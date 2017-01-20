using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default : Page
{
    private string TopCommand { get; set; } = " TOP 10";
    private string SelectCommand { get; } = "SELECT";
    private string SelectTopCommand { get; } = " Posts.Id, Categories.Name AS CategoryName, Users.UserName, Posts.Title, Posts.Image, Posts.Text, Posts.Link, Posts.CreatedAt, Posts.EditedAt FROM Posts INNER JOIN Categories ON Posts.Category = Categories.Id INNER JOIN Users ON Posts.EditorId = Users.UserId";
    private string WhereCommand { get; set; } = "";
    private string OrderCommand { get; set; } = " ORDER BY Posts.EditedAt DESC";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
            HandlePostback();
        
        var category = Request.QueryString["category"];
        if (string.IsNullOrEmpty(category))
        {
            Posts.SelectCommand = SelectCommand + TopCommand + SelectTopCommand + WhereCommand + OrderCommand;
            Repeater1.DataBind();
            return;
        }

        Categories.SelectParameters.Clear();
        Categories.SelectParameters.Add("Id", category);
        var selected = (DataView) Categories.Select(DataSourceSelectArguments.Empty);

        if (selected == null)
        {
            Posts.SelectCommand = SelectCommand + TopCommand + SelectTopCommand + WhereCommand + OrderCommand;
            Repeater1.DataBind();
            return;
        }

        if (string.IsNullOrEmpty(WhereCommand))
            WhereCommand += " WHERE ";
        else
            WhereCommand += " AND ";
        WhereCommand += " Posts.Category = @Category";

        Posts.SelectParameters.Clear();
        Posts.SelectParameters.Add("Category", category);
        Posts.SelectCommand = SelectCommand + TopCommand + SelectTopCommand + WhereCommand + OrderCommand;
        Repeater1.DataBind();
        CategoryName = selected[0].Row["Name"] + " ";
    }

    private void HandlePostback()
    {
        TopCommand = "";
        if (!string.IsNullOrEmpty(SortType.Value))
        {
            SortName.Value = "";
            SortDate.Value = "";
            switch (SortType.Value)
            {
                case "links":
                    WhereCommand = " WHERE Image IS NOT NULL";
                    return;
                case "posts":
                    WhereCommand = " WHERE Image IS NULL";
                    return;
                default:
                    return;
            }
        }
        if (!string.IsNullOrEmpty(SortName.Value))
        {
            SortDate.Value = "";
            SortType.Value = "";
            switch (SortName.Value)
            {
                case "asc":
                    OrderCommand = " ORDER BY Title ASC";
                    return;
                case "desc":
                    OrderCommand = " ORDER BY Title DESC";
                    return;
                default:
                    return;
            }
        }

        if (string.IsNullOrEmpty(SortDate.Value))
            return;

        SortName.Value = "";
        SortType.Value = "";
        switch (SortDate.Value)
        {
            case "asc":
                OrderCommand = " ORDER BY EditedAt ASC";
                return;
            case "desc":
                OrderCommand = " ORDER BY EditedAt DESC";
                return;
            default:
                return;
        }
    }

    public string CategoryName { get; set; } = "";
}