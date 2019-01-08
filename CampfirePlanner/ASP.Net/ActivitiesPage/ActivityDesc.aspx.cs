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
            SqlCommand cmd = new SqlCommand("SELECT * FROM Activity INNER JOIN Images ON Activity.ActivityID = Images.ActivityID WHERE Activity.ActivityID = @actid", conn);
            cmd.Parameters.AddWithValue("@actid", actID);
            SqlDataAdapter daActivity = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();
            conn.Open();
            daActivity.Fill(result, "Activity");
            conn.Close();

            lblTitle.Text = result.Tables[0].Rows[0]["ActivityName"].ToString();
            lblDesc.Text = result.Tables[0].Rows[0]["ActivityDesc"].ToString();
            lblExp.Text = result.Tables[0].Rows[0]["ActivityExp"].ToString();
            lblDuration.Text = result.Tables[0].Rows[0]["Duration"].ToString();
            lblLinks.Text = result.Tables[0].Rows[0]["Link"].ToString();
            image1.Src = result.Tables[0].Rows[0]["ImgLink"].ToString();
            //lblVotes.Text = result.Tables[0].Rows[0]["Vote"].ToString();

            //Display Categories
            //lblCategories.Text = displayCategories();
        }

        //private string displayCategories()
        //{
        //    int actID = Convert.ToInt32(Request.QueryString["actID"]);

        //    string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
        //    SqlConnection conn = new SqlConnection(strConn);
        //    SqlCommand cmd = new SqlCommand("SELECT CategoryID FROM Activity WHERE Categories.ActivityID = @actid", conn);
        //    cmd.Parameters.AddWithValue("@actid", actID);
        //    SqlDataAdapter daActivity = new SqlDataAdapter(cmd);
        //    DataSet result = new DataSet();
        //    conn.Open();
        //    string cat = (string)cmd.ExecuteScalar();
        //    conn.Close();

        //    List<string> catList = new List<string>();
        //    cmd = new SqlCommand("SELECT catName FROM Categories", conn);
        //    SqlDataAdapter daCategories = new SqlDataAdapter(cmd);
        //    result = new DataSet();
        //    conn.Open();
        //    daCategories.Fill(result, "Categories");
        //    conn.Close();

        //    foreach (DataRow row in result.Tables["SkillSet"].Rows)
        //    {
        //        catList.Add(row[0].ToString());
        //    }

        //    string actCategories = "";
        //    for (int i = 0; i < cat.Length; i++)
        //    {
        //        if (cat[i].ToString() == "a")
        //            actCategories += catList[0];
        //        else if (cat[i].ToString() == "b")
        //            actCategories += catList[1];
        //        else if (cat[i].ToString() == "c")
        //            actCategories += catList[2];
        //        else if (cat[i].ToString() == "d")
        //            actCategories += catList[3];
        //        else if (cat[i].ToString() == "e")
        //            actCategories += catList[4];
        //    }

        //    return actCategories;
        //}

        public string getImgLink()
        {
            if (slideshowCount() > 1)
            {
                int actID = Convert.ToInt32(Request.QueryString["actID"]);

                //Display Fields
                string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = new SqlCommand("SELECT * FROM Images WHERE ActivityID = @actid", conn);
                cmd.Parameters.AddWithValue("@actid", actID);
                SqlDataAdapter daActivity = new SqlDataAdapter(cmd);
                DataSet result = new DataSet();
                conn.Open();
                daActivity.Fill(result, "Activity");
                conn.Close();

                return result.Tables[0].Rows[1]["ImgLink"].ToString();
            }
            else
                return "";
        }

        public string getImgLink2()
        {
            if (slideshowCount() > 2)
            {
                int actID = Convert.ToInt32(Request.QueryString["actID"]);

                //Display Fields
                string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = new SqlCommand("SELECT * FROM Images WHERE ActivityID = @actid", conn);
                cmd.Parameters.AddWithValue("@actid", actID);
                SqlDataAdapter daActivity = new SqlDataAdapter(cmd);
                DataSet result = new DataSet();
                conn.Open();
                daActivity.Fill(result, "Activity");
                conn.Close();

                return result.Tables[0].Rows[2]["ImgLink"].ToString();
            }
            else
                return "";
        }

        //private int deleteActivity()
        //{
        //    string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
        //    SqlConnection conn = new SqlConnection(strConn);
        //    SqlCommand cmd = new SqlCommand("DELETE FROM Activity WHERE ActivityID = @actid", conn);
        //    cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));
        //    conn.Open();
        //    cmd.ExecuteNonQuery();
        //    conn.Close();

        //    return 0;
        //}

        public int slideshowCount()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Images WHERE ActivityID=@actid", conn);

            cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));

            SqlDataAdapter dacount = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            int count = (int)cmd.ExecuteScalar();
            dacount.Fill(result, "Images");
            conn.Close();

            return count;
        }

        //protected void btnDel_Click(object sender, EventArgs e)
        //{
        //    if (Session["UserAuthentication"].ToString() == "Admin")
        //    {
        //        if (deleteActivity() == 0)
        //        {
        //            Response.Redirect("~/ASP.Net/ActivitiesPage/ActivitiesPage.aspx");
        //        }
        //    }
        //}

        protected void btnUpVote_Click(object sender, EventArgs e)
        {

        }

        protected void btnDownVote_Click(object sender, EventArgs e)
        {
            if (isVoteValid())
            {
                string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = new SqlCommand("UPDATE Activity SET Vote = Vote-1 WHERE ActivityID = @actid", conn);
                cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                showActivityDesc();
            }
        }

        protected void btnUpVote_Click1(object sender, EventArgs e)
        {
            if (isVoteValid())
            {
                string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = new SqlCommand("UPDATE Activity SET Vote = Vote+1 WHERE ActivityID = @actid", conn);
                cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            showActivityDesc();
        }

        private bool isVoteValid()
        {
            return true;
        }
    }
}