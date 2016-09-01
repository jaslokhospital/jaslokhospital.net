<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LeftPaneBookAppointment.ascx.cs" Inherits="JSControls_MiddleContent_LeftPaneBookAppointment" EnableViewState="true" ViewStateMode="Enabled" ClientIDMode="Static" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%--<style type="text/css">
    .table-condensed {
        display: none;
    }

    .riTextBox[type="text"] {
        font-family: 'Roboto' !important;
        font-weight: 300 !important;
        height: 40px !important;
        font-size: 15px !important;
        font-style: normal !important;
        border: 1px solid #ccc !important;
    }

    .RadPicker {
        width: 72% !important;
    }
    
    
</style>--%>



<div class="divBookApp_left_form">

    <telerik:RadAjaxPanel ID="RadSearchPanel" LoadingPanelID="RadAjaxLoadingPanel1" runat="server" RestoreOriginalRenderDelegate="false">
        <div class="form-horizontal">



            <div class="form-group right_part1">
                <h3 class="dnn_h3header">Book an Appointment</h3>
            </div>

            <div class="form-group">
                <asp:DropDownList CssClass="form-control appoint_form" runat="server" ID="ddlSpecialtyLPB" ValidationGroup="btnLPBA" AutoPostBack="true" OnSelectedIndexChanged="ddlSpecialtyLPB_SelectedIndexChanged" EnableViewState="true" ViewStateMode="Enabled">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:DropDownList class="form-control appoint_form app_doctor" ValidationGroup="btnLPBA" data-select-validator="app_doctor" runat="server" ID="ddlDoctorLPBA" AutoPostBack="true" OnSelectedIndexChanged="ddlDoctorLPBA_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="form-group">

                <asp:DropDownList class="form-control appoint_form app_doctor" ValidationGroup="btnLPBA" runat="server" ID="ddlDay">
                    <asp:ListItem Text="Select Day" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:LinkButton ID="tbnLPBAppointment" runat="server" ValidationGroup="btnLPBA" class="btn btn_submit" OnClientClick="return ValidationLPBA()" OnClick="tbnLPBAppointment_Click">Submit<i class="glyphicon glyphicon-chevron-right"></i></asp:LinkButton>
            </div>





        </div>
    </telerik:RadAjaxPanel>
</div>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30">
    <div class="modal-dialog" style="vertical-align: middle; text-align: center; background-color: white; margin-top: 0px !important; height: 100%; width: 100%;">
        <img alt="Loading..." src='/images/loading.gif' style="margin-top: 1%;" />
    </div>
</telerik:RadAjaxLoadingPanel>

<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
<%--<script type="text/javascript">
    function Val() {
        if ($(".app_doctor option:selected").index() > 0)
            return true;
        else if ($("#dnn_LeftPaneBookAppointment_ddlDoctorLPBA option:selected").index() > 0)
            return true;
        else if ($("#dnn_LeftPaneBookAppointment1_ddlDoctorLPBA option:selected").index() > 0)
            return true;
        else {
            alert("Please select doctor name");
            return false;
        }
    }
</script>--%>
</telerik:RadCodeBlock>