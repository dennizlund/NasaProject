using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;

using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string title = Request.Form["inputTitle"];
        string content = Request.Form["inputContentUpdate"];

        this.latestUpdate();

        //this.paragraph.InnerHtml = readContent("~/content/content.txt");
        //this.title.InnerHtml = readContent("~/content/title.txt");
        
        //using (StreamReader sr = new StreamReader(Server.MapPath("~/content/upload.txt"), true))
        //{
        //    string line = sr.ReadToEnd();
        //    if (line.EndsWith(".png\r\n") || line.EndsWith(".jpg\r\n"))
        //    {
        //        this.imageUpdate.Src = line;
        //        //this.videoUpdate.Disabled = true;
        //        this.videoUpdate.Visible = false;
        //    }
        //    else
        //    {
        //        this.imageUpdate.Visible = false;
        //        this.videoUpdate.Attributes["src"] = line;
        //    }
        //}

    }

    protected string readContent(string path)
    {
        using (StreamReader sr = new StreamReader(Server.MapPath(path), true))
        {
            string line = sr.ReadToEnd();
            return line;
        }
    }

    protected void latestUpdate()
    {
        SqlConnection myConnection = new SqlConnection(this.SqlDataSource1.ConnectionString);

        myConnection.Open();

        SqlCommand command = new SqlCommand("SELECT TOP 1 * FROM Articles ORDER BY id DESC", myConnection);

        SqlDataReader reader = command.ExecuteReader();
        

        if (reader.Read())
        {
            string content = reader["contentText"].ToString();
            string title = reader["titleText"].ToString();
            string source = reader["uploadSrc"].ToString();

            this.paragraph.InnerHtml = content;
            this.title.InnerHtml = title;

            if (source.EndsWith(".png") || source.EndsWith(".jpg"))
            {
                this.imageUpdate.Src = source;
                this.videoUpdate.Visible = false;
                myConnection.Close();
            }
            else
            {
                this.imageUpdate.Visible = false;
                this.videoUpdate.Attributes["src"] = source;
                myConnection.Close();
            }
        }
        else
        {
            myConnection.Close();
        }



    }

    


}