using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CampfirePlanner.ASP.Net.ActivitiesPage
{
    public partial class ActivitiesPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<string> typesList = new List<string> { };
                Session["session_type"] = typesList;
                Session["session_page"] = 0;
                lbl_pagenumber.Text = Session["session_page"].ToString();

                fillGrid(Session["session_type"], Session["session_page"]);

                setImgSrc();
            }
        }

        public Control FindControlRecursive(Control _control, string _id)
        {
            if (_control.ID == _id) return _control;

            foreach (Control controlToSearch in _control.Controls)
            {
                Control controlToReturn = FindControlRecursive(controlToSearch, _id);
                if (controlToReturn != null) return controlToReturn;
            }
            return null;
        }

        public void fillGrid(object _type, object _page)
        {
            ActivityPage ap = new ActivityPage(_type, _page);
            DataTable table = ap.getData();
            DataTable filteredTable = ap.filterData(table, _type as List<string>);

            List<string> _typeList = Session["session_type"] as List<string>;
            string nameControlString;
            Label control;
            //Label control2;
            int j = Convert.ToInt32(_page) * 8;
            for (int i = 1; i <= 32; i += 4)
            {
                nameControlString = "Label" + i.ToString();
                control = (Label)FindControlRecursive(Page, nameControlString);
                if (control != null)
                {
                    if (j < filteredTable.Rows.Count)
                    {
                        control.Text = filteredTable.Rows[j]["ActivityName"].ToString();
                    }
                }
                nameControlString = "Label" + (i + 1).ToString();
                control = (Label)FindControlRecursive(Page, nameControlString);
                if (control != null)
                {
                    if (j < filteredTable.Rows.Count)
                    {
                        control.Text = filteredTable.Rows[j]["ActivityDesc"].ToString();
                    }
                }
                nameControlString = "Label" + (i + 2).ToString();
                control = (Label)FindControlRecursive(Page, nameControlString);
                if (control != null)
                {
                    if (j < filteredTable.Rows.Count)
                    {
                        control.Text = filteredTable.Rows[j]["CategoryID"].ToString();
                    }
                }
                nameControlString = "Label" + (i + 3).ToString();
                control = (Label)FindControlRecursive(Page, nameControlString);
                if (control != null)
                {
                    if (j < filteredTable.Rows.Count)
                    {
                        control.Text = filteredTable.Rows[j]["ActivityID"].ToString();
                        j++;
                    }
                }
            }
        }

        protected void btn_previous_Click(object sender, EventArgs e)
        {
            int _page_number = Convert.ToInt32(Session["session_page"]);
            if (_page_number > 0)
            {
                _page_number--;
                Session["session_page"] = _page_number;
                lbl_pagenumber.Text = Session["session_page"].ToString();
                fillGrid(Session["session_type"], Session["session_page"]);
            }
        }

        protected void btn_next_Click(object sender, EventArgs e)
        {
            int _page_number = Convert.ToInt32(Session["session_page"]);
            _page_number++;
            Session["session_page"] = _page_number;
            lbl_pagenumber.Text = Session["session_page"].ToString();
            fillGrid(Session["session_type"], Session["session_page"]);
        }

        protected void cbl_categories_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<string> selected = new List<string>();
            foreach (ListItem item in cbl_categories.Items)
                if (item.Selected) selected.Add(item.Value.ToString());

            Session["session_type"] = selected;
            fillGrid(Session["session_type"], Session["session_page"]);
            //string[] _typesArray = Session["session_type"] as string[];
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

        public string getImage()
        {
            //string link = "";
            //Label control;
            ////Read connection string "CampfireConnectionString" from web.config file.
            //string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            ////Instantiate a SqlConnection object with the Connection String read.
            //SqlConnection conn = new SqlConnection(strConn);
            //SqlCommand cmd = new SqlCommand("SELECT URL FROM Activity WHERE ActivityID=@assignedID", conn);

            //for (int i=4; i<=32; i+=4)
            //{
            //    string controlName = "Label" + i.ToString();
            //    control = (Label)FindControlRecursive(Page, controlName);
                
            //    cmd.Parameters.AddWithValue("@assignedID", control.Text);
            //    conn.Open();
            //    if (cmd.ExecuteScalar().ToString() != null)
            //    {
            //        link = cmd.ExecuteScalar().ToString();
            //    }
            //    conn.Close();
                
                //}
            
            return ""; //link;
        }

        public int Label4Update()
        {
            return Convert.ToInt32(Label4.Text);
        }
        public int Label8Update()
        {
            return Convert.ToInt32(Label8.Text);
        }
        public int Label12Update()
        {
            return Convert.ToInt32(Label12.Text);
        }
        public int Label16Update()
        {
            return Convert.ToInt32(Label16.Text);
        }
        public int Label20Update()
        {
            return Convert.ToInt32(Label20.Text);
        }
        public int Label24Update()
        {
            return Convert.ToInt32(Label24.Text);
        }
        public int Label28Update()
        {
            return Convert.ToInt32(Label28.Text);
        }
        public int Label32Update()
        {
            return Convert.ToInt32(Label32.Text);
        }

        private string getFeaturedActivity(int actID)
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT ImgLink FROM Images WHERE ActivityID = @actID", conn);
            cmd.Parameters.AddWithValue("@actid", actID);

            SqlDataAdapter daActivity = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            daActivity.Fill(result, "Images");
            conn.Close();

            if (result.Tables["Images"].Rows.Count > 0)
                return result.Tables["Images"].Rows[0]["ImgLink"].ToString();
            else
                return "";
        }

        private void setImgSrc()
        {
            string strConn = ConfigurationManager.ConnectionStrings["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Activity ORDER BY Votes DESC", conn);

            SqlDataAdapter daActivity = new SqlDataAdapter(cmd);
            DataSet result = new DataSet();

            conn.Open();
            daActivity.Fill(result, "Activity");
            conn.Close();

            slide1.Src = getFeaturedActivity(Convert.ToInt32(result.Tables[0].Rows[0]["ActivityID"]));
            slide2.Src = getFeaturedActivity(Convert.ToInt32(result.Tables[0].Rows[1]["ActivityID"]));
            slide3.Src = getFeaturedActivity(Convert.ToInt32(result.Tables[0].Rows[2]["ActivityID"]));
            slide1Title.InnerHtml = result.Tables[0].Rows[0]["ActivityName"].ToString();
            slide2Title.InnerHtml = result.Tables[0].Rows[1]["ActivityName"].ToString();
            slide3Title.InnerHtml = result.Tables[0].Rows[2]["ActivityName"].ToString();
            slide1Link.HRef = "../ActivitiesPage/ActivityDesc.aspx?actID=" + Convert.ToInt32(result.Tables[0].Rows[0]["ActivityID"]);
            slide2Link.HRef = "../ActivitiesPage/ActivityDesc.aspx?actID=" + Convert.ToInt32(result.Tables[0].Rows[1]["ActivityID"]);
            slide3Link.HRef = "../ActivitiesPage/ActivityDesc.aspx?actID=" + Convert.ToInt32(result.Tables[0].Rows[2]["ActivityID"]);
        }
    }
}