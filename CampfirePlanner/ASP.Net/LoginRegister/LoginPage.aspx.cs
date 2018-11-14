using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CampfirePlannerPlanner.ASP.Net.LoginRegister
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string inputEmail = txtEmail.Text;
            string inputPw = txtPw.Text;
            
            if (CheckLoginData(inputEmail, inputPw))
            {
                string strConn = ConfigurationManager.ConnectionStrings
                    ["CampfireConnectionString"].ToString();

                SqlConnection conn = new SqlConnection(strConn);

                SqlCommand cmd = new SqlCommand("SELECT Username, Type FROM CampfireUsers WHERE EmailAddr=@email AND Password=@password", conn);
                cmd.Parameters.AddWithValue("@password", inputPw);
                cmd.Parameters.AddWithValue("@email", inputEmail);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["Type"].ToString() == "A")
                    {
                        Session["UserAuthentication"] = "Admin";
                        conn.Close();
                        Response.Redirect("~/ASP.Net/HomePage/HomePage.aspx");
                    }
                    else
                    {
                        Session["UserAuthentication"] = dr["Username"].ToString();
                        conn.Close();
                        Response.Redirect("~/ASP.Net/HomePage/HomePage.aspx");
                    }
                }
            }
            else
            {
                lblMessage.Text = "Invalid Login ID or Password";
            }
        }

        private bool CheckLoginData(string _email, string _password)
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);

            SqlCommand cmd = new SqlCommand("SELECT Password FROM CampfireUsers WHERE EmailAddr=@email", conn);
            cmd.Parameters.AddWithValue("@email", _email);
            conn.Open();
            string pw = (string)cmd.ExecuteScalar();
            conn.Close();

            if (_password == pw)
                return true;
            else
                return false;
        }
    }
}