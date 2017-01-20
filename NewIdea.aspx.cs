using System;
using System.Web.Security;
using System.Web.UI;

public partial class NewIdea : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
            Response.Redirect(FormsAuthentication.LoginUrl);
    }

    protected void Submit_OnClick(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters.Clear();
        SqlDataSource1.InsertParameters.Add("Name", User.Identity.Name);
        SqlDataSource1.InsertParameters.Add("Text", Text.Text);
        SqlDataSource1.InsertParameters.Add("CreatedAt", DateTime.Now.ToString("s"));
        if (SqlDataSource1.Insert() != 0)
            Success.Visible = true;
        else
            Failed.Visible = true;
    }
}