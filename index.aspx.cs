﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;

namespace DOTS
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) FormsAuthentication.SignOut();
            ErrorBox.Visible = false;
        }

        protected void regBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx", false);
        }

        protected void forgotPasswordBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgotPassword.aspx", false);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int iActive;

            SqlDataAdapter adapt = Helpers.connectionHelper("POTS_Login");

            adapt.SelectCommand.Parameters.AddWithValue("@LearnerEmail", txtBoxEmail.Text);

            // Byte[] hashedBytes = Helpers.ComputeHash(txtBoxPassword.Text, txtBoxEmail.Text);
            adapt.SelectCommand.Parameters.AddWithValue( "@LearnerPassword", Helpers.ComputeHash(txtBoxPassword.Text, txtBoxEmail.Text) );
            Label1.Text = Helpers.ComputeHash(txtBoxPassword.Text, txtBoxEmail.Text);
           // adapt.SelectCommand.Parameters.AddWithValue( "@LearnerPassword", txtBoxPassword.Text );  

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
                    ErrorBox.Visible = true;
                    lblErrorMessage.Text = "<strong>" + Convert.ToString(dt.Rows[0]["ClientName"]) + " Account Expired:</strong> Please contact your training manager.";
                    break;
                case 1:
                    FormsAuthentication.RedirectFromLoginPage(txtBoxEmail.Text, true);
                    Session["UserName"] = Convert.ToString(dt.Rows[0]["UserName"]);
                    Session["ClientName"] = Convert.ToString(dt.Rows[0]["ClientName"]);
                    Session["ClientId"] = dt.Rows[0]["ClientId"];
                    Session["LearnerId"] = Convert.ToString(dt.Rows[0]["LearnerId"]);
                    Session["AccessLevel"] = Convert.ToString(dt.Rows[0]["AccessLevel"]);
                    Session["MasterPage"] = Convert.ToString(dt.Rows[0]["MasterPage"]);
                    Response.Redirect("home.aspx");
                    break;
                case -1:
                    ErrorBox.Visible = true;
                    lblErrorMessage.Text = "Invalid email or password.";
                    break;
                default:
                    // no default yet
                    break;
            }

            //dt.Dispose();           

        }
    }
}