<%@ Page Title="New Idea" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewIdea.aspx.cs" Inherits="NewIdea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-4">
                    <asp:Label runat="server" Id="Success" CssClass="alert alert-success alert-block" Text="Your input uaz saved successfully!" Visible="False" ></asp:Label>
                    <asp:Label runat="server" Id="Failed" CssClass="alert alert-danger alert-block" Text="Error saving, please try again later!" Visible="False"></asp:Label>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Ideas] WHERE [Id] = @original_Id AND [Name] = @original_Name AND [Text] = @original_Text AND [CreatedAt] = @original_CreatedAt AND (([RejectionSummary] = @original_RejectionSummary) OR ([RejectionSummary] IS NULL AND @original_RejectionSummary IS NULL))" InsertCommand="INSERT INTO [Ideas] ([Name], [Text], [CreatedAt]) VALUES (@Name, @Text, @CreatedAt)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Ideas]" UpdateCommand="UPDATE [Ideas] SET [Name] = @Name, [Text] = @Text, [CreatedAt] = @CreatedAt, [RejectionSummary] = @RejectionSummary WHERE [Id] = @original_Id AND [Name] = @original_Name AND [Text] = @original_Text AND [CreatedAt] = @original_CreatedAt AND (([RejectionSummary] = @original_RejectionSummary) OR ([RejectionSummary] IS NULL AND @original_RejectionSummary IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32"/>
                    <asp:Parameter Name="original_Name" Type="String"/>
                    <asp:Parameter Name="original_Text" Type="String"/>
                    <asp:Parameter Name="original_CreatedAt" Type="DateTime"/>
                    <asp:Parameter Name="original_RejectionSummary" Type="String"/>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String"/>
                    <asp:Parameter Name="Text" Type="String"/>
                    <asp:Parameter Name="CreatedAt" Type="DateTime"/>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String"/>
                    <asp:Parameter Name="Text" Type="String"/>
                    <asp:Parameter Name="CreatedAt" Type="DateTime"/>
                    <asp:Parameter Name="RejectionSummary" Type="String"/>
                    <asp:Parameter Name="original_Id" Type="Int32"/>
                    <asp:Parameter Name="original_Name" Type="String"/>
                    <asp:Parameter Name="original_Text" Type="String"/>
                    <asp:Parameter Name="original_CreatedAt" Type="DateTime"/>
                    <asp:Parameter Name="original_RejectionSummary" Type="String"/>
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Text" CssClass="control-label col-sm-4" Text="Text"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox runat="server" ID="Text" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-4">
                    <asp:Button runat="server" Id="Submit" Text="Submit" CssClass="btn btn-lg btn-primary" OnClick="Submit_OnClick"/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" Runat="Server">
</asp:Content>