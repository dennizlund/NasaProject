using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
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

            if (fileExtension.ToLower() != ".png" && fileExtension.ToLower() != ".jpg" && fileExtension.ToLower() != ".mp4")
            {
                this.lblUploadMessage.Text = "Only .png , .jpeg or .mp4 files are allowed";
                this.lblUploadMessage.ForeColor = Color.Red;
            }

            else
            {
                int fileSize = this.FileUpload.PostedFile.ContentLength;

                if (fileSize > 20971520)
                {
                    this.lblUploadMessage.Text = "Maximum file size (2MB) exceeded";
                    this.lblUploadMessage.ForeColor = Color.Red;
                }
                else
                {
                    this.FileUpload.SaveAs(Server.MapPath("~/Uploads/" + this.FileUpload.FileName));
                    this.lblUploadMessage.Text = "File Uploaded";
                    this.lblUploadMessage.ForeColor = Color.GreenYellow;
                    saveLocation("./Uploads/" + this.FileUpload.FileName);
                    saveText("~/content/title.txt", this.inputTitle.Text);
                    saveText("~/content/content.txt", this.inputContentUpdate.Text);
                    Response.Redirect("index.aspx");

                }
            }

        }
        else
        {
            this.lblUploadMessage.Text = "Please select a file to upload";
            this.lblUploadMessage.ForeColor = Color.Red;
        }
    }

    protected void buttonPost_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }

    protected void saveLocation(string path)
    {
        using (System.IO.StreamWriter w = new System.IO.StreamWriter(Server.MapPath("~/content/upload.txt"), false))
        {
            w.WriteLine(path); // Write the text
        }
    }

    protected void saveText(string path, string text)
    {
        using (System.IO.StreamWriter w = new System.IO.StreamWriter(
            Server.MapPath(path),
            false))
        {
            w.WriteLine(text); // Write the text
        }
    }
}