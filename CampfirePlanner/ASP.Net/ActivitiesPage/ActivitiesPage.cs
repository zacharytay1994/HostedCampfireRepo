using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Campfire.ActivitiesPage
{
    public class ActivityPage
    {
        private object type { get; set; }
        private object page { get; set; }
        public ActivityPage (object _type, object _page)
        {
            type = _type;
            page = _page;
        }
        public DataTable getData()
        {
            // Get Data from SQL and store Data in DataTable table
            string strConn = ConfigurationManager.ConnectionStrings
                ["CampfireConnectionString"].ToString();

            SqlConnection conn = new SqlConnection(strConn);

            SqlCommand cmd = new SqlCommand
                ("SELECT * FROM Activities", conn);

            DataSet result = new DataSet();

            SqlDataAdapter daActivity = new SqlDataAdapter(cmd);

            conn.Open();

            daActivity.Fill(result, "ActivityTable");

            conn.Close();

            DataTable table = result.Tables["ActivityTable"];

            return table;
  
        }

        // Filters Table based on category and return category
        public DataTable filterData(DataTable _tableToFilter, List<string> _filterParameters)
        {
            // Clones schema without data
            bool check;
            DataTable filteredTable = _tableToFilter.Clone();
            List<string> catList = new List<string> { };
            for (int i = 0; i<_tableToFilter.Rows.Count; i++)
            {
                check = false;
                catList.Clear();
                string catString = _tableToFilter.Rows[i]["Category"].ToString();
                for (int j = 0; j < catString.Length; j++)
                {
                    catList.Add(catString[j].ToString());
                }

                foreach (string fp_catvalue in _filterParameters)
                {
                    foreach(string catvalue in catList)
                    {
                        if (catvalue == fp_catvalue)
                        {
                            filteredTable.Rows.Add(_tableToFilter.Rows[i].ItemArray);
                            check = true;
                            break;
                        }
                    }
                    if (check == true)
                    {
                        break;
                    }
                }
            }
            return filteredTable;
        }
    }
}