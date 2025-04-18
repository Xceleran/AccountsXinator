using System;
using System.Collections.Generic;

using System.Data;
using System.Linq;
using System.Web;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;
using System.Net;
using System.Runtime.Remoting.Messaging;

namespace Accounts.Xinator
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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


            //logoutFromAll();

            //string LogoutReturnUrl = ConfigurationManager.AppSettings["LogoutReturnUrl"].ToString();

            //Response.Redirect(LogoutReturnUrl);
            Response.Redirect("Login.aspx?lg=1");
        }
        public void logoutFromAll()
        {
            //string sql = "select LogoutUrl from tbl_Logout";
            //Database db = new Database();
            //DataTable dt = new DataTable();
            //db.Execute(sql, out dt);
            //if (dt.Rows.Count > 0)
            //{
            //    foreach(DataRow dr in dt.Rows)
            //    {
            //        var sUrl = dr["LogoutUrl"].ToString();
            //        var client = new RestClient(sUrl);
            //        var request = new RestRequest(Method.GET);
            //        IRestResponse response = client.Execute(request);
            //    }

            //}

            try
            {

                Database db = new Database();
                string Sql = "Select * FROM [XinatorCentral].[dbo].[tbl_Logout]";

                db.Open();

                DataTable dt;

                db.Execute(Sql, out dt);

                foreach (DataRow dr in dt.Rows)
                {
                    string url = dr["LogoutUrl"].ToString();

                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

                    HttpWebResponse httpWebResponse = (HttpWebResponse)request.GetResponse();
                    Stream responseStream = httpWebResponse.GetResponseStream();

                    StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                    string response = reader.ReadToEnd();

                    responseStream.Close();
                    reader.Close();
                }


            }
            catch (Exception ex)
            {

            }


        }
    }
}