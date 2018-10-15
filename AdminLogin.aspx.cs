using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.ServiceModel.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

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
        this.ValidateUser();
    }

    protected void btnBack_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }

    protected void ValidateUser()
    {
        SqlConnection myConnection = new SqlConnection(this.SqlDataSource1.ConnectionString);

        myConnection.Open();

        SqlCommand command = new SqlCommand("SELECT * FROM [dbo].[UserAccounts] WHERE username COLLATE Latin1_General_CS_AS LIKE  '%' + @username + '%' AND password COLLATE Latin1_General_CS_AS LIKE '%' + @password + '%';", myConnection);



        command.Parameters.AddWithValue("@username", this.userName.Text);
        command.Parameters.AddWithValue("@password", this.password.Text);

        SqlDataReader reader = command.ExecuteReader();

        if (reader.Read())
        {
            Session["username"] = this.userName.Text;
            Session["password"] = this.password.Text;
            myConnection.Close();
            Response.Redirect("Post.aspx");
        }
        else
        {
            this.LoginMessage.Text = "Wrong username or password";
            myConnection.Close();
        }

    }
    protected void btnLogin_OnClick(object sender, EventArgs e)
    {
        if (this.btnLogin.Text == "Logout")
        {
            Session.Contents.RemoveAll();
            Session.Abandon();
        }
    }
}