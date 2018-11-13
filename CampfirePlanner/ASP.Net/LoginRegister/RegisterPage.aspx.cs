using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampfirePlannerPlanner.ASP.Net.LoginRegister
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(rfv_username.IsValid) + Convert.ToInt32(rfv_email.IsValid)
                + Convert.ToInt32(rfv_password.IsValid) + Convert.ToInt32(rfv_password2.IsValid) + Convert.ToInt32(cv_password2.IsValid) == 5)
            {

                string _username = tb_username.Text.ToString();
                string _email = email_Email.Value;
                string _password = tb_password2.Text.ToString();

                //AddRegisterData(_username, _email, _password);
                Response.Redirect("~/ASP.Net/HomePage/HomePage.aspx");
            }
        }
    }
}