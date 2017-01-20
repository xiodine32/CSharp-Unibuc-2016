using System;
using System.Web.Security;
using System.Web.UI;

public partial class EditUsers : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.ExtendsRole(IdentityExtender.Administrator))
            FormsAuthentication.RedirectToLoginPage();

        Details.Visible = false;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        var gridView1SelectedValue = (Guid?) GridView1.SelectedValue;
        if (gridView1SelectedValue == null)
            return;
        var user = Membership.GetUser((Guid) gridView1SelectedValue);
        if (user == null)
            return;

        Details.Visible = true;
        // there must be only one
        var roles = Roles.GetRolesForUser(user.UserName);
        if (roles.Length == 0)
            Roles.AddUserToRole(user.UserName, "Normal");
        roles = Roles.GetRolesForUser(user.UserName);
        RadioButtonList1.SelectedValue = roles[0];
    }

    protected void RadioButtonList1_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        var gridView1SelectedValue = (Guid?)GridView1.SelectedValue;
        if (gridView1SelectedValue == null)
            return;
        var user = Membership.GetUser((Guid)gridView1SelectedValue);
        if (user == null)
            return;
        Roles.RemoveUserFromRoles(user.UserName, Roles.GetRolesForUser(user.UserName));
        Roles.AddUserToRole(user.UserName, RadioButtonList1.SelectedValue);
    }

    protected void Delete_OnClick(object sender, EventArgs e)
    {
        var gridView1SelectedValue = (Guid?)GridView1.SelectedValue;
        if (gridView1SelectedValue == null)
            return;
        var user = Membership.GetUser((Guid)gridView1SelectedValue);
        if (user == null)
            return;
        Membership.DeleteUser(user.UserName, true);
    }
}