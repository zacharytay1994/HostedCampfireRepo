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
            int dayz = 1;
                if (SelectedDates.Count() != 2 && !SelectedDates.Contains(calSelect.SelectedDate))
                {
                    SelectedDates.Add(calSelect.SelectedDate);
                }
                else
                {
                    SelectedDates.Remove(calSelect.SelectedDate);
                }

                ViewState["SelectedDates"] = SelectedDates;

            if (SelectedDates.Count() == 2)
            {
                dayz = (SelectedDates[0].Day - SelectedDates[1].Day);
                if (dayz < 0)
                    dayz = -dayz;
            }
            else
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

        protected void btnEvent_Click(object sender, EventArgs e)
        {
            if (rvDayz.IsValid)
            {
                DateTime startDate;
                DateTime endDate;
                Event newEvent = new Event();
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

                newEvent.startDate = startDate;
                newEvent.endDate = endDate;
                newEvent.eventName = txtEvent.Text;
                newEvent.accountID = getAccID();
                newEvent.createEvent();
            }
        }

        private int getAccID()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT AccountiD FROM Users WHERE Username=@name", conn);

            cmd.Parameters.AddWithValue("@name", Session["UserAuthentication"].ToString());

            SqlDataAdapter daID = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            int accID = (int)cmd.ExecuteScalar();
            daID.Fill(result, "Parent");
            conn.Close();

            return accID;
        }
    }
}