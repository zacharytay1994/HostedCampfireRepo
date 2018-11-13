using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CampfirePlanner.Classes
{
    public class SQLFunctions
    {
        //public void AddRegisterData(string _username, string _email,
        //   string _password)
        //{
        //    string strConn = ConfigurationManager.ConnectionStrings
        //            ["CampfireConnectionString"].ToString();

        //    SqlConnection conn = new SqlConnection(strConn);

        //    SqlCommand cmd = new SqlCommand("INSERT INTO CampfireUsers " +
        //        "(Username, EmailAddr, Password) VALUES (@username," +
        //        "@email, @password)", conn);


        //    cmd.Parameters.AddWithValue("@username", _username);
        //    cmd.Parameters.AddWithValue("@email", _email);
        //    cmd.Parameters.AddWithValue("@password", _password);

        //    conn.Open();

        //    cmd.ExecuteNonQuery();

        //    conn.Close();
        //}

        //public bool CheckLoginData(string _email, string _password)
        //{
        //    string strConn = ConfigurationManager.ConnectionStrings
        //            ["CampfireConnectionString"].ToString();

        //    SqlConnection conn = new SqlConnection(strConn);

        //    SqlCommand cmd = new SqlCommand("SELECT Password FROM CampfireUsers WHERE EmailAddr=@email", conn);
        //    cmd.Parameters.AddWithValue("@email", _email);
        //    conn.Open();
        //    string pw = (string)cmd.ExecuteScalar();
        //    conn.Close();

        //    if (_password == pw)
        //        return true;
        //    else
        //        return false;
        //}
        //public void AddActivity(string _activityname, string _activitydesc, string _activitycat, string _activityexp, string _activitylink)
        //{
        //    string strConn = ConfigurationManager.ConnectionStrings
        //            ["CampfireConnectionString"].ToString();

        //    SqlConnection conn = new SqlConnection(strConn);

        //    SqlCommand cmd = new SqlCommand("INSERT INTO Activities " +
        //        "(ActivityName, ActivityDesc, Category, ActivityExp, Link) VALUES (@activityname, @activitydesc," +
        //        "@activitycat, @activityexp, @activitylink)", conn);

        //    cmd.Parameters.AddWithValue("@activityname", _activityname);
        //    cmd.Parameters.AddWithValue("@activitydesc", _activitydesc);
        //    cmd.Parameters.AddWithValue("@activitycat", _activitycat);
        //    cmd.Parameters.AddWithValue("@activityexp", _activityexp);
        //    cmd.Parameters.AddWithValue("@activitylink", _activitylink);

        //    conn.Open();

        //    cmd.ExecuteNonQuery();

        //    conn.Close();
        //}
    }
}