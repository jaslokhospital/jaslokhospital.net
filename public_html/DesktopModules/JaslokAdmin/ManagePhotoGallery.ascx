<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManagePhotoGallery.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManagePhotoGallery" %>
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
    
        <div class="form-horizontal">
             <asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">
             <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label  for="">Album:<span style="color: red">*</span></label></div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:DropDownList ID="ddlAlbum" CssClass="form-control" runat="server" >
                        <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvPAgeType" runat="server" ErrorMessage="Please Select Album type" ControlToValidate="ddlAlbum" InitialValue="0"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            </div>
            <%--<div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Photo Title:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtPhotoTitle" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please Enter Photo Title" ControlToValidate="txtPhotoTitle"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            </div>--%>
           <%-- <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Photo Description:</label>
                <div class="col-xs-9">
                    <telerik:RadEditor runat="server" ID="txtPhotoDesc">
                        <ImageManager ViewPaths="/Content" UploadPaths="/Content/PhotoGallery" DeletePaths="/Content/bks" />
                    </telerik:RadEditor>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageKeyword">Photo Image Alternate Text:</label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtAltText" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>--%>
             <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label for="redPageContent">Image: <span style="color: red">*</span></label></div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:FileUpload ID="UploadImages" runat="server" onchange="getFileData(this);" Style="color: transparent;" />
                    <asp:Label ID="listofuploadedfiles" runat="server" />
                     <asp:RequiredFieldValidator ID="rfvImgupload" runat="server" ErrorMessage="Please Select Image" ControlToValidate="UploadImages"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator> 
                    <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="UploadImages" ForeColor="Red" ValidationGroup="JHCat" ErrorMessage="Only  .jpg, .png and .jpeg"
                        ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label  for="">Image Description:</label></div>
                <div class="col-md-6" style="text-align: left;">
                   <asp:TextBox ID="txtImageDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </div>
            </div>
          <div class="row">
               
               <div class="col-xs-12" style="text-align:center;">

                    <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="JHCat" OnClick="btnSubmit_Click" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />

                </div>
            </div>
            </asp:PlaceHolder>

              <asp:PlaceHolder ID="plcView" runat="server">
                  
            <div class="form-group">
                 <asp:Label ID="lblMessage" Visible="false" runat="server" /><br /><br />
                <asp:Button ID="btnAddJaslokTimes" runat="server" Text="Add Photo" CssClass="btn btn-default" OnClick="btnAddJaslokTimes_Click" /><br /><br />
            <asp:DropDownList ID="drpSelectPhotoAlbum" CssClass="form-control" runat="server">
                    </asp:DropDownList><br />
<asp:Button ID="btnSelect" runat="server" Text="Submit" CssClass="btn btn-default btnstyle" OnClick="btnSelect_Click"/><br /><br />
               <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger;"></asp:Label>
            <asp:DataGrid ID="dgPhoto" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="PhotoId" OnItemCommand="dgPhoto_ItemCommand" OnPageIndexChanged="dgPhoto_PageIndexChanging" EmptyDataText="No records has been added.">

                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns> 
                    <%--<asp:TemplateColumn HeaderText="S.No">
                        <ItemTemplate>
                            <asp:Label ID="lblsnumber" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>--%>
                   <%-- <asp:BoundColumn DataField="PhotoTitle" HeaderText="Title"></asp:BoundColumn>--%>
<%--                    <asp:BoundColumn DataField="PhotoImgAlternateText" HeaderText="ImgAlternateText"></asp:BoundColumn>--%>
                    <%-- <asp:BoundColumn DataField="AlbumID" HeaderText="ID"></asp:BoundColumn>--%>
                      <asp:TemplateColumn HeaderText="Image" ItemStyle-Width="5%">
                        <ItemTemplate>
                            <asp:Image ID="PhotoImageUrl" ImageUrl='<%#"~"+Eval("PhotoImageUrl") %>' runat="server" Height="50px" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="AlbumTitle" HeaderText="Album"></asp:BoundColumn>
                    <asp:BoundColumn DataField="PhotoDescription" HeaderText="Description"></asp:BoundColumn>

                  
                    <asp:TemplateColumn HeaderText="Edit" ItemStyle-Width="5%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("PhotoId")%>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("PhotoId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
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






