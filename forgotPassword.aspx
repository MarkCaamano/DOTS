<%@ Page Title="" Language="C#" MasterPageFile="MasterPageStart.Master" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="DOTS.forgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" CssClass="header1">Password Recovery</asp:Label>
       <%-- <asp:Label runat="server" class="header2">Password recovery</asp:Label>--%>
        <p class="instructions">To reset your password, enter the email address associated with your account.</p>
        <asp:Table runat="server" ID="Table1" style="margin-left: 10%;">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblemail" runat="server" Text="Email" CssClass="login"></asp:Label>
                </asp:TableCell>
                 </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" runat="server" Width="300" Height="30"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter an email" ValidationGroup="Submit" CssClass="warning" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                               <asp:TableCell>
                    &nbsp;
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="warning"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
          <asp:Table ID="Table2" runat="server" style="margin-left: 10%;">         
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="submitBtn" runat="server" OnClick="submitBtn_Click" CssClass="btnLogin" Text="Reset password" ValidationGroup="Submit" Width="130"></asp:Button>
                </asp:TableCell>
               <asp:TableCell>
                    &nbsp;
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="returnBtn" runat="server" CssClass="linkBtn rightFloat" Text="Return" OnClick="returnBtn_Click" ></asp:Button>                   
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table> 
        <div class="spacer"></div>
    </form>
</asp:Content>