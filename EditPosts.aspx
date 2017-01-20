<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditPosts.aspx.cs" Inherits="EditPosts" validateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    
    <div class="container">
        <div class="text-center">
            <asp:HyperLink Text="Add" runat="server" NavigateUrl="~/NewPost.aspx" CssClass="btn btn-primary btn-lg"/>
            <br/>
            <br/>
        </div>
    <form runat="server" class="form-horizontal">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Posts.Id, Users.UserName AS Editor, Posts.Title, Posts.Link, Posts.Text, Posts.Image, Categories.Name AS Category, Posts.CreatedAt, Posts.EditedAt FROM Posts INNER JOIN Categories ON Posts.Category = Categories.Id INNER JOIN Users ON Posts.EditorId = Users.UserId" DeleteCommand="DELETE FROM Posts WHERE (Id = @Id)" UpdateCommand="UPDATE Posts SET Title = @Title, Link = @Link, Text = @Text, Image = @Image, EditedAt = CURRENT_TIMESTAMP WHERE Id = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" />
                <asp:Parameter Name="Link" />
                <asp:Parameter Name="Text" />
                <asp:Parameter Name="Image" />
                <asp:Parameter Name="Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="Id">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Editor" HeaderText="Editor" SortExpression="Editor" ReadOnly="True" />
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox4" runat="server" ErrorMessage="Required!" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Link" SortExpression="Link">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Link") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator 
                            ID="RegularExpressionValidator1"
                            runat="server" 
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"
                            ControlToValidate="TextBox1"
                            ErrorMessage="Input valid Internet URL!"
                            ></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Link") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Text" SortExpression="Text">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Text") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Text") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image" SortExpression="Image">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Image") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" ReadOnly="True" />
                <asp:BoundField DataField="CreatedAt" HeaderText="CreatedAt" SortExpression="CreatedAt" ReadOnly="True" />
                <asp:BoundField DataField="EditedAt" HeaderText="EditedAt" SortExpression="EditedAt" ReadOnly="True" />
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
        </form>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" Runat="Server">
</asp:Content>

