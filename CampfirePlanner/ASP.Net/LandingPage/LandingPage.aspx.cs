using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampfirePlannerPlanner.ASP.Net
{
    public partial class LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_enter_Click(object sender, EventArgs e)
        {
            Response.Redirect("../LoginRegister/LoginPage.aspx");
        }
    }
}