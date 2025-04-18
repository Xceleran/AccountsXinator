using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Accounts.Xinator
{
    public partial class FeatureTourHD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //clearCookies();
            string FeautureTourUser = ConfigurationManager.AppSettings["FeautureTourUserHD"].ToString();
            string FeautureTourCompany = ConfigurationManager.AppSettings["FeautureTourCompanyHD"].ToString();
            string sUrl = "";
            string sCookieVal = FeautureTourUser + "|" + FeautureTourCompany;
            Session["XinatorSSO"] = sCookieVal;
            //HttpCookie cookie = new HttpCookie("XinatorSSO", sCookieVal);

            //cookie.Expires = DateTime.Now.AddMonths(1);

            //Response.Cookies.Add(cookie);

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

            Session["CompanyID"] = null;
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
        }
    }
}