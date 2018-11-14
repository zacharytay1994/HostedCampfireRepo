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
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            for (int i = 1; i < EventActivity.Days; i++)
            {
                rblDay.Items.Add(new ListItem(Convert.ToString(i), Convert.ToString(i)));
            }   
            */
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
    }
}