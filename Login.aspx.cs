using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Accounts.Xinator
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {


            lblError.Text = "";

            //AuthManager lp = new AuthManager();

            string UserID = Common.CleanInput(txtUsername.Text, 80);
            string Password = Common.CleanInput(txtPassword.Text, 15);
            //string SysAdminPwd = ConfigurationManager.AppSettings["SysAdminPwd"];           

            string sUrl = "";

            try
            {
                User user = VerifyUser(UserID, Password);

                if (user.Verified)
                {
                    //Zh: Storing Login time

                    Session["LoginTime"] = DateTime.Now.ToString();

                    string sCookieVal = user.UserID + "|" + user.CompanyID;

                    //HttpCookie cookie = new HttpCookie("XinatorSSO", sCookieVal);

                    //cookie.Expires= DateTime.Now.AddMonths(1);

                    //Response.Cookies.Add(cookie);
                    Session["XinatorSSO"] = sCookieVal;
                    string sKey = "";
                    string redirectUri = "";
                    string AppName = "";
                    if (Request["lg"] != null)
                    {
                        sKey = ConfigurationManager.AppSettings["CentralToken"].ToString();
                        redirectUri = ConfigurationManager.AppSettings["LogoutReturnUrl"].ToString() + "AuthVerify.aspx";
                        AppName = ConfigurationManager.AppSettings["AppName"].ToString();
                    }
                    else
                    {
                        if (Request["skey"] != null) sKey = Request["skey"];
                        if (Request["redirectUri"] != null) redirectUri = Request["redirectUri"];
                        if (Request["app"] != null) AppName = Request["app"];
                    }
                    string sParam = "skey=" + sKey + "&redirectUri=" + redirectUri + "&app=" + AppName;
                    //Response.Redirect("AuthUser.aspx?" + sParam);

                    sUrl = "AuthUser.aspx?" + sParam;

                }
                else
                {
                    lblError.Text = user.ErrorMessage;
                    return;
                }
            }
            catch (Exception ex)
            {
                sUrl = "Error.aspx?msg=Login error";
            }

            Response.Redirect(sUrl);

        }

        //public User VerifyUser(string UserID,string Password)
        //{
        //    User user = null;


        //    string sql = "";
        //    Database db = new Database();
        //    DataTable dt = new DataTable();
        //    db.Open();

        //    if (!string.IsNullOrEmpty(UserID) && !string.IsNullOrEmpty(Password))
        //    {
        //        sql = "Select*from XinatorCentral.dbo.tbl_User where UserID='" + UserID + "' and Password='" + Password + "'; ";

        //        db.Execute(sql, out dt);
        //        db.Close();
        //        if (dt.Rows.Count > 0)
        //        {
        //            user = new User();

        //            DataRow dr = dt.Rows[0];
        //            user.UserID = dr["UserID"].ToString();
        //            user.CompanyID = dr["CompanyID"].ToString();

        //        }
        //    }

        //    return user;
        //}
        public User VerifyUser(string UserID, string Password)
        {
            User user = new User();


            string sql = "";
            Database db = new Database();
            DataTable dt = new DataTable();
            db.Open();

            if (!string.IsNullOrEmpty(UserID) && !string.IsNullOrEmpty(Password))
            {
                sql = "Select * from XinatorCentral.dbo.tbl_User " +
                      " where UserID='" + UserID + "'" +
                      " and Password='" + Password + "'" +
                      " and IsFieldTechnitian = 0";

                db.Execute(sql, out dt);
                db.Close();
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    user.UserID = dr["UserID"].ToString();
                    user.CompanyID = dr["CompanyID"].ToString();


                    sql = "Select * from [XinatorCentral].dbo.tbl_Company where " +
                             "CompanyID = @CompanyID ";

                    db.Command.CommandText = sql;
                    db.Command.Parameters.AddWithValue("@CompanyID", dr["CompanyID"].ToString());

                    DataTable dt2 = new DataTable();

                    db.Execute(out dt2);

                    if (dt2.Rows.Count > 0)
                    {
                        DataRow dr1 = dt2.Rows[0];

                        bool IsActive = Convert.ToBoolean(dr1["IsActive"]);
                        bool Trial = Convert.ToBoolean(dr1["IsTrial"]);

                        if (!IsActive)
                        {

                            user.Verified = false;
                            user.ErrorMessage = "Your account deactivated.";
                        }
                        else if (Trial)
                        {
                            DateTime TrialEndDate = Convert.ToDateTime(dr1["TrialEndDate"]);
                            if (TrialEndDate < DateTime.Today)
                            {
                                user.Verified = false;
                                user.ErrorMessage = "Your trial period has been ended.Please use the Chat link to contact support to resolve this issue.";
                            }
                            else
                            {
                                user.Verified = true;
                            }
                        }
                        else
                        {
                            user.Verified = true;

                        }

                        //else
                        //{
                        //    userInfo.Verified = true;
                        //}

                    }
                    else
                    {
                        user.Verified = false;
                        user.ErrorMessage = "Invalid User name or Password";
                    }

                }
                else
                {
                    user.Verified = false;
                    user.ErrorMessage = "Invalid User name or Password";
                }
            }
            else
            {
                user.Verified = false;
                user.ErrorMessage = "User and Password can not be null";
            }

            return user;
        }
        public void createLoginCookie(string UserID, string CompanyID)
        {

            //string coockieVal = UserID + "|" + CompanyID;
            //HttpCookie myCookie = new HttpCookie("XinatorSSO");
            //myCookie.Value = coockieVal;
            //string AccountUrl = ConfigurationManager.AppSettings["BaseUrl"].ToString();
            //myCookie.Domain = AccountUrl;
            //HttpContext.Current.Response.Cookies.Add(myCookie);


        }

    }
}