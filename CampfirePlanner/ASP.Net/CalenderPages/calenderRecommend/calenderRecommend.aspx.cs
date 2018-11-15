using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using CampfirePlanner.Classes;

namespace CampfirePlanner.ASP.Net.CalenderPages
{
    public partial class calenderRecommend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (txtStart.Text != "" || txtEnd.Text != "")
            {
                TimeSpan timeActivity = DateTime.Parse(txtEnd.Text).Subtract(DateTime.Parse(txtStart.Text));
                if (timeActivity.TotalMinutes < 0)
                {
                    lblValidTime.Text = "Please enter valid times!";
                }
            }

            if (!Page.IsPostBack)
            {
                for (int i = 1; i <= getNumberOfDays(); i++)
                {
                    rblDay.Items.Add(new ListItem("Day " + Convert.ToString(i), Convert.ToString(i)));
                }
            }
        }

        protected void btnRecommendation_Click(object sender, EventArgs e)
        {
            //lblStart.Text = DateTime.Parse(txtStart.Text).TimeOfDay.ToString();
            TimeSpan timeActivity = DateTime.Parse(txtEnd.Text).Subtract(DateTime.Parse(txtStart.Text)); //The time the activity should take
            lblActivity.Text = "Here are some activities under " + timeActivity.TotalMinutes + " minutes!";
            displayRecommendation();
        }

        protected void displayRecommendation()
        {
            if (txtStart.Text != "" && txtEnd.Text != "")
            {
                string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
                SqlConnection conn = new SqlConnection(strConn);

                SqlCommand cmd = new SqlCommand("SELECT * FROM Activity WHERE Duration <= @dur ORDER BY Duration DESC", conn);
                TimeSpan timeActivity = DateTime.Parse(txtEnd.Text).Subtract(DateTime.Parse(txtStart.Text)); //The time the activity should take
                cmd.Parameters.AddWithValue("@dur", timeActivity.TotalMinutes);


                //Declare and instantiate DataAdapter object
                SqlDataAdapter daRecommendation = new SqlDataAdapter(cmd);

                //Create a DataSet object to contain the records retrieved from database
                DataSet result = new DataSet();

                //A connection must be opened before any operations made.
                conn.Open();

                daRecommendation.Fill(result, "Recommendation");

                //A connection should always be closed, whether error occurs or not.
                conn.Close();

                //Specify GridView to get data from table
                gvRecommendation.DataSource = result.Tables["Recommendation"];

                //Display the list of data in GridView
                gvRecommendation.DataBind();
            }
        }

        protected void gvRecommendation_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the page index to the page clicked by user.
            gvRecommendation.PageIndex = e.NewPageIndex;
            // Display records on the new page.
            displayRecommendation();
        }

        protected int getNumberOfDays()
        {
            string targetedEventID = Request.QueryString["id"]; //*********
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);

            SqlCommand cmd = new SqlCommand("SELECT * FROM Event WHERE EventID = @event", conn);
            //cmd.Parameters.AddWithValue("@event", targetedEventID); 
            cmd.Parameters.AddWithValue("@event", 3); //CHANGE THIS WHEN THE QUERYSTRING OF EVENT ID ARRIVES FROM PREVIOUS PAGE

            //Declare and instantiate DataAdapter object
            SqlDataAdapter daEvents = new SqlDataAdapter(cmd);

            //Create a DataSet object to contain the records retrieved from database
            DataSet result = new DataSet();

            //A connection must be opened before any operations made.
            conn.Open();

            daEvents.Fill(result, "Event");

            //A connection should always be closed, whether error occurs or not.
            conn.Close();

            DateTime start = Convert.ToDateTime(result.Tables[0].Rows[0]["StartDate"]);
            DateTime end = Convert.ToDateTime(result.Tables[0].Rows[0]["EndDate"]);

            TimeSpan daysActivity = end.Subtract(start);

            return daysActivity.Days + 1;
        }

        protected DateTime getStartDate()
        {
            string targetedEventID = Request.QueryString["id"];
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);

            SqlCommand cmd = new SqlCommand("SELECT * FROM Event WHERE EventID = @event", conn);
            //cmd.Parameters.AddWithValue("@event", targetedEventID);
            cmd.Parameters.AddWithValue("@event", 3); //CHANGE THIS WHEN QUERYSTRING ARRIVES

            //Declare and instantiate DataAdapter object
            SqlDataAdapter daEvents = new SqlDataAdapter(cmd);

            //Create a DataSet object to contain the records retrieved from database
            DataSet result = new DataSet();

            //A connection must be opened before any operations made.
            conn.Open();

            daEvents.Fill(result, "Event");

            //A connection should always be closed, whether error occurs or not.
            conn.Close();

            DateTime start = Convert.ToDateTime(result.Tables[0].Rows[0]["StartDate"]);

            return start;
        }

        protected void rblDay_SelectedIndexChanged(object sender, EventArgs e)
        {
            DateTime newDate = getStartDate().AddDays(Convert.ToDouble(rblDay.SelectedValue) - 1);
            lblDay.Text = newDate.Date.ToString("d");
        }

        protected void gvRecommendation_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void gvRecommendation_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int recommendationID;
            GridViewRow r = gvRecommendation.Rows[e.NewSelectedIndex];
            recommendationID = Convert.ToInt32(r.Cells[0].Text);
            lblAdd.Text = recommendationID.ToString();
            //reccID = recommendationID;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int eventID = Convert.ToInt32(Request.QueryString["eventID"]);
            // Create a new object
            EventActivity objActivity = new EventActivity();

            //objActivity.EventID = eventID;
            objActivity.EventID = 3;  //Change this to querystring ver when other page before is done
            objActivity.ActivityID = Convert.ToInt32(lblAdd.Text);
            objActivity.StartTime = DateTime.Parse(txtStart.Text).TimeOfDay.ToString();
            objActivity.Day = Convert.ToInt32(rblDay.SelectedValue);
            objActivity.eventActivityAdd();
        }
    }
}