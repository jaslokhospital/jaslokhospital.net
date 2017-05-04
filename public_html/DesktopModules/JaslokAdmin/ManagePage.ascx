<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManagePage.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManagePage" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<style>
    .small {
        font-size: 11px;
        color: red;
        font-weight: bold;
        text-transform: capitalize;
    }
</style>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <%-- <h3>Quick Inquiry</h3>--%>
    <div class="border-3"></div>
    <div class="border-3"></div>
    <div class="border-3"></div>
    <asp:Label ID="lblMessage" Visible="false" runat="server" />
    <div class="form-horizontal">
        <div class="row">
            <div class="col-md-4">
                <label>Page Type:<span style="color: red">*</span></label>
                <%-- <input type="text"  id="Name" placeholder="Name">--%>
                <asp:DropDownList ID="ddlPageType" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageType_SelectedIndexChanged">
                    <asp:ListItem>--Select--</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvPAgeType" runat="server" ErrorMessage="Please select page type" ControlToValidate="ddlPageType" InitialValue="0"
                    Display="Dynamic" ValidationGroup="JHCat" CssClass="small"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-4">
                <label>Page Title:<span style="color: red">*</span></label>
                <%-- <input type="text"  id="Name" placeholder="Name">--%>
                <asp:TextBox ID="txtPageTitle" class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter title" ControlToValidate="txtPageTitle"
                    Display="Dynamic" ValidationGroup="JHCat" CssClass="small"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-4">
                <label>Page Keyword:</label>
                <%-- <input type="text"  id="Name" placeholder="Name">--%>
                <asp:TextBox ID="txtPageKeyword" class="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label>Page Description:</label>
                <asp:TextBox ID="txtPageDesc" class="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">                
                <asp:TextBox ID="txtthumbnail" class="form-control" runat="server"></asp:TextBox>               
            </div>
            <div class="col-md-4">
                <input type="button" style="height:38px;" class="btn btn-primary2" value="Pick a file" onclick="var NewThumb = '<%= txtthumbnail.ClientID %>';var ImgCaption='<%= hdnCaption.ClientID %>'; var popup = window.open('/thumbnail_browse.aspx?txtName=' + NewThumb + '&ImageCaption='+ImgCaption+'&Image=', 'Thumbnail Repository', 'width=500,height=600,scrollbars=1'); popup.focus();" />
            &nbsp;
			<input type="button" style="height:38px;" class="btn btn-primary2" onclick="generateImage('<%= txtthumbnail.ClientID %>','<%= hdnCaption.ClientID %>')" value="Add Image" />
            <asp:HiddenField ID="hdnCaption" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label>Page Content:</label>
                <telerik:RadEditor ContentAreaCssFile="~/Portals/_default/Skins/JaslokSkin/Styles/css/EditorStyle.css" runat="server" ID="redPageContent" CssClass="form-control" Width="100%">
                    <ImageManager ViewPaths="/Content" UploadPaths="~/" DeletePaths="/Content/bks" />
                </telerik:RadEditor>
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




<table cellpadding="4" cellspacing="4" width="100%" style="margin-bottom: 3%;">


    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>

        <td colspan="2">
            <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found"></asp:Label>
            <asp:DataGrid ID="dgPage" runat="server" AutoGenerateColumns="False" Width="100%" Visible="true"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="PageTabId" OnItemCommand="dgPage_ItemCommand" OnPageIndexChanged="dgPage_PageIndexChanging" EmptyDataText="No records has been added.">

                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>
                    <asp:TemplateColumn HeaderText="S.No">
                        <ItemTemplate>
                            <asp:Label ID="lblsnumber" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="PageType" HeaderText="Type"></asp:BoundColumn>
                    <asp:BoundColumn DataField="PageTitle" HeaderText="Title"></asp:BoundColumn>
                    <asp:BoundColumn DataField="PageDescription" HeaderText="Description"></asp:BoundColumn>
                    <asp:BoundColumn DataField="PageKeywords" HeaderText="Keywords"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Edit">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("PageTabId")%>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("PageTabId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />

            </asp:DataGrid>
        </td>
    </tr>
</table>
<script>
    function generateImage(imgSrc,imagecaption)
    {
        var imgPath = document.getElementById(imgSrc).value;
        var imagecaption = document.getElementById(imagecaption).value;
        var editor = $find("<%= redPageContent.ClientID %>");
    var generatedHTML="";
    if(imgPath !="")
    {
        if(imagecaption=="")
        {
            generatedHTML = "<table><tr><td><img style='width:100%;' src='" + imgPath + "' /></td></tr></table>";
        }
        else
        {
            generatedHTML = "<table><tr><td><img style='width:100%;' src='" + imgPath + "' /></td></tr><tr><td>"+imagecaption+"</td></tr></table>";
        }
        editor.pasteHtml(generatedHTML);
    }
        

}
</script>
