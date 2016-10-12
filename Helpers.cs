using System;
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
        //Convert.ToBase64String
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