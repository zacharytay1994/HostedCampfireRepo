using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampfirePlanner.ASP.Net.CalenderPages.calenderViewDay
{
    public partial class calenderViewDay1 : System.Web.UI.UserControl
    {
        public string stringy;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserAuthentication"] != null)
            {
                Label1.Text = stringy;
            }
            else
                Response.Redirect("~/ASP.Net/LoginRegister/LoginPage.aspx");
        }
    }
}