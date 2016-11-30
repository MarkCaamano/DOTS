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

namespace DOTS
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }
        protected void submitBtn_Click(object sender, EventArgs e)
        {
            
            int iActive;

            SqlDataAdapter adapt = Helpers.connectionHelper("POTS_PasswordRecovery");
            adapt.SelectCommand.Parameters.AddWithValue("@LearnerEmail", txtEmail.Text);

            DataTable dt = new DataTable();
            adapt.Fill(dt);

            if ((dt != null) && (dt.Rows.Count > 0))
            {
                iActive = Convert.ToInt32(dt.Rows[0]["Active"]);
            }
            else
            {
                iActive = -1;
            }
            switch (iActive)
            {
                case 0:
                    //ErrorBox.Visible = true;
                    //lblErrorMessage.Text = "";
                    break;
                case 1:
                    
                    lblErrorMessage.Text = "Email sent to <b>" + txtEmail.Text + "</b> this may take a few moments for the message to arrive. Please check your inbox, the message may have been filtered to your junk or spam folder.";
                    break;
                case -1:
                   
                    lblErrorMessage.Text = "Cannot recover this account.";
                    break;
                default:
                    // no default yet
                    break;
            }
        }

        protected void returnBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx", false);
        }
    }
}