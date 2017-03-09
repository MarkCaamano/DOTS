<%@ Page Title="" Language="C#" MasterPageFile="MasterDefault.Master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="DOTS.history" %>

<asp:Content ID="content1" ContentPlaceHolderID="Content_Menu" runat="server">
    <span id="tabId" style="display: none">HyperLink2</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <%--    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Style/bootstrap.min.css" rel="stylesheet" />--%>

    <div id="idCourse">
        <div class="idCourseTitle"><%--Completed Courses--%>&nbsp;</div>
   <%--       <asp:Table ID="tblCourses" CssClass="courseTable" runat="server" BorderStyle="None">
            <asp:TableHeaderRow CssClass="courseTableHeader">
              <asp:TableCell Width="2%">ID</asp:TableCell>
                <asp:TableHeaderCell Style="border: none;" Width="3%"></asp:TableHeaderCell>
                <asp:TableHeaderCell Width="50%">Course Name</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="11%">Progress</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="8%">Score</asp:TableHeaderCell>
                <asp:TableHeaderCell Style="border: none;" Width="13%">Ended</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>--%>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courseTable" BorderStyle="None">
            <Columns>
                 <asp:ButtonField Text="Button" HeaderStyle-Width="2%" ButtonType="Button">
                 <ItemStyle BorderStyle="None" />
                 </asp:ButtonField>
                <asp:TemplateField HeaderText="Course Name" HeaderStyle-Width="50%" ItemStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:Label ID="txtCourseNameId" runat="server" Text='<%#Eval("Course")%>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle Width="50%"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Progress" HeaderStyle-Width="11%" ItemStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:Label ID="txtProgressId" runat="server"  Text='<%#Eval("Progress")%>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle Width="11%"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Score" HeaderStyle-Width="8%"  ItemStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:Label ID="txtScoreId" runat="server" Text='<%#Eval("Score")%>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle Width="8%"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ended" HeaderStyle-Width="13%"  ItemStyle-BorderStyle="None">
                    <ItemTemplate>
                        <asp:Label ID="txtEndedId" runat="server" Text='<%#Eval("CompleteDate")%>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle Width="13%"></HeaderStyle>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="courseTableHeader" />
             <RowStyle HorizontalAlign="Left" Height="50" CssClass="courseTableRow" />
        </asp:GridView>

        <asp:Panel ID="panelNoEnroll" runat="server">
            <div class="noEnrollment">No history could be found</div>
        </asp:Panel>
    </div>
    <asp:Label ID="Label1" runat="server"></asp:Label>
</asp:Content>
