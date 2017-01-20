using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected string Query { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        var query = Request.QueryString["query"];
        if (string.IsNullOrEmpty(query))
            Response.Redirect("~/Default.aspx");

        Query = query;
    }
}