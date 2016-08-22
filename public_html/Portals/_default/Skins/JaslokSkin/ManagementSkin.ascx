<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManagementSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_ManagementSkin" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Home/WriteToUs.ascx" TagPrefix="JS" TagName="WriteToUs" %>
<%@ Register Src="~/JSControls/Home/PhotoGallery.ascx" TagPrefix="JS" TagName="PhotoGallery" %>
<%@ Register Src="~/JSControls/Home/VideoGallery.ascx" TagPrefix="JS" TagName="VideoGallery" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>




<div id="contentpaneHeader" runat="server"></div>
    <!-----header end->

 <!-- Carousel    ================================================== -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="item active">
                 <asp:Image ID="imgbanner" runat="server" CssClass="img-div"  />
            </div>
        </div>
    </div>
</div>
<img src="images/icon.jpg" alt="Icon" class="icon-right">
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

             

                <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment" />

            </div>
        </div>







        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part">
                 <div id="divFeedbContent" runat="server"></div>
                 <div class="media">
                    <div class="media-left media-top col-sm-3 col-xs-12">
               
                           
                             
                                
                                

                          
                        </div>
                       <div class="media-body col-sm-9 col-xs-12">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <div id="contentpane" runat="server"></div>
                </div> </div></div>
        </div>








    </div>
</div>
 </div>


<JS:Testimonials runat="server" ID="Testimonials" />
<JS:Footer runat="server" ID="Footer" />
  
  