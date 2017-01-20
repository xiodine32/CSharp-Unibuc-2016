<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <form runat="server" class="form-horizontal">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <div class="form-group">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="control-label col-sm-4">User Name:</asp:Label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="control-label col-sm-4">Password:</asp:Label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label col-sm-4">Confirm Password:</asp:Label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" CssClass="control-label col-sm-4">E-mail:</asp:Label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" CssClass="control-label col-sm-4">Security Question:</asp:Label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="Question" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" CssClass="control-label col-sm-4">Security Answer:</asp:Label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="Answer" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-4">
                                <div class="alert alert-danger">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-4">
                                <asp:Button ID="RegistrationButton" ValidationGroup="CreateUserWizardStep1" CommandName="MoveNext" class="btn btn-lg btn-primary btn-block" runat="server" Text="Register" />
                            </div>
                        </div>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    <ContentTemplate>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-4 alert alert-success">
                                Your account has been successfully created.
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-4 alert alert-success">
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1"/>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <LayoutTemplate>
                <div class="container">
                    <asp:PlaceHolder ID="headerPlaceHolder" runat="server"/>
                    <asp:PlaceHolder ID="sideBarPlaceHolder" runat="server"/>
                    <asp:PlaceHolder ID="WizardStepPlaceHolder" runat="server"/>
                    <asp:PlaceHolder ID="navigationPlaceHolder" runat="server"/>
                </div>
            </LayoutTemplate>
        </asp:CreateUserWizard>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" Runat="Server">
</asp:Content>