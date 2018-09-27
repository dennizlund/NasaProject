using System;
using System.Collections.Generic;
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

        this.paragraph.InnerHtml = readContent("~/content/content.txt");
        this.title.InnerHtml = readContent("~/content/title.txt");

        using (StreamReader sr = new StreamReader(Server.MapPath("~/content/upload.txt"), true))
        {
            string line = sr.ReadToEnd();
            if (line.EndsWith(".png\r\n") || line.EndsWith(".jpg\r\n"))
            {
                this.imageUpdate.Src = line;
                //this.videoUpdate.Disabled = true;
                this.videoUpdate.Visible = false;
            }
            else
            {

                this.imageUpdate.Visible = false;
                this.videoUpdate.Attributes["src"] = line;
            }
        }

        if (title != null)
        {
            //this.paragraph.InnerHtml = title;
            using (System.IO.StreamWriter w = new System.IO.StreamWriter(Server.MapPath("~/content/title.txt"), false))
            {
                w.WriteLine(title); // Write the text
            }
        }

        if (content != null)
        {
            using (System.IO.StreamWriter w = new System.IO.StreamWriter(
                Server.MapPath("~/content/content.txt"),
                false))
            {
                w.WriteLine(content); // Write the text
            }

            //this.title.InnerHtml = content;
        }
        
    }

    protected string readContent(string path)
    {
        using (StreamReader sr = new StreamReader(Server.MapPath(path), true))
        {
            string line = sr.ReadToEnd();
            return line;
        }
    }
}