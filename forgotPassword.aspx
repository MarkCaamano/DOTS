<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageStart.Master" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="DOTS.forgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" class="header1">Password Recovery</asp:Label>
       <%-- <asp:Label runat="server" class="header2">Password recovery</asp:Label>--%>
        <p style="margin-left: 10%;">To reset your password, enter the email address associated with your account.</p>
        <asp:Table runat="server" ID="Table1" style="margin-left: 10%;">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblemail" runat="server" Text="Email: " class="login"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" runat="server" Width="173"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter an email" ValidationGroup="Submit" class="warning" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
          <asp:Table ID="Table2" runat="server" style="margin-left: 10%; width:50%;">         
            <asp:TableRow>
                <asp:TableCell>
                    <asp:LinkButton ID="submitBtn" runat="server" OnClick="submitBtn_Click" class="linkBtn" Text="Reset password" ValidationGroup="Submit"></asp:LinkButton>
                </asp:TableCell>
               <asp:TableCell>
                    &nbsp;
                </asp:TableCell>
                <asp:TableCell>
                    <asp:LinkButton ID="returnBtn" runat="server" class="linkBtn rgtBtn" Text="Return" OnClick="returnBtn_Click"></asp:LinkButton>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </form>
        <div id="ErrorBox" class="ErrorBox" runat="server">
        <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>