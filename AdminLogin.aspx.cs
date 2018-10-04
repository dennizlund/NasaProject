using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session != null)
        {
            if (Session["username"] != null && Session["password"] != null)
            {
                Response.Redirect("Post.aspx");
            }

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = this.userName.Value;
        Session["password"] = this.password.Value;
        Response.Redirect("post.aspx");
    }

    protected void btnBack_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}