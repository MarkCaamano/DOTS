<%@ Page Title="" Language="C#" MasterPageFile="MasterPageStart.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxPop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="loginScreen">
        
        <asp:Label ID="lblLogin" runat="server" CssClass="header1">Login</asp:Label>
        <%--<div class="instructions">Please do not include spaces when entering the email or password</div>--%>
        <asp:Label ID="lblErrorMessage" runat="server" CssClass="warning" Style="margin-left: 10%;" ValidateRequestMode="Enabled" Visible="False"></asp:Label>
        <asp:Table ID="Table1" runat="server" Style="margin-left: 10%;" CellPadding="5">
            <asp:TableRow>
                <asp:TableCell VerticalAlign="Top">
                    <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="login"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtBoxEmail" runat="server" Width="300" Height="30"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Please enter an email" ValidationGroup="Submit" ControlToValidate="txtBoxEmail" CssClass="warning" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invaild email format; do not include spaces" Display="Dynamic" CssClass="fa-exclamation-triangle warning" ControlToValidate="txtBoxEmail" ValidationGroup="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell VerticalAlign="Top">
                    <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="login"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtBoxPassword" runat="server" TextMode="Password" Width="300" Height="30"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Please enter your password" ControlToValidate="txtBoxPassword" ValidationGroup="Submit" CssClass="warning" Display="Dynamic" ></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:LinkButton ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" ValidationGroup="Submit" CssClass="btnLogin" Width="120" />
                </asp:TableCell></asp:TableRow><asp:TableRow>
                <asp:TableCell>
                    <asp:LinkButton ID="LinkButton2" runat="server" Text="Register" CssClass="linkBtn" Enabled="False"></asp:LinkButton>
                    <span>|</span>
                    <asp:LinkButton ID="forgotPasswordBtn" runat="server" Text="Forgot Password" OnClick="forgotPasswordBtn_Click" CssClass="linkBtn"></asp:LinkButton>
                </asp:TableCell></asp:TableRow></asp:Table></div><%--Style="display: none;"--%><ajaxPop:ModalPopupExtender ID="mp1" runat="server" PopupControlID="forgotPass" TargetControlID="forgotPasswordBtn" BackgroundCssClass="modalBackground" />

    <asp:Panel ID="forgotPass" runat="server" CssClass="modalPopup" ValidateRequestMode="Inherit">
        <div class="modalHeader">Password Recovery</div><p class="tbforgotPassInstructions">To reset your password, enter the email address associated with your account.</p><asp:Table runat="server" ID="tbforgotPass" Style="margin-left: 10%;">

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label2" runat="server" Text="Email" CssClass="login"></asp:Label>
                </asp:TableCell></asp:TableRow><asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" runat="server" Width="300" Height="30"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter an email" ValidationGroup="forgotPassSubmit" CssClass="warning" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invaild email format" Display="Dynamic" CssClass="warning" ControlToValidate="txtEmail" ValidationGroup="forgotPassSubmit" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </asp:TableCell></asp:TableRow><asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                   <%-- CssClass="warning"--%>
                   <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="Table3" runat="server" CssClass="rightFloat" Style="margin: 0 10px 10px 0">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:LinkButton ID="lkbtnResetPassword" runat="server" OnClick="lkbtnResetPassword_Click" CssClass="btnLogin" Text="Reset password" ValidationGroup="forgotPassSubmit"></asp:LinkButton>
                </asp:TableCell><asp:TableCell>
                    &nbsp;
                </asp:TableCell><asp:TableCell>
                    <asp:LinkButton ID="lkbtnCancel" runat="server" CssClass="btnCancel" Text="Cancel" OnClick="lkbtnCancel_Click"></asp:LinkButton>
                </asp:TableCell></asp:TableRow></asp:Table></asp:Panel></asp:Content>