﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampfirePlanner.ASP.Net.LoginRegister
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //string inputEmail = txtEmail.Text;
            //string inputPw = txtPw.Text;
            //if (CheckLoginData(inputEmail, inputPw) == true)
            //{
            //    string strConn = ConfigurationManager.ConnectionStrings
            //        ["CampfireConnectionString"].ToString();

            //    SqlConnection conn = new SqlConnection(strConn);

            //    SqlCommand cmd = new SqlCommand("SELECT Username FROM CampfireUsers WHERE EmailAddr=@email AND Password=@password", conn);
            //    cmd.Parameters.AddWithValue("@password", inputPw);
            //    cmd.Parameters.AddWithValue("@email", inputEmail);
            //    conn.Open();
            //    SqlDataReader dr = cmd.ExecuteReader();
            //    if (dr.Read())
            //    {
            //        Session["UserAuthentication"] = dr["Username"].ToString();
            //        conn.Close();
            //        Response.Redirect("~/HomePage.aspx");
            //    }
            //}
            //else
            //{
            //    lblMessage.Text = "Invalid Login ID or Password";
            //}
            Response.Redirect("~/ASP.Net/HomePage/HomePage.aspx");
        }
    }
}