<%@ Page Title="New Post" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewPost.aspx.cs" Inherits="NewPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <div class="container">
        <form class="form-horizontal" runat="server">
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
                <asp:Label ID="TitleLabel" runat="server" AssociatedControlID="PostTitle" CssClass="control-label col-sm-4">Title:</asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="PostTitle" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="TitleRequired" runat="server" ControlToValidate="PostTitle" ErrorMessage="Title is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <asp:SqlDataSource ID="Categories" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" AssociatedControlID="Category" CssClass="control-label col-sm-4">Category:</asp:Label>
                <div class="col-sm-4">
                    <asp:DropDownList runat="server" ID="Category" DataSourceID="Categories" CssClass="form-control" DataTextField="Name" DataValueField="Id"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Category" ErrorMessage="Category is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="control-label col-sm-4" AssociatedControlID="Link">Type:</asp:Label>
                <div class="col-sm-2">
                    <asp:RadioButton runat="server" AutoPostBack="True" ID="Link" Text="Link" GroupName="TypeBox" CssClass="radio-inline" OnCheckedChanged="Link_OnCheckedChanged"/>
                </div>
                <div class="col-sm-2">
                    <asp:RadioButton runat="server" AutoPostBack="True" ID="Text" Text="Text" GroupName="TypeBox" CssClass="radio-inline" OnCheckedChanged="Text_OnCheckedChanged"/>
                </div>
            </div>
            <div class="form-group" runat="server" Visible="False" id="BoxLink">
                <asp:Label ID="Label3" runat="server" AssociatedControlID="LinkURL" CssClass="control-label col-sm-4">Link:</asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="LinkURL" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LinkURL" ErrorMessage="URL is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator 
                            ID="RegularExpressionValidator1"
                            runat="server" 
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"
                            ControlToValidate="LinkURL"
                            ErrorMessage="Input valid Internet URL!"
                            CssClass="text-danger"
                            Display="Dynamic"
                            ></asp:RegularExpressionValidator>
                </div>
                <div class="clearfix" style="padding: 0 0 15px 0;"></div>
                <asp:Label ID="Label5" runat="server" AssociatedControlID="LinkUpload" CssClass="control-label col-sm-4">File:</asp:Label>
                <div class="col-sm-4">
                    <asp:FileUpload ID="LinkUpload" runat="server"  />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="LinkUpload" ErrorMessage="Thumbnail is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group" runat="server" Visible="False" id="BoxText">
                <asp:Label ID="Label4" runat="server" AssociatedControlID="PostText" CssClass="control-label col-sm-4">Text:</asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="PostText" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PostText" ErrorMessage="Text is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-4 col-sm-offset-4">
                    <asp:Button runat="server" OnClick="OnClick" CssClass="btn btn-primary btn-lg" Text="Submit"/>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" Runat="Server">
</asp:Content>