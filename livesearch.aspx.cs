using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class livesearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = Request.Params["q"];
        
        SqlConnection myConnection = new SqlConnection(this.SqlDataSource1.ConnectionString);
        myConnection.Open();
        // % sign says 0 or more characters before or after input
        SqlCommand command = new SqlCommand("SELECT * FROM Articles WHERE titleText LIKE '%"+ s +"%'", myConnection);
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            //pastes the content on the page in link form
            Response.Write("<a href='Content.aspx?q="+reader["id"].ToString() + "'>" + reader["titleText"].ToString() + "</a></br>");
        }
    }




}