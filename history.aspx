<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDefault.Master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="DOTS.history" %>

<asp:Content ID="content1" ContentPlaceHolderID="Content_Menu" runat="server">
    <span id="tabId" style="display: none">HyperLink2</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="idCourse">
        <div class="idCourseTitle"><%--Completed Courses--%>&nbsp;</div>
          <asp:Table ID="tblCourses" CssClass="courseTable" runat="server" BorderStyle="None">
            <asp:TableRow CssClass="courseTableHeader">
               <%-- <asp:TableCell Width="2%">ID</asp:TableCell>--%>
                <asp:TableCell Width="50%">Course Name</asp:TableCell>             
                <asp:TableCell Width="11%">Progress</asp:TableCell>
                <asp:TableCell Width="8%">Score</asp:TableCell>
                <asp:TableCell Style="border: none;" Width="13%">Ended</asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <asp:Panel ID="panelNoEnroll" runat="server">
            <div class="noEnrollment">No history could be found</div>
        </asp:Panel>
    </div>
    <asp:Label ID="Label1" runat="server"></asp:Label>
</asp:Content>
