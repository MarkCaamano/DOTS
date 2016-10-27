<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDefault.Master" AutoEventWireup="true" CodeBehind="learnerProfiles.aspx.cs" Inherits="learnerProfiles" EnableEventValidation = "false"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxPop" %>

<asp:Content ID="content1" ContentPlaceHolderID="Content_Menu" runat="server">
    <span id="tabId" style="display: none">HyperLink4</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="idCourse" aria-busy="False">
        <div class="idCourseTitle">
            Employees
            <div class="rightFloat">
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btnSubmitPassword" />
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btnSubmitPassword" Enabled="False" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btnSubmitPassword" Enabled="False" />
            </div>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gvEmployee" runat="server" BorderStyle="None" BorderWidth="0px" CellPadding="6" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" CssClass="courseTable" AllowPaging="True" OnPageIndexChanging="gvEmployee_PageIndexChanging"  OnRowDataBound = "OnRowDataBound" PagerStyle-CssClass="gridViewPage">
                    <Columns>

                        <asp:TemplateField HeaderText="ID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="txtNameid" runat="server" Text='<%#Eval("LearnerId")%>' />
                            </ItemTemplate>
                            <HeaderStyle CssClass="courseTable" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="txtNameid" runat="server" Text='<%#Eval("FirstName")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Last Name" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="txtNameid" runat="server" Text='<%#Eval("LastName") %>' />
                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="eMail">
                            <ItemTemplate>
                                <asp:Label ID="txtNameid" runat="server" Text='<%#Eval("LearnerEmail") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Access Level">
                            <ItemTemplate>
                                <asp:Label ID="txtNameid" runat="server" Text='<%#Eval("AccessLevel") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <HeaderStyle CssClass="courseTableHeader" HorizontalAlign="Left" Font-Bold="False" Height="35"></HeaderStyle>

                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" PageButtonCount="4" />

                    <PagerStyle BackColor="#CCCCCC" Height="10px" />

                    <RowStyle HorizontalAlign="Left" Height="40" CssClass="courseTableRow" />

                    <SelectedRowStyle CssClass="selectedRow" />
                    <AlternatingRowStyle CssClass="courseTableRowOdd"></AlternatingRowStyle>
                </asp:GridView>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lnkSubmitUser" />
            </Triggers>
        </asp:UpdatePanel>
    </div>

    <ajaxPop:ModalPopupExtender ID="mp1" runat="server" PopupControlID="pNewUser" TargetControlID="btnNew" BackgroundCssClass="modalBackground" />
    <%--Style="display: none;"--%>
    <asp:Panel ID="pNewUser" runat="server" CssClass="modalPopup" ValidateRequestMode="Inherit">
        <div class="modalHeader">
            New User
            <div class="rightFloat">
                Access<asp:DropDownList ID="ddlAccessLevel" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlAccessLevel_SelectedIndexChanged">
                    <asp:ListItem Text="<Select Access Level>" Value="0" />
                </asp:DropDownList>
            </div>
        </div>
        <asp:Table runat="server" ID="tblPassword" CssClass="tblPassword" CellPadding="5" Width="100%">
            <asp:TableRow>
                <asp:TableCell Width="60">
                    <asp:Label ID="lblEmail" runat="server" Text="eMail:" CssClass="profile"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAddEmail" runat="server" Width="100%"></asp:TextBox>
                    <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1"
                        runat="server"
                        ErrorMessage="Not a vailid email"
                        ControlToValidate="txtAddEmail" Visible="False">
                    </asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtPassword" runat="server" Visible="False"></asp:TextBox>
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
                    <asp:TextBox ID="txtAddFirstName" runat="server" Width="100%"></asp:TextBox>
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
                    <asp:TextBox ID="txtAddLastName" runat="server" Width="100%"></asp:TextBox>
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
                    <asp:TextBox ID="lblCompanyText" runat="server" Width="100%" BorderStyle="None" ReadOnly="True"></asp:TextBox>
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
        </asp:Table>
        <div style="font-size: 0.8em; padding-right: 40px; width: 411px;">
        </div>
        <br />
        <asp:Table runat="server" ID="Table2" CssClass="rightFloat" Style="margin-right: 14px; margin-bottom: 10px;">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="lnkSubmitUser" runat="server" CssClass="btnSubmitPassword" Text="Add" OnClick="lnkSubmitUser_Click" Enabled="true"></asp:Button>
                </asp:TableCell><asp:TableCell>
                    <asp:LinkButton ID="lnkCancel" runat="server" CssClass="btnCancelPassword" Text="Cancel" OnClick="CancelUser_Click"></asp:LinkButton>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
    <asp:Label ID="lblmsg" runat="server"></asp:Label>
</asp:Content>