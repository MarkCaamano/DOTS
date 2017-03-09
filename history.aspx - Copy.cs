using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.SessionState;
using System.Windows;

namespace DOTS
{
    public partial class history : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            if (Session.Contents.Count == 0)
            {
                Response.Redirect("~/timeout.aspx");
            }
            else
            {
                string Client = string.Empty;
                if (Session["ClientName"] != null) Client = Session["ClientName"].ToString();
                try
                {
                    if ((Session["MasterPage"] != null) && (Session["MasterPage"].ToString() != string.Empty))
                    {
                        this.MasterPageFile = "~/Clients/" + Client + "/" + Session["MasterPage"].ToString();
                    }
                }
                catch
                {
                    this.MasterPageFile = "~/MasterPage.master";
                }
            }
            base.OnPreInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlDataAdapter adapt = Helpers.connectionHelper("POTS_CompletedCourses");
                adapt.SelectCommand.Parameters.AddWithValue("@ClientName", Session["ClientName"]);
                adapt.SelectCommand.Parameters.AddWithValue("@LearnerID", Session["LearnerId"]);
                DataSet dsHistory = new DataSet("History");
                DataTable dtPTable = new DataTable("RecentHistory");
                DataTable dtCTable = new DataTable("OldHistory");

                //adapt.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                adapt.Fill(dsHistory);

                GridView1.DataSource = dsHistory.Tables[0];
                GridView1.DataBind();

                try
                {
                    if (dsHistory != null)
                    {
                        GridView1.Visible = true;
                        panelNoEnroll.Visible = false;

                    }
                    else
                    {
                        GridView1.Visible = false;
                        panelNoEnroll.Visible = true;
                    }
                }
                catch (Exception CourseHistory)
                {
                    Label1.Text = "Exception caught: " + CourseHistory;
                }

                // dsHistory.Tables.Add("RecentHistory");
                // dsHistory.Tables.Add("OldHistory");

                //DataTable ct = new DataTable();
                //adapt.Fill(ct);               

                //DropDownList1.DataSource = ct;
                //DropDownList1.DataValueField = "Course";
                //DropDownList1.DataTextField = "Course";
                //DropDownList1.DataBind();

                //try
                //{
                //    if ((ct != null) && (ct.Rows.Count > 0))
                //    {
                //        tblCourses.Visible = true;
                //        panelNoEnroll.Visible = false;
                //        int iCollapseCount = 1;
                //        foreach (DataRow r in ct.Rows)
                //        {
                //            string sID = r["CourseID"].ToString();
                //            int iRank = Convert.ToInt32(r["RankCourseId"]);
                //            if (iRank == 1)
                //            {
                //                TableRow row = new TableRow();
                //                TableCell cell0 = new TableCell();
                //                TableCell cell1 = new TableCell();
                //                TableCell cell2 = new TableCell();
                //                TableCell cell3 = new TableCell();
                //                TableCell cell4 = new TableCell();
                //                TableCell cell5 = new TableCell();
                //                string s = iCollapseCount.ToString();
                //                cell0.Text = "<button type='button' class='btn-primary' data-toggle='collapse' aria-controls='collapse" + s + "'>1</button>";
                //                //"<button type='button' class='btnLaunch'  onclick='window.open(\"" + r["CoursePath"] + "\",\"_blank\") '>Launch</button>";
                //                cell1.Text = r["CourseID"].ToString();

                //                cell2.Text = r["Course"].ToString();

                //                cell3.Text = "<div class='progressImage" + r["Progress"].ToString() + " progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";

                //                cell4.Text = "<div style='text-align:center;'>" + r["Score"].ToString() + "</div>";
                //                cell5.Text = DateTime.Parse(r["CompleteDate"].ToString()).ToString("MM/dd/yy <br> hh:mm:ss tt");

                //                //row.Cells.Add(cell1);
                //                row.Cells.Add(cell0);
                //                row.Cells.Add(cell2);
                //                row.Cells.Add(cell3);
                //                row.Cells.Add(cell4);
                //                row.Cells.Add(cell5);

                //                //if (tblCourses.Rows.Count % 2 == 0)
                //                //{
                //                //    row.CssClass = "courseTableRow";
                //                //}
                //                //else
                //                //{
                //                row.CssClass = "courseTableRow";
                //                //}
                //                tblCourses.Rows.Add(row);

                //            }
                //            else
                //            {

                //                TableRow row2 = new TableRow();
                //                TableCell cell1 = new TableCell();
                //                TableCell cell2 = new TableCell();
                //                TableCell cell3 = new TableCell();
                //                TableCell cell4 = new TableCell();
                //                TableCell cell5 = new TableCell();
                //                TableCell cell6 = new TableCell();

                //                cell1.Text = r["CourseID"].ToString();

                //                cell2.Text = "";

                //                cell3.Text = "<div class='progressImage" + r["Progress"].ToString() + " progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";

                //                cell4.Text = "<div style='text-align:center;'>" + r["Score"].ToString() + "</div>";

                //                cell5.Text = DateTime.Parse(r["CompleteDate"].ToString()).ToString("MM/dd/yy <br> hh:mm:ss tt");

                //                cell6.Text = "";

                //                row2.Cells.Add(cell6);
                //                row2.Cells.Add(cell2);
                //                row2.Cells.Add(cell3);
                //                row2.Cells.Add(cell4);
                //                row2.Cells.Add(cell5);

                //                row2.CssClass = "courseTableRow2 collapse";

                //                tblCourses.Rows.Add(row2);
                //            }
                //            //
                //            iCollapseCount++;
                //        }
                //    }
                //    else
                //    {
                //        tblCourses.Visible = false;
                //        panelNoEnroll.Visible = true;
                //    }
                //}
                //catch (Exception CourseHistory)
                //{
                //    Label1.Text = "Exception caught: " + CourseHistory;
                //}
            }
        }
    }
}