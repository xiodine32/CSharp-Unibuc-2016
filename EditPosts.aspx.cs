using System;
using System.Web.Security;
using System.Web.UI;

public partial class EditPosts : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.ExtendsRole(IdentityExtender.Editor))
            FormsAuthentication.RedirectToLoginPage();
    }
}