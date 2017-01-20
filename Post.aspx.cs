using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Post : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["error"] = null;
        var id = Request.QueryString["id"];

        if (string.IsNullOrEmpty(id)) {
            Response.Redirect("~/Default.aspx");
            return;
        }
        int returnId;

        if (int.TryParse(id, out returnId))
            return;

        Response.Redirect("~/Default.aspx");
    }

    protected void OnClick(object sender, EventArgs e)
    {
        var command = new SqlCommand("INSERT INTO Comments (Name, Text, CreatedAt, PostId) VALUES (@Name, @Text, @CreatedAt, @PostId)",
            new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString));

        command.Parameters.AddWithValue("Name", User.Identity.Name);
        command.Parameters.AddWithValue("Text", (LoginView.FindControl("InsertText") as TextBox)?.Text);
        command.Parameters.AddWithValue("CreatedAt", DateTime.Now);
        command.Parameters.AddWithValue("PostId", Request.QueryString["id"]);
        command.Connection.Open();
        try
        {
            command.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            ViewState["error"] = "Error: " + ee.Message;
        }
        finally
        {
            command.Connection.Close();
            GridView1.DataBind();
            var item = LoginView.FindControl("InsertText") as TextBox;
            if (item != null)
                item.Text = "";
        }

    }
}