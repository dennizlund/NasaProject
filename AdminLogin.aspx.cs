using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.ServiceModel.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var uId = "dennis";
        ICollection test = GetAllUsers(uId, "SQLServerConnectionString");

        if (Session != null)
        {
            if (Session["username"] != null && Session["password"] != null)
            {
                Response.Redirect("Post.aspx");
            }

        }
    }


    private ICollection GetAllUsers(string username, string connection)
    {
        ArrayList al = new ArrayList();

        ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings[connection];

        SqlDataSource sds = new SqlDataSource(cts.ConnectionString, "SELECT username, password, Id FROM Users WHERE username = @userid");
        sds.SelectParameters.Add("userid ", DbType.String, username);

        try
        {

            IEnumerable IDs = sds.Select(DataSourceSelectArguments.Empty);

            // Iterate through the Enumeration and create a
            // NorthwindEmployee object for each ID.
            foreach (DataRowView row in IDs)
            {
                string id = row["Id"].ToString();

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