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
    public partial class profile : System.Web.UI.Page
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
            //EditAccount.Visible = false;
            //panelUpdate.Visible = false;

            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;

            //lnkSubmitPassword.Enabled = false;

            if (!Page.IsPostBack)
            {
                SqlDataAdapter adapt = Helpers.connectionHelper("POTS_UserProfile");
                adapt.SelectCommand.Parameters.AddWithValue("@LearnerID", Session["LearnerId"]);
                DataTable ct = new DataTable();
                adapt.Fill(ct);
                try
                {
                    if ((ct != null) && (ct.Rows.Count > 0))
                    {
                        foreach (DataRow r in ct.Rows)
                        {
                            lblFirstNameText.Text = r["FirstName"].ToString();
                            lblLastNameText.Text = r["LastName"].ToString();
                            lblEmailText.Text = r["LearnerEmail"].ToString();
                            lblCompanyText.Text = Convert.ToString(Session["ClientName"]);
                        }
                    }
                }
                catch
                {

                }
            }
        }
        protected void EditProfile_Click(object sender, EventArgs e)
        {
            //lblCompanyText.BorderStyle = BorderStyle.Solid;
            lblEmailText.BorderStyle = BorderStyle.Solid;
            lblEmailText.ReadOnly = false;
            lblFirstNameText.BorderStyle = BorderStyle.Solid;
            lblFirstNameText.ReadOnly = false;
            lblLastNameText.BorderStyle = BorderStyle.Solid;
            lblLastNameText.ReadOnly = false;

            UpdateProfileBtn.Visible = true;
            editProfileBtn.Visible = false;
        }

        protected void UpdateProfile_Click(object sender, EventArgs e)
        {

            SqlCommand comm = new SqlCommand("POTS_UpsertUserProfile");
            comm.Parameters.AddWithValue("@LearnerID", Session["LearnerId"]);
            comm.Parameters.AddWithValue("@FirstName", lblFirstNameText.Text);
            comm.Parameters.AddWithValue("@LastName", lblLastNameText.Text);
            comm.Parameters.AddWithValue("@LearnerEmail", lblEmailText.Text);

            if (Helpers.ActionCommand(comm) == 0)
            {

            }

            if (this.Form.Parent != null)
            {
                Label lbl = (Label)this.Form.Parent.FindControl("labelUserName");
                lbl.Text = lblFirstNameText.Text + " " + lblLastNameText.Text;
            }

            Session["UserName"] = lblFirstNameText.Text + " " + lblLastNameText.Text;

            UpdateProfileBtn.Visible = false;
            editProfileBtn.Visible = true;

            lblEmailText.BorderStyle = BorderStyle.None;
            lblEmailText.ReadOnly = true;
            lblFirstNameText.BorderStyle = BorderStyle.None;
            lblFirstNameText.ReadOnly = true;
            lblLastNameText.BorderStyle = BorderStyle.None;
            lblLastNameText.ReadOnly = true;

            //Account.Visible = true;
            //EditAccount.Visible = false;

        }
        protected void editPasswordBtn_Click(object sender, EventArgs e)
        {
            editPasswordBtn.Visible = false;
            cancelBtn.Visible = true;
        }

        protected void CancelProfile_Click(object sender, EventArgs e)
        {
            editPasswordBtn.Visible = true;
            cancelBtn.Visible = false;
        }
        protected void lnkSubmitPassword_Click(object sender, EventArgs e)
        {
            SqlCommand comm = new SqlCommand("POTS_UpdateUserProfile");
            comm.Parameters.AddWithValue("@LearnerID", Session["LearnerId"]);
            comm.Parameters.AddWithValue("@LearnerEmail", lblEmailText.Text);
            //if (Page.IsValid)
            //{
            //    pLblUpdate.Text = "Password has been updated";
            //    panelUpdate.Visible = true;
            //}
        }
        protected void CancelPassword_Click(object sender, EventArgs e)
        {
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            mp1.Hide();
        }
    }
}