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
                
               
                //adapt.Fill(dsHistory);

                // dsHistory.Tables.Add("RecentHistory");
                // dsHistory.Tables.Add("OldHistory");

                DataTable ct = new DataTable();
                adapt.Fill(ct);               

                //DropDownList1.DataSource = ct;
                //DropDownList1.DataValueField = "Course";
                //DropDownList1.DataTextField = "Course";
                //DropDownList1.DataBind();

                try
                {
                    if ((ct != null) && (ct.Rows.Count > 0))
                    {
                        panelNoEnroll.Visible = false;
                        
                        foreach (DataRow r in ct.Rows)
                        {
                            DataTable dtPTable = new DataTable("RecentHistory");
                            DataTable dtCTable = new DataTable("OldHistory");

                            string sID = r["CourseID"].ToString();
                            int iRank = Convert.ToInt32(r["RankCourseId"]);
                            if (iRank == 1)
                            {
                                dtPTable.Columns.Add("CourseID", typeof(int));
                                dtPTable.Columns.Add("Course", typeof(string));
                                dtPTable.Columns.Add("Progress", typeof(string));
                                dtPTable.Columns.Add("Score", typeof(string));
                                dtPTable.Columns.Add("CompleteDate", typeof(string));  
              
                                //cell0.Text = "<button type='button' class='btn-primary'>1</button>";
                                //"<button type='button' class='btnLaunch'  onclick='window.open(\"" + r["CoursePath"] + "\",\"_blank\") '>Launch</button>";
                                int sPCell1 = Convert.ToInt32(r["CourseID"]);
                                string sPCell2 = r["Course"].ToString();
                                string sPCell3 = "<div class='progressImage" + r["Progress"].ToString() + " progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";
                                string sPCell4 = "<div style='text-align:center;'>" + r["Score"].ToString() + "</div>";
                                string sPCell5 = DateTime.Parse(r["CompleteDate"].ToString()).ToString("MM/dd/yy <br> hh:mm:ss tt");

                                dtPTable.Rows.Add(sPCell1,sPCell2,sPCell3,sPCell4,sPCell5);
                            }
                            else
                            {

                                dtCTable.Columns.Add("CourseID", typeof(int));
                                dtCTable.Columns.Add("Course", typeof(string));
                                dtCTable.Columns.Add("Progress", typeof(string));
                                dtCTable.Columns.Add("Score", typeof(string));
                                dtCTable.Columns.Add("CompleteDate", typeof(string));  

                                string sCCell1 = r["CourseID"].ToString();

                                string sCCell3 = "<div class='progressImage" + r["Progress"].ToString() + " progressSpacing'><div style='text-align:center; line-height:40px;'>" + r["Progress"].ToString() + "</div></div>";

                                string sCCell4 = "<div style='text-align:center;'>" + r["Score"].ToString() + "</div>";

                                string sCCell5 = DateTime.Parse(r["CompleteDate"].ToString()).ToString("MM/dd/yy <br> hh:mm:ss tt");

                               // dtCTable.Rows.Add(sCCell1,sCCell3,sCCell4,sCCell5);
                               
                            }
                          
                            //DataTable dtPTable = new DataTable("RecentHistory");
                            //DataTable dtCTable = new DataTable("OldHistory");

                            //adapt.MissingSchemaAction = MissingSchemaAction.AddWithKey;

                            DataSet dsHistory = new DataSet();
                            //Add two DataTables in Dataset  
                            dsHistory.Tables.Add(dtPTable);
                            dsHistory.Tables.Add(dtCTable);

                            //DataRelation Datatablerelation = new DataRelation("History", dsHistory.Tables[0].Columns[0], dsHistory.Tables[1].Columns[0], true);
                            //dsHistory.Relations.Add(dsHistory.Tables["dtPTable"].Columns["CourseID"], dsHistory.Tables["dtCTable"].Columns["CourseID"]);

                            GridView1.DataSource = dsHistory.Tables[0];
                           
                            GridView1.DataBind();
                        }
                    }
                    else
                    {
                        panelNoEnroll.Visible = true;
                    }
                }
                catch (Exception CourseHistory)
                {
                    Label1.Text = "Exception caught: " + CourseHistory;
                }
            }
        }
    }
}