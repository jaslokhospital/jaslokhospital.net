<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageVideoGallery.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageVideoGallery" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script>
    function getFileData(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= listofuploadedfiles.ClientID %>");
        lbl.innerHTML = filename;
    }
    function getFilename(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= lblUploadThumbnail.ClientID %>");
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
                <label for="Album">Album: <span style="color: red">*</span></label></div>
                <div class="col-md-6" style="text-align: left;">                  
                        <asp:DropDownList ID="ddlAlbum" runat="server" class="form-control">
                            <asp:ListItem>--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvPAgeType" runat="server" ErrorMessage="Please select album type" ControlToValidate="ddlAlbum" InitialValue="0"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>  
                </div>
            </div>
            <%--<div class="form-group">
                <label class="control-label col-xs-3" for="VideoTitle">Video Title: <span style="color: red">*</span></label>
                <div class="col-xs-9">
                   <asp:TextBox ID="txtVideoTitle" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please enter video title" ControlToValidate="txtVideoTitle"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            </div>--%>
           <%-- <div class="form-group">
                <label class="control-label col-xs-3" for="">Video Description:</label>
                <div class="col-xs-9">
                   <telerik:RadEditor runat="server" ID="txtVideoDesc" class="form-control">
                            <ImageManager ViewPaths="/Content" UploadPaths="/Content/VideoGalleryFolder" DeletePaths="/Content/bks" />
                                    </telerik:RadEditor>
                </div>
            </div>--%>
          <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label for="UploadVideo">Upload Video: <span style="color: red">*</span></label></div>
                <div class="col-md-6" style="text-align: left;">  
                    <%-- <input type="text"  id="Name" placeholder="Name">--%>
                  <asp:FileUpload ID="UploadVideo" runat="server" onchange="getFileData(this);" style="color: transparent;" />
                             <asp:Label ID="listofuploadedfiles" runat="server" />
                               <asp:RequiredFieldValidator ID="reqVideo" runat="server" ErrorMessage="Please upload video" ControlToValidate="UploadVideo"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                                             
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UploadVideo" ForeColor="Red" ValidationGroup="JHCat" Display="Dynamic"
        ErrorMessage="Only .mp4 and .flv" ValidationExpression="(.*\.([Mm][Pp][4])|.*\.([Ff][Ll][Vv])$)"></asp:RegularExpressionValidator>
                </div>
            </div>
          <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label for="VideoThumbnail">Video Thumbnail: <span style="color: red">*</span></label></div>
                  <div class="col-md-6" style="text-align: left;">                   
                        <asp:FileUpload ID="UploadVideoThumbnail" runat="server" onchange="getFilename(this);" style="color: transparent;"/>
                             <asp:Label ID="lblUploadThumbnail" runat="server" />
                              <asp:RequiredFieldValidator ID="rfvImgupload" runat="server" ErrorMessage="Please upload Image" ControlToValidate="UploadVideoThumbnail"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>    
                             <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="UploadVideoThumbnail" ForeColor="Red" ValidationGroup="JHCat" ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg" 
                               ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([Jj][Pp][Ee][Gg])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>                           
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
                   <asp:Label ID="lblMessage" Visible="false" runat="server"/><br /><br />
                  <asp:Button ID="btnAddJaslokTimes" runat="server" Text="Add Video" CssClass="btn btn-default" OnClick="btnAddJaslokTimes_Click" /><br /><br />
            
             <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
            <asp:DataGrid ID="dgVideo" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="VideoId" OnItemCommand="dgVideo_ItemCommand" OnPageIndexChanged="dgVideo_PageIndexChanging" EmptyDataText="No records has been added.">

               <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>
                    <%--<asp:TemplateColumn HeaderText="Sl No">
                        <ItemTemplate>
                            <asp:Label ID="lblSlNo" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>--%>
                  <%--  <asp:BoundColumn DataField="VideoTitle" HeaderText="Title"></asp:BoundColumn>--%>
                    <asp:TemplateColumn HeaderText="VideoThumbnail" ItemStyle-Width="5%">
                        <ItemTemplate>                           
                            <asp:Image ID="Thumbnail" runat="server" Height="50px" ImageUrl='<%# "~"+Eval("VideoThumbnail")%>' />
                            
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="AlbumTitle" HeaderText="Album"></asp:BoundColumn>
                  <%--  <asp:BoundColumn DataField="VideoThumbnail" HeaderText="Thumbnail"></asp:BoundColumn>--%>
                    
                    <asp:TemplateColumn HeaderText="Edit" ItemStyle-Width="5%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("VideoId")%>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("VideoId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
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
            <asp:HiddenField ID="hdnThumbnailPath" runat="server" />
                 </asp:PlaceHolder>
        </div>
    </div>


