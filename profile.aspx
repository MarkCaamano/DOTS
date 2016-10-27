<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDefault.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="profile" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxPop" %>
<asp:Content ID="content1" ContentPlaceHolderID="Content_Menu" runat="server">
    <span id="tabId" style="display: none">HyperLink3</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <asp:Panel ID="Account" runat="server" Style="margin: 2% 0% 0% 2%; width: 500px; margin-left: 3%;">
        <div id="idProfile">
            <div class="idProfileTitle"><%--My Profile--%>&nbsp;</div>
            <asp:Table runat="server" ID="tblProfile" CssClass="tblProfile">
                <asp:TableRow>
                    <asp:TableCell Width="60">
                        <asp:Label ID="lblEmail" runat="server" Text="eMail:" CssClass="profile"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="lblEmailText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter an email" ValidationGroup="Submit" CssClass="warning" ControlToValidate="lblEmailText" Visible="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name:" CssClass="profile"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="lblFirstNameText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your first name" ValidationGroup="Submit" CssClass="warning" ControlToValidate="lblFirstNameText" Visible="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name:" CssClass="profile"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="lblLastNameText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your last name" ValidationGroup="Submit" CssClass="warning" ControlToValidate="lblLastNameText" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCompany" runat="server" Text="Company:" CssClass="profile"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="lblCompanyText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                     <div class="spacerHalf"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div style="float: right;">
                            <asp:LinkButton ID="UpdateProfileBtn" runat="server" Text="Update Profile" OnClick="UpdateProfile_Click" CssClass="btnSubmitPasswordLG" ValidationGroup="Submit" Visible="False" />&nbsp;
                            <asp:LinkButton ID="editProfileBtn" runat="server" Text="Edit Profile" OnClick="EditProfile_Click" CssClass="btnSubmitPasswordLG" />
                            &nbsp;
                    <asp:LinkButton ID="editPasswordBtn" runat="server" Text="Change Password" OnClick="editPasswordBtn_Click" CssClass="btnSubmitPasswordLG" />&nbsp;
                             <asp:LinkButton ID="cancelBtn" runat="server" Text="Cancel" OnClick="CancelProfile_Click" CssClass="btnSubmitPasswordLG" Visible="False" />
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </asp:Panel>
    <ajaxPop:ModalPopupExtender ID="mp1" runat="server" PopupControlID="pPasswordReset" TargetControlID="editPasswordBtn" BackgroundCssClass="modalBackground" />
    <%--Style="display: none;"--%>

    <asp:Panel ID="pPasswordReset" runat="server" CssClass="modalPopup" ValidateRequestMode="Inherit">
        <div class="modalHeader">Change Password</div>
        <table id="tblPassword" class="tblPassword">
            <tr>
                <td style="width: 122px">
                    <asp:Label ID="lblPassword" runat="server" Text="New Password: " CssClass="profile" />
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Width="100%" TextMode="Password" OnTextChanged="txtPassword_TextChanged" /><br />
                    
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password required" CssClass="warning" ValidationGroup="submitPassword" Display="Dynamic" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Incorrect character or length" ControlToValidate="txtPassword" CssClass="warning" Display="Dynamic" ValidationExpression="[\d\w\S^\xA0]{8,}" ValidationGroup="submitPassword"></asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <%-- placeholder ="New Password" placeholder ="Confirm Password" --%>
                <td>
                    <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password: " CssClass="profile" />
                </td>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" Width="100%" TextMode="Password" /><br />
                    <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ErrorMessage="Password required" CssClass="warning" ValidationGroup="submitPassword" Display="Dynamic" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator></td>
            </tr>
        </table>
                <div style="margin-left: 162px;">
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match." CssClass="warning" ValidationGroup="submitPassword" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
        </div>
        <div style="font-size: 0.8em; padding-right: 40px">
            <ul>
                <li>Use at least eight characters; the more characters, the better.</li>
                <li>Make your password easy for you to remember but hard for someone else to guess.</li>
                <li>Intersperse punctuation marks or symbols such as #, $, %, etc. Do not use a blank space.</li>
                <li>Always use a mixture of upper- and lower-case characters.</li>
            </ul>
        </div>
        <br />
        <table id="Table2" class="rightFloat" style="margin-right: 14px; margin-bottom: 10px;">
            <tr>
                <td>
                    <asp:Button ID="lnkSubmitPassword" runat="server" CssClass="btnSubmitPassword" Text="Update" OnClick="lnkSubmitPassword_Click" ValidationGroup="submitPassword"></asp:Button>
                </td>
                <td>
                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" OnClick="CancelPassword_Click" CssClass="btnCancelPassword" CausesValidation="False"></asp:LinkButton></td>
            </tr>
        </table>

    </asp:Panel>
</asp:Content>
