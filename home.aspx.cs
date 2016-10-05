using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.SessionState;

namespace DOTS
{
    public partial class home : System.Web.UI.Page
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
                SqlDataAdapter adapt = Helpers.connectionHelper("POTS_UserCourses");
                adapt.SelectCommand.Parameters.AddWithValue("@ClientName", Session["ClientName"]);
                adapt.SelectCommand.Parameters.AddWithValue("@LearnerID", Session["LearnerId"]);
                DataTable ct = new DataTable();
                adapt.Fill(ct);
                try
                {
                    if ((ct != null) && (ct.Rows.Count > 0))
                    {
                        tblCourses.Visible = true;
                        panelNoEnroll.Visible = false;
                        foreach (DataRow r in ct.Rows)
                        {
                            TableRow row = new TableRow();
                            TableCell cell1 = new TableCell();
                            TableCell cell2 = new TableCell();
                            TableCell cell3 = new TableCell();
                            TableCell cell4 = new TableCell();
                            TableCell cell5 = new TableCell();
                            cell1.Text = r["Course"].ToString();
                            //cell2.Text = r["CourseStatus"].ToString();
                            //cell3.Text = r["Progress"].ToString();

                            cell3.Text = "<div class='progressImage"+ r["Progress"].ToString() +" progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";

                            //switch (r["Progress"].ToString())
                            //{
                            //    case "0":
                            //        cell3.Text = "<div class='progressImage0 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    case "10":
                            //        cell3.Text = "<div class='progressImage10 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    case "20":
                            //        cell3.Text = "<div class='progressImage20 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    case "30":
                            //        cell3.Text = "<div class='progressImage30 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    case "40":
                            //        cell3.Text = "<div class='progressImage40 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    case "50":
                            //        cell3.Text = "<div class='progressImage50 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    case "60":
                            //        cell3.Text = "<div class='progressImage60 progressSpacing''><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    case "70":
                            //        cell3.Text = "<div class='progressImage70 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    case "80":
                            //        cell3.Text = "<div class='progressImage80 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    case "90":
                            //        cell3.Text = "<div class='progressImage90 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    case "100":
                            //        cell3.Text = "<div class='progressImage100 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //    default:
                            //        cell3.Text = "<div class='progressImage0 progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                            //        break;
                            //}
                            cell3.Text += "<div style='text-align:center;'>" + r["CourseStatus"].ToString() + "</div>";
                            //cell3.Style.Add("background-repeat","no-repeat");
                            cell4.Text = "<div style='text-align:center;'>" + r["Score"].ToString() + "</div>";
                            if (string.IsNullOrEmpty(r["CoursePath"].ToString()))
                            {
                                cell5.Text = "<div class='warning'>Error Not Set</div>";
                            }
                            else
                            {
                                cell5.Text = "<div style='text-align:center;'><a href='" + r["CoursePath"] + "' target='_blank' class='btnLaunch' >Launch</a></div>";
                            }
                            row.Cells.Add(cell1);
                            //row.Cells.Add(cell2);
                            row.Cells.Add(cell3);
                            row.Cells.Add(cell4);
                            row.Cells.Add(cell5);

                            if (tblCourses.Rows.Count % 2 == 0)
                            {
                                row.CssClass = "courseTableRow";
                            }
                            else
                            {
                                row.CssClass = "courseTableRowOdd";
                            }

                            tblCourses.Rows.Add(row);
                        }
                    }
                    else
                    {
                        tblCourses.Visible = false;
                        panelNoEnroll.Visible = true;
                    }
                }
                catch
                {
                }
            //    SqlDataAdapter adaptPending = Helpers.connectionHelper("POTS_UserPending");
            //    adaptPending.SelectCommand.Parameters.AddWithValue("@ClientName", Session["ClientName"]);
            //    adaptPending.SelectCommand.Parameters.AddWithValue("@LearnerID", Session["LearnerId"]);
            //    DataTable dtPending = new DataTable();
            //    adaptPending.Fill(dtPending);
            //    if ((dtPending != null) && (dtPending.Rows.Count > 0))
            //    {
            //        tblPending.Visible = true;
            //        panelPending.Visible = false;
            //        foreach (DataRow drPending in dtPending.Rows)
            //        {
            //            TableRow rowPending = new TableRow();
            //            TableCell cell1 = new TableCell();
            //            TableCell cell2 = new TableCell();
            //            //class='btnLaunch'
            //            cell1.Text = drPending["Course"].ToString();
            //            if (string.IsNullOrEmpty(drPending["CoursePath"].ToString()))
            //            {
            //                cell2.Text = "<div class='warning'>Error Not Set</div>";
            //            }
            //            else
            //            {
            //                cell2.Text = "<a href='" + drPending["CoursePath"] + "' target='_blank' class='btnLaunch'>Launch</a>";
            //            }
            //            //cell2.Text = "<a  href='" + drPending["CoursePath"] + "' target='_blank'>Launch</a>";
            //            rowPending.Cells.Add(cell1);
            //            rowPending.Cells.Add(cell2);
            //            if (tblPending.Rows.Count % 2 == 0)
            //            {
            //                rowPending.CssClass = "courseTableRow";
            //            }
            //            else
            //            {
            //                rowPending.CssClass = "courseTableRowOdd";
            //            }
            //            tblPending.Rows.Add(rowPending);
            //        }
            //    }
            //    else
            //    {
            //        tblPending.Visible = false;
            //        panelPending.Visible = true;
            //    }
            }
        }

        protected void Link_Click(object sender, EventArgs e)
        {
            var watch = System.Diagnostics.Stopwatch.StartNew();
            //for()
            //{
            // // ..
            //}
            watch.Stop();
            // Format 00:00:02.0001008
            string elapsed = watch.Elapsed.ToString();
            // Milliseconds like 2000 for 2 seconds
            string elapsedMs = watch.ElapsedMilliseconds.ToString();
            System.Diagnostics.Debug.WriteLine(elapsed);
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/index.aspx");
        }
    }
}