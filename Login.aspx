<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server" >
    <form runat="server" class="form-horizontal">
        <div class="container">
        <asp:Login ID="Login1" runat="server" RenderOuterTable="False">
            <LayoutTemplate>
                <div class="form-group">
                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="control-label col-sm-4">User Name:</asp:Label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="control-label col-sm-4">Password:</asp:Label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-4">
                        <asp:CheckBox ID="RememberMe" runat="server" Text="&nbsp;Remember me next time." />
                    </div>
                </div>
                <asp:Label ID="FailureText" runat="server" CssClass="alert alert-danger alert-block col-sm-offset-4 col-sm-4"></asp:Label>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-4">
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" CssClass="btn btn-lg btn-primary"/>
                        <asp:Button ID="RegisterButton" runat="server" Text="Register" CssClass="btn btn-lg btn-default" OnClick="RegisterButton_OnClick"/>
                    </div>
                </div>
            </LayoutTemplate>
        </asp:Login>
            </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" Runat="Server">
</asp:Content>

