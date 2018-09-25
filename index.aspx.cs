using System;
using System.Collections.Generic;
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

        if (title != null)
        {
            this.paragraph.InnerHtml = title;
        }

        if (content != null)
        {
            this.title.InnerHtml = content;
        }
        

        Page previousPage = Page.PreviousPage;
        if (previousPage != null)
        {
            //.Text = ((TextBox)previousPage.FindControl("inputTitle")).Text;
        }
    }
    
}