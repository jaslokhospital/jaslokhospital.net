<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageDoctor.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageDoctor" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
   
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="form-horizontal">
              <asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">
            
            <div class="row">
            <div class="col-md-4">
                <label for="">Name: <span style="color: red">*</span></label>
               
                    <%-- <input type="text"  id="Name" placeholder="Name">--%>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="txtName"
                        Display="Dynamic" ValidationGroup="MT" ForeColor="Red"></asp:RequiredFieldValidator>

               
            </div>
            <%--  <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Title: <span style="color: red">*</span></label>
                <div class="col-xs-9">
                    <input type="text"  id="Name" placeholder="Name">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Title" ControlToValidate="txtTitle"
                        Display="Dynamic" ValidationGroup="MT" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            </div>--%>
             <div class="col-md-4">
                <label  for="PageDescription">Designation: </label>
               
                    <%-- <input type="text"  id="Name" placeholder="Name">--%>
                    <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control"></asp:TextBox>
              
            </div>
            <%-- <div class="form-group">
                <label class="control-label col-xs-3" for="PageKeyword">Specialization: <span style="color: red">*</span></label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Specialization" ControlToValidate="txtSpecialization"
                        Display="Dynamic" ValidationGroup="MT" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>--%>
                 <div class="col-md-4">
               <label for="redPageContent">Email Id: <span style="color: #ff0000; font-size: 13px">*</span></label>
               
                           <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="MT" ErrorMessage="Please Enter Email ID"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="MT" ControlToValidate="txtEmail"
                        ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
              
            </div></div>

                    <div class="row">
            <div class="col-md-4">
                <label for="redPageContent">Mobile Number <span style="color: #ff0000; font-size: 13px">*</span></label>
               
                    <asp:TextBox ID="txtMob" runat="server" CssClass="form-control" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return ture;" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvmob" ControlToValidate="txtMob" runat="server" ForeColor="Red" Display="Dynamic" MaxLength="10" ValidationGroup="MT" ErrorMessage="Please Enter Mobile Number"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rgvMob" MinimumValue="1000000000" Type="Double" MaximumValue="9999999999" Display="Dynamic" ControlToValidate="txtMob" runat="server" ForeColor="Red" ValidationGroup="MT" ErrorMessage="Please Enter valid Mobile Number"></asp:RangeValidator>
               
            </div>
            <div class="col-md-4">
                <label for="redPageContent">Phone Number:</label>
               
                    <asp:TextBox ID="txtPhn" runat="server" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return ture;" CssClass="form-control" MaxLength="20"></asp:TextBox>
                    <%--  <asp:RangeValidator ID="rgvPhoneNumber" runat="server" ControlToValidate="txtPhn" Type="Double" ForeColor="Red" MinimumValue="0" ErrorMessage="Please enter valid phone number" ValidationGroup="MT"></asp:RangeValidator> 
                    --%>
                </div>
          
            <div class="col-md-4">
                <label for="redPageContent">Image:</label>
              
                    <asp:FileUpload ID="UploadImages" runat="server" onchange="getFileData(this);" Style="color: transparent;" />
                    <asp:Label ID="listofuploadedfiles" runat="server" />
                    <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="UploadImages" ForeColor="Red" ValidationGroup="MU" ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg"
                        ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>

            </div></div>

           <div class="row">
            <div class="col-md-12">
                <label  for="redPageContent">Area of expertise:</label>
                
                    <telerik:RadEditor runat="server" ID="redoctor" Width="100%">
                        <ImageManager ViewPaths="/Content" UploadPaths="/Content/EditorUpload" DeletePaths="/Content/bks" />
                    </telerik:RadEditor>
                  </div>    
                </div>
            
            <div class="row">
            <div class="col-md-12">
                <label for="redPageContent">Brief write up:</label>
               
                    <telerik:RadEditor runat="server" ID="redBriefWriteUp" Width="100%">
                        <ImageManager ViewPaths="/Content" UploadPaths="/Content/EditorUpload" DeletePaths="/Content/bks" />
                    </telerik:RadEditor>

                </div>
            </div>
           <div class="row">
            <div class="col-md-12">
                <label for="redPageContent">Awards/Fellowship:</label>
                
                    <telerik:RadEditor runat="server" ID="redAwards" Width="100%">
                        <ImageManager ViewPaths="/Content" UploadPaths="/Content/EditorUpload" DeletePaths="/Content/bks" />
                    </telerik:RadEditor>

                </div>
            </div>


           
           


           <div class="row">
            <div class="col-md-12">
                <asp:UpdatePanel ID="upSpecialtyList" runat="server">
                    <ContentTemplate>
                        <div class="row">
                         
                            <div class="col-xs-6">
                                   <label for="PageTitle">Available Specialty</label>
                                <asp:ListBox ID="listspecialityAvl" runat="server" SelectionMode="Multiple" class="form-control" Style="height: 200px;" Width="100%">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                </asp:ListBox>
                            </div>

                             <div class="col-xs-6">
                                  <label for="PageTitle">Added Specialty</label>
                                <asp:ListBox ID="listspecialitySel" runat="server" SelectionMode="Multiple" class="form-control" Style="height: 200px;" Width="100%"></asp:ListBox>
                            </div>
                        </div>
                        <div class="row" >
                           
                            <div class="col-xs-12" style="text-align:center;">
                                <asp:Button ID="btnAddMedicine" class="btn newbnt btn-primary2" runat="server" OnClick="btnAddSpecialty_Click" Text="Add" />
                                <asp:Button ID="btnAddAll" class="btn newbnt btn-primary2" runat="server" OnClick="btnAddAll_Click" Text="Add All" />
                                <asp:Button ID="btnRemove" class="btn newbnt btn-primary2" runat="server" OnClick="btnRemove_Click" Text="Remove" />
                                <asp:Button ID="btnRemoveAll" class="btn newbnt btn-primary2" runat="server" OnClick="btnRemoveAll_Click" Text="Remove All" /><br />
                            </div>
                        </div>
                        <div class="row" >
                            <div class="col-xs-12"><hr style="height:1px;" /></div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div> </div>
            <div class="row">
            <div class="col-md-12" style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="MT" OnClick="btnSubmit_Click" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />

                </div>
            </div>
           </asp:PlaceHolder>

             <asp:PlaceHolder ID="plcView" runat="server">
        <asp:Label ID="lblMessage" Visible="false" runat="server" />
                 
            <div class="form-group">
                 <asp:Button ID="btnAddDoctor" runat="server" Text="Add Doctor" CssClass="btn btn-default" OnClick="btnAddJaslokTimes_Click" /><br /><br />
            
                    <div class="row" style="text-align:center;">
                        <div class="col-md-10"><asp:TextBox ID="txtSearchDoctor" CssClass="form-control" runat="server" Style="float: left;"></asp:TextBox></div>
                        <div class="col-md-2" style="text-align:left;"><asp:Button ID="btnSearch" runat="server" Text="Search Doctor" OnClick="btnSearch_Click" CssClass="btn btn-default" /></div>
                    </div>
                <br />
                <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger;"></asp:Label>
                <asp:DataGrid ID="dgDoctor" runat="server" AutoGenerateColumns="False" PageSize="10" AllowPaging="true" Width="100%"
                    DataKeyField="DoctorId" OnItemCommand="dgDoctor_ItemCommand" OnPageIndexChanged="dgDoctor_PageIndexChanging">

                    <HeaderStyle Wrap="False" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                        Mode="NumericPages" />
                    <Columns>      
                         <asp:TemplateColumn HeaderText="Photo" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <%-- <asp:Image ID="ImageDoctor" ImageUrl='<%#"~"+Eval("ImageUrl") %>' runat="server" Width="100px" Height="100px" />--%>
                                <asp:Image ID="ImageDoctor" ImageUrl='<%#!string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl")))?"~"+Eval("ImageUrl"):"/images/no_avatar.gif" %>' runat="server" Height="50px" />
                            </ItemTemplate>
                        </asp:TemplateColumn>                 
                        <asp:BoundColumn DataField="Name" HeaderText="Name" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
                        <%--<asp:BoundColumn DataField="Title" HeaderText="Title"></asp:BoundColumn>--%>
                        <asp:BoundColumn DataField="Designation" HeaderText="Designation"></asp:BoundColumn>
                        <%-- <asp:BoundColumn DataField="Specialization" HeaderText="Specialization"></asp:BoundColumn>--%>

                        <asp:BoundColumn DataField="EmailId" HeaderText="EmailId"></asp:BoundColumn>
                        <asp:BoundColumn DataField="MobileNo" HeaderText="MobileNo"></asp:BoundColumn>
                      <%--  <asp:BoundColumn DataField="PhoneNo" HeaderText="PhoneNo"></asp:BoundColumn>--%>
                        <%-- <asp:BoundColumn DataField="ImageUrl" HeaderText="ImageUrl"></asp:BoundColumn>--%>
                       
                        <asp:TemplateColumn HeaderText="Edit">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("DoctorId") %>' AlternateText="click here to edit."
                                    ID="imgbtnEdit"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Delete">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("DoctorId") %>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                                    ID="ImagebtnDelete"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                    <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                    <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                        Mode="NumericPages" CssClass="normaltableheadercelluser" />

                </asp:DataGrid>
                <asp:HiddenField ID="hdnImagePath" runat="server" />
            </div>
                 </asp:PlaceHolder>
        </div>
   
</div>



<script>
    function getFileData(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= listofuploadedfiles.ClientID %>");

        lbl.innerHTML = filename;

    }
</script>
<style>
    .newbnt {
        margin-bottom: 5px !important;
    }
    .right_part .row {
        margin-top: 0;
    }
</style>
<script type="text/javascript"> var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
     var keyCode = e.which ? e.which : e.keyCode
     var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
 } </script>
