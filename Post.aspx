<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <asp:SqlDataSource runat="server" ID="Posts" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Posts.Id, Categories.Name as CategoryName, Posts.Image, Posts.EditedAt, Posts.CreatedAt, Posts.Text, Posts.Link, Posts.Title, Users.UserName FROM Posts INNER JOIN Categories ON Posts.Category = Categories.Id INNER JOIN Users ON Posts.EditorId = Users.UserId WHERE (Posts.Id = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="Comments" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT CreatedAt, Text, Name FROM Comments WHERE (PostId = @Id) ORDER BY CreatedAt DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="Posts" >
        <ItemTemplate>
            <div class="container">
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
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <form runat="server" class="form-horizontal">
        <div class="container">
            <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" DataSourceID="Comments" ForeColor="#333333" GridLines="None"  CssClass="table table-striped" AutoGenerateColumns="False" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" />
                            <asp:BoundField DataField="CreatedAt" HeaderText="At" SortExpression="CreatedAt" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
            </div>
        </div>
        <asp:LoginView runat="server" ID="LoginView">
            <AnonymousTemplate>
                <div class="text-center">
                    <h2>Log in to comment</h2>
                </div>
            </AnonymousTemplate>
            <LoggedInTemplate>
                    <% if (ViewState["error"] != null)
               { %>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-4">
                    <div class="alert alert-danger">
                        <%= ViewState["error"] %>
                    </div>
                </div>
            </div>
            <% } %>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Text: " AssociatedControlID="InsertText" CssClass="col-sm-4 control-label"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="InsertText" runat="server" TextMode="MultiLine" CssClass="form-control no-resize"></asp:TextBox>
                <asp:RequiredFieldValidator  runat="server" ControlToValidate="InsertText" ErrorMessage="A message is required!" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            
        </div>
        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <asp:Button runat="server" CssClass="btn btn-primary btn-lg" Text="Submit" OnClick="OnClick"/>
            </div>
        </div>
            </LoggedInTemplate>
        </asp:LoginView>
        
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" Runat="Server">
</asp:Content>

