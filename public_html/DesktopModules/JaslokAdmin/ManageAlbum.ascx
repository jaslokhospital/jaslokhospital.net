<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageAlbum.ascx.cs" Inherits="DotNetNuke.Modules.JaslokAdmin.ManageAlbum" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<script>
    function getFileData(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= listofuploadedfiles.ClientID %>");
        lbl.innerHTML = filename;

    }
</script>--%>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
   
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
       
        <div class="form-horizontal">
             <asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">
             <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label for="">Album Type:<span style="color: red">*</span></label></div>
                <div class="col-md-6" style="text-align: left;">
                    <%-- <input type="text"  id="Name" placeholder="Name">--%>
                    <asp:DropDownList ID="ddlAlbumType" runat="server" class="form-control">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Photo Gallery</asp:ListItem>
                        <asp:ListItem>Video Gallery</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvPAgeType" runat="server" ErrorMessage="Please Select Album Type" ControlToValidate="ddlAlbumType" InitialValue="--Select--"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            </div>
          <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label for="PageTitle">Album Title:<span style="color: red">*</span></label></div>
                <div class="col-md-6" style="text-align: left;">
                    <%-- <input type="text"  id="Name" placeholder="Name">--%>
                    <asp:TextBox ID="txtAlbumTitle" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please Enter Album Title" ControlToValidate="txtAlbumTitle"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <%--<div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Album Description:</label>
                <div class="col-xs-9">
                    <telerik:RadEditor runat="server" ID="txtAlbumDesc">
                         <ImageManager ViewPaths="/Content/Album" UploadPaths="~/" DeletePaths="/Content/bks" />
                    </telerik:RadEditor>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageKeyword">Album Iamge Alternate Text:</label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtAltText" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>--%>
            <%--<div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label  for="redPageContent">Image:</label></div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:FileUpload ID="UploadImages" runat="server" onchange="getFileData(this);" Style="color: transparent;" />
                    <asp:Label ID="listofuploadedfiles" runat="server" />
                   
                    <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="UploadImages" ValidationGroup="JHCat" ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg" ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                </div>
            </div>--%>
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
                  <asp:Button ID="btnAddJaslokTimes" runat="server" Text="Add Album" CssClass="btn btn-default" OnClick="btnAddJaslokTimes_Click" /><br /><br />
            
           
                <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger;"></asp:Label>
                <asp:DataGrid ID="dgAlbum" runat="server" AutoGenerateColumns="False" Width="100%"
                    AllowPaging="True" CssClass="normaltable22user"
                    DataKeyField="AlbumId" OnItemCommand="dgAlbum_ItemCommand" OnPageIndexChanged="dgAlbum_PageIndexChanging" EmptyDataText="No records has been added.">

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
                       <%-- <asp:TemplateColumn HeaderText="Album Image">
                            <ItemTemplate>
                                <asp:Image ID="AlbumImageUrl" runat="server" Width="150px" Height="150px" ImageUrl='<%# "~"+Eval("AlbumImageUrl")%>' />
                            </ItemTemplate>
                        </asp:TemplateColumn>--%>
                        <asp:BoundColumn DataField="AlbumTitle" HeaderText="Title" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
                        <asp:BoundColumn DataField="AlbumType" HeaderText="Type" ItemStyle-Width="10%"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Edit"  ItemStyle-Width="5%">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("AlbumId")%>' AlternateText="click here to edit."
                                    ID="imgbtnEdit"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Delete">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("AlbumId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
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












