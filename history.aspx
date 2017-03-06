<%@ Page Title="" Language="C#" MasterPageFile="MasterDefault.Master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="DOTS.history" %>

<asp:Content ID="content1" ContentPlaceHolderID="Content_Menu" runat="server">
    <span id="tabId" style="display: none">HyperLink2</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Style/bootstrap.min.css" rel="stylesheet" />

    <div id="idCourse">
        <div class="idCourseTitle"><%--Completed Courses--%>&nbsp;</div>
        <asp:Table ID="tblCourses" CssClass="courseTable" runat="server" BorderStyle="None">
            <asp:TableHeaderRow CssClass="courseTableHeader">
                <%-- <asp:TableCell Width="2%">ID</asp:TableCell>--%>
                <asp:TableHeaderCell Style="border: none;" Width="3%"></asp:TableHeaderCell>
                <asp:TableHeaderCell Width="50%">Course Name</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="11%">Progress</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="8%">Score</asp:TableHeaderCell>
                <asp:TableHeaderCell Style="border: none;" Width="13%">Ended</asp:TableHeaderCell>
            </asp:TableHeaderRow>

        </asp:Table>
        <asp:Panel ID="panelNoEnroll" runat="server">
            <div class="noEnrollment">No history could be found</div>
        </asp:Panel>
    </div>
    <asp:Label ID="Label1" runat="server"></asp:Label>
</asp:Content>
