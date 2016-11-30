<%@ Page Title="" Language="C#" MasterPageFile="MasterPageStart.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="DOTS.register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" CssClass="header1">Registration</asp:Label><br />
        <asp:Label ID="Label2" runat="server" CssClass="header2">Member registration form</asp:Label>
        <asp:Table runat="server" ID="Table1" style="margin: 0% 0% 0% 10%;">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name: " CssClass="login"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirstName" runat="server" Width="173"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your first name" ValidationGroup="Submit" CssClass="warning" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name: " CssClass="login"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLastName" runat="server" Width="173"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your last name" ValidationGroup="Submit" CssClass="warning" ControlToValidate="txtLastName"></asp:RequiredFieldValidator><br />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEmail" runat="server" Text="Email: " CssClass="login"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtBoxEmail" runat="server" Width="173"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Please enter an email" ValidationGroup="Submit" CssClass="warning" ControlToValidate="txtBoxEmail"></asp:RequiredFieldValidator><br />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPassword" runat="server" Text="Password: " CssClass="login"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword" runat="server" Width="173" TextMode="Password"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Please enter Password" ValidationGroup="Submit" CssClass="warning" ControlToValidate="txtPassword"></asp:RequiredFieldValidator><br />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password: " CssClass="login"> </asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" Width="173" TextMode="Password"></asp:TextBox>&nbsp;
                    <asp:CompareValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" ErrorMessage="Password Does Not Match" ValidationGroup="Submit" CssClass="warning" ControlToValidate="txtPassword" ControlToCompare="txtConfirmPassword"></asp:CompareValidator><br />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCompany" runat="server" Text="Company: " CssClass="login" Enabled="False"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCompany" runat="server" Width="173" Enabled="False"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <%--            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblSecurity" runat="server" Text="Security: " class="login"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSecurity" runat="server" Width="173"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>--%>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCaptcha" runat="server" Text=""></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:LinkButton ID="resetBtn" runat="server" CssClass="linkBtn" Text="Reset Form"></asp:LinkButton>
                </asp:TableCell>

                <asp:TableCell>
                    <asp:LinkButton ID="submitBtn" runat="server" CssClass="linkBtn" Text="Submit" ValidationGroup="Submit"></asp:LinkButton>
                </asp:TableCell>

                <asp:TableCell>
                    <asp:LinkButton ID="returnBtn" runat="server" CssClass="linkBtn rgtBtn" Text="Return" OnClick="returnBtn_Click"></asp:LinkButton>
                </asp:TableCell>
            </asp:TableRow>

        </asp:Table>
    </form>
</asp:Content>