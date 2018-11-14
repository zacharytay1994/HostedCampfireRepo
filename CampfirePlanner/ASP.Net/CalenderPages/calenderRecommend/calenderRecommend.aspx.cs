using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CampfirePlanner.ASP.Net.CalenderPages
{
    public partial class calenderRecommend : System.Web.UI.Page
    {
        int reccID;
        protected void Page_Load(object sender, EventArgs e)
        {
            string targetedEventID = Request.QueryString["id"];
            //lblDay.Text = targetedEventID; //grab the targeted id from previous page

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
            //lblStart.Text = txtStart.Text;
            //lblEnd.Text = txtEnd.Text;
            TimeSpan timeActivity = DateTime.Parse(txtEnd.Text).Subtract(DateTime.Parse(txtStart.Text)); //The time the activity should take
            lblActivity.Text = "Here are some activities under " + timeActivity.TotalMinutes + " minutes!";
            displayRecommendation();
        }

        protected void displayRecommendation()
        {          
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
            
            SqlCommand cmd = new SqlCommand("SELECT * FROM Activities WHERE Duration <= @dur ORDER BY Duration DESC", conn);
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
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
            string targetedEventID = Request.QueryString["id"];
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);

            SqlCommand cmd = new SqlCommand("SELECT * FROM Events WHERE EventID = @event", conn);
            //cmd.Parameters.AddWithValue("@event", targetedEventID);
            cmd.Parameters.AddWithValue("@event", 1);

            //Declare and instantiate DataAdapter object
            SqlDataAdapter daEvents = new SqlDataAdapter(cmd);

            //Create a DataSet object to contain the records retrieved from database
            DataSet result = new DataSet();

            //A connection must be opened before any operations made.
            conn.Open();

            daEvents.Fill(result, "Events");

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

            SqlCommand cmd = new SqlCommand("SELECT * FROM Events WHERE EventID = @event", conn);
            //cmd.Parameters.AddWithValue("@event", targetedEventID);
            cmd.Parameters.AddWithValue("@event", 1);

            //Declare and instantiate DataAdapter object
            SqlDataAdapter daEvents = new SqlDataAdapter(cmd);

            //Create a DataSet object to contain the records retrieved from database
            DataSet result = new DataSet();

            //A connection must be opened before any operations made.
            conn.Open();

            daEvents.Fill(result, "Events");

            //A connection should always be closed, whether error occurs or not.
            conn.Close();

            DateTime start = Convert.ToDateTime(result.Tables[0].Rows[0]["StartDate"]);

            return start;
        }

        protected void rblDay_SelectedIndexChanged(object sender, EventArgs e)
        {
            DateTime newDate = getStartDate().AddDays(Convert.ToDouble(rblDay.SelectedValue) - 1);
            lblDay.Text = newDate.ToString();
        }

        protected void addToEvents()
        {
            string eventID = Request.QueryString["eventID"];
            //Read connection string "ePortfolioConnectionString" from web.config file.
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            //Instantiate a SqlConnection object with the Connection String read.
            SqlConnection conn = new SqlConnection(strConn);

            //Instantiate a SqlCommand object, supply it with an INSERT SQL statement
            //which will return the auto-generated staffID after insertation,
            //and the connection object for connecting to the database.
            SqlCommand cmd = new SqlCommand
                             ("INSERT INTO EventActivity (EventID, ActivityID, Day, StartTime)" +
                             "VALUES (@eveid, @actid, @day, @startt)", conn);

            //Define the parameters used in SQL statement, value for each parameter
            //is retrieved from respective class's property.
            cmd.Parameters.AddWithValue("@eveid", eventID);
            cmd.Parameters.AddWithValue("@actid", reccID);
            cmd.Parameters.AddWithValue("@day", rblDay.SelectedValue);
            cmd.Parameters.AddWithValue("@startt", txtStart.Text);
        }

        protected void gvRecommendation_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void gvRecommendation_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow r = gvRecommendation.Rows[e.NewSelectedIndex];
            int recommendationID = Convert.ToInt32(r.Cells[0].Text);
            reccID = recommendationID;
        }
    }
}