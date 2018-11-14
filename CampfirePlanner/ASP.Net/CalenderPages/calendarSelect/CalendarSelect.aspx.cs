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
        Event newEvent = new Event();

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

                newEvent.startDate = startDate;
                newEvent.endDate = endDate;
                newEvent.eventName = txtEvent.Text;
                newEvent.accountID = getAccID();
                //newEvent.createEvent();

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
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE Type = 'u'", conn);
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
                int accID = Convert.ToInt32(gvUsers.Rows[i].Cells[0].Text);
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            gvUsers.DataSource = null;

            string search = txtSearch.Text;

            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE Type = 'u' AND Username LIKE '%'+@name+'%'", conn);
            cmd.Parameters.AddWithValue("@name", search);
            SqlDataAdapter daSearch = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            daSearch.Fill(result, "Users");
            conn.Close();

            gvUsers.DataSource = result.Tables["Users"];
            gvUsers.DataBind();
        }
    }
}