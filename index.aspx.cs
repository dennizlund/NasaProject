using System;
using System.Collections.Generic;
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

        using (StreamReader sr = new StreamReader(Server.MapPath("~/content/title.txt"), true))
        {
            string line = sr.ReadToEnd();
            this.title.InnerHtml = line;
        }

        using (StreamReader sr = new StreamReader(Server.MapPath("~/content/content.txt"), true))
        {
            string line = sr.ReadToEnd();
            this.paragraph.InnerHtml = line;
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
            using (System.IO.StreamWriter w = new System.IO.StreamWriter(Server.MapPath("~/content/content.txt"), false))
            {
                w.WriteLine(content); // Write the text
            }
            //this.title.InnerHtml = content;
        }
        

        Page previousPage = Page.PreviousPage;
        if (previousPage != null)
        {
            //.Text = ((TextBox)previousPage.FindControl("inputTitle")).Text;
        }
    }
    
}