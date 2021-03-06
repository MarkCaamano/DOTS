﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Diagnostics;
using System.Threading;

namespace DOTS
{
    public class Helpers
    {
        public Helpers()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static string ComputeHash(string sInput, string sInput2)
        {
            byte[] bPassword = Encoding.UTF8.GetBytes(sInput + sInput2.ToLower());
            byte[] bHashPassword = HashAlgorithm.Create("SHA512").ComputeHash(bPassword);

            return Convert.ToBase64String(bHashPassword);
        }

        public static int DoesLearnerExists(string lEmail, string lFristName, string lLastName)
        {

            //check to see if user is in the table and alert that user profile exists.
            SqlDataAdapter adapt = Helpers.connectionHelper("POTS_UserExists");
            adapt.SelectCommand.Parameters.AddWithValue("@FirstName", lFristName);
            adapt.SelectCommand.Parameters.AddWithValue("@LastName", lLastName);
            adapt.SelectCommand.Parameters.AddWithValue("@LearnerEmail", lEmail);
            DataTable dt = new DataTable();
            adapt.Fill(dt);

            if ((dt != null) && (dt.Rows.Count > 0))
            {
                int doesExist = Convert.ToInt32(dt.Rows[0]["LearnerId"]);
                return doesExist;
            }
            else
            {
                return 0;
            }
        }
        //Convert.ToBase64String
        public static void insertLearner(string lEmail, string lFristName, string lLastName, int lAccessLevel, string lClientName)
        {
            string connString;
            SqlConnection conn = null;
            SqlCommand sCommand = null;

            lEmail = lEmail.ToLower();
            //lFristName = lFristName.ToLower().Substring(0, 1).ToUpper();
            //lLastName = lLastName.ToLower().Substring(0, 1).ToUpper();


            SqlDataAdapter adapt = Helpers.connectionHelper("POTS_ClientPassWord");
            adapt.SelectCommand.Parameters.AddWithValue("@ClientName", lClientName);
            DataTable dt = new DataTable();
            adapt.Fill(dt);

            string sClientPasss = dt.Rows[0]["DefaultPassword"].ToString();           

            //System.Web.HttpContext.Current.Response.Write(@"<script language='javascript'>alert('the string Email is:"+ lEmail+"');</script>");

            try
            {
                connString = ConfigurationManager.ConnectionStrings["POTS_ConnectionString"].ConnectionString;
                conn = new SqlConnection(connString);
                sCommand = new SqlCommand("POTS_UpsertUserProfile", conn);
                sCommand.CommandType = CommandType.StoredProcedure;

                sCommand.Parameters.Add("@LearnerID", SqlDbType.Int).Value = System.DBNull.Value;

                // stuff Administrator inserted //
                sCommand.Parameters.Add("@LearnerEmail", SqlDbType.VarChar, 255).Value = lEmail;
                sCommand.Parameters.Add("@FirstName", SqlDbType.VarChar, 255).Value = lFristName;
                sCommand.Parameters.Add("@LastName", SqlDbType.VarChar, 255).Value = lLastName;

                // stuff Administator did not add //                
                sCommand.Parameters.Add("@LearnerPassword", SqlDbType.VarChar, 255).Value = ComputeHash(sClientPasss, lEmail);
                sCommand.Parameters.Add("@AccessLevel", SqlDbType.Int).Value = lAccessLevel;
                sCommand.Parameters.Add("@ClientId", SqlDbType.Int).Value = dt.Rows[0]["ClientId"];

                // sCommand.Parameters.Add("@LearnerID", SqlDbType.Int).Value = lId;

                conn.Open();
                sCommand.ExecuteNonQuery();
                conn.Close();
            }
            finally
            {
                sCommand.Dispose();
                conn.Dispose();
            }
        }
        public static string AllLower(string sValue)
        {
            return sValue.ToLower();
        }
        public static string InitialCap(string sCapIt)
        {
            return sCapIt.Substring(0, 1).ToUpper();
        }

        public static void UpdateLearnerPassword(int lId, string sNewPassword, string sLearnerEmail)
        {
            string connString;
            SqlConnection conn = null;
            SqlCommand sCommand = null;

            try
            {
                connString = ConfigurationManager.ConnectionStrings["POTS_ConnectionString"].ConnectionString;
                conn = new SqlConnection(connString);
                sCommand = new SqlCommand("POTS_UpdateUserPassword", conn);
                sCommand.CommandType = CommandType.StoredProcedure;

                sCommand.Parameters.Add("@LearnerID", SqlDbType.Int).Value = lId;
                sCommand.Parameters.Add("@LearnerPassword", SqlDbType.VarChar, 255).Value = ComputeHash(sNewPassword, sLearnerEmail);

                conn.Open();
                sCommand.ExecuteNonQuery();
                conn.Close();
            }
            finally
            {
                sCommand.Dispose();
                conn.Dispose();
            }
        }
        public static SqlDataAdapter connectionHelper(string sProcedure)
        {
            SqlCommand cmd = null;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["POTS_ConnectionString"].ConnectionString;

            cmd = new SqlCommand(sProcedure, con);
            SqlDataAdapter SQLAdapt = new SqlDataAdapter(cmd);
            SQLAdapt.SelectCommand.CommandType = CommandType.StoredProcedure;

            return SQLAdapt;
        }

        public static Int16 ActionCommand(SqlCommand cmd)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["POTS_ConnectionString"].ConnectionString);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                cmd.Connection = conn;
                cmd.ExecuteNonQuery();
                conn.Close();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

    }
}