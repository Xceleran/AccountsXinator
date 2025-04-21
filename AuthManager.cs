using System;
using System.Data;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Accounts.Xinator
{
    public class AuthManager
    {
        public static bool ValidateRequest(string AppName, string RedirectUri)
        {
            bool retVal = false;

            AppName = Common.CleanInput(AppName);
            RedirectUri = Common.CleanInput(RedirectUri);

            try
            {
                Database db = new Database();

                db.Open();

                string Sql = "Select * from XinatorCentral.dbo.tbl_Apps " +
                             " Where AppName = '" + AppName + "'" +
                             " And RedirectUri = '" + RedirectUri + "'";

                DataTable dt;

                db.Execute(Sql, out dt);

                if (dt.Rows.Count > 0)
                {
                    retVal = true;
                }
                else
                {
                    Common.LogError("Sql: " + Sql);
                }

                db.Close();

            }
            catch (Exception ex)
            {
                Common.LogError("AuthManager:ValidateRequest: " + ex.Message);
            }

            return retVal;

        }

        public static string GetCurrentLogin()
        {
            string sUser = "";

            //HttpCookie ssoCookie = HttpContext.Current.Request.Cookies["XinatorSSO"];

            //if (ssoCookie != null)
            //{
            //    string sCookie = ssoCookie.Value;
            //    sUser = sCookie;


            //}


            if (HttpContext.Current.Session["XinatorSSO"] != null)
            {
                string ssoCookie = HttpContext.Current.Session["XinatorSSO"].ToString();

                //   string sCookie = ssoCookie.Value;
                sUser = ssoCookie;


            }
            return sUser;

        }



        public static string EncryptString(string key, string encryptString)
        {
            string EncryptionKey = key;
            byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
                //encryptor.Padding = PaddingMode.PKCS7;
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);

                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        //cs.Close();
                        cs.FlushFinalBlock();
                    }
                    encryptString = Convert.ToBase64String(ms.ToArray());

                }
            }

            return encryptString;
        }

        public string DecryptString(string key, string cipherText)
        {
            string EncryptionKey = key;

            // Decode the encoded string.
            cipherText = Uri.UnescapeDataString(cipherText);

            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });

                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
    }
}
