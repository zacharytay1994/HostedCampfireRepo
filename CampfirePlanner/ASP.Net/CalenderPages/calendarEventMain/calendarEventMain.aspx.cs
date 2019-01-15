using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CampfirePlanner.ASP.Net.CalenderPages.calendarEventMain
{
    public partial class calendarEventMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblWelcome.Text = "Welcome, " + Session["UserAuthentication"].ToString();
            displayEvents();
        }              

        protected int returnUserID()
        {
            string userName = Session["UserAuthentication"].ToString();
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);

            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE Username = @userName", conn);
            cmd.Parameters.AddWithValue("@userName", userName);

            //Declare and instantiate DataAdapter object
            SqlDataAdapter daEvents = new SqlDataAdapter(cmd);

            //Create a DataSet object to contain the records retrieved from database
            DataSet result = new DataSet();

            //A connection must be opened before any operations made.
            conn.Open();

            daEvents.Fill(result, "Event");

            //A connection should always be closed, whether error occurs or not.
            conn.Close();

            int userID = Convert.ToInt32(result.Tables[0].Rows[0]["AccountID"]);

            return userID;
        }

        protected void displayEvents()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);

            SqlCommand cmd = new SqlCommand("SELECT * FROM Event WHERE AccountID = @accountid", conn);
            cmd.Parameters.AddWithValue("@accountid", returnUserID());

            //Declare and instantiate DataAdapter object
            SqlDataAdapter daEvents = new SqlDataAdapter(cmd);

            //Create a DataSet object to contain the records retrieved from database
            DataSet result = new DataSet();

            //A connection must be opened before any operations made.
            conn.Open();

            daEvents.Fill(result, "Event");

            //A connection should always be closed, whether error occurs or not.
            conn.Close();

            //Specify GridView to get data from table
            gvEvents.DataSource = result.Tables["Event"];

            //Display the list of data in GridView
            gvEvents.DataBind();
        }

        protected void gvEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            string eventID = gvEvents.SelectedRow.Cells[0].Text;
            string eventName = gvEvents.SelectedRow.Cells[3].Text;
            string conString = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM EventMembers INNER JOIN Users ON EventMembers.AccountID = Users.AccountID WHERE EventID = @EventID", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.Parameters.AddWithValue("@EventID", eventID);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        this.gvCollab.DataSource = dt;
                        this.gvCollab.DataBind();
                    }
                }
            }

            lblCollabInfo.Text = "Collaborators for " + eventName;
            if (gvCollab.Rows.Count == 0)
            {
                lblCollab.Visible = true;
                lblCollab.Text = "You are not currently collaborating with anyone!";
            }

            else
            {
                lblCollab.Visible = true;
                lblCollab.Text = "You are collaborating with " + gvCollab.Rows.Count + " people!";
            }
        }

        protected void btnEvents_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ASP.Net/CalenderPages/calendarSelect/CalendarSelect.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ASP.Net/HomePage/HomePage.aspx");
        }
    }
}