using System;
using System.Configuration;

namespace Accounts.Xinator
{
    public partial class FeatureTour : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //clearCookies();
            string FeautureTourUser = ConfigurationManager.AppSettings["FeautureTourUser"].ToString();
            string FeautureTourCompany = ConfigurationManager.AppSettings["FeautureTourCompany"].ToString();
            string sUrl = "";
            string sCookieVal = FeautureTourUser + "|" + FeautureTourCompany;

            //HttpCookie cookie = new HttpCookie("XinatorSSO", sCookieVal);

            //cookie.Expires = DateTime.Now.AddMonths(1);

            //Response.Cookies.Add(cookie);
            Session["XinatorSSO"] = sCookieVal;
            string sKey = Request["skey"];
            string redirectUri = Request["redirectUri"];
            string AppName = Request["app"];

            string sParam = "skey=" + sKey + "&redirectUri=" + redirectUri + "&app=" + AppName;
            //Response.Redirect("AuthUser.aspx?" + sParam);

            sUrl = "AuthUser.aspx?" + sParam;
            Response.Redirect(sUrl);

        }
        public void clearCookies()
        {

            //if (Request.Cookies["XinatorSSO"] != null)
            //{
            //    System.Web.HttpCookie ssoCookie = new System.Web.HttpCookie("XinatorSSO");
            //    ssoCookie.Expires = DateTime.Now.AddDays(-1);
            //    Response.Cookies.Add(ssoCookie);

            //}
            //Request.Cookies.Clear();
            Session["XinatorSSO"] = null;
            Session["CompanyID"] = null;
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
        }
    }
}
