using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using CampfirePlanner.ASP.Net.ActivitiesPage.App_Code;

namespace CampfirePlanner.ASP.Net.ActivitiesPage
{
    public partial class ActivityDesc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                showActivityDesc();
                if (Session["UserAuthentication"].ToString() == "Admin")
                {
                    btnDel.Visible = true;
                }
                else
                {
                    btnDel.Visible = false;
                }
            }
        }
        private void showActivityDesc()
        {
            int actID = Convert.ToInt32(Request.QueryString["actID"]);

            //Display Fields
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Activity WHERE ActivityID = @actid", conn);
            cmd.Parameters.AddWithValue("@actid", actID);
            SqlDataAdapter daActivity = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();
            conn.Open();
            daActivity.Fill(result, "Activities");
            conn.Close();

            lblTitle.Text = result.Tables[0].Rows[0]["ActivityName"].ToString();
            lblDesc.Text = result.Tables[0].Rows[0]["ActivityDesc"].ToString();
            lblExp.Text = result.Tables[0].Rows[0]["ActivityExp"].ToString();
            lblDuration.Text = result.Tables[0].Rows[0]["Duration"].ToString();
            lblLinks.Text = result.Tables[0].Rows[0]["Link"].ToString();

            //Display Categories
            //string catDisplay = result.Tables[0].Rows[0]["Category"].ToString();
            //if (catDisplay.Contains("a"))
            //    catDisplay +=
            //else if (catDisplay.Contains("b"))
            //    catDisplay +=
            //else if (catDisplay.Contains("b"))
            //    catDisplay +=
            //else if (catDisplay.Contains("b"))
            //    catDisplay +=
            //lblCategories.Text = catDisplay;
        }

        private int deleteActivity()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("DELETE FROM Activity WHERE ActivityID = @actid", conn);
            cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            return 0;
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (Session["UserAuthentication"].ToString() == "Admin")
            {
                if (deleteActivity() == 0)
                {
                    Response.Redirect("~/ASP.Net/ActivitiesPage/ActivitiesPage.aspx");
                }
            }
        }
    }
}