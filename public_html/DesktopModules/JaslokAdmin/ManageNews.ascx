<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageNews.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageNews" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<script>
    function getFileData(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= listofuploadedfiles.ClientID %>");
        lbl.innerHTML = filename;
    }
</script>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
   
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
           <asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">
        <div class="form-horizontal">
           
            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label  for="Name">Title:<span style="color: red">*</span></label>
                     </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:TextBox ID="txtNewsTitle" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please Enter News Title" ControlToValidate="txtNewsTitle"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            </div>
            <div class="row" style="width: 80%">
                 <div class="col-md-6" style="text-align: right;">
                <label for="PageTitle">Date:<span style="color: red">*</span></label></div>
                  <div class="col-md-6" style="text-align: left;">
                    <telerik:RadDatePicker runat="server" ID="txtNewsDate" class="form-control" Width="250px"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select News Date" ControlToValidate="txtNewsDate"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
           <%-- <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">News Content:</label>
                <div class="col-xs-9">
                    <telerik:RadEditor runat="server" ID="txtNewsContent" class="form-control">
                        <ImageManager ViewPaths="/Content" UploadPaths="/Content/EditorUpload" DeletePaths="/Content/bks" />
                    </telerik:RadEditor>

                </div>
            </div>--%>
            <div class="row" style="width: 80%">
                 <div class="col-md-6" style="text-align: right;">
                <label for="">Thumbnail Image:</label></div>
                  <div class="col-md-6" style="text-align: left;">
                    <asp:FileUpload ID="UploadImages" runat="server" onchange="getFileData(this);" Style="color: transparent;" />
                      <asp:Label ID="listofuploadedfiles" runat="server" />
                    <asp:HiddenField ID="hdnThumbnail" runat="server" Value="" />
                    <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="UploadImages" Display="Dynamic" ForeColor="Red" ValidationGroup="MT" ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg"
                        ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][eE][Gg])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                  
                </div>
            </div>
            <div class="row" style="width: 80%">
                 <div class="col-md-6" style="text-align: right;">
                <label for="PageKeyword">Is Active:</label></div>
                  <div class="col-md-6" style="text-align: left;">
                    <asp:CheckBox ID="chkActive" runat="server" />
                </div>
            </div>


            <div class="row">
               
                <div class="col-xs-12" style="text-align:center">
                    <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="JHCat" OnClick="btnSubmit_Click" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />
                </div>
            </div>
          
        </div>
</asp:PlaceHolder>
      <asp:PlaceHolder ID="plcView" runat="server">
           <asp:Label ID="lblMessage" Visible="false" runat="server" /><br /><br />
           <asp:Button ID="btnAddHeltip" runat="server" Text="Add News" CssClass="btn btn-default" OnClick="btnAddHeltip_Click" /><br /><br />
             <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger;"></asp:Label>
            <asp:DataGrid ID="dgNews" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="NewsId" OnItemCommand="dgNews_ItemCommand"  OnPageIndexChanged="dgNews_PageIndexChanging" EmptyDataText="No records has been added.">

                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
               
                <Columns>
                   <%-- <asp:TemplateColumn HeaderText="Sr No">
                        <ItemTemplate>
                            <asp:Label ID="lblSlNo" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>--%>
                    <asp:BoundColumn DataField="NewsTitle" HeaderText="Title" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
                    <asp:BoundColumn DataField="NewsDate" HeaderText="Date"></asp:BoundColumn>
                     <asp:TemplateColumn HeaderText="Active" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("isActive")) ? "Yes" : "No" %>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Edit">
                          
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("NewsId")%>' AlternateText="click here to edit." ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("NewsId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
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




