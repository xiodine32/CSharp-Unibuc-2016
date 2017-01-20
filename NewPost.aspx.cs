using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.ExtendsRole(IdentityExtender.Administrator))
            FormsAuthentication.RedirectToLoginPage();
        ViewState["error"] = null;
    }

    protected void Text_OnCheckedChanged(object sender, EventArgs e)
    {
        BoxText.Visible = Text.Checked;
        BoxLink.Visible = Link.Checked;
    }

    protected void Link_OnCheckedChanged(object sender, EventArgs e)
    {
        BoxText.Visible = Text.Checked;
        BoxLink.Visible = Link.Checked;
    }

    protected void OnClick(object sender, EventArgs e)
    {
        if (!BoxText.Visible && !BoxLink.Visible)
        {
            ViewState["error"] = "Type is required";
            return;
        }

        if (BoxLink.Visible)
        {
            // validate image
            if (!LinkUpload.PostedFile.ContentType.ToLower().EndsWith("jpeg"))
            {
                ViewState["error"] = "Image file is not in JPEG format! Format is: " +
                                     LinkUpload.PostedFile.ContentType.ToUpper();
                return;
            }
            var filename = "/Images/" + Guid.NewGuid().ToString().Replace("-", string.Empty) + ".jpg";

            LinkUpload.SaveAs(Server.MapPath("~") + filename);

            const string queryLink =
                "INSERT INTO Posts (EditorId, Title, Link, Text, CreatedAt, EditedAt, Category, Image)"
                + " VALUES (@EditorId, @Title, @Link, NULL, @CreatedAt, @EditedAt, @Category, @Image)";
            var comLink = new SqlCommand(queryLink,
                new SqlConnection(
                    System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString));
            comLink.Parameters.AddWithValue("EditorId", Membership.GetUser()?.ProviderUserKey?.ToString());
            comLink.Parameters.AddWithValue("Title", PostTitle.Text);
            comLink.Parameters.AddWithValue("Link", LinkURL.Text);
            comLink.Parameters.AddWithValue("CreatedAt", DateTime.Now);
            comLink.Parameters.AddWithValue("EditedAt", DateTime.Now);
            comLink.Parameters.AddWithValue("Category", Category.SelectedValue);
            comLink.Parameters.AddWithValue("Image", filename);
            comLink.Connection.Open();
            try
            {
                comLink.ExecuteNonQuery();
                Response.Redirect("~/Default.aspx");
            }
            catch (Exception eee)
            {
                ViewState["error"] = "Exception: " + eee.Message;
            }
            finally
            {
                comLink.Connection.Close();
            }
            return;
        }
        // BoxText

        const string query = "INSERT INTO Posts (EditorId, Title, Link, Text, CreatedAt, EditedAt, Category, Image)"
                             + " VALUES (@EditorId, @Title, NULL, @Text, @CreatedAt, @EditedAt, @Category, NULL)";
        var com = new SqlCommand(query,
            new SqlConnection(
                System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString));
        com.Parameters.AddWithValue("EditorId", Membership.GetUser()?.ProviderUserKey?.ToString());
        com.Parameters.AddWithValue("Title", PostTitle.Text);
        com.Parameters.AddWithValue("Text", PostText.Text);
        com.Parameters.AddWithValue("CreatedAt", DateTime.Now);
        com.Parameters.AddWithValue("EditedAt", DateTime.Now);
        com.Parameters.AddWithValue("Category", Category.SelectedValue);
        com.Connection.Open();
        try
        {
            com.ExecuteNonQuery();
            Response.Redirect("~/Default.aspx");
        }
        catch (Exception eee)
        {
            ViewState["error"] = "Exception: " + eee.Message;
        }
        finally
        {
            com.Connection.Close();
        }

    }
}