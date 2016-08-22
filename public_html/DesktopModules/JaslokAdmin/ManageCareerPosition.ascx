<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageCareerPosition.ascx.cs" Inherits="DotNetNuke.Modules.JaslokAdmin.ManageCareerPosition" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="Telerik.QuickStart" Namespace="Telerik.QuickStart" TagPrefix="telerik" %>--%>

<script type="text/javascript">
    Telerik.Web.UI.RadDatePicker.prototype._actionBeforeShowPopup_original = Telerik.Web.UI.RadDatePicker.prototype._actionBeforeShowPopup;
    Telerik.Web.UI.RadDatePicker.prototype._actionBeforeShowPopup = function () {
        this._actionBeforeShowPopup_original();
        if (Telerik.Web.UI.RadDateTimePicker) {
            Telerik.Web.UI.RadDateTimePicker.prototype._hideAllTimePopups();
        }
    }
</script>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
   <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
      

        <div class="form-horizontal">
              <asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">

            <div class="row">
            <div class="col-md-4">
                <label  for="PageTitle">Category Name:<span style="color: red">*</span></label>
              
                     <asp:DropDownList runat="server" ID="drpJobCategoryName" class="form-control">
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvJobCategoryName" runat="server" ErrorMessage="Please select job category" ControlToValidate="drpJobCategoryName" InitialValue="0"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator> 
               
            </div>
            <div class="col-md-4">
                <label  for="PageDescription">Position:<span style="color: red">*</span></label>
                
                   <asp:TextBox ID="txtPosition" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please Enter Position" ControlToValidate="txtPosition"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
               
            </div> 
            <div class="col-md-4">
                <label  for="PageTitle">ReportTo:</label>
              
                    <asp:TextBox ID="txtReportTo" runat="server" class="form-control"></asp:TextBox>
                
            </div> </div>
            <div class="row">
            <div class="col-md-4">
                <label for="PageTitle">Location:</label>
               
                     <asp:TextBox ID="txtLocation" runat="server" class="form-control"></asp:TextBox>
               
            </div>
            <div class="col-md-4">
                <label for="PageTitle">Total Vacant Position:</label>
               
                     <asp:TextBox ID="txtTotalVacantPosition" runat="server" class="form-control"></asp:TextBox>                     
                    <asp:RegularExpressionValidator ID="rexpTextOrdinal" runat="server" ControlToValidate="txtTotalVacantPosition" Display="Dynamic" ErrorMessage="Only numbers" 
                        ValidationExpression="^\d+$" style="font-size:10px; color: red;" ValidationGroup="JHCat"></asp:RegularExpressionValidator>                   
               
            </div>
            <div class="col-md-4">
                <label  for="PageTitle">Min Exp:<span style="color: red">*</span></label>
               
                     <asp:TextBox ID="txtMinExp" runat="server" class="form-control"></asp:TextBox>
                    <span style="font-size:10px;">(Enter in year)</span>  
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Min Exp" ControlToValidate="txtMinExp"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMinExp" Display="Dynamic" ErrorMessage="Only numbers" 
                        ValidationExpression="^\d+$" style="font-size:10px; color: red;" ValidationGroup="JHCat"></asp:RegularExpressionValidator>
                </div>
            </div>

             <div class="row">
            <div class="col-md-4">
                <label  for="PageTitle">Max Exp:</label>
                
                     <asp:TextBox ID="txtMaxExp" runat="server" class="form-control"></asp:TextBox>
                    <span style="font-size:10px;">(Enter in year)</span> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMaxExp" Display="Dynamic" ErrorMessage="Only numbers" 
                        ValidationExpression="^\d+$" style="font-size:10px; color: red;" ValidationGroup="JHCat"></asp:RegularExpressionValidator> 
             
            </div>
                    <div class="col-md-4">
                <label for="PageTitle">Expiry Date:</label>
               
                     <telerik:RadDateTimePicker ID="datetimepick" runat="server" class="form-control"></telerik:RadDateTimePicker>
              
            </div>
             <div class="col-md-4">
                <label for="PageTitle">Salary:</label>
               
                     <asp:TextBox ID="txtSalary" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row">
            <div class="col-md-6">
                <label for="PageTitle">Application Submitted At:</label>
               
                     <asp:TextBox ID="txtSubmittedAt" runat="server" class="form-control"></asp:TextBox>
              
            </div>
            <div class="col-md-6">
                <label  for="PageTitle">IsApproved:</label>
                
                     <asp:CheckBox ID="ckbIsApproved" runat="server" />
              
            </div></div>
           <div class="row">               
                 <div class="col-md-12">
                <label  for="PageTitle">Job Role:<span style="color: red">*</span></label>
             
                     <telerik:RadEditor runat="server" ID="conJob_Role" Width="100%">
                            <ImageManager ViewPaths="/Content" UploadPaths="/Content/SeminarGallery" DeletePaths="/Content/bks" />
                                    </telerik:RadEditor>
                        <asp:RequiredFieldValidator ID="rfvJob_Role" runat="server" ErrorMessage="Please Enter Job Role" ControlToValidate="conJob_Role"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">               
                 <div class="col-md-12">
                <label  for="PageTitle">Professional Requirement:</label>
             
                     <telerik:RadEditor runat="server" ID="conProfessionalRequirement" Width="100%">
                            <ImageManager ViewPaths="/Content" UploadPaths="/Content/SeminarGallery" DeletePaths="/Content/bks" />
                     </telerik:RadEditor>
                </div>
            </div>
           <div class="row">               
                 <div class="col-md-12">
                <label for="PageTitle">Education:<span style="color: red">*</span></label>
               
                     <telerik:RadEditor runat="server" ID="conEducation" Width="100%">
                            <ImageManager ViewPaths="/Content" UploadPaths="/Content/SeminarGallery" DeletePaths="/Content/bks" />
                                    </telerik:RadEditor>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Education" ControlToValidate="conEducation"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            
             <div class="row">
            <div class="col-md-12" style="text-align: center;">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="JHCat" OnClick="btnSubmit_Click" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />
                </div>
            </div>
          
                  </asp:PlaceHolder>

             <asp:PlaceHolder ID="plcView" runat="server">
                   <asp:Label ID="lblMessage" Visible="false" runat="server"/><br /><br />
                  <asp:Button ID="btnAddPosition" runat="server" Text="Add Career Positions" CssClass="btn btn-default" OnClick="btnAddPosition_Click"/><br /><br />
             <asp:Label ID="Label1" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger;"></asp:Label>
           
                  <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
            <asp:DataGrid ID="dgCareerPosition" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="JobId" OnItemCommand="dgCareerPosition_ItemCommand" OnPageIndexChanged="dgCareerPosition_PageIndexChanging" EmptyDataText="No records has been added.">

                 <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>
                    <asp:TemplateColumn HeaderText="Sl No">
                        <ItemTemplate>
                            <asp:Label ID="lblSlNo" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="Position" HeaderText="Position"></asp:BoundColumn>
                    <asp:BoundColumn DataField="FunctionName" HeaderText="Function Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="ReportTo" HeaderText="ReportTo" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Location" HeaderText="Location" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn DataField="TotalVacantPosition" HeaderText="TotalVacantPosition" Visible="false"></asp:BoundColumn>
                     <asp:BoundColumn DataField="MinExp" HeaderText="MinExp"></asp:BoundColumn>
                    <asp:BoundColumn DataField="MaxExp" HeaderText="Max Exp"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Job_Role" HeaderText="Role"></asp:BoundColumn>
                    <asp:BoundColumn DataField="ProfessionalRequirement" HeaderText="Professional Requirement"></asp:BoundColumn>
                     <asp:BoundColumn DataField="Education" HeaderText="Education" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn DataField="ExpiryDate" HeaderText="ExpiryDate" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Salary" HeaderText="Salary" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn DataField="SubmittedAt" HeaderText="SubmittedAt" Visible="false"></asp:BoundColumn>
                      <%--<asp:BoundColumn DataField="IsApproved" HeaderText="IsApproved"></asp:BoundColumn>--%>
                     <asp:TemplateColumn HeaderText="Active" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Literal ID="ltstatus" runat="server" Text='  <%# Convert.ToBoolean(Eval("IsApproved")) ? "Yes" : "No" %>'></asp:Literal>
                              
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Edit">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("JobId")%>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("JobId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
            </asp:DataGrid>
                 </asp:PlaceHolder>
        </div>
  
</div>
