<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ApplySeminar.ascx.cs" Inherits="JSControls_MiddleContent_ApplySeminar" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="right_part">
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="form-horizontal">

            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Seminar Title:</label>
                <div class="col-xs-9">
                    <asp:Label ID="lblSeminarTitle" runat="server"></asp:Label>

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Name:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                   <asp:TextBox ID="txtUserName" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDateOfSeminar" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="txtUserName"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Graduate:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                      <asp:TextBox ID="txtGraduates" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvGraduates" runat="server" ErrorMessage="*" ControlToValidate="txtGraduates"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>           
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Institution:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtInstitution" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInstitution" runat="server" ErrorMessage="Please Enter Institution" ControlToValidate="txtInstitution"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Address:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtAddress" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Phone No:</label>
                <div class="col-xs-9">                   
                   <asp:TextBox ID="txtPhone" runat="server" class="form-control" MaxLength="10" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtContact" runat="server" ErrorMessage="Please Enter Phone" ControlToValidate="txtPhone"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter 10 digit number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Mobile:</label>
                <div class="col-xs-9">                   
                   <asp:TextBox ID="txtMobile" runat="server" class="form-control" MaxLength="10" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Mobile Number" ControlToValidate="txtMobile"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter 10 digit number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Fax:</label>
                <div class="col-xs-9">                   
                   <asp:TextBox ID="txtFax" runat="server" class="form-control" MaxLength="10" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return false;"></asp:TextBox>                       
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtFax" ErrorMessage="Enter 10 digit number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Email:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="MU" ErrorMessage="Please Enter Email ID"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="MU" ControlToValidate="txtEmail" CssClass="requiredFieldValidateStyle"
                            ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                </div>
            </div>
            
             <div class="form-group">
               <label class="control-label col-xs-3" for=""></label>
                <div class="col-xs-9">

                    <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="MU" OnClick="btnSubmit_Click" />&nbsp;&nbsp;&nbsp;&nbsp
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />    

                </div>
            </div>
            <asp:Label ID="lblMessage" Visible="false"  runat="server"/>
        </div>
    </div>
</div>