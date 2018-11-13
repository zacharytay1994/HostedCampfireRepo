using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Campfire.App_Code;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Campfire
{
    public partial class activityAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitForm_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Create a new object
                Activity objActivity = new Activity();

                objActivity.activityName = activityName.Text;
                objActivity.activityDescription = briefDescription.Text;

                string categ = "";
                
                foreach (var x in lbCat.SelectedValue)
                {
                    categ += x;                    
                }
                objActivity.category = categ;
                objActivity.activityExplanation = txtExplanation.Text;
                objActivity.link = txtLinks.Text;
                string uploadedFile = "";
                if (upPhoto.HasFile == true)
                {
                    string savePath;

                    //Find the filename extension of the file to be uploaded
                    string fileExt = Path.GetExtension(upPhoto.FileName);

                    uploadedFile = activityName.Text + fileExt;

                    //MapPath - to find the complete path to the images folder in server
                    savePath = MapPath("~/imgages/gamePhotos/" + uploadedFile);

                    try
                    {
                        upPhoto.SaveAs(savePath); //Upload the file to server
                        objActivity.activityPhoto = uploadedFile;
                    }
                    catch (IOException)
                    {
                        //File IO error, could be due to access rights denied
                        lblPhoto.Text = "File uploading fail!";
                    }
                    catch (Exception ex) //Other types of errors
                    {
                        lblPhoto.Text = ex.Message;
                    }
                }
                else
                {
                    lblPhoto.Text = "Please select a file!";
                }
                objActivity.activityPhoto = "defaultpicture.jpg";

                int id = objActivity.activityAdd();

                string strValues = "";
                strValues += "name=" + activityName.Text;
                strValues += "&description=" + id.ToString();
                //strValues += "&category=" + ;
                strValues += "&explain=" + txtExplanation.Text;
                strValues += "&link=" + txtLinks.Text;
                strValues += "&photo=defaultpicture.jpg";
                Response.Redirect("confirmActivityAdd.aspx?" + strValues);
            }
        }

        protected void returnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }
    }
}