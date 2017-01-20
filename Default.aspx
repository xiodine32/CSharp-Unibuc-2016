<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Diagnostics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <asp:SqlDataSource ID="Categories" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Categories] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="category" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <form runat="server" class="form-horizontal">
    <asp:SqlDataSource ID="Posts" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"></asp:SqlDataSource>
    <div class="container">
        <h1><%= CategoryName %>Posts</h1>
        <hr />
        <% if (!string.IsNullOrEmpty(CategoryName))
           { %>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Name" AssociatedControlID="SortName" CssClass="col-sm-1 control-label"></asp:Label>
            <div class="col-sm-3">
                <select id="SortName" runat="server" class="form-control" onchange="form.submit()">
                    <option value="">--- Select ---</option>
                    <option value="asc">Ascending</option>
                    <option value="desc">Descending</option>
                </select>
            </div>
            <asp:Label ID="Label2" runat="server" Text="Date" AssociatedControlID="SortDate" CssClass="col-sm-1 control-label"></asp:Label>
            <div class="col-sm-3">
                <select id="SortDate" runat="server" class="form-control" onchange="form.submit()">
                    <option value="">--- Select ---</option>
                    <option value="asc">Ascending</option>
                    <option value="desc">Descending</option>
                </select>
            </div>
            <asp:Label ID="Label3" runat="server" Text="Type" AssociatedControlID="SortType" CssClass="col-sm-1 control-label"></asp:Label>
            <div class="col-sm-3">
                <select id="SortType" runat="server" class="form-control" onchange="form.submit()">
                    <option value="">--- Select ---</option>
                    <option value="links">Links</option>
                    <option value="posts">Posts</option>
                </select>
            </div>
        </div>
        <hr />
        <% } %>
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

