using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Accounts.Xinator
{
    public partial class KeepSessionAlive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["XinatorSSO"] != null)
                {
                    Response.Write(Session["XinatorSSO"].ToString());
                    Response.Write("<br>");

                    if (Session["LoginTime"] != null)
                    {
                        Response.Write("Login at: " + Session["LoginTime"].ToString());

                        DateTime dtLoggedin = DateTime.Parse(Session["LoginTime"].ToString());
                        TimeSpan duration = DateTime.Now.Subtract(dtLoggedin);
                        Response.Write("<br>");
                        Response.Write("Duration: " + duration.ToString(@"hh\:mm\:ss"));
                    }

                }
                else
                {
                    Response.Write("Session time out");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
    }
}
