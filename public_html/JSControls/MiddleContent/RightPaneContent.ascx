<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RightPaneContent.ascx.cs" Inherits="JSControls_MiddleContent_RightPaneContent" %>


<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="item active">
                <asp:Image runat="server" CssClass="img-div" ID="imgbanner" />
            </div>
        </div>
    </div>

</div>
<img src="/images/icon.jpg" alt="Icon" class="icon-right">
<div class="row">
    <div class="container">
        <div class="col-md-3">
            <div class="left_part">
                <div class="about_dept">
                    <h4>About the Department <i class="fa fa-chevron-right"></i></h4>

                </div>
                <div class="doc_attendence">
                    <h4>Doctors in Attendance</h4>
                </div>
                <div class="doc_attendence">
                    <h4>Videos</h4>
                </div>
                <div class="date_timings">
                    <h3>Date & Timings</h3>
                    <span>Every Monday(12.00 to 2.00 pm)<br>
                        Appointment on: 022-66 57 3014<br>
                        OPD Reception, 2nd Floor,<br>
                        Jaslok Hospital
                    </span>

                </div>
                <div class="left_form">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <h3>Book an <span>Appointment</span></h3>
                        </div>
                        <div class="form-group">
                            <select class="form-control appoint_form">
                                <option selected="selected">Search by Speciality</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control appoint_form">
                                <option selected="selected">Search by Doctor</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control">
                                <option selected="selected">Date & Time</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn_submit">Submit<i class="glyphicon glyphicon-chevron-right"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-9">
            <div id="divScopeContent" runat="server" class="right_part">
            </div>
        </div>
    </div>
</div>
<div class="row space">
    <div class="container">
        <div class="research_papers">
            <div class="col-md-3">
                <div id="talkbubble">
                    <div class="research_text">
                        <span class="glyphicon glyphicon-list-alt"></span>
                        Research Papers 
                    </div>
                </div>
            </div>

            <div class="col-md-9">
                <div class="carousel slide" data-ride="carousel" id="quote-carousel">
                    <!-- Carousel Slides / Quotes -->
                    <div class="carousel-inner text-center">
                        <!-- Quote 1 -->
                        <div class="item active">
                            <div class="row">
                                <div class="col-sm-4 col-sm-offset-1">
                                    <ul class="media-list">
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#">
                                                    <img class="media-object" src="images/pdf.png" alt="...">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h4 class="media-heading">Lorem Ipsum Dolar</h4>
                                                <p>Lorem Ipsum Dolar samet dolrame lor amet samet dolr ame</p>
                                                <p>
                                                    <i class="glyphicon glyphicon-eye-open"></i>
                                                    <span>View </span>
                                                    <i class="glyphicon glyphicon-download"></i>
                                                    <span>Download </span>
                                                </p>
                                            </div>
                                        </li>
                                    </ul>

                                </div>
                                <div class="col-sm-4 col-sm-offset-1">
                                    <ul class="media-list">
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#">
                                                    <img class="media-object" src="images/pdf.png" alt="...">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h4 class="media-heading">Lorem Ipsum Dolar</h4>
                                                <p>Lorem Ipsum Dolar samet dolrame lor amet samet dolr ame</p>
                                                <p>
                                                    <i class="glyphicon glyphicon-eye-open"></i>
                                                    <span>View </span>
                                                    <i class="glyphicon glyphicon-download"></i>
                                                    <span>Download </span>
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                        <!-- Quote 2 -->
                        <div class="item">
                            <div class="row">
                                <div class="col-sm-4 col-sm-offset-1">
                                    <ul class="media-list">
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#">
                                                    <img class="media-object" src="images/pdf.png" alt="...">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h4 class="media-heading">Lorem Ipsum Dolar</h4>
                                                <p>Lorem Ipsum Dolar samet dolrame lor amet samet dolr ame</p>
                                                <p>
                                                    <i class="glyphicon glyphicon-eye-open"></i>
                                                    <span>View </span>
                                                    <i class="glyphicon glyphicon-download"></i>
                                                    <span>Download </span>
                                                </p>
                                            </div>
                                        </li>
                                    </ul>

                                </div>
                                <div class="col-sm-4 col-sm-offset-1">
                                    <ul class="media-list">
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#">
                                                    <img class="media-object" src="images/pdf.png" alt="...">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h4 class="media-heading">Lorem Ipsum Dolar</h4>
                                                <p>Lorem Ipsum Dolar samet dolrame lor amet samet dolr ame</p>
                                                <p>
                                                    <i class="glyphicon glyphicon-eye-open"></i>
                                                    <span>View </span>
                                                    <i class="glyphicon glyphicon-download"></i>
                                                    <span>Download </span>
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Bottom Carousel Indicators -->


                    <!-- Carousel Buttons Next/Prev -->
                    <a data-slide="prev" href="#quote-carousel" class="left carousel-control"><i class="fa fa-chevron-left"></i></a>
                    <a data-slide="next" href="#quote-carousel" class="right carousel-control"><i class="fa fa-chevron-right"></i></a>
                </div>
            </div>



        </div>
    </div>
</div>
