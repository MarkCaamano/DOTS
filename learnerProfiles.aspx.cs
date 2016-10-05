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
            //SqlCommand comm = new SqlCommand("POTS_UpdateUserProfile");
            //comm.Parameters.AddWithValue("@LearnerID", Session["LearnerId"]);
            //comm.Parameters.AddWithValue("@LearnerEmail", lblEmailText.Text);
        }

        protected void CancelUser_Click(object sender, EventArgs e)
        {
            lblEmailText.Text = string.Empty;
            lblFirstNameText.Text = string.Empty;
            lblLastNameText.Text = string.Empty;
          
            mp1.Hide();
        }
    }
}