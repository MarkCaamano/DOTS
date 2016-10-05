using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DOTS
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void onChnage(object sender, EventArgs e)
        {
            txtCompany.Text = "Hi";
        }

        protected void returnBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx", false);
        }
    }
}