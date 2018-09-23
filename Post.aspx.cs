using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (this.FileUpload.HasFile)
        {
            string fileExtension = System.IO.Path.GetExtension(this.FileUpload.FileName);

            if (fileExtension.ToLower() != ".png" && fileExtension.ToLower() != ".jpeg")
            {
                this.lblUploadMessage.Text = "Only .png or .jpeg files are allowed";
                this.lblUploadMessage.ForeColor = Color.Red;
            }

            else
            {
                int fileSize = this.FileUpload.PostedFile.ContentLength;

                if (fileSize > 2097152)
                {
                    this.lblUploadMessage.Text = "Maximum file size (2MB) exceeded";
                    this.lblUploadMessage.ForeColor = Color.Red;
                }
                else
                {
                    this.FileUpload.SaveAs(Server.MapPath("~/Uploads/" + this.FileUpload.FileName));
                    this.lblUploadMessage.Text = "File Uploaded";
                    this.lblUploadMessage.ForeColor = Color.GreenYellow;
                }
            }

        }
        else
        {
            this.lblUploadMessage.Text = "Please select a file to upload";
            this.lblUploadMessage.ForeColor = Color.Red;
        }
    }
}