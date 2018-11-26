using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampfirePlanner.ASP.Net.ActivitiesPage
{
    public partial class ActivitiesPage21 : System.Web.UI.UserControl
    {
        public string _activityName;
        public string _activityDescription;

        protected void Page_Load(object sender, EventArgs e)
        {
            activityImage.ImageUrl = "";
            activityName.Text = _activityName;
            activityDescripton.Text = _activityDescription;
        }

        //public DataTable getData()
        //{
        //    DataTable table;
        //    return table;
        //}
    }
}