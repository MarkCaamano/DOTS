<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDefault.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="DOTS.profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxPop" %>
<asp:Content ID="content1" ContentPlaceHolderID="Content_Menu" runat="server">
    <span id="tabId" style="display: none">HyperLink3</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var elems = $('#<%=txtPassword.ClientID%>, #<%=txtConfirmPassword.ClientID%>');
            elems.on('keyup', function () {
                var hasValue = elems.filter(function () {
                    return this.value.length
                }).length != elems.length;
                if ($("#MainContent_RequiredFieldValidatorConfirmPassword").prop("visibility", "hidden")) {
                    $("#<%=lnkSubmitPassword.ClientID%>").prop("disabled", hasValue);
                }
            });
        });
    </script>

    <asp:Panel ID="Account" runat="server" Style="margin: 2% 0% 0% 2%; width: 500px; margin-left: 3%;">
        <div id="idProfile">
            <div class="idProfileTitle"><%--My Profile--%>&nbsp;</div>
            <asp:Table runat="server" ID="tblProfile" class="tblProfile">
                <asp:TableRow>
                    <asp:TableCell Width="60">
                        <asp:Label ID="lblEmail" runat="server" Text="eMail:" class="profile"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="lblEmailText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter an email" ValidationGroup="Submit" class="warning" ControlToValidate="lblEmailText" Visible="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name:" class="profile"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="lblFirstNameText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your first name" ValidationGroup="Submit" class="warning" ControlToValidate="lblFirstNameText" Visible="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name:" class="profile"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="lblLastNameText" runat="server" ReadOnly="True" Width="100%" BorderStyle="None"></asp:TextBox>                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your last name" ValidationGroup="Submit" class="warning" ControlToValidate="lblLastNameText" Display="Dynamic">
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
                        <asp:Label ID="lblCompany" runat="server" Text="Company:" class="profile"></asp:Label>
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
                            <asp:LinkButton ID="UpdateProfileBtn" runat="server" Text="Update Profile" OnClick="UpdateProfile_Click" class="btnSubmitPasswordLG" ValidationGroup="Submit" Visible="False" />&nbsp;
                            <asp:LinkButton ID="editProfileBtn" runat="server" Text="Edit Profile" OnClick="EditProfile_Click" CssClass="btnSubmitPasswordLG" />
                            &nbsp;
                    <asp:LinkButton ID="editPasswordBtn" runat="server" Text="Change Password" OnClick="editPasswordBtn_Click" CssClass="btnSubmitPasswordLG" />&nbsp;
                             <asp:LinkButton ID="cancelBtn" runat="server" Text="Cancel" OnClick="CancelProfile_Click" class="btnSubmitPasswordLG" Visible="False" /> 
                        </div>
                    </asp:TableCell></asp:TableRow></asp:Table></div></asp:Panel><%--<asp:Panel ID="EditAccount" runat="server" Style="margin: 2% 0% 0% 2%; width: 500px; margin-left: 3%;" Visible="False">
        <div id="idEditAccount">
            <div class="idEditAccountTitle">Edit Profile</div>
            <asp:Table runat="server" ID="Table1" class="tblProfile">
                <asp:TableRow>
                    <asp:TableCell Width="60">
                        <asp:Label ID="EAlblEmail" runat="server" Text="eMail:" class="profile"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="EAtxtEmail" runat="server" Width="100%" TextMode="Email"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Please enter an email" ValidationGroup="Submit" class="warning" ControlToValidate="EAtxtEmail"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="EAlblFirstName" runat="server" Text="First Name:" class="profile"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="EAtxtFirstName" runat="server" Width="100%"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your first name" ValidationGroup="Submit" class="warning" ControlToValidate="EAtxtFirstName"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div class="tblProfileDiv"></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="EAlblLastName" runat="server" Text="Last Name:" class="profile"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="EAtxtLastName" runat="server" Width="100%"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your last name" ValidationGroup="Submit" class="warning" ControlToValidate="EAtxtLastName">
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
                        <asp:Label ID="EAlblCompany" runat="server" Text="Company:" class="profile"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:Label ID="EAlblCompanyText" runat="server" Width="100%"></asp:Label>
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
                            <asp:LinkButton ID="updateBtn" runat="server" Text="Update Profile" OnClick="UpdateProfile_Click" class="btnSubmitPasswordLG" ValidationGroup="Submit" />&nbsp;
                    <asp:LinkButton ID="cancelBtn" runat="server" Text="Cancel" OnClick="CancelProfile_Click" class="btnSubmitPasswordLG" />
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </asp:Panel>--%><asp:Panel ID="panelUpdate" runat="server" Visible="False">
    </asp:Panel>


    <ajaxPop:ModalPopupExtender ID="mp1" runat="server" PopupControlID="pPasswordReset" TargetControlID="editPasswordBtn" BackgroundCssClass="modalBackground" />

    <asp:Panel ID="pPasswordReset" runat="server" CssClass="modalPopup" ValidateRequestMode="Inherit" Style="display: none;">
        <div class="modalHeader">Change Password</div><asp:Table runat="server" ID="tblPassword" CssClass="tblPassword" CellPadding="5" Width="100%">
            <asp:TableRow>

                <asp:TableCell Width="122px">
                    <asp:Label ID="lblPassword" runat="server" Text="New Password: " class="profile" />
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="100%" />
                </asp:TableCell></asp:TableRow><asp:TableRow>

                <asp:TableCell>
                    <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password: " class="profile" />
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="100%" />
                </asp:TableCell></asp:TableRow></asp:Table><div style="font-size: 0.8em; padding-right: 40px">
            <ul>
                <li>Use at least eight characters; the more characters, the better.</li><li>Make your password easy for you to remember but hard for someone else to guess.</li><li>Intersperse punctuation marks or symbols such as #, $, %, etc. Do not use a blank space.</li><li>Always use a mixture of upper- and lower-case characters.</li></ul></div><br /><asp:Table runat="server" ID="Table2" CssClass="rightFloat" Style="margin-right: 14px; margin-bottom: 10px;">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="lnkSubmitPassword" runat="server" CssClass="btnSubmitPassword" Text="Update" OnClick="lnkSubmitPassword_Click"></asp:Button>
                </asp:TableCell><asp:TableCell>
                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" OnClick="CancelPassword_Click" class="btnCancelPassword"></asp:LinkButton>
                </asp:TableCell></asp:TableRow></asp:Table><div style="margin-left: 20px;">
            <asp:CompareValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" ErrorMessage="Confirm password does not match the new password." ValidationGroup="UpdatePassword" class="warning" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" />
        </div>
    </asp:Panel>
</asp:Content>
