using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampfirePlanner.Classes;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CampfirePlanner.ASP.Net.CalenderPages.calendarSelect
{
    public partial class CalendarSelect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void calSelect_SelectionChanged(object sender, EventArgs e)
        {
            if (SelectedDates.Count() != 2 && calSelect.SelectedDate >= DateTime.Today)
            {
                if (!SelectedDates.Contains(calSelect.SelectedDate))
                {
                    SelectedDates.Add(calSelect.SelectedDate);
                }
                else
                {
                    SelectedDates.Remove(calSelect.SelectedDate);
                }
            }

            ViewState["SelectedDates"] = SelectedDates;
            int dayz = 0;
            if (SelectedDates.Count() == 2)
            {
                dayz = (SelectedDates[0].Day - SelectedDates[1].Day);
                if (dayz < 0)
                    dayz = -dayz;
            }
            else if (SelectedDates.Count() == 1)
                dayz = 1;
            txtDayz.Text = dayz.ToString();
        }

        protected void calSelect_PreRender(object sender, EventArgs e)
        {
            calSelect.SelectedDates.Clear();

            foreach (DateTime dt in SelectedDates)
            {
                calSelect.SelectedDates.Add(dt);
            }
        }

        protected void calSelect_Load(object sender, EventArgs e)
        {
            calSelect.SelectedDates.Clear();
        }

        public List<DateTime> SelectedDates
        {
            get
            {
                if (ViewState["SelectedDates"] == null)
                    ViewState["SelectedDates"] = new List<DateTime>();

                return (List<DateTime>)ViewState["SelectedDates"];
            }
            set
            {
                ViewState["SelectedDates"] = value;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            SelectedDates.Clear();
            txtDayz.Text = "";
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (rvDayz.IsValid)
            {
                DateTime startDate;
                DateTime endDate;

                if (SelectedDates.Count() > 1)
                {
                    if (SelectedDates[1] > SelectedDates[0])
                    {
                        startDate = SelectedDates[0];
                        endDate = SelectedDates[1];
                    }
                    else
                    {
                        startDate = SelectedDates[1];
                        endDate = SelectedDates[0];
                    }
                }
                else
                {
                    startDate = SelectedDates[0];
                    endDate = SelectedDates[0];
                }

                Session["startDate"] = startDate;
                Session["endDate"] = endDate;
                Session["evName"] = txtEvent.Text;

                txtEvent.Enabled = false;
                calSelect.Enabled = false;
                btnReset.Enabled = false;
                btnCreate.Enabled = false;
                tdList.Visible = true;
                tdList2.Visible = true;

                fillUserList();
            }
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

        private void fillUserList()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE AccountID != @id AND Type = 'u'", conn);
            cmd.Parameters.AddWithValue("@id", getAccID());
            SqlDataAdapter daUsers = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            daUsers.Fill(result, "Users");
            conn.Close();

            gvUsers.DataSource = result.Tables["Users"];
            gvUsers.DataBind();
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "addUser")
            {
                int i = Convert.ToInt32(e.CommandArgument);
                string userName = gvUsers.Rows[i].Cells[1].Text;
                string accID = gvUsers.Rows[i].Cells[0].Text;

                bool success = true;
                foreach (ListItem li in lbSelected.Items)
                {
                    if (li.ToString() == userName)
                        success = false;
                }
                if (success)
                {
                    lbSelected.Items.Add(new ListItem(userName, accID));
                    lblCount.Text = lbSelected.Items.Count.ToString();
                }
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            gvUsers.DataSource = null;

            string search = txtSearch.Text;

            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE AccountID != @id AND Type = 'u' AND Username LIKE '%'+@name+'%'", conn);
            cmd.Parameters.AddWithValue("@id", getAccID());
            cmd.Parameters.AddWithValue("@name", search);
            SqlDataAdapter daSearch = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            daSearch.Fill(result, "Users");
            conn.Close();

            gvUsers.DataSource = result.Tables["Users"];
            gvUsers.DataBind();
        }

        protected void lbSelected_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnRemove.Visible = true;
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            lbSelected.Items.Remove(lbSelected.SelectedItem);
            lbSelected.DataBind();
            btnRemove.Visible = false;
            lblCount.Text = lbSelected.Items.Count.ToString();
        }

        protected void btnEventCreate_Click(object sender, EventArgs e)
        {
            Event newEvent = new Event();
            newEvent.startDate = Convert.ToDateTime(Session["startDate"]);
            newEvent.endDate = Convert.ToDateTime(Session["endDate"]);
            newEvent.eventName = Session["evName"].ToString();
            newEvent.accountID = getAccID();
            int eventID = newEvent.createEvent();

            addEventMembers(eventID, getAccID(), "c");
            foreach (ListItem li in lbSelected.Items)
            {
                int accID = Convert.ToInt32(li.Value);

                addEventMembers(eventID, accID, "m");
            }

            Response.Redirect("/ASP.Net/CalenderPages/calendarEventMain/calendarEventMain.aspx");
        }

        private void addEventMembers(int eID, int aID, string aStatus)
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("INSERT INTO EventMembers (EventID, AccountID, MemberStatus) VALUES(@eID, @aID, @mStatus)", conn);

            cmd.Parameters.AddWithValue("@eID", eID);
            cmd.Parameters.AddWithValue("@aID", aID);
            cmd.Parameters.AddWithValue("@mStatus", aStatus);

            SqlDataAdapter daID = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}