<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Login.aspx.cs" Inherits="Accounts.Xinator.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>Accounts.Xinator </title>

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

    <style type="text/css">
        .modal {
            overflow-x: hidden;
            overflow-y: auto;
        }
    </style>
    <script type="text/javascript">
        function OpenModal() {
            $("#LicanseAgrement").modal('show');
        }
        $(window).scroll(function () {
            if ($(this).scrollTop() >= $("#terms").height()) {
                $('#payment').prop({ disabled: false });
            }
        });
        $(document).ready(function () {
            $('#btn_Save').prop("disabled", true);
            // OpenModal();
        });
    </script>
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
    <form id="form" runat="server">
        <section class="login-1stsec py-5" id="homesec">
            <div class="container">

                <div class="row d-flex justify-content-center align-items-center fullHeight">
                    <div class="col-12 mt-5">
                        <div class="row d-flex justify-content-center align-items-center">

                            <div class="col-12 col-sm-12 col-md-6 col-lg-4 ">
                                <div class="login-container shadow-sm">
                                    <h2>Sign in to XinatorCentral</h2>

                                    <div class="">
                                        <input type="hidden">
                                    </div>

                                    <div class="">

                                        <input type="hidden" id="txtcompanyID" runat="server">
                                    </div>

                                    <div class="row">
                                        <div class="col-12 mt-3">
                                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>

                                        </div>

                                        <div class="col-12 mt-3">
                                            <label class="form-label mb-0">Email</label>

                                            <asp:TextBox ID="txtUsername" name="txtUsername" class="form-control" runat="server" MaxLength="80"></asp:TextBox>
                                        </div>
                                        <div class="col-12 mt-3">
                                            <label class="form-label mb-0">Password</label>

                                            <asp:TextBox ID="txtPassword" name="txtPassword" class="form-control" runat="server" TextMode="Password" MaxLength="15"></asp:TextBox>
                                        </div>

                                        <div class="col-12 mt-3">
                                            <input type="checkbox" name="remember" id="remember">
                                            <label for="remember">Remember me on this computer</label>
                                        </div>


                                        <div class="col-12 mt-3">
                                            <asp:Button ID="btnLogin" type="button" class="btn btn-primary btn-loginblue w-100" runat="server" Text="Login" OnClick="btnLogin_Click" />

                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </section>
        <div class="modal fade bd-example-modal-lg" data-backdrop="static" data-keyboard="false" id="LicanseAgrement" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">SOFTWARE LICENSE AGREEMENT</h5>
                    </div>

                    <div class="modal-body">
                        <div class="WordSection1" id="terms" style="overflow: auto; max-height: 80vh;">

                            <input id="payment" type="checkbox" onchange="document.getElementById('btn_Save').disabled = !this.checked;" name="terms">
                            <span class="redSmall">I have read and agree to the terms of the License Agreement.  Click <a href="XSI LICENSE AGREEMENT.htm" target="_blank" class="link-primary">here</a> to read the agreement.</span>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btn_Save" ClientIDMode="Static" UseSubmitBehavior="False" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnLogin_Click" />

                    </div>
                </div>
            </div>
        </div>
    </form>



    <footer class="footer-sec">
        <div class="container">
            <div class="row">


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


    <!-- watchdemoccmodal -->
    <div class="modal fade" id="msfofficeytmodal" tabindex="-1" aria-labelledby="msfofficeytmodalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h5>Download Instruction</h5>
                </div>

                <div class="btnX shadow d-flex justify-content-center align-items-center">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-3">
                    <section>
                        <div class="container">

                            <div class="row">

                                <div class="col-12">

                                    <p>myServiceJOBS and myServiceJOBS+ are available in the Apple Store or Google Play. They can be downloaded directly from the store or you can send a download link to mobile devices - iOS or Android! Here's how:</p>
                                    <p class="mt-2">To Email a link to any iOS or Android rnobile device for the recipient to tap on and download the myServiceJOBS+ or myServiceJOBS mobile app from the Apple Store or GooglePlay. Just do the following:</p>

                                    <ul class="mb-2">
                                        <li>Click the "Send Link" button below to open email
                                        </li>
                                        <li>Enter the email address(es) for the mobile device(s)
                                        </li>
                                        <li>Send the email
                                        </li>
                                        <li>Once the user gets the email on the mobile device, they just tap it and are automatically directed to the correct application store for their device. Nice and easy.
                                        </li>
                                    </ul>

                                    <p class="mt-2">
                                        Note: myServiceJOBS+ is an in-app purchase within the JOBS Field App. Just
                                click on "Upgrade to myServiceJOBS+" and you will receive instructions for
                                setting up your Administration and additional field users.
                                    </p>

                                </div>
                            </div>

                            <div class="row ">
                                <div class="col-12 d-flex justify-content-center align-items-center">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 mt-3">
                                                <a class="href-link" href="mailto: ?Subject=myServiceJOBS Dowload Link&Body=Use the link below to download myServiceJOBS on your iOS device. %0D%0A  %0D%0A  https://itunes.apple.com/us/app/myservicejobs-free-work-order/id1013466457?mt=8  %0D%0A ">

                                                    <button type="button" class="btn btn-primary btn-orange rounded-pill w-100" data-bs-toggle="modal" data-bs-target="#msfofficeytmodal">
                                                        Send iOS Link
                                                    </button>

                                                </a>
                                            </div>

                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 mt-3">
                                                <a class="href-link" href="mailto: ?Subject=myServiceJOBS Dowload Link&Body=Use the link below to download myServiceJOBS on your Android device. %0D%0A  %0D%0A  https://play.google.com/store/apps/details?id=com.myserviceforce.myservicejobs  %0D%0A ">

                                                    <button type="button" class="btn btn-primary btn-darkblue rounded-pill w-100" data-bs-toggle="modal" data-bs-target="#msfofficeytmodal">
                                                        Send Android Link
                                                    </button>
                                                </a>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </section>



                </div>
            </div>
        </div>
    </div>


    <iframe src="https://jobs-msschedules.myserviceforce.com/logoutFromParent.asp" style="width: 0px; height: 0px"></iframe>
    <iframe src="https://jobs-msschedules.myserviceforce.com/logoutFromParent.aspx" style="width: 0px; height: 0px"></iframe>
    <iframe src="https://paymentportal.xceleran.com/logoutFromParent.aspx" style="width: 0px; height: 0px"></iframe>


    <call-us
        style="position: fixed; right: 20px; bottom: 20px; font-family: Arial; z-index: 99999; --call-us-form-header-background: #0d3568; --call-us-main-button-background: #0d3568; --call-us-client-text-color: #d4d4d4; --call-us-agent-text-color: #0d3568; --call-us-form-height: 330px;"
        id="wp-live-chat-by-3CX"
        channel-url="https://myservice.pa.3cx.us:5001"
        files-url="https://myservice.pa.3cx.us:5001"
        minimized="true"
        animation-style="none"
        party="profitandexpense"
        minimized-style="BubbleRight"
        allow-call="false"
        allow-video="false"
        allow-soundnotifications="true"
        enable-onmobile="true"
        offline-enabled="true"
        enable="true"
        ignore-queueownership="false"
        authentication="none"
        operator-name="Profit and Expense Consultant"
        show-operator-actual-name="true"
        channel="phone"
        aknowledge-received="true"
        gdpr-enabled="false"
        gdpr-message="I agree that my personal data to be processed and for the use of cookies in order to engage in a chat processed by COMPANY, for the purpose of Chat/Support for the time of  30 day(s) as per the GDPR."
        message-userinfo-format="both"
        message-dateformat="both"
        start-chat-button-text="Chat with Us"
        window-title="Xceleran Live Chat"
        button-icon-type="DoubleBubble"
        invite-message="Hello! How may I help you today?"
        authentication-message="May I have your name and email?"
        unavailable-message="We are unavailable at the moment. Please leave us a message."
        offline-finish-message="We received your message and we'll contact you soon."
        ending-message="Your session is over. Please feel free to contact us again!"
        greeting-visibility="none"
        greeting-offline-visibility="none"
        chat-delay="1000"
        offline-name-message="May we have your name?"
        offline-email-message="May we have your email?"
        offline-form-invalid-name="The provided name is not valid. Please try again."
        offline-form-maximum-characters-reached="Maximum characters reached"
        offline-form-invalid-email="Hmmm...that doesn't look like an email address. Please try again.?">
    </call-us>

    <script defer src="https://cdn.3cx.com/livechat/v1/callus.js" id="tcx-callus-js"></script>

</body>
</html>
