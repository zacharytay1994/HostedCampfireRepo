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
            SqlCommand cmd = new SqlCommand("INSERT INTO Event (StartDate, EndDate, EventName, AccountID) " +
                                            "OUTPUT INSERTED.EventID " +
                                            "VALUES(@sdate, @edate, @ename, @aID)", conn);

            cmd.Parameters.AddWithValue("@sdate", startDate);
            cmd.Parameters.AddWithValue("@edate", endDate);
            cmd.Parameters.AddWithValue("@ename", eventName);
            cmd.Parameters.AddWithValue("@aid", accountID);

            conn.Open();
            int id = (int)cmd.ExecuteScalar();
            conn.Close();

            return id;
        }
    }
}