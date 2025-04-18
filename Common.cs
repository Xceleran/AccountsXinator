using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Accounts.Xinator
{
    public class Common
    {

        public static string CleanInput(string sInput, int iLength = 0)
        {

            if (iLength > 0)
            {
                if (sInput.Length > iLength)
                {
                    sInput = sInput.Substring(0, iLength);
                }
            }

            sInput = sInput.Replace("'", "");
            sInput = sInput.Replace(";", "");
            sInput = sInput.Replace("--", "");
            sInput = sInput.Replace("<", "");
            sInput = sInput.Replace(">", "");
            sInput = sInput.Replace("script", "");
            sInput = sInput.Replace("html", "");
            //sInput = sInput.Replace("(", "");
            //sInput = sInput.Replace(")", "");
            //sInput = sInput.Replace("=", "");
            //sInput = sInput.Replace("*", "");
            //sInput = sInput.Replace("href", "");
            //sInput = sInput.Replace("&lt", "");
            //sInput = sInput.Replace("&gt", "");
            //sInput = sInput.Replace("&quot", "");

            return sInput;

        }


        public static void LogError(string sError)
        {
            string filePath = "ErrorLog/Log.txt";

            filePath = HttpContext.Current.Server.MapPath(filePath);

            StreamWriter sw = new StreamWriter(filePath, true);

            sw.WriteLine(DateTime.Now.ToString());
            sw.WriteLine(sError);

            sw.Flush();
            sw.Close();
        }


    }
}
