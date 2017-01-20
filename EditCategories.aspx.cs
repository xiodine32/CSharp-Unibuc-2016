using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_OnClick(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters.Clear();
        SqlDataSource1.InsertParameters.Add("Name", InsertBu.Text);
        SqlDataSource1.Insert();
    }
}