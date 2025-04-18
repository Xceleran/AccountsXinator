using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Accounts.Xinator
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sMessage = "";

            if (Request["msg"] != null)
            {
                sMessage = Request["msg"];
            }

            Response.Write(sMessage);
        }
    }
}
