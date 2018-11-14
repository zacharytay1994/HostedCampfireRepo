using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using CampfirePlanner.Classes;

namespace CampfirePlanner.Classes
{
    public class EventActivity
    {
        public int EventActivityID { get; set; }
        public int EventID { get; set; }
        public int ActivityID { get; set; }
        public int Day { get; set; }
        public string StartTime { get; set; }

        public int eventActivityAdd()
        {
            //Read connection string "ePortfolioConnectionString" from web.config file.
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            //Instantiate a SqlConnection object with the Connection String read.
            SqlConnection conn = new SqlConnection(strConn);

            //Instantiate a SqlCommand object, supply it with an INSERT SQL statement
            //which will return the auto-generated staffID after insertation,
            //and the connection object for connecting to the database.
            SqlCommand cmd = new SqlCommand
                             ("INSERT INTO EventActivities (EventID, ActivityID, Day, StartTime) VALUES(@eventid, @activityid, @day, @starttime)", conn);

            //Define the parameters used in SQL statement, value for each parameter
            //is retrieved from respective class's property.
            cmd.Parameters.AddWithValue("@eventid", EventID);
            cmd.Parameters.AddWithValue("@activityid", ActivityID);
            cmd.Parameters.AddWithValue("@day", Day);
            cmd.Parameters.AddWithValue("@starttime", StartTime);

            //A connection to database must be opened before any operations made.
            conn.Open();

            //ExectureScalar is used to retrieve the auto-generated
            //ID after exectuing the INSERT SQL statement
            cmd.ExecuteNonQuery();

            //A connection should be closed after operations.
            conn.Close();

            return 0;
        }
    }
}