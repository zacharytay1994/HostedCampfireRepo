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

                //if (Session["UserAuthentication"].ToString() == "Admin")
                //{
                //    btnDel.Visible = true;
                //}
                //else
                //{
                //    btnDel.Visible = false;
                //}
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
            lblVotes.Text = voteCount().ToString();

            // Color Voted Button
            /*btnUpVote.Style["background-color"] = "white";
            btnDownVote.Style["background-color"] = "white";
            if (voteCheck() == 1)      // Currently Up-Voted
                btnUpVote.Style["background-color"] = "green";
            else if (voteCheck() == 0) // Currently Down-Voted
                btnDownVote.Style["background-color"] = "red";*/

            //Display Categories
            lblCategories.Text = displayCategories();
        }

        private string displayCategories()
        {
            int actID = Convert.ToInt32(Request.QueryString["actID"]);

            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT CategoryID FROM Activity WHERE ActivityID = @actid", conn);
            cmd.Parameters.AddWithValue("@actid", actID);
            SqlDataAdapter daActivity = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();
            conn.Open();
            string cat = (string)cmd.ExecuteScalar();
            conn.Close();

            List<string> catList = new List<string>();
            cmd = new SqlCommand("SELECT catName FROM Categories", conn);
            SqlDataAdapter daCategories = new SqlDataAdapter(cmd);
            result = new DataSet();
            conn.Open();
            daCategories.Fill(result, "Categories");
            conn.Close();

            foreach (DataRow row in result.Tables["Categories"].Rows)
            {
                catList.Add(row[0].ToString());
            }

            string actCategories = "";
            for (int i = 0; i < cat.Length; i++)
            {
                if (cat[i].ToString() == "a")
                    actCategories += " " + catList[0];
                else if (cat[i].ToString() == "b")
                    actCategories += " " + catList[1];
                else if (cat[i].ToString() == "c")
                    actCategories += " " + catList[2];
                else if (cat[i].ToString() == "d")
                    actCategories += " " + catList[3];
                else if (cat[i].ToString() == "e")
                    actCategories += " " + catList[4];
                else if (cat[i].ToString() == "f")
                    actCategories += " " + catList[5];
                else if (cat[i].ToString() == "g")
                    actCategories += " " + catList[6];
            }

            return actCategories;
        }

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

        protected void btnDownVote_Click(object sender, EventArgs e)
        {
            voteClicked(0);
        }

        protected void btnUpVote_Click(object sender, EventArgs e)
        {
            voteClicked(1);
        }

        private void voteClicked(int voteStatus)
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Votes WHERE ActivityID = @actID AND AccountID = @accID", conn);

            cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));
            cmd.Parameters.AddWithValue("@accID", getAccID());

            SqlDataAdapter daVotes = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            daVotes.Fill(result, "Votes");
            conn.Close();

            if (result.Tables["Votes"].Rows.Count > 0) // If user voted before
            {
                int userVote = Convert.ToInt32(result.Tables[0].Rows[0]["VoteValue"]);
                if (userVote == voteStatus) // If user clicks same vote
                {
                    cmd = new SqlCommand("DELETE FROM Votes WHERE ActivityID = @actID AND AccountID = @accID", conn);
                    cmd.Parameters.AddWithValue("@accID", getAccID());
                    cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                else // If user votes differently
                {
                    cmd = new SqlCommand("UPDATE Votes SET VoteValue = @vote WHERE ActivityID = @actID AND AccountID = @accID", conn);
                    cmd.Parameters.AddWithValue("@accID", getAccID());
                    cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));
                    cmd.Parameters.AddWithValue("@vote", voteStatus);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            else // If user hasn't voted before
            {
                cmd = new SqlCommand("INSERT INTO Votes VALUES(@accID, @actID, @vote)", conn);
                cmd.Parameters.AddWithValue("@vote", voteStatus);
                cmd.Parameters.AddWithValue("@accID", getAccID());
                cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            showActivityDesc();
        }

        private int voteCheck()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Votes WHERE ActivityID = @actID AND AccountID = @accID", conn);

            cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));
            cmd.Parameters.AddWithValue("@accID", getAccID());

            SqlDataAdapter daVotes = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            daVotes.Fill(result, "Votes");
            conn.Close();

            if (result.Tables["Votes"].Rows.Count > 0)
            {
                int userVote = Convert.ToInt32(result.Tables[0].Rows[0]["VoteValue"]);
                return userVote;
            }
            else
                return -1;
        }

        private int voteCount()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT VoteValue FROM Votes WHERE ActivityID = @actID", conn);

            cmd.Parameters.AddWithValue("@actid", Convert.ToInt32(Request.QueryString["actID"]));

            SqlDataAdapter daVotes = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            daVotes.Fill(result, "Votes");
            conn.Close();

            int total = 0;
            foreach (DataRow row in result.Tables["Votes"].Rows)
            {
                if (Convert.ToInt32(row[0]) == 1)
                    total += 1;
                else
                    total -= 1;
            }

            // Update votes for activity
            cmd = new SqlCommand("UPDATE Activity SET Votes = @vote WHERE ActivityID = @actID", conn);

            cmd.Parameters.AddWithValue("@vote", total);
            cmd.Parameters.AddWithValue("@actID", getAccID());
            SqlDataAdapter daID = new SqlDataAdapter(cmd);
            result = new DataSet();
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            return total;
        }

        private int getAccID()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT AccountID FROM Users WHERE Username=@name", conn);

            cmd.Parameters.AddWithValue("@name", Session["UserAuthentication"].ToString());

            SqlDataAdapter daID = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            int accID = (int)cmd.ExecuteScalar();
            daID.Fill(result, "Users");
            conn.Close();

            return accID;
        }

        protected void btnShowHide_Click(object sender, EventArgs e)
        {
            displayComments();
        }

        protected void addComment()
        {
            string commentText = txtAddComment.Text;
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            using (SqlConnection con = new SqlConnection(strConn))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Comments VALUES(@accID, @actID, @commentText)", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.Parameters.AddWithValue("@actID", Convert.ToInt32(Request.QueryString["actID"]));
                        cmd.Parameters.AddWithValue("@accID", getAccID());
                        cmd.Parameters.AddWithValue("@commentText", commentText);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        lblThanks.Text = "Comment Added!";
                    }
                }
            }
        }

        protected void displayComments()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(strConn))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Comments INNER JOIN Users ON Comments.AccountID = Users.AccountID WHERE ActivityID = @activityid", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.Parameters.AddWithValue("@activityid", Convert.ToInt32(Request.QueryString["actID"]));
                        //cmd.Parameters.AddWithValue("@accountid", getAccID());
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        this.gvComments.DataSource = dt;
                        this.gvComments.DataBind();
                    }
                }
            }
        }

        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            addComment();
        }
    }
}