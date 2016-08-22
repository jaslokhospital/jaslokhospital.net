<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageHomeSlider.ascx.cs" Inherits="DotNetNuke.Modules.JaslokAdmin.ManageHomeSlider" %>

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
    .small {
        font-size: 12px;
        color: red;
        font-weight: bold;
    }
</style>
<div class="border-3"></div>
<div class="border-3"></div>
<div class="border-3"></div>

<asp:PlaceHolder ID="plcView" runat="server">
     <asp:Label ID="lblMessage" Visible="false" runat="server" />  <br />  <br />
    <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger;"></asp:Label>
    <asp:Button ID="btnAdd" runat="server" Text="Add New Home Sliders" CssClass="btn btn-default" OnClick="btnAdd_Click" /><br />
    <br />
    <asp:DataGrid ID="dgHomeSlider" runat="server" AutoGenerateColumns="False" Width="100%" PageSize="10"
        AllowPaging="True" CssClass="normaltable22user" OnItemCommand="dgHomeSlider_ItemCommand" OnPageIndexChanged="dgHomeSlider_PageIndexChanging" EmptyDataText="No records has been added."
        DataKeyField="SliderId">

        <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
        <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
        <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
            Mode="NumericPages" CssClass="normaltableheadercelluser" />
        <Columns>
            <asp:TemplateColumn HeaderText="Image" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Image ID="ImageUrl" runat="server" Height="50px"
                        ImageUrl='<%# "~"+Eval("ImageUrl")%>' />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:BoundColumn DataField="Title" HeaderText="Title"  ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
            <asp:BoundColumn DataField="RedirectLink" HeaderText="Redirect Link"  ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
            <asp:TemplateColumn HeaderText="Active" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%# Convert.ToBoolean(Eval("IsActive")) ? "Yes" : "No" %>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Edit" ItemStyle-Width="5%">
                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                <ItemTemplate>
                    <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("SliderId")%>' AlternateText="click here to edit."
                        ID="imgbtnEdit"></asp:ImageButton>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%">
                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                <ItemTemplate>
                    <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("SliderId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
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
</asp:PlaceHolder>

<asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="form-horizontal">
            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>Title:<span style="color: red">*</span></label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:TextBox ID="txtImageTitle" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="small" ID="rfvLocation" runat="server" ErrorMessage="Please Enter Image Title" ControlToValidate="txtImageTitle"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>RedirectLink:</label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:TextBox ID="txtRedirectLink" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>Image:<span style="color: red">*</span></label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:FileUpload ID="UploadImages" runat="server" onchange="getFileData(this);" Style="color: transparent;" />

                    <asp:Label ID="listofuploadedfiles" runat="server" />
                    <asp:RequiredFieldValidator CssClass="small" ID="rfvImgupload" runat="server" ErrorMessage="Please Select Image" ControlToValidate="UploadImages"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="small" Display="Dynamic" ID="rexp" runat="server" ControlToValidate="UploadImages" ValidationGroup="JHCat" ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg" ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                    <asp:HiddenField ID="hdnUploadImg" runat="server" />
                </div>
            </div>
            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>Is Active:</label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:CheckBox ID="ckbIsActive" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12" style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="JHCat" OnClick="btnSubmit_Click" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />
                </div>
            </div>

           
        </div>
    </div>
</asp:PlaceHolder>
