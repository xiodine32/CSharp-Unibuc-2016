<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditUsers.aspx.cs" Inherits="EditUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <div class="container">
    <form runat="server" class="form-horizontal">
        <div class="form-group" id="Details" runat="server" Visible="False">
            <asp:Label ID="Label1" runat="server" Text="Label" CssClass="control-label col-sm-4">Roles:</asp:Label>
            <div class="col-sm-4">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="radio-inline" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_OnSelectedIndexChanged">
                    <asp:ListItem Value="Normal"></asp:ListItem>
                    <asp:ListItem Value="Editor"></asp:ListItem>
                    <asp:ListItem Value="Administrator"></asp:ListItem>
                </asp:RadioButtonList>
                
            </div>
            <div class="clearfix" style="padding: 0 0 20px 0;"></div>
            <div class="col-sm-4 col-sm-offset-4">
                <asp:Button runat="server" ID="Delete" CssClass="btn btn-danger btn-lg" OnClick="Delete_OnClick" Text="Delete"/>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Users]">

        </asp:SqlDataSource>
        <div style="display: table; margin: 0 auto;">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" CellPadding="10" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Horizontal" CellSpacing="10" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="UserId" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
                    <asp:BoundField DataField="ApplicationId" HeaderText="ApplicationId" SortExpression="ApplicationId" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:CheckBoxField DataField="IsAnonymous" HeaderText="IsAnonymous" SortExpression="IsAnonymous" />
                    <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" SortExpression="LastActivityDate" />
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
     </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" Runat="Server">
</asp:Content>

