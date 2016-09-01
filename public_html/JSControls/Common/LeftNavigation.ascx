<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LeftNavigation.ascx.cs" Inherits="JSControls_Common_LeftNavigation" %>

<!--<style>
    

    .left_part {
        padding-top: 0;
    }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("dropdown-menu").click(function(){
			$(".dropdown-menu li a").slideTogle();             
		});
	});
</script>-->

<!--<script>
$('#nav-drop').click(function(){
  if ( $('.bs-docs-sidenavr').css('visibility') == 'hidden' )
    $('.bs-docs-sidenavr').css('visibility','visible');
  else
    $('.bs-docs-sidenavr').css('visibility','hidden');
}); 
    </script>-->

<ul class="nav nav-list bs-docs-sidenav" id="nav-drop1" style="margin-bottom: 4%;">

    <asp:Repeater ID="rptMenus" runat="server" OnItemDataBound="rptMenus_ItemDataBound">
        <ItemTemplate>
            <li <asp:Literal ID="ltState" runat="server"></asp:Literal>> <a href='<%# Eval("MenuLink") %>'><i class="glyphicon glyphicon-chevron-right"></i><asp:Literal ID="ltMenuText" runat="server" Text='<%# Eval("MenuText") %>'></asp:Literal></a></li>
        </ItemTemplate>
    </asp:Repeater>
</ul>

<div class="dropdown">
    <div id="nav-drop" class="dropdown-toggle" data-toggle="dropdown"><a href="#">Select the Options</a>
    <span class="glyphicon glyphicon-chevron-down arrow" ></span></div>
    <ul class="dropdown-menu drop-menu">
        <asp:Repeater ID="rptMenusMobile" runat="server" >
        <ItemTemplate>
            <li <asp:Literal ID="ltStateMobile" runat="server">></asp:Literal><a href='<%# Eval("MenuLink") %>'><asp:Literal ID="ltMenuTextMobile" runat="server" Text='<%# Eval("MenuText") %>'></asp:Literal></a></li>
        </ItemTemplate>
    </asp:Repeater>
    </ul>
  </div>


        
<div id="divHelthCheckUp" runat="server" visible="false">
    <div id="divmMedical" class="doc_attendence" style="cursor: pointer" ><a href="/specialties#Medical"><b>Medical Specialities</b> <i class="fa fa-chevron-right"></i></a></div>
    <div id="divPatient" class="doc_attendence" style="cursor: pointer" ><a href="/specialties#Patient"><b>Patient Facilities</b> <i class="fa fa-chevron-right"></i></a></div>
    <div id="divSpecialty" class="doc_attendence" style="cursor: pointer"><a href="/specialties#Specialty"><b>Specialty Clinics</b> <i class="fa fa-chevron-right"></i></a></div>
</div>

 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <%--<script>
            $(document).ready(function () {
                $("#myBtn").click(function () {
                    $("#myModal").modal();
                });
            });
            jQuery(function ($) {
                $('.navbar .dropdown').hover(function () {
                    $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();

                }, function () {
                    $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp();

                });

                $('.navbar .dropdown > a').click(function () {
                    location.href = this.href;
                });

            });
        </script>--%>