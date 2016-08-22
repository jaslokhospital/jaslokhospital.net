<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HomePageSlider.ascx.cs" EnableViewState="false" Inherits="JSControls_Home_HomePageSlider" %>

<div class="col-md-8 col-sm-8 col-xs-12">
    <div class="demo">
        <div class="item">
            <ul id="image-gallery" class="gallery list-unstyled cS-hidden clearfix h100">          
                <asp:Repeater ID="rptHomeSlide" runat="server">
                     <ItemTemplate>
                    <li data-thumb="" class="team-grids"><a href='<%#Eval("RedirectLink")%>'>
                        <img alt='<%#Eval("ImageAlternateText")%>' title='<%#Eval("Title")%>' class="facility_slidr"  src='<%#Eval("ImageUrl")%>'/>
                        <div class="captn">
                            <h4><%#Eval("Title")%></h4>
                           <span class="btn know_more">KNOW MORE ></span>
                        </div>
                    </a></li>
                    </ItemTemplate> 
                </asp:Repeater>
                 <%--<li data-thumb="" class="team-grids"><a href="/corporate-profile/hospital-facilities">
                        <img class="img-responsive" alt="Hospital Facilities" title="Hospital Facilities" class="facility_slidr"  src="/Content/HomeSliderGallery/Hospital-Facilities.jpg"/>
                        <div class="captn">
                            <h4>Hospital Facilities</h4>
                           <span class="btn know_more">KNOW MORE ></span>
                        </div>
                    </a></li>
                 <li data-thumb="" class="team-grids"><a href="/technological-milestone">
                        <img class="img-responsive" alt="Technological Milestone" title="Technological Milestone" class="facility_slidr"  src="/Content/HomeSliderGallery/Technological-Milestone.jpg"/>
                        <div class="captn">
                            <h4>Technological Milestone</h4>
                           <span class="btn know_more">KNOW MORE ></span>
                        </div>
                    </a></li>
                 <li data-thumb="" class="team-grids"><a href="/specialties/health-check-up">
                        <img class="img-responsive" alt="Health checkup Plans" title="Health checkup Plans" class="facility_slidr"  src="/Content/HomeSliderGallery/Health-Checkup-Plans.jpg"/>
                        <div class="captn">
                            <h4>Health checkup Plans</h4>
                           <span class="btn know_more">KNOW MORE ></span>
                        </div>
                    </a></li>
                 <li data-thumb="" class="team-grids"><a href="/education-and-research/health-tips">
                        <img class="img-responsive" alt="Health Tips" title="Health Tips" class="facility_slidr"  src="/Content/HomeSliderGallery/health_tips__.png"/>
                        <div class="captn">
                            <h4 class="health">Health Tips</h4>
                           <span class="btn know_more" id="know-health">KNOW MORE ></span>
                        </div>
                    </a></li>--%>
            </ul>
        </div>
    </div>
</div>




