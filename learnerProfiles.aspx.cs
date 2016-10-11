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
            string connString;
            SqlConnection conn = null;
            SqlCommand sCommand = null;
            
            try
            {
                connString = ConfigurationManager.ConnectionStrings["POTS_ConnectionString"].ConnectionString;
                conn = new SqlConnection(connString);
                sCommand = new SqlCommand("POTS_UpsertUserProfile", conn);
                sCommand.CommandType = CommandType.StoredProcedure;

                // do not pass learner ID? //         
                sCommand.Parameters.Add("@LearnerID", SqlDbType.Int).Value = System.DBNull.Value;
                // stuff Administrator inserted //
                sCommand.Parameters.Add("@LearnerEmail", SqlDbType.VarChar, 255).Value = txtAddEmail.Text;
                sCommand.Parameters.Add("@FirstName", SqlDbType.VarChar, 255).Value = txtAddFirstName.Text;
                sCommand.Parameters.Add("@LastName", SqlDbType.VarChar, 255).Value = txtAddLastName.Text;
                // stuff Administator did not add //                
                
                Byte[] hashedBytes = Helpers.ComputeHash("password", new SHA512CryptoServiceProvider());
               
                sCommand.Parameters.Add("@LearnerPassword", SqlDbType.VarChar, 255).Value = System.Text.Encoding.UTF8.GetString(hashedBytes);
                sCommand.Parameters.Add("@AccessLevel", SqlDbType.Int).Value = Convert.ToInt32(DropDownList1.SelectedValue);
                sCommand.Parameters.Add("@ClientId", SqlDbType.Int).Value = Session["ClientId"];

                conn.Open();
                sCommand.ExecuteNonQuery();
                conn.Close();

                // Yay it was added //
                lblmsg.Text = "Record Inserted Succesfully into the Database";
                lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
            }
            catch (InvalidCastException eSuckIt)
            {
                // good try. try gooder //
                lblmsg.Text = "Record NOT Inserted into the Database. Error: " + eSuckIt;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                sCommand.Dispose();
                conn.Dispose();
            }

        }

        protected void CancelUser_Click(object sender, EventArgs e)
        {
            txtAddEmail.Text = string.Empty;
            txtAddFirstName.Text = string.Empty;
            txtAddLastName.Text = string.Empty;

            mp1.Hide();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Console.WriteLine("yes!");
        }
    }
}