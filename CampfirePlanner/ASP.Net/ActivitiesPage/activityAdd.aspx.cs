using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampfirePlanner.ASP.Net.ActivitiesPage.App_Code;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;

namespace CampfirePlanner.ASP.Net.ActivitiesPage
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
                objActivity.duration = Convert.ToInt32(txtDuration);
                objActivity.activityExplanation = txtExplanation.Text;
                objActivity.link = txtLinks.Text;
                if (upPhoto.HasFile == true)
                {
                    HttpPostedFile file = upPhoto.PostedFile;

                    var myAccount = new Account { ApiKey = "775262439546842", ApiSecret = "AaFN__kiLc85ypytnaHJuIlHLKY", Cloud = "campfire-inc" };
                    Cloudinary _cloudinary = new Cloudinary(myAccount);
                    
                    var uploadParams = new ImageUploadParams()
                    {
                        File = new FileDescription(file.FileName, file.InputStream),
                    };
                    var uploadResult = _cloudinary.Upload(uploadParams);
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
                strValues += "&category=" + categ;
                strValues += "&duration=" + txtDuration;
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