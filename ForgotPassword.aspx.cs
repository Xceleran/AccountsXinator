using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web;
using System.Collections.Generic;

namespace Accounts.Xinator
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = Common.CleanInput(txtEmail.Text.Trim(), 200);
            Database db = new Database();

            try
            {
                db.Open();
                string sql = "SELECT id, CompanyID FROM [XinatorCentral].dbo.tbl_User WHERE Email = @Email";
                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter("@Email", email)
                };

                DataTable dt = new DataTable();
                dt = db.Execute(sql, parameters);

                if (dt.Rows.Count <= 0)
                {
                    lblMessage.Text = "No user found with this Email!";
                }

                db.Close();

                if (dt.Rows.Count > 0)
                {
                    DataRow userRow = dt.Rows[0];
                    string userId = userRow["id"].ToString();
                    string companyId = userRow["CompanyID"].ToString();

                    // Verify company status
                    sql = "SELECT IsActive, IsTrial, TrialEndDate FROM [XinatorCentral].dbo.tbl_Company WHERE CompanyID = @CompanyID";
                    parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@CompanyID", companyId)
                    };

                    db.Open();
                    DataTable companyDt = new DataTable();
                    companyDt = db.Execute(sql, parameters);

                    db.Close();

                    if (companyDt.Rows.Count > 0)
                    {
                        DataRow companyRow = companyDt.Rows[0];
                        bool isActive = Convert.ToBoolean(companyRow["IsActive"]);
                        bool isTrial = Convert.ToBoolean(companyRow["IsTrial"]);
                        DateTime? trialEndDate = companyRow["TrialEndDate"] != DBNull.Value ? Convert.ToDateTime(companyRow["TrialEndDate"]) : (DateTime?)null;

                        if (!isActive)
                        {
                            lblMessage.Text = "Your account is deactivated.";
                            return;
                        }
                        if (!isTrial && trialEndDate.HasValue && trialEndDate.Value < DateTime.Today)
                        {
                            lblMessage.Text = "Your trial period has ended. Please contact support.";
                            return;
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Company not found.";
                        return;
                    }

                    // Generate and store reset token
                    string token = Guid.NewGuid().ToString();
                    DateTime expires = DateTime.Now.AddHours(24);

                    sql = "UPDATE [XinatorCentral].dbo.tbl_User SET ResetToken = @Token, ResetTokenExpires = @Expires WHERE id = @UserId";
                    parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@Token", token),
                        new SqlParameter("@Expires", expires),
                        new SqlParameter("@UserId", userId)
                    };

                    db.Open();
                    db.Update(sql, parameters);
                    db.Close();

                    // Generate dynamic reset link
                    string protocol = HttpContext.Current.Request.Url.Scheme;
                    string host = HttpContext.Current.Request.Url.Host;
                    int port = HttpContext.Current.Request.Url.Port;
                    string portPart = (port == 80 || port == 443) ? "" : $":{port}";
                    string resetLink = $"{protocol}://{host}{portPart}/ResetPassword.aspx?token={token}";

                    // Send email
                    MailMessage mail = new MailMessage();
                    mail.To.Add(email);
                    // mail.CC.Add("support@myserviceforce.com");
                    // mail.Bcc.Add("support@myserviceforce.com");
                    mail.Subject = "Password Reset Request";
                    mail.Body = $"<p>Please click the following link to reset your password: <a href=\"{resetLink}\">{resetLink}</a></p>";
                    mail.IsBodyHtml = true;

                    SmtpClient smtp = new SmtpClient();
                    try
                    {
                        smtp.Send(mail);
                        lblMessage.Text = "Password reset link has been sent to your email.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    catch (Exception ex)
                    {
                        Common.LogError($"Failed to send email: {ex.Message}");
                        lblMessage.Text = "Failed to send email. Please try again later.";
                    }
                }
                else
                {
                    lblMessage.Text = "Email not found.";
                }
            }
            catch (Exception ex)
            {
                Common.LogError($"ForgotPassword error: {ex.Message}");
                lblMessage.Text = "An error occurred. Please try again.";
            }
            finally
            {
                db.Close();
            }
        }
    }
}
