using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using CampfirePlanner.ASP.Net.ActivitiesPage.App_Code;

namespace CampfirePlanner.ASP.Net.ActivitiesPage.App_Code
{
    public class Activity
    {
        public int activityID { get; set; }
        public string activityName { get; set; }
        public string activityDescription { get; set; }
        public string category { get; set; }
        public int duration { get; set; }
        public string activityExplanation { get; set; }
        public string link { get; set; }
        public string activityPhoto { get; set; }

        public int activityAdd()
        {
            //Read connection string "ePortfolioConnectionString" from web.config file.
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            //Instantiate a SqlConnection object with the Connection String read.
            SqlConnection conn1 = new SqlConnection(strConn);

            //Instantiate a SqlCommand object, supply it with an INSERT SQL statement
            //which will return the auto-generated staffID after insertation,
            //and the connection object for connecting to the database.
            SqlCommand cmd1 = new SqlCommand
                             ("INSERT INTO Activity (ActivityName, ActivityDesc, CategoryID, Duration, ActivityExp, Link) OUTPUT INSERTED.ActivityID VALUES (@name, @desc, @cat, @dur, @expla, @link)", conn1);

            //Define the parameters used in SQL statement, value for each parameter
            //is retrieved from respective class's property.
            cmd1.Parameters.AddWithValue("@name", activityName);
            cmd1.Parameters.AddWithValue("@desc", activityDescription);
            cmd1.Parameters.AddWithValue("@cat", category);
            cmd1.Parameters.AddWithValue("@dur", duration);
            cmd1.Parameters.AddWithValue("@expla", activityExplanation);
            cmd1.Parameters.AddWithValue("@link", link);

            //A connection to database must be opened before any operations made.
            conn1.Open();

            //ExectureScalar is used to retrieve the auto-generated
            //ID after exectuing the INSERT SQL statement
            int id = (int)cmd1.ExecuteScalar();

            //A connection should be closed after operations.
            conn1.Close();

            return id;
            //SqlConnection conn2 = new SqlConnection(strConn);
            //SqlCommand cmd2 = new SqlCommand
            //                 ("INSERT INTO Images (ImgLink, ActivityID) VALUES (@imglink, @actid)", conn2);
            //cmd2.Parameters.AddWithValue("@imglink", activityPhoto);
            //cmd2.Parameters.AddWithValue("actid", activityID);

            //conn2.Open();
            //int id = cmd2.ExecuteNonQuery();
            //conn2.Close();

            //return id;
        }
    }
}