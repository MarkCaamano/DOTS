<%@ Page Title="" Language="C#" MasterPageFile="MasterDefault.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="profile" %>


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
                        <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="profile"></asp:Label>
                        <br />
                        <asp:TextBox ID="lblEmailText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None" Height="30"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter an email" ValidationGroup="Submit" CssClass="warning" ControlToValidate="lblEmailText" Visible="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="profile"></asp:Label>
                        <br />
                        <asp:TextBox ID="lblFirstNameText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None" Height="30"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your first name" ValidationGroup="Submit" CssClass="warning" ControlToValidate="lblFirstNameText" Visible="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name" CssClass="profile"></asp:Label>
                        <br />
                        <asp:TextBox ID="lblLastNameText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None" Height="30"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your last name" ValidationGroup="Submit" CssClass="warning" ControlToValidate="lblLastNameText" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCompany" runat="server" Text="Company" CssClass="profile"></asp:Label>
                        <br />
                        <asp:TextBox ID="lblCompanyText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None" Height="30"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                     <div class="spacerHalf"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div style="float: right;">
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:LinkButton ID="UpdateProfileBtn" runat="server" Text="Update Profile" OnClick="UpdateProfile_Click" CssClass="btnLogin" ValidationGroup="Submit" Visible="False" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:LinkButton ID="cancelBtn" runat="server" Text="Cancel" OnClick="CancelProfile_Click" CssClass="btnCancel" Visible="False" />
                                    </asp:TableCell>
                                    <%--btnCancelPassword 
btnSubmitPasswordLG--%>
                                    <asp:TableCell>
                                        <asp:LinkButton ID="editProfileBtn" runat="server" Text="Edit Profile" OnClick="EditProfile_Click" CssClass="btnLogin" />
                                    </asp:TableCell>
                                    <%--CssClass="btnSubmitPasswordLG"--%>
                                    <asp:TableCell>
                                        <asp:LinkButton ID="editPasswordBtn" runat="server" Text="Change Password" OnClick="editPasswordBtn_Click" CssClass="btnLogin" />
                                    </asp:TableCell>

                                </asp:TableRow>
                            </asp:Table>
                            <%--btnSubmitPasswordLG--%>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </asp:Panel>

    <ajaxPop:ModalPopupExtender ID="mp1" runat="server" PopupControlID="pPasswordReset" TargetControlID="editPasswordBtn" BackgroundCssClass="modalBackground" />
    <%--  --%>
    <asp:Panel ID="pPasswordReset" runat="server" CssClass="modalPopup" ValidateRequestMode="Inherit" Style="display: none;">
        <div class="modalHeader">Change Password</div>
        <table id="tblPassword" class="tblPassword">
            <tr>
                <td style="width: 122px">
                    <asp:Label ID="lblPassword" runat="server" Text="New Password" CssClass="profile" /><br />

                    <asp:TextBox ID="txtPassword" runat="server" Width="100%" TextMode="Password" OnTextChanged="txtPassword_TextChanged" Height="30" /><br />

                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password required" CssClass="warning" ValidationGroup="submitPassword" Display="Dynamic" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Incorrect length or space used" ControlToValidate="txtPassword" CssClass="warning" Display="Dynamic" ValidationExpression="[\S]{8,}" ValidationGroup="submitPassword"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <%-- placeholder ="New Password" placeholder ="Confirm Password" --%>
                <td>
                    <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="profile" />
                    <br />
                    <asp:TextBox ID="txtConfirmPassword" runat="server" Width="100%" TextMode="Password" Height="30" /><br />
                    <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ErrorMessage="Password required" CssClass="warning" ValidationGroup="submitPassword" Display="Dynamic" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <div style="margin-left: 162px;">
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match." CssClass="warning" ValidationGroup="submitPassword" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
        </div>
        <div style="font-size: 0.8em; padding-right: 40px">
            <ul>
                <li>Use at least 8 characters; the more characters, the better.</li>
                <li>Make your password easy for you to remember but hard for someone else to guess.</li>
                <li>Intersperse punctuation marks or symbols such as #, $, %, etc. Do not use a blank space.</li>
                <li>Always use a mixture of upper- and lower-case characters.</li>
            </ul>
        </div>
        <br />
        <table id="Table2" class="rightFloat" style="margin-right: 14px; margin-bottom: 10px;">
            <tr>
                <td>
                    <asp:LinkButton ID="lnkUpdatePassword" runat="server"  Text="Update" OnClick="lnkUpdatePassword_Click" CssClass="btnLogin" ValidationGroup="submitPassword"></asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" OnClick="CancelPassword_Click" CssClass="btnCancel" CausesValidation="False"></asp:LinkButton></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
