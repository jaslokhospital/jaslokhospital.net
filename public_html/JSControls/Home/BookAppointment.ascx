<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookAppointment.ascx.cs" Inherits="JSControls_Home_BookAppointment" EnableViewState="true" ViewStateMode="Enabled" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<style>
    .datetimepicker-minutes .table-condensed td, .datetimepicker-hours .table-condensed td, .datetimepicker-days  .table-condensed td{font-size:12px !important; } 
</style>--%>

<div class="row top">
    <telerik:RadAjaxPanel ID="RadSearchPanel" LoadingPanelID="RadAjaxLoadingPanel1" runat="server" RestoreOriginalRenderDelegate="false">
    <div class="container">
        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
            <div class="book-now">
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



