<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ideas.aspx.cs" Inherits="Ideas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <div class="container">
        <form class="form-horizontal" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Ideas] WHERE [Id] = @original_Id AND [Name] = @original_Name AND [Text] = @original_Text AND [CreatedAt] = @original_CreatedAt AND (([RejectionSummary] = @original_RejectionSummary) OR ([RejectionSummary] IS NULL AND @original_RejectionSummary IS NULL))" InsertCommand="INSERT INTO [Ideas] ([Name], [Text], [CreatedAt], [RejectionSummary]) VALUES (@Name, @Text, @CreatedAt, @RejectionSummary)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Ideas]" UpdateCommand="UPDATE [Ideas] SET [RejectionSummary] = @RejectionSummary WHERE [Id] = @original_Id AND [Name] = @original_Name AND [Text] = @original_Text AND [CreatedAt] = @original_CreatedAt AND (([RejectionSummary] = @original_RejectionSummary) OR ([RejectionSummary] IS NULL AND @original_RejectionSummary IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Text" Type="String" />
                    <asp:Parameter Name="original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="original_RejectionSummary" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Text" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="RejectionSummary" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Text" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="RejectionSummary" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Text" Type="String" />
                    <asp:Parameter Name="original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="original_RejectionSummary" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="table table-striped" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField HeaderText="Actions" ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                    <asp:BoundField DataField="Text" HeaderText="Text" ReadOnly="True" SortExpression="Text" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="Created At" ReadOnly="True" SortExpression="CreatedAt" />
                    <asp:BoundField DataField="RejectionSummary" HeaderText="Rejection Summary" SortExpression="RejectionSummary" />
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

