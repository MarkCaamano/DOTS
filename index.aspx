<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageStart.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DOTS.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <form id="form1" runat="server">
        <asp:Label ID="lblLogin" runat="server" CssClass="header1">Login</asp:Label>
        
        <asp:Table ID="Table1" runat="server" Style="margin-left: 10%;" CellPadding="5">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEmail" runat="server" Text="Email: " CssClass="login"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtBoxEmail" runat="server" Width="173"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Please enter an email" ValidationGroup="Submit" ControlToValidate="txtBoxEmail" CssClass="warning"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPassword" runat="server" Text="Password: " CssClass="login"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtBoxPassword" runat="server" TextMode="Password" Width="173"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Please enter password" ControlToValidate="txtBoxPassword" ValidationGroup="Submit" CssClass="warning"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <%--<asp:TableRow>
                <asp:TableCell>
                    <asp:CheckBox ID="PersistCookie" runat="server" />
                    Remember Me
                </asp:TableCell>
            </asp:TableRow>--%>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" ValidationGroup="Submit" CssClass="btnLogin" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        &nbsp;<asp:Table ID="Table2" runat="server" Style="margin-left: 10%;">
            <asp:TableRow>
                <%--                <asp:TableCell>
                    <asp:LinkButton ID="regBtn" runat="server" Text="Register" OnClick="regBtn_Click" class="linkBtn" Visible="False" Enabled="False"></asp:LinkButton>
                </asp:TableCell>--%>
                <asp:TableCell>
                    <asp:LinkButton ID="forgotBtn" runat="server" Text="Forgot Password" OnClick="forgotPasswordBtn_Click" CssClass="linkBtn"></asp:LinkButton>
                </asp:TableCell>
                <asp:TableCell>
                    <%--<asp:LinkButton ID="helpBtn" runat="server" Text="Help?" class="linkBtn" style="float:right;"></asp:LinkButton>--%>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
    </form>
    <div id="ErrorBox" class="ErrorBox" runat="server">
        <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
