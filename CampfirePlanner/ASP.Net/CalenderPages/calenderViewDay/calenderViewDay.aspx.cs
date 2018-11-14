﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampfirePlanner.ASP.Net.CalenderPages.calenderViewDay
{
    public partial class calenderViewDay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int day = 1;
            int eventid = 1;

            DataTable table = GetData(eventid, day);
            fillTimeTable();
            TableCell c = new TableCell();
            c.Controls.Add(new LiteralControl(table.Rows[0]["StartTime"].ToString()));
            Table1.Rows[0].Cells.Add(c);

        }

        // Get data of activities on specific day of event
        public DataTable GetData(int _eventid, int _day)
        {
            // Get Data from SQL and store Data in DataTable table
            string strConn = ConfigurationManager.ConnectionStrings
                ["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);

            SqlCommand cmd = new SqlCommand
                ("SELECT * FROM EventActivity WHERE EventID = @eventid AND Day = @day", conn);

            cmd.Parameters.AddWithValue("@eventid", _eventid);
            cmd.Parameters.AddWithValue("@day", _day);

            DataSet result = new DataSet();

            SqlDataAdapter daActivity = new SqlDataAdapter(cmd);

            conn.Open();

            daActivity.Fill(result, "ActivityTable");

            conn.Close();

            DataTable table = result.Tables["ActivityTable"];

            return table;
        }

        // create a table with timeslots
        public void fillTimeTable()
        {
            int numrows = 96;
            int numcells = 1;
            int hour = 00;
            string hourstr;
            int min = 00;
            string minstr;
            string time;
            for (int j = 0; j < numrows; j++)
            {
                hourstr = hour.ToString();
                if (hourstr.Length < 2)
                {
                    hourstr = "0" + hourstr;
                }
                minstr = min.ToString();
                if (minstr.Length < 2)
                {
                    minstr = minstr + "0";
                }
                time = hourstr + minstr;
                TableRow r = new TableRow();
                for (int i = 0; i < numcells; i++)
                {
                    TableCell c = new TableCell();
                    c.Controls.Add(new LiteralControl(time.ToString()));
                    r.Cells.Add(c);
                }
                Table1.Rows.Add(r);
                if (min < 45)
                {
                    min += 15;
                }
                else
                {
                    hour += 01;
                    min = 00;
                }
            }
        }

        public int returnTime(string _time)
        {

            return 0;
        }
    }
}