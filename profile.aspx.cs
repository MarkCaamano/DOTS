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

        if (!Page.IsPostBack)
        {
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            fPageLoad();
        }
    }
    protected void fPageLoad()
    {
        SqlDataAdapter adapt = DOTS.Helpers.connectionHelper("POTS_UserProfile");
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
    protected void EditProfile_Click(object sender, EventArgs e)
    {
        fChangeTxtBox(false, BorderStyle.Solid);
        fChangeBtns(false);
    }

    protected void UpdateProfile_Click(object sender, EventArgs e)
    {

        SqlCommand comm = new SqlCommand("POTS_UpsertUserProfile");
        comm.Parameters.AddWithValue("@LearnerID", Session["LearnerId"]);
        comm.Parameters.AddWithValue("@FirstName", lblFirstNameText.Text);
        comm.Parameters.AddWithValue("@LastName", lblLastNameText.Text);
        comm.Parameters.AddWithValue("@LearnerEmail", lblEmailText.Text);

        if (DOTS.Helpers.ActionCommand(comm) == 0)
        {

        }

        if (this.Form.Parent != null)
        {
            Label lbl = (Label)this.Form.Parent.FindControl("labelUserName");
            lbl.Text = lblFirstNameText.Text + " " + lblLastNameText.Text;
        }

        Session["UserName"] = lblFirstNameText.Text + " " + lblLastNameText.Text;

        fChangeBtns(true);
        fChangeTxtBox(true, BorderStyle.None);
    }
    protected void editPasswordBtn_Click(object sender, EventArgs e)
    {
        fChangeBtns(false);
    }
    protected void CancelProfile_Click(object sender, EventArgs e)
    {
        fChangeTxtBox(true, BorderStyle.None);
        fChangeBtns(true);
        fPageLoad();
    }
    protected void lnkUpdatePassword_Click(object sender, EventArgs e)
    {
         DOTS.Helpers.UpdateLearnerPassword(Convert.ToInt32(Session["LearnerId"]), txtConfirmPassword.Text, lblEmailText.Text);
        
        //txtPassword.Text = string.Empty;
        //txtConfirmPassword.Text = string.Empty;

        //mp1.Hide();
    }
    protected void CancelPassword_Click(object sender, EventArgs e)
    {
        txtPassword.Text = string.Empty;
        txtConfirmPassword.Text = string.Empty;
        mp1.Hide();
    }
    protected void fChangeTxtBox(bool bReadOnly, BorderStyle sType)
    {
        lblEmailText.BorderStyle = sType;
        lblEmailText.ReadOnly = bReadOnly;
        lblFirstNameText.BorderStyle = sType;
        lblFirstNameText.ReadOnly = bReadOnly;
        lblLastNameText.BorderStyle = sType;
        lblLastNameText.ReadOnly = bReadOnly;
    }
    protected void fChangeBtns(bool bVisible)
    {
        UpdateProfileBtn.Visible = !bVisible;
        editProfileBtn.Visible = bVisible;
        cancelBtn.Visible = !bVisible;
        editPasswordBtn.Visible = bVisible;
    }

    protected void txtPassword_TextChanged(object sender, EventArgs e)
    {

    }

}