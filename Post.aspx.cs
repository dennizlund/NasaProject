using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class AdminPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //< asp:SqlDataSource
        //    id = "users"
        //runat = "server"
        //DataSourceMode = "DataReader"
        //ConnectionString = "<%$ ConnectionStrings:SQLServerConnectionString%>"
        //SelectCommand = "SELECT * FROM Users" >
        //    </ asp:SqlDataSource >
        

        

    }

    private ICollection GetAllUsers(string query, string connection)
    {
        ArrayList al = new ArrayList();

        ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings[connection];

        SqlDataSource sds = new SqlDataSource(cts.ConnectionString, query);

        try
        {

            IEnumerable IDs = sds.Select(DataSourceSelectArguments.Empty);

            // Iterate through the Enumeration and create a
            // NorthwindEmployee object for each ID.
            foreach (DataRowView row in IDs)
            {
                string id = row["username"].ToString();
                
                al.Add(id);
            }
        }
        finally
        {
            // If anything strange happens, clean up.
            sds.Dispose();
        }

        return al;
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