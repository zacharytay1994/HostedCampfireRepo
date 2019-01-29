using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampfirePlannerPlanner.ASP.Net.MasterPages.MainNavBar
{
    public partial class NavBar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserAuthentication"] != null)
            {
                btnNavLogInOut.InnerText = "Log Out";
            }
            else
                btnNavLogInOut.InnerText = "Log In";
        }

        protected void logInOut(object sender, EventArgs e)
        {
            if (Session["UserAuthentication"] != null)
            {
                Session["UserAuthentication"] = null;
                Response.Redirect("~/ASP.Net/HomePage/HomePage.aspx");
            }
            else
            {
                Response.Redirect("~/ASP.Net/LoginRegister/LoginPage.aspx");
            }
        }
    }
}