<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageJaslokTImes.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageJaslokTImes" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script>
    function getFileData(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= lblfileName.ClientID %>");
        lbl.innerHTML = filename;
    }
    function getPdfFile(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= lblfdfName.ClientID %>");
        lbl.innerHTML = filename;
    }
</script>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="form-horizontal">
             <asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">
             <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label  for="PageTitle">File Name:<span style="color: red">*</span></label> 
                </div>
                 <div class="col-md-6" style="text-align: left;">
                    <asp:TextBox ID="txtFriendlyName" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter file name" ControlToValidate="txtFriendlyName"
                        Display="Dynamic" ValidationGroup="JaslokTimes" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label  for="PageDescription">Thumbnail: <span style="color: red">*</span></label>   </div> 
                             <div class="col-md-6" style="text-align: left;">
                   <asp:FileUpload ID="fileUploadJaslokTimes" runat="server" onchange="getFileData(this);" Style="color: transparent;"/>
                   <p> <asp:Label ID="lblfileName" runat="server"/></p> 
                    <asp:RegularExpressionValidator ID="revFileUploadTOPIC" runat="server" ControlToValidate="fileUploadJaslokTimes"
                        Display="Dynamic" ForeColor="Red" ValidationGroup="JaslokTimes" ErrorMessage="Please upload image file only" ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([Jj][Pp][Ee][Gg])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvFileName" runat="server" ErrorMessage="Please upload thumbnail" ControlToValidate="fileUploadJaslokTimes"
                        Display="Dynamic" ValidationGroup="JaslokTimes" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                </div>
                 <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label  for="Pagepdf">Upload pdf: <span style="color: red">*</span></label>   </div> 
                             <div class="col-md-6" style="text-align: left;">
                    <asp:FileUpload ID="fileUploadpdf" runat="server" onchange="getPdfFile(this);" Style="color: transparent;"/>
                   <p>  <asp:Label ID="lblfdfName" runat="server"/> </p>
                    <asp:RegularExpressionValidator ID="revfileUploadpdf" runat="server" ControlToValidate="fileUploadpdf"
                        Display="Dynamic" ForeColor="Red" ValidationGroup="JaslokTimes" ErrorMessage="Please upload pdf file only" ValidationExpression="(.*\.([Pp][Dd][Ff])$)"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvfileUploadpdf" runat="server" ErrorMessage="Please select pdf" ControlToValidate="fileUploadpdf"
                        Display="Dynamic" ValidationGroup="JaslokTimes" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                </div>
                  <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label  for="redPageContent">Is Active:</label>
                 </div> 
                             <div class="col-md-6" style="text-align: left;">
                    <asp:CheckBox ID="chkFileActive" runat="server" /></div>
                </div>
            
           <div class="row">
               
               <div class="col-xs-12" style="text-align:center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="JaslokTimes" class="btn btn-primary2"/>&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />
                    <asp:HiddenField ID="hdnid" runat="server" Value="0" />
                    <asp:HiddenField ID="hdnFileName" runat="server" Value="" />
                    <asp:HiddenField ID="hdnFilePath" runat="server" Value="" />
                     <asp:HiddenField ID="hdnPdfPath" runat="server" Value="" />
                </div>
            </div>
         
                </asp:PlaceHolder>
             </div>


             <asp:PlaceHolder ID="plcView" runat="server">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label><br /><br />
                  <asp:Button ID="btnAddJaslokTimes" runat="server" Text="Add Jaslok Times" CssClass="btn btn-default" OnClick="btnAddJaslokTimes_Click" /><br /><br />
            
                    <asp:DataGrid ID="dgJHTimes" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="true" PageSize="10" CssClass="normaltable22user"
                DataKeyField="JaslokTimesId" OnItemCommand="dgJHTimes_ItemCommand">
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>
                    <asp:TemplateColumn HeaderText="File Name" ItemStyle-HorizontalAlign="Justify">
                        <ItemTemplate>
                            <asp:Label ID="lblFileName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FileFriendlyName") %>' Width="400px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <%--<asp:TemplateColumn HeaderText="Category Name">
                        <ItemTemplate>
                            <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CategoryName") %>' Width="400px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>       --%>
                   
                    <asp:TemplateColumn HeaderText="Active" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("IsActiveJaslokTimes")) ? "Yes" : "No" %>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Edit">
                        <ItemTemplate>
                            <asp:ImageButton CommandName="JTEdit" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.JaslokTimesId") %>' ImageUrl="/images/edit.gif" AlternateText="click here to Delete."
                                ID="ImageButton1"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>                            
                            <asp:ImageButton CommandName="JTDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.JaslokTimesId") %>' ImageUrl="/images/del.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <HeaderStyle BackColor="Silver" />
                <PagerStyle Mode="NumericPages" HorizontalAlign="Right" />
            </asp:DataGrid>
             </asp:PlaceHolder>
        
    
</div>





