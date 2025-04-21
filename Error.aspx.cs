using System;

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
