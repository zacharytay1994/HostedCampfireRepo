using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CampfirePlanner.Classes
{
    public class Event
    {
        public string eventName { get; set; }
        public DateTime startDate { get; set; }
        public DateTime endDate { get; set; }
        public int accountID { get; set; }

        public int createEvent()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("INSERT INTO Event(StartDate, EndDate, AccountID, EventName) OUTPUT INSERTED.EventID VALUES (@sdate, @edate, @aID, @ename)", conn);

            cmd.Parameters.AddWithValue("@sdate", startDate.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@edate", endDate.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@aID", accountID);
            cmd.Parameters.AddWithValue("@ename", eventName);

            conn.Open();
            int id = (int)cmd.ExecuteScalar();
            conn.Close();

            return id;
        }
    }
}