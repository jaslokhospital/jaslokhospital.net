<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SpecialtiesSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_SpecialtiesSkin" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Home/WriteToUs.ascx" TagPrefix="JS" TagName="WriteToUs" %>
<%@ Register Src="~/JSControls/Home/PhotoGallery.ascx" TagPrefix="JS" TagName="PhotoGallery" %>
<%@ Register Src="~/JSControls/Home/VideoGallery.ascx" TagPrefix="JS" TagName="VideoGallery" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register Src="~/JSControls/Home/HomePageBanner.ascx" TagName="HomePageBanner" TagPrefix="JS" %>

<div id="contentpaneHeader" runat="server"></div>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

            <asp:Image ID="imgbanner" ImageUrl="/Content/Banner/opd-web-banner-150216-20160215114721383.jpg" alt="opd web banner" class="img-div img-responsive" runat="server" />
        </div>
    </div>
</div>

<%--<div id="carousel-example-generic" class="carousel slide innercarosel" data-ride="carousel" data-interval="false">
    <ol class="carousel-indicators">
        <asp:Repeater ID="rptPager" runat="server">
            <ItemTemplate>
                <li data-target="#carousel-example-generic" data-slide-to='<%# (Container.ItemIndex) %>' class='<%# (Container.ItemIndex == 0) ? "active" : ""%>'></li>
            </ItemTemplate>
        </asp:Repeater>
    </ol>
    <div class="carousel-inner" role="listbox">
        <asp:Repeater ID="rptHomePagebanner" runat="server">
            <ItemTemplate>
                <%-- <div class="item">
                <div class='<%#Container.ItemIndex==0?"item active":"item"%>'>
                    <img class="second-slide" src='<%#Eval("ImageUrl")%>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>--%>

<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right">--%>
<div class="row">
    <div class="container containerspace">
        <ul class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a id="rootbreadcrumb" runat="server" class="active" href="/specialties"><span id="MainRoot" runat="server">Specialties</span></a></li>
            <li class="active" id="Subrootbreadcrumb" runat="server" visible="false" ><a id="SubRootAnchor" class="active" href="javascript:void(0);"><span id="SubRootSpan" runat="server"> </span></a></li>
        </ul>
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part">

                <div id="divmMedical" class="about_dept" style="cursor: pointer; margin-top: " onclick="openSISPanel('Medical')"><b>Medical Specialties</b> <i class="fa fa-chevron-right"></i></div>
                 <div id="divPatient" class="doc_attendence" style="cursor: pointer" onclick="openSISPanel('Patient')"><b>Patient Facilities</b> <i class="fa fa-chevron-right"></i></div>
                <div id="divSpecialty" class="doc_attendence" style="cursor: pointer; margin-bottom:20px;" onclick="openSISPanel('Specialty')"><b>Specialty Clinics</b> <i class="fa fa-chevron-right"></i></div>
               

                <div class="left_form  visible-lg visible-md  visible-sm hidden-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment" />
                </div>
            </div>
        </div>
        <div id="contentpane" runat="server"></div>

        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part specialty_header">

                <%--<h3 id="h3header" class="desk" runat="server">Medical <span class='desk1'>Specialties</span></h3> --%>
                <h3 id="h3header" runat="server" style="padding: 10px 0;">Medical Specialties</h3> 
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div id="Div1" runat="server">
                    <p id="innerParagraph" runat="server"></p>
                </div>
                <div class="row row-spacing">
                    <asp:Panel ID="pnlMedicalSISkinPane" runat="server">

                        <asp:Repeater ID="datalistSpecialtySkin" runat="server">
                            <ItemTemplate>


                                <div class="col-md-4 col-sm-6 col-xs-12 col-spacing ">
                                    <div class="speciality-icons equal">
                                        <a id="A3" href='<%#"/specialties/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("SpecialtyName"))) +"/"+ Eval("SpecialtyId")%>' runat="server">
                                           <%--<img alt='<%# Eval("SpecialtyName") %>' src='<%#!string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl")))?Eval("ImageUrl"):"../../../../Content/SpecialtiesGallery/default-img.png"%>'/>--%>
                                            <i class='<%#!string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl")))?"sprite sprite-"+System.IO.Path.GetFileNameWithoutExtension(Convert.ToString(Eval("ImageUrl"))).Replace('&','_').Replace('(','_').Replace(')','_').Replace('/','_'):"sprite sprite-default-img"%>'></i>
                                           <%--<div class='<%#"specialties specialties-" + Eval("SpecialtyAliasName")%>' style="float:left"></div>--%>
                                           <span> <%#Eval("SpecialtyName")%></span>
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </asp:Panel>
                    <asp:Panel ID="PnlPatientSISP" runat="server" Style="display: none">

                        <asp:Repeater ID="datalistPnlPatientSISP" runat="server">
                            <ItemTemplate>

                                <div class="col-md-4 col-sm-6 col-xs-12 col-spacing">
                                    <div class="speciality-icons" style="height:50px">
										<a id="A3" href='<%# (Eval("SpecialtyID").ToString() == "33") ? "/specialitywise-opd" : "/specialties"+"/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("SpecialtyName")))+"/" + Eval("SpecialtyId") %>' runat="server">
                                        <%-- <img alt='<%# Eval("SpecialtyName") %>' src='<%#!string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl")))?Eval("ImageUrl"):"../../../../Content/SpecialtiesGallery/default-img.png"%>'/>--%>
                                            <i class='<%#!string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl")))?"sprite sprite-"+System.IO.Path.GetFileNameWithoutExtension(Convert.ToString(Eval("ImageUrl"))).Replace('&','_').Replace('(','_').Replace(')','_').Replace('/','_'):"sprite sprite-default-img"%>'></i>
                                             <%-- <div class='<%#"specialties specialties-" + Eval("SpecialtyAliasName")%>' style="float:left"></div>--%>
                                            <span><%#Eval("SpecialtyName")%></span>
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </asp:Panel>
                    <asp:Panel ID="PnlSpecialitySISP" runat="server" Style="display: none">

                        <asp:Repeater ID="datalistPnlSpecialitySISP" runat="server">
                            <ItemTemplate>

                                <div class="col-md-4 col-sm-6 col-xs-12 col-spacing ">
                                    <div class="speciality-icons equal">
                                        <a id="A3" href='<%#"/specialties"+"/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("SpecialtyName")))+"/" + Eval("SpecialtyId")%>' runat="server">
                                            <%--<img alt='<%# Eval("SpecialtyName") %>' src='<%#!string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl")))?Eval("ImageUrl"):"../../../../Content/SpecialtiesGallery/default-img.png"%>'/>--%>
                                            <i class='<%#!string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl")))?"sprite sprite-"+System.IO.Path.GetFileNameWithoutExtension(Convert.ToString(Eval("ImageUrl"))).Replace('&','_').Replace('(','_').Replace(')','_').Replace('/','_'):"sprite sprite-default-img"%>'></i>
                                           <%--<div class='<%#"specialties specialties-" + Eval("SpecialtyAliasName")%>' style="float:left"></div>--%>
                                            <span> <%#Eval("SpecialtyName")%></span>
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </asp:Panel>
                    
                </div>
                
            </div>


        </div>
        <div class="left_form hidden-lg visible-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />
                </div>
    </div>
</div>

<JS:Testimonials runat="server" ID="Testimonials" />
<JS:Footer runat="server" ID="Footer" />

<script type="text/javascript">
 //   var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
 //    var keyCode = e.which ? e.which : e.keyCode
 //    var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
 //}

    $(window).load(function () {
        equalheight('.equal');
        
        if (window.location.href.includes("#") && window.location.href.includes("/specialties")) {
            var type = window.window.location.href.split('#')[1];
            openSISPanel(type)
        }
    });


    $(window).resize(function () {
        equalheight('.equal');
    });

    equalheight = function (container) {

        var currentTallest = 0,
             currentRowStart = 0,
             rowDivs = new Array(),
             $el,
             topPosition = 0;
        $(container).each(function () {

            $el = $(this);
            $($el).height('auto')
            topPostion = $el.position().top;

            if (currentRowStart != topPostion) {
                for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
                    rowDivs[currentDiv].height(currentTallest);
                }
                rowDivs.length = 0; // empty the array
                currentRowStart = topPostion;
                currentTallest = $el.height();
                rowDivs.push($el);
            } else {
                rowDivs.push($el);
                currentTallest = (currentTallest < $el.height()) ? ($el.height()) : (currentTallest);
            }
            
            for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
                rowDivs[currentDiv].height(currentTallest);
            }
        });
    }



    function openSISPanel(val) {
        document.getElementById('<%=pnlMedicalSISkinPane.ClientID%>').style.display = 'none';
        document.getElementById('<%=PnlSpecialitySISP.ClientID%>').style.display = 'none';
        document.getElementById('<%=PnlPatientSISP.ClientID%>').style.display = 'none';

        document.getElementById('divmMedical').className = 'doc_attendence';
        document.getElementById('divSpecialty').className = 'doc_attendence';
        document.getElementById('divPatient').className = 'doc_attendence';

        if (val == 'Medical') {
            
            document.getElementById('<%=pnlMedicalSISkinPane.ClientID%>').style.display = 'block';
			document.getElementById('<%=h3header.ClientID%>').innerHTML = "Medical Specialties";
            document.getElementById('divmMedical').className = 'about_dept';
            equalheight('.equal');
        }
        else if (val == 'Specialty') {
            
            document.getElementById('<%=PnlSpecialitySISP.ClientID%>').style.display = 'block';
			document.getElementById('<%=h3header.ClientID%>').innerHTML = "Specialty Clinics";
            document.getElementById('divSpecialty').className = 'about_dept';
            equalheight('.equal');
        }
        else if (val == 'Patient') {
            
            document.getElementById('<%=PnlPatientSISP.ClientID%>').style.display = 'block';
			document.getElementById('<%=h3header.ClientID%>').innerHTML = "Patient Facilities";
            document.getElementById('divPatient').className = 'about_dept';
            equalheight('.equal');
        }
}
</script>