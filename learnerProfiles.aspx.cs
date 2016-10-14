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
using System.Windows;
using System.Security.Cryptography;
using System.Text;
using System.Drawing;

namespace DOTS
{
    public partial class learnerProfiles : System.Web.UI.Page
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
            lblCompanyText.Text = Session["ClientName"].ToString();

            if (!Page.IsPostBack)
            {
                BindData();
            }
        }
        protected void ClearData()
        {
            txtAddEmail.Text = string.Empty;
            txtAddFirstName.Text = string.Empty;
            txtAddLastName.Text = string.Empty;
            ddlAccessLevel.SelectedIndex = 0;

            txtPassword.Text = string.Empty;           
        }

        protected void BindData()
        {
            // drop down for new users //
            DataTable dsDDL = new DataTable();

            SqlDataAdapter sdasDDL = Helpers.connectionHelper("POTS_Access");

            sdasDDL.Fill(dsDDL);

            ddlAccessLevel.DataSource = dsDDL;
            ddlAccessLevel.DataTextField = "AccessLevelDesc";
            ddlAccessLevel.DataValueField = "AccessLevelId";
            ddlAccessLevel.DataBind();

            // populate user based on client //
            SqlDataAdapter adapt = Helpers.connectionHelper("POTS_ClientLearnerProfiles");
            adapt.SelectCommand.Parameters.AddWithValue("@ClientName", Session["ClientName"].ToString());
            adapt.SelectCommand.Parameters.AddWithValue("@LearnerId", Session["LearnerId"].ToString());
            adapt.SelectCommand.Parameters.AddWithValue("@AccessLevel", Session["AccessLevel"].ToString());

            DataTable dtLearner = new DataTable();            
            adapt.Fill(dtLearner);
            //
            try
            {
                dtLearner.DefaultView.Sort = "AccessLevel ASC, LastName ASC";
                gvEmployee.DataSource = dtLearner;
                gvEmployee.DataBind();
            }
            catch
            {

            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvEmployee, "Select$" + e.Row.RowIndex);
               // e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvEmployee.Rows)
            {
                if (row.RowIndex == gvEmployee.SelectedIndex)
                {                    
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }

        protected void lnkSubmitUser_Click(object sender, EventArgs e)
        {

            try
            {
                Helpers.insertLearner(0, txtAddEmail.Text, txtAddFirstName.Text, txtAddLastName.Text, Convert.ToInt32(ddlAccessLevel.SelectedValue), Convert.ToString(Session["ClientName"]));

                // Yay it was added //
                lblmsg.Text = "Record Inserted Succesfully into the Database";
                lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;               
            }
            catch (InvalidCastException eSuckIt)
            {
                // good try try gooder //
                lblmsg.Text = "Record NOT Inserted into the Database. Error: " + eSuckIt;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {            
                BindData();  
                //empty 
                ClearData();
                // hide pop-up
                mp1.Hide();
            }  
        }

        protected void CancelUser_Click(object sender, EventArgs e)
        {
            ClearData();
            // hide pop-up
            mp1.Hide();
        }

        protected void ddlAccessLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            Console.WriteLine("yes!");
        }

        protected void gvEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEmployee.PageIndex = e.NewPageIndex;
            //foreach (GridViewRow row in gvEmployee.Rows)
            //{
                gvEmployee.SelectedIndex = -1;
            //}
            BindData();
        }

    }
}