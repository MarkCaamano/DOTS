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

    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) FormsAuthentication.SignOut();
        }

        protected void regBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx", false);
        }

        protected void forgotPasswordBtn_Click(object sender, EventArgs e)
        {
            txtEmail.Text = string.Empty;
            //Response.Redirect("forgotPassword.aspx", false);
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int iActive;
            string eMailInput = txtBoxEmail.Text;
            //int iSubscriber;

            SqlDataAdapter adapt = DOTS.Helpers.connectionHelper("POTS_Login");
            
            adapt.SelectCommand.Parameters.AddWithValue("@LearnerEmail", eMailInput);
            //adapt.SelectCommand.Parameters.AddWithValue("@LearnerPassword", DOTS.Helpers.ComputeHash(txtBoxPassword.Text, eMailInput));

            adapt.SelectCommand.Parameters.AddWithValue("@LearnerPassword", txtBoxPassword.Text);
            //Label1.Text = DOTS.Helpers.ComputeHash(txtBoxPassword.Text, eMailInput);

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
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "<strong>" + Convert.ToString(dt.Rows[0]["ClientName"]) + " Account Expired:</strong> Please contact your training manager.";
                    break;
                case 1:
                    FormsAuthentication.RedirectFromLoginPage(eMailInput, true);
                    Session["UserName"] = Convert.ToString(dt.Rows[0]["UserName"]);
                    Session["ClientName"] = Convert.ToString(dt.Rows[0]["ClientName"]);
                    Session["ClientId"] = dt.Rows[0]["ClientId"];
                    Session["LearnerId"] = Convert.ToString(dt.Rows[0]["LearnerId"]);
                    Session["AccessLevel"] = Convert.ToString(dt.Rows[0]["AccessLevel"]);
                    Session["MasterPage"] = Convert.ToString(dt.Rows[0]["MasterPage"]);
                    Response.Redirect("home.aspx");
                    break;
                case -1:
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "The email, password, or both are invalid";
                    break;
                default:
                    // no default yet
                    break;
            }
           dt.Dispose();           
        }

        protected void lkbtnResetPassword_Click(object sender, EventArgs e)
        {
            int iActive;

            SqlDataAdapter adapt = DOTS.Helpers.connectionHelper("POTS_PasswordRecovery");
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
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Email sent to <b>" + txtEmail.Text + "</b> this may take a few moments for the message to arrive. Please check your inbox, the message may have been filtered to your junk or spam folder.";

                    break;
                case -1:
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Cannot recover this account.";
                    break;
                default:
                    // no default yet
                    break;
            }
            txtEmail.Text = string.Empty;
        }

        protected void lkbtnCancel_Click(object sender, EventArgs e)
        {
            txtEmail.Text = string.Empty;
            //mp1.Hide();
        }
    }