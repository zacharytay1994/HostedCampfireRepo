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

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {

        }

        protected void btnRecommendation_Click(object sender, EventArgs e)
        {
            lblStart.Text = txtStart.Text;
            lblEnd.Text = txtEnd.Text;
            TimeSpan timeActivity = DateTime.Parse(txtEnd.Text).Subtract(DateTime.Parse(txtStart.Text)); //The time the activity should take
        }

        protected void displayRecommendation()
        {
            string strConn = ConfigurationManager.ConnectionStrings["EventPlannerConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);

            SqlCommand cmd = new SqlCommand("SELECT * FROM Activities WHERE duration <= @dur ORDER BY duration DESC", conn);

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
}