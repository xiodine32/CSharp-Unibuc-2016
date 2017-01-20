<%@ Page Title="Search" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <form runat="server">
        <asp:SqlDataSource runat="server" ID="Posts" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Posts.Id, Categories.Name AS CategoryName, Posts.Image, Posts.EditedAt, Posts.CreatedAt, Posts.Text, Posts.Link, Posts.Title, Users.UserName FROM Posts INNER JOIN Categories ON Posts.Category = Categories.Id INNER JOIN Users ON Posts.EditorId = Users.UserId WHERE (Posts.Text LIKE '%' + @Text + '%')">
            <SelectParameters>
                <asp:QueryStringParameter Name="Text" QueryStringField="query" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="container">
            <h1>Searched for '<%= Query %>'</h1>
            <hr/>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="Posts" >
                <ItemTemplate>
                    <div class="col-sm-offset-2 col-sm-8">
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/Post.aspx?id=" + Eval("ID") %>' runat="server" CssClass="a-disable">
                            <div class="well">
                                <h3 class="pull-right"><%# Eval("CategoryName")  %></h3>
                                <h2><%# Eval("Title")  %></h2>
                                <hr />
                                <%# !string.IsNullOrEmpty(Eval("Link").ToString()) ? 
                                        "<h4>Link</h4><a href='" + Eval("Link") + "'><img src='" + Eval("Image") + "' class='img-responsive' target='_blank'/></a>" : 
                                        "<h4>Text</h4><p>" + Eval("Text") + "</p>"
                                    %>
                                <hr/>
                                <span><%# Eval("UserName")%></span>
                                <span class="pull-right"><%# Eval("EditedAt") != Eval("CreatedAt") ?
                                                                 "edited at: <strong>" + Eval("EditedAt") + "</strong>":
                                                                 "created at: <strong>" + Eval("CreatedAt") + "</strong>"%></span>
                        
                            </div>
                        </asp:HyperLink>
                    </div>
                
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" Runat="Server">
</asp:Content>

