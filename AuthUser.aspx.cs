using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Accounts.Xinator
{
    public partial class AuthUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string sKey = "";
            string redirectUri = "";
            string AppName = "";


            if (Request["skey"] != null) sKey = Request["skey"];
            if (Request["redirectUri"] != null) redirectUri = Request["redirectUri"];
            if (Request["app"] != null) AppName = Request["app"];

            if (string.IsNullOrEmpty(sKey) || string.IsNullOrEmpty(redirectUri) || string.IsNullOrEmpty(AppName))
            {
                Response.Redirect("Error.aspx?msg=Invaliv request!");
                Common.LogError("AuthUser.aspx: " + "Invalid query string:"
                                 + sKey + "||" + redirectUri + "||" + AppName);
            }
            else
            {
                bool isValidate = AuthManager.ValidateRequest(AppName, redirectUri);

                if (isValidate)
                {
                   
                    string sRetval = AuthManager.GetCurrentLogin();
                    
                    if (!string.IsNullOrEmpty(sRetval))
                    {
                        string sToken = AuthManager.EncryptString(sKey, sRetval);
                        //encode the token
                        sToken = Uri.EscapeDataString(sToken);

                        Response.Redirect(redirectUri + "?token=" + sToken);
                    }
                    else
                    {
                        string sParam = "skey=" + sKey + "&redirectUri=" + redirectUri + "&app=" + AppName;
                        Response.Redirect("Login.aspx?" + sParam);
                    }

                }
                else
                {
                    Response.Redirect("Error.aspx?msg=Access unauthorized!");
                    Common.LogError("isValidate = false");
                }
            }

        }

    }
}