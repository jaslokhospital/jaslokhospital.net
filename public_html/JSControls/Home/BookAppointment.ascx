<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookAppointment.ascx.cs" Inherits="JSControls_Home_BookAppointment" EnableViewState="true" ViewStateMode="Enabled" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<style>
.btn-widget-container {margin:0;}
/*.btn-widget a.green-lg	{background: #fff;
    color: #e04c56;
    font-family: 'Roboto';
    font-weight: 500;
    font-size: 16px;
    text-transform: uppercase;
    cursor: pointer;}
a.green-lg span{
    display: block;
    position: absolute;
    top: 20%;
    left: 18%;
}
a.green-lg:hover{background:#d39caf; color:#fff;}*/
</style>

<div class="row top">
    <telerik:RadAjaxPanel ID="RadSearchPanel" LoadingPanelID="RadAjaxLoadingPanel1" runat="server" RestoreOriginalRenderDelegate="false">
    <div class="container">
        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
            <div class="book-now" style="text-align:center;">
<script type="text/javascript">
	!function(){
		var d = new Date();
		var n = d.getTime();
		var e=document.createElement("script");
		e.type="text/javascript",e.src="https://www.qikwell.com/qikwell-widget.js?"+n,document.getElementsByTagName("head")[0].appendChild(e);
	}();
//setTimeout(function(){$("a.green-lg").append("<span>Book Appointment</span>")}, "1000");
</script>
<a id="qikwell-widget-container" data-widget-id="e990c7ef-f1c0-4036-8b49-720f77d31fbd" data-sub-source="1" name="qikwell-widget-container" data-entity-type="clinic" data-entity-id="c78e8bf6-78ba-4e5b-87dc-e4efd5079ac9" >
Book Appointment at Jaslok Hospital and Research Centre,Peddar Road,Mumbai</a>
<div style="display:none;">
                        <div class="bookappointmentie">
                        <asp:DropDownList CssClass="sort-by col-md-3" runat="server" ID="ddlSpecialtyB" OnSelectedIndexChanged="ddlSpecialtyB_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true" ViewStateMode="Enabled">
                        </asp:DropDownList>
                            </div>
                        <div class="bookappointmentie">
                        <asp:DropDownList class="sort-by col-md-3" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDoctor_SelectedIndexChanged" ID="ddlDoctor">
                        </asp:DropDownList>
                            </div>
                            
               
                        <div class="bookappointmentie">
                        <asp:DropDownList class="sort-by col-md-3" runat="server" ID="ddlDay">
                            <asp:ListItem Text="Select Day" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                            </div>
                        <asp:Button ID="tbnHBAppointment" runat="server" Text="BOOK NOW" class="btn col-md-1" OnClick="tbnHBAppointment_Click"  ValidationGroup="grpBAdoctor" /> 
                <div class="bookappointmentie">
                             <asp:RequiredFieldValidator ID="refDoctor" runat="server" class="col-md-2" ControlToValidate="ddlDoctor" Font-Size="15px" ToolTip="Please select doctor" ErrorMessage="Please select doctor" ForeColor="red" InitialValue="0" ValidationGroup="grpBAdoctor" ></asp:RequiredFieldValidator>
                        </div>
                      <%--   <asp:RequiredFieldValidator ID="rfvd" runat="server" ErrorMessage="Please Enter date" ControlToValidate="txtdatetime"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>  --%>
                   

                <%--  <button class="btn">BOOK NOW</button>--%>
</div>
            </div>
        </div>
    </div>
    </telerik:RadAjaxPanel>
</div>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30">
                    <div class="modal-dialog" style="vertical-align: middle; text-align: center; background-color: white;margin-top: 0px !important; height:100%; width:100%;">
                        <img alt="Loading..." src='/images/loading.gif' style="margin-top:1%;"/>
                    </div>
                </telerik:RadAjaxLoadingPanel>
<telerik:RadCodeBlock ID="jv001" runat="server">
<%--<script type="text/javascript">
    function ValHBA() {
        if (document.getElementById('<%=ddlDoctor.ClientID%>').selectedIndex == 0) {
            alert("Please select Doctor Name!");
            return false;
        }
        else {
            document.forms[0].target = "_blank";
        }
    }
</script>--%>
</telerik:RadCodeBlock>



