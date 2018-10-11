using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
        if (Session["username"] == null && Session["password"] == null)
        {
            Response.Redirect("index.aspx");
        }
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
                    this.lblUploadMessage.Text = "Maximum file size (20MB) exceeded";
                    this.lblUploadMessage.ForeColor = Color.Red;
                }
                else
                {
                    this.FileUpload.SaveAs(Server.MapPath("~/Uploads/" + this.FileUpload.FileName));
                    this.lblUploadMessage.Text = "File Uploaded";
                    this.lblUploadMessage.ForeColor = Color.GreenYellow;

                    // STOPPA IN DATABAS QUERY HÄR
                    
                    this.SaveToDatabase();
                    this.SaveLocation("./Uploads/" + this.FileUpload.FileName);
                    this.SaveText("~/content/title.txt", this.inputTitle.Text);
                    this.SaveText("~/content/content.txt", this.inputContentUpdate.Text);
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

    protected void ButtonPostClick(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }

    protected void SaveLocation(string path)
    {
        using (System.IO.StreamWriter w = new System.IO.StreamWriter(Server.MapPath("~/content/upload.txt"), false))
        {
            w.WriteLine(path); // Write the text
        }
    }

    protected void SaveText(string path, string text)
    {
        using (System.IO.StreamWriter w = new System.IO.StreamWriter(
            Server.MapPath(path),
            false))
        {
            w.WriteLine(text); // Write the text
        }
    }

    protected void SaveToDatabase()
    {
        SqlConnection myConnection = new SqlConnection(this.SqlDataSource1.ConnectionString);

        String query = "INSERT INTO dbo.Articles (contentText,titleText,uploadSrc, userId) VALUES (@content,@title,@source,@userId)";

        using (SqlCommand command = new SqlCommand(query, myConnection))
        {
            command.Parameters.AddWithValue("@content", this.inputContentUpdate.Text);
            command.Parameters.AddWithValue("@title", this.inputTitle.Text);
            command.Parameters.AddWithValue("@source", "./Uploads/" + this.FileUpload.FileName);
            command.Parameters.AddWithValue("@userId", this.GetUserId());
            

            myConnection.Open();
            int result = command.ExecuteNonQuery();

            // Check Error
            if (result < 0)
                Console.WriteLine("Error inserting data into Database!");
        }
        
        myConnection.Close();



    }

    protected int GetUserId()
    {
        SqlConnection myConnection = new SqlConnection(this.SqlDataSource1.ConnectionString);

        String query = "SELECT * FROM UserAccounts WHERE @username = username AND @password = password";

        using (SqlCommand command = new SqlCommand(query, myConnection))
        {
            command.Parameters.AddWithValue("@username", Session["username"]);
            command.Parameters.AddWithValue("@password", Session["password"]);
            


            myConnection.Open();

            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                int id = Convert.ToInt32(reader["id"].ToString());
                myConnection.Close();
                return id;
            }
            myConnection.Close();
            return 1;
        }

        
    }
}