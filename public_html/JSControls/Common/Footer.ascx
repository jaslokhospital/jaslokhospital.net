<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="JSControls_Home_Footer" %>
<%@ Register Src="~/JSControls/Common/PressRelease.ascx" TagPrefix="JS" TagName="PressRelease" %>
<%@ Register Src="~/JSControls/Common/JaslokTimesSubscription.ascx" TagPrefix="JS" TagName="Subscription" %>
<div class="container-fluid footer">
    <div class="container">
        <div class="row">
            <JS:PressRelease runat="server" ID="PressRelease" />


            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 foot hidden-xs">

                <div class="title">Contact</div>
                <span class="subtitle">Jaslok Hospital & Research Centre</span>
                <div class="contactlist">
                    <p><i class="glyphicon glyphicon-map-marker icon-color"></i>15 - Dr. Deshmukh Marg,<br>
                        <span>Pedder Road, Mumbai- 400026</span></p>
                    <p><i class="glyphicon glyphicon-envelope icon-color"></i><a href="mailto:online@jaslokhospital.net">online@jaslokhospital.net</a></p>


                    <p>
                        <i class="glyphicon glyphicon-earphone icon-color" style="display: inline; top: 20px;"></i>
                        <span style="">+91-22-66573333</span><br>
                        <span>+91-22-2353-3333</span><br>
                        <span>+91-22-66573010</span><br>
                    </p>                   

                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 foot">
                <div class="hidden-xs">
                    <div class="title">jaslok times</div>
                    <JS:Subscription runat="server" ID="Subscription1" />
                    <a href="/jasloktimes">
                        <h4 style="color: #ffffff">Jaslok Time Archives:</h4>
                    </a>
                </div>
                <div class="socialdiv colored hidden-xs">
                    <ul>
                        <li><a class="twitter" href="http://twitter.com/jaslokhospital" target="_blank"></a></li>
                        <li><a class="facebook" href="http://facebook.com/jaslokhospital" target="_blank"></a></li>
                        <li><a class="youtube" href="http://www.youtube.com/jaslokhospitalindia" target="_blank"></a></li>
                        <li><a class="linkedin" href="https://www.linkedin.com/company/jaslok-hospital" target="_blank"></a></li>
                    </ul>
                </div>

                <div class="hidden-lg hidden-md hidden-sm">
                    <div class="socialdiv colored">
                        <ul>
                            <li><a class="" href="http://twitter.com/jaslokhospital" target="_blank">
                                <img src="/images/tw.png" alt="twitter" title="twitter" class="img-responsive" /></a></li>
                            <li><a class="" href="http://facebook.com/jaslokhospital" target="_blank">
                                <img src="/images/fb.png" alt="facebook" title="facebook" class="img-responsive" /></a></li>
                            <li><a class="" href="http://www.youtube.com/jaslokhospitalindia" target="_blank">
                                <img src="/images/yu.png" alt="youtube" title="youtube" class="img-responsive" /></a></li>
                            <li><a class="" href="https://www.linkedin.com/company/jaslok-hospital" target="_blank">
                                <img src="/images/li.png" alt="linked-in" title="linked-in" class="img-responsive" /></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- footerbottom -->
<div class="container-fluid footer-inner">
    <div class="container">

        <div class="row">
            <div class="col-md-1 col-col-sm-12 xs-12 logo4">
                <img src="/images/footer_logo.png" class="" alt="footer_logo" title="footer_logo">
            </div>
            <div class="col-md-8 col-sm-12 col-xs-12">
                <ul id="footernav1" class="nav1" style="width: 100%;">
                    <li class="border"><a href="/about-us">About us </a></li>
                    <li class="border"><a href="/complaint">Complaint </a></li>
                    <li class="border"><a href="http://webmail.jaslokhospital.net/appsuite/signin">Webmail</a></li>
                    <li class="border footer-links-margin-mobile"><a href="/photo-gallery">Media Centre </a></li>
                    <li class="border"><a href="/career">Career</a></li>
                    <li class="border"><a href="/contact-us">Contact us </a></li>
                    <li class="border footer-links-margin-mobile"><a href="/patients/quick-enquiry">Send a Query </a></li>
                    <li class="border"><a href="/privacy-policy">Privacy Policy </a></li>
                    <li class="border"><a href="/sitemap">Site Map</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                <p class="foottext">© Jaslok Hospital. All rights Reserved.</p>
            </div>
        </div>
    </div>
</div>

<%--<div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding:5px 50px;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
                    </div>
                    <div class="modal-body" style="padding:40px 50px;">
                        <div>
                            <div class="form-group">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
                                <input type="text" class="form-control" id="usrname" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                                <input type="text" class="form-control" id="psw" placeholder="Enter password">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="" checked>
                  Remember me</label>
                            </div>
                            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                        <p>Not a member? <a href="#">Sign Up</a></p>
                        <p>Forgot <a href="#">Password?</a></p>
                    </div>
                </div>
            </div>
        </div>--%>
    