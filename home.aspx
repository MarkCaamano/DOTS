<%@ Page Title="" Language="C#" MasterPageFile="MasterDefault.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="DOTS.home" %>

<asp:Content ID="content1" ContentPlaceHolderID="Content_Menu" runat="server">

    <span id="tabId" style="display: none">HyperLink1</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <%--<h3 class="enrolled"></h3>--%>
    <div id="idCourse">
        <div class="idCourseTitle">Curriculum</div>
        <asp:Table ID="tblCourses" CssClass="courseTable" runat="server" BorderStyle="None">
            <asp:TableHeaderRow CssClass="courseTableHeader">
                <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>
                <%--                <asp:TableCell>Status</asp:TableCell>--%>
                <asp:TableHeaderCell>Progress</asp:TableHeaderCell>
                <asp:TableHeaderCell>Score</asp:TableHeaderCell>
                <asp:TableHeaderCell Style="border: none;" Width="12%">Action</asp:TableHeaderCell>
            </asp:TableHeaderRow>         
                                   
           <%-- not working 
               <asp:TableFooterRow  CssClass="courseTableHeader">
               <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>              
                <asp:TableHeaderCell>Progress</asp:TableHeaderCell>
                <asp:TableHeaderCell>Score</asp:TableHeaderCell>
                <asp:TableHeaderCell Style="border: none;" Width="12%">Action</asp:TableHeaderCell>
           </asp:TableFooterRow>--%>
 
        </asp:Table>
        <asp:Panel ID="panelNoEnroll" runat="server">
            <div class="noEnrollment">Not enrolled in any courses</div>
        </asp:Panel>
    </div>

    <%--    <div id="idPending">
        <div class="idPendingTitle">Pending</div>
        <asp:Table ID="tblPending" CssClass="courseTable" runat="server" BorderStyle="None">
            <asp:TableRow CssClass="courseTableHeader">
                <asp:TableCell Width="">Course Name</asp:TableCell>
                <asp:TableCell style="border:none;" Width="12%">Action</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Panel ID="panelPending" runat="server">
            <div class="noEnrollment">No pending courses</div>
        </asp:Panel>
    </div>--%>
</asp:Content>

