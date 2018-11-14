using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampfirePlanner.ASP.Net.CalenderPages.calendarSelectDay
{
    public partial class calendarSelectDay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            calSelect.SelectedDates.Clear();
        }

        protected void calSelect_SelectionChanged(object sender, EventArgs e)
        {
            if (MultipleSelectedDates.Contains(calSelect.SelectedDate))
            {
                MultipleSelectedDates.Remove(calSelect.SelectedDate);
            }
            else
            {
                MultipleSelectedDates.Add(calSelect.SelectedDate);
            }

            ViewState["MultipleSelectedDates"] = MultipleSelectedDates;
        }

        protected void calSelect_PreRender(object sender, EventArgs e)
        {
            calSelect.SelectedDates.Clear();

            foreach (DateTime dt in MultipleSelectedDates)
            {
                calSelect.SelectedDates.Add(dt);
            }
        }

        public List<DateTime> MultipleSelectedDates
        {
            get
            {
                if (ViewState["MultipleSelectedDates"] == null)

                    ViewState["MultipleSelectedDates"] = new List<DateTime>();
                return (List<DateTime>)ViewState["MultipleSelectedDates"];
            }
            set
            {
                ViewState["MultipleSelectedDates"] = value;
            }
        }


        protected void btnGetSelectedDate_Click(object sender, EventArgs e)
        {

            foreach (DateTime dt in MultipleSelectedDates)
            {
                
            }
        }
    }
}