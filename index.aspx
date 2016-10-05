<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageStart.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DOTS.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <form id="form1" runat="server">
        <asp:Label ID="lblLogin" runat="server" class="header1">Login</asp:Label>
        <asp:Table ID="Table1" runat="server" ErrorMessage="Please enter password" Style="margin-left: 10%;" CellPadding="5">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEmail" runat="server" Text="Email: " class="login"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtBoxEmail" runat="server" Width="173"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Please enter an email" ValidationGroup="Submit" class="warning" ControlToValidate="txtBoxEmail"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPassword" runat="server" Text="Password: " class="login"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtBoxPassword" runat="server" TextMode="Password" Width="173"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Please enter password" ControlToValidate="txtBoxPassword" ValidationGroup="Submit" class="warning"></asp:RequiredFieldValidator>
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
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" ValidationGroup="Submit" class="btnLogin" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        &nbsp;<asp:Table ID="Table2" runat="server" Style="margin-left: 10%;">
            <asp:TableRow>
                <%--                <asp:TableCell>
                    <asp:LinkButton ID="regBtn" runat="server" Text="Register" OnClick="regBtn_Click" class="linkBtn" Visible="False" Enabled="False"></asp:LinkButton>
                </asp:TableCell>--%>
                <asp:TableCell>
                    <asp:LinkButton ID="forgotBtn" runat="server" Text="Forgot Password" OnClick="forgotPasswordBtn_Click" class="linkBtn"></asp:LinkButton>
                </asp:TableCell>
                <asp:TableCell>
                    <%--<asp:LinkButton ID="helpBtn" runat="server" Text="Help?" class="linkBtn" style="float:right;"></asp:LinkButton>--%>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </form>
    <div id="ErrorBox" class="ErrorBox" runat="server">
        <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
