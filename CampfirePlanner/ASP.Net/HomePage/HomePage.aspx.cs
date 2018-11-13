using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampfirePlannerPlanner.ASP.Net.HomePage
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Converts category string to List, and returns List
        public List<string> stringConverter(string _cat)
        {
            List<string> catList = new List<string> { };
            for (int i = 0; i < _cat.Length; i++)
            {
                catList.Add(_cat[i].ToString());
            }
            return catList;
        }
    }
}