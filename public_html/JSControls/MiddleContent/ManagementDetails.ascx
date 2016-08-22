<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManagementDetails.ascx.cs" Inherits="JSControls_MiddleContent_ManagementDetails" %>
<div class="media">
    <div class="media-left media-top col-sm-3 col-xs-12 mgt-bg-space">
        <a data-toggle="collapse" data-parent="#accordion" href="#media-collapse-1" aria-expanded="true" aria-controls="media-collapse-1">
            <asp:Image ID="imgProfile" runat="server" class="media-object media-border img-responsive profile-bg" ImageUrl='<%#Eval("ImageUrl")%>' />
        </a>
    </div>
    <div class="media-body col-sm-9 col-xs-12 managemant-bg mgt-info-space">
        <footer class="panel-footer ft-space">
           <%-- <img src="../../images/Dicon.png" />--%>
            <span runat="server" id="FindDName" class="s-bold"><%#Eval("Name")%>'</span>
            <span runat="server" class="s-regular" id="lblDoctorDesignation"><%#Eval("Designation")%></span>
        </footer>
        <%--<div class="panel-body">
            <%#Eval("Title")%>
        </div>--%>
        <div class="bs-example scopeofservices">
            <div class="panel-group" id="">
                <%--<div class="panel panel-default panel-brder">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="active">
                                <h4>Designation</h4>
                            </a>
                        </div>
                    </div>
                    <div id="" class="panel-collapse collapse in" style="padding-top:10px;">
                        <div class="panel-body managemant-bg panel-brder-lt">
                            <p runat="server" id="pbodyDesignation"><%#Eval("Designation")%></p>
                        </div>
                    </div>
                </div>--%>
                <div class="panel panel-default panel-brder">
                    <%--<div class="panel-heading">
                        <div class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                <h4>Description</h4>
                            </a>
                        </div>
                    </div>--%>
                    <div id="" class="panel-collapse collapse in">
                        <div class="panel-body managemant-bg panel-brder-lt" style="padding:20px 20px 10px !important;">
                             <p id="pbodyDescription" runat="server"><%#Eval("Description")%></p>
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
    </div>
</div>

<%--<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/jquery-1.9.1.min.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        
        $('.collapse').on('shown.bs.collapse', function () {
            alert("hi");
    $(this).parent().find(".fa-chevron-right").removeClass("fa-chevron-right").addClass("fa-chevron-down");
}).on('hidden.bs.collapse', function () {
    $(this).parent().find(".fa-chevron-down").removeClass("fa-chevron-down").addClass("fa-chevron-right");
});
    });    </script>--%>
