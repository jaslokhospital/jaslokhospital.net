<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LeftPaneFindDoctor.ascx.cs" Inherits="JSControls_MiddleContent_LeftPaneFindDoctor" EnableViewState="true" ViewStateMode="Enabled" ClientIDMode="Static" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12">
<telerik:RadAjaxPanel ID="RadSearchPanel" LoadingPanelID="RadAjaxLoadingPanel1" runat="server" RestoreOriginalRenderDelegate="false">
    <div class="left_form finddoc_left_form finddoc">
        
		<div class="form-horizontal">
		
            <div class="form-group right_part">
                <h3 class="find dnn_h3header">Find a Doctor</h3>
            </div>
              
                    <div class="form-group">
                        <asp:DropDownList runat="server" ID="ddlSpecialtyLPD" OnSelectedIndexChanged="ddlSpecialtyLPD_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true" ViewStateMode="Enabled" class="form-control appoint_form">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList runat="server" ID="ddlDoctorLPD" class="form-control appoint_form">
                        </asp:DropDownList>
                    </div>
            
            <div class="form-group finddoc_pt97">
                <asp:LinkButton ID="btnSubmitLPFD" runat="server" class="btn btn_submit" OnClientClick="return ValHomeLPFD();" OnClick="btnSubmitLPFD_Click">Submit<i class="glyphicon glyphicon-chevron-right"></i></asp:LinkButton>
            </div>
        </div>

    </div>
		</telerik:RadAjaxPanel>
			<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30">
                    <div class="modal-dialog" style="vertical-align: middle; text-align: center; background-color: white;margin-top: 0px !important; height:100%; width:100%;">
                        <img alt="Loading..." src='/images/loading.gif' style="margin-top:1%;"/>
                    </div>
        </telerik:RadAjaxLoadingPanel>		
	</div>

<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
<%--<script type="text/javascript">
    function ValLPFD() {
        if (document.getElementById('<%=ddlDoctorLPD.ClientID%>').selectedIndex == 0) {
            alert("Please select Doctor");
            return false;
        }     
    }
</script>--%>
</telerik:RadCodeBlock>