using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace Accounts.Xinator
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string token = Request.QueryString["token"];
                if (string.IsNullOrEmpty(token))
                {
                    pnlForm.Visible = false;
                    lblError.Text = "Invalid token.";
                    return;
                }

                token = Common.CleanInput(token, 100);

                Database db = new Database();
                try
                {
                    db.Open();
                    string sql = "SELECT id, CompanyID FROM [XinatorCentral].dbo.tbl_User WHERE ResetToken = @Token AND ResetTokenExpires > @Now";
                    List<SqlParameter> parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@Token", token),
                        new SqlParameter("@Now", DateTime.Now),
                    };

                    DataTable dt = new DataTable();
                    dt = db.Execute(sql, parameters);

                    if (dt.Rows.Count > 0)
                    {
                        DataRow userRow = dt.Rows[0];
                        string userId = userRow["id"].ToString();
                        string companyId = userRow["CompanyID"].ToString();

                        // Verify company status
                        sql = "SELECT IsActive, IsTrial, TrialEndDate FROM [XinatorCentral].dbo.tbl_Company WHERE CompanyID = @CompanyID";

                        parameters = new List<SqlParameter>
                        {
                            new SqlParameter("@CompanyID", companyId),
                            new SqlParameter("@Now", DateTime.Now),
                        };

                        DataTable companyDt = new DataTable();
                        companyDt = db.Execute(sql, parameters);

                        if (companyDt.Rows.Count > 0)
                        {
                            DataRow companyRow = companyDt.Rows[0];
                            bool isActive = Convert.ToBoolean(companyRow["IsActive"]);
                            bool isTrial = Convert.ToBoolean(companyRow["IsTrial"]);
                            DateTime? trialEndDate = companyRow["TrialEndDate"] != DBNull.Value ? Convert.ToDateTime(companyRow["TrialEndDate"]) : (DateTime?)null;

                            if (!isActive)
                            {
                                pnlForm.Visible = false;
                                lblError.Text = "Your account is deactivated.";
                                return;
                            }
                            if (!isTrial && trialEndDate.HasValue && trialEndDate.Value < DateTime.Today)
                            {
                                pnlForm.Visible = false;
                                lblError.Text = "Your trial period has ended. Please contact support.";
                                return;
                            }
                        }
                        else
                        {
                            pnlForm.Visible = false;
                            lblError.Text = "Company not found.";
                            return;
                        }

                        pnlForm.Visible = true;
                        hfUserId.Value = userId;
                    }
                    else
                    {
                        pnlForm.Visible = false;
                        lblError.Text = "Invalid or expired token.";
                    }
                }
                catch (Exception ex)
                {
                    Common.LogError($"ResetPassword error: {ex.Message}");
                    lblError.Text = "An error occurred. Please try again.";
                }
                finally
                {
                    db.Close();
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            string newPassword = Common.CleanInput(txtPassword.Text, 50);
            string userId = hfUserId.Value;
            Database db = new Database();

            try
            {
                db.Open();
                string sql = "UPDATE [XinatorCentral].dbo.tbl_User SET Password = @Password, ResetToken = NULL, ResetTokenExpires = NULL WHERE id = @UserId";

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter("@Password", newPassword),
                    new SqlParameter("@UserId", userId)
                };

                int isSuccess = db.Update(sql, parameters);
                if (isSuccess > 0)
                {
                    Response.Redirect("Login.aspx?reset=success");
                }
                else
                {
                    Response.Redirect("Login.aspx?reset=unsucessfull");
                }
            }
            catch (Exception ex)
            {
                Common.LogError($"ResetPassword update error: {ex.Message}");
                lblError.Text = "An error occurred. Please try again.";
            }
            finally
            {
                db.Close();
            }
        }
    }
}
