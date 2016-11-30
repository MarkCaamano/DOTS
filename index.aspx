<%@ Page Title="" Language="C#" MasterPageFile="MasterPageStart.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <form id="form1" runat="server">
        <asp:Label ID="lblLogin" runat="server" CssClass="header1">Login</asp:Label>
        <div class="instructions">Please do not include spaces when entering the email or password</div>        
        <asp:Label ID="lblErrorMessage" runat="server" CssClass="warning" Style="margin-left: 10%;" ValidateRequestMode="Enabled"></asp:Label>
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

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invaild email format" Display="Dynamic" CssClass="warning" ControlToValidate="txtBoxEmail" ValidationGroup="Submit" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Please enter your password" ControlToValidate="txtBoxPassword" ValidationGroup="Submit" CssClass="warning" Display="Dynamic"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" ValidationGroup="Submit" CssClass="btnLogin" />
        </asp:TableCell>
                </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                 <asp:LinkButton ID="LinkButton2" runat="server" Text="Register"  CssClass="linkBtn" Enabled="False"></asp:LinkButton> <span>|</span> <asp:LinkButton ID="LinkButton1" runat="server" Text="Forgot Password" OnClick="forgotPasswordBtn_Click" CssClass="linkBtn"></asp:LinkButton>                    
         </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <div class="spacer"></div>
    </form>
</asp:Content>
