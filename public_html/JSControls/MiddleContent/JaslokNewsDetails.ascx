<%@ Control Language="C#" AutoEventWireup="true" CodeFile="JaslokNewsDetails.ascx.cs" Inherits="JSControls_MiddleContent_JaslokNewsDetails" %>
<div class="modal-dialog modal-lg">
    <div class="modal-content press-release-content">
        <div class="modal-header">
            <h4 class="modal-title" runat="server" id="h4Title"></h4>
            
        </div>
        <div class="modal-body">
            <%--<div id="divNewsDate" runat="server"></div>--%>
            <p runat="server" id="pContents">
            </p>
            <p>
                <asp:Image runat="server" class="img-responsive" ID="imgTestimonial" Visible="false" />
            </p>
        </div>
        <div class="modal-footer">
        </div>
    </div>
</div>
