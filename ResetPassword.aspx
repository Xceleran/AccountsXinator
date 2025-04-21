<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Accounts.Xinator.ResetPassword" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Reset Password</title>

    <!-- <link rel="shortcut icon" type="image/png" href="img/favcon.png">
 -->
    <link href="css/bootsrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/all.css" rel="stylesheet">

    <link href="css/style.css" rel="stylesheet">
    <link href="css/poppins.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

    <link rel="stylesheet" href="css/owlcarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owlcarousel/owl.theme.default.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
    <div class="nav-top nav-top shadow">
        <div id="contop" class="container-fluid-sm container-fluid-md px-0 px-sm-0 px-md-0 container-lg">

            <nav class="navbar navbar-expand-md navbar-dark" aria-label="msf navbar">
                <div class="container-fluid">
                    <a class="navbar-brand" href="https://www.xceleran.com/xinatorservco/">
                        <img src="img/logo/central.png" class="img-responsive logo d-block" />
                    </a>
                </div>
            </nav>
        </div>
    </div>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlForm" runat="server" Visible="false">
            <section class="login-1stsec py-5" id="homesec">
                <div class="container">
                    <div class="row d-flex justify-content-center align-items-center fullHeight">
                        <div class="col-12 mt-5">
                            <div class="row d-flex justify-content-center align-items-center">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
                                    <div class="login-container shadow-sm">
                                        <h2>Reset Password in to XinatorCentral</h2>

                                        <asp:HiddenField ID="hfUserId" runat="server" />

                                        <div class="row">
                                            <div class="col-12 mt-3">
                                                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                            </div>
                                            <div class="col-12 mt-3">
                                                <label class="form-label mb-0">Email</label>
                                                <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password" placeholder="New Password"></asp:TextBox><br />
                                            </div>

                                            <div class="col-12 mt-3">
                                                <asp:Button ID="btnReset" class="btn btn-primary btn-loginblue w-100" runat="server" Text="Reset Password" OnClick="btnReset_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </asp:Panel>
    </form>
    <footer class="footer-sec">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <p>
                        Copyright © 2022 All rights reserved by <a href="" target="_blank">XinatorServco.com</a>
                    </p>
                </div>
            </div>
        </div>
    </footer>

    <script src="js/jquery/jquery-3.5.1.min.js"></script>
    <script src="js/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.simple-scroll-follow.min.js"></script>
    <script src="js/owlcarousel/owl.carousel.min.js"></script>
    <script src="js/customjs.js"></script>
</body>
</html>
