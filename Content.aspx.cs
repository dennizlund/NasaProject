using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.ServiceModel.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string title = Request.Form["inputTitle"];
        string content = Request.Form["inputContentUpdate"];

        if (Session["username"] != null && Session["password"] != null)
        {
            this.btnLogin.Text = "Logout";
        }
        else
        {
            this.btnLogin.Text = "Login";
        }

        this.GetInfo();

    }

    protected string readContent(string path)
    {
        using (StreamReader sr = new StreamReader(Server.MapPath(path), true))
        {
            string line = sr.ReadToEnd();
            return line;
        }
    }

    protected void GetInfo()
    {
        string id = Request.Params["q"];
        SqlConnection myConnection = new SqlConnection(this.SqlDataSource1.ConnectionString);

        myConnection.Open();

        SqlCommand command = new SqlCommand("SELECT * FROM Articles WHERE id = @id", myConnection);
        command.Parameters.AddWithValue("@id", id);

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

    protected void btnLogin_OnClick(object sender, EventArgs e)
    {
        if (this.btnLogin.Text == "Logout")
        {
            Session.RemoveAll();
            Session.Abandon();
        }
        else
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}