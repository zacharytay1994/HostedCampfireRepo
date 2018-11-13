using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampfirePlannerPlanner.ASP.Net.LoginRegister
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
            //        ["CampfirePlannerConnectionString"].ToString();

            //    SqlConnection conn = new SqlConnection(strConn);

            //    SqlCommand cmd = new SqlCommand("SELECT Username FROM CampfirePlannerUsers WHERE EmailAddr=@email AND Password=@password", conn);
            //    cmd.Parameters.AddWithValue("@password", inputPw);
            //    cmd.Parameters.AddWithValue("@email", inputEmail);
            //    conn.Open();
            //    SqlDataReader dr = cmd.ExecuteReader();
            //    if (dr.Read())
            //    {
            //        Session["UserAuthentication"] = dr["Username"].ToString();
            //        conn.Close();
            //        Response.Redirect("~/HomePage/HomePage.aspx");
            //    }
            //}   else if (inputEmail == "admin@gmail.com" && inputPw == "pass123")
            //    {
            //        Session["UserAuthentication"] = "Admin";
            //        Response.Redirect("~/HomePage/HomePage.aspx");
            //    }
            //    else
            //    {
            //        lblMessage.Text = "Invalid Login ID or Password";
            //    }
            Response.Redirect("~/ASP.Net/HomePage/HomePage.aspx");
        }
    }
}