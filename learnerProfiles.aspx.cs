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
               // drop down for new users //
                DataTable dsDDL = new DataTable();

                SqlDataAdapter sdasDDL = Helpers.connectionHelper("POTS_Access");
               
                sdasDDL.Fill(dsDDL);

                DropDownList1.DataSource = dsDDL;
                DropDownList1.DataTextField = "AccessLevelDesc";
                DropDownList1.DataValueField = "AccessLevelId";
                DropDownList1.DataBind();

               // populate user based on client //
                SqlDataAdapter adapt = Helpers.connectionHelper("POTS_ClientLearnerProfiles");
                adapt.SelectCommand.Parameters.AddWithValue("@ClientName", Session["ClientName"].ToString());
                DataTable dtLearner = new DataTable();
                adapt.Fill(dtLearner);
                try
                {
                    gvEmployee.DataSource = dtLearner;
                    gvEmployee.DataBind();
                }
                catch
                {

                }
            }
        }

        protected void lnkSubmitUser_Click(object sender, EventArgs e)
        {

            SqlDataAdapter AddsqlAdapt = Helpers.connectionHelper("POTS_UpsertUserProfile");

            //// do not pass learner ID?         
            //AddsqlAdapt.InsertCommand.Parameters.AddWithValue("@LearnerID", null);
            AddsqlAdapt.InsertCommand.Parameters.AddWithValue("@LearnerEmail", lblEmailText.Text);
            AddsqlAdapt.InsertCommand.Parameters.AddWithValue("@FirstName", lblFirstNameText.Text);
            AddsqlAdapt.InsertCommand.Parameters.AddWithValue("@LastName", lblLastNameText.Text);
            AddsqlAdapt.InsertCommand.Parameters.AddWithValue("@LearnerPassword", "password");
            AddsqlAdapt.InsertCommand.Parameters.AddWithValue("@ClientId", Session["ClientId"]);
            AddsqlAdapt.InsertCommand.Parameters.AddWithValue("@AccessLevel", Convert.ToInt32(DropDownList1.SelectedValue));

            try
            {
                lblmsg.Text = "Record Inserted Succesfully into the Database";
                lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
            }
            catch
            {
                lblmsg.Text = "Record NOT in the Database";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void CancelUser_Click(object sender, EventArgs e)
        {
            lblEmailText.Text = string.Empty;
            lblFirstNameText.Text = string.Empty;
            lblLastNameText.Text = string.Empty;
          
            mp1.Hide();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Console.WriteLine("yes!");
        }
    }
}