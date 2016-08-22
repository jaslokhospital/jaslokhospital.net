<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageUsers.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageUsers" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<script>
    function getFileData(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= listofuploadedfilesp.ClientID %>");
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
    <asp:Label ID="lblMessage" Visible="false" runat="server" />
    <asp:Button ID="btnAdd" runat="server" Text="Add New Management/Trustee" CssClass="btn btn-default" OnClick="btnAdd_Click" /><br />
    <br />
    <asp:DataGrid ID="dgUsers" runat="server" AutoGenerateColumns="False" Width="100%"
        AllowPaging="True" CssClass="normaltable22user" OnItemCommand="dgUsers_ItemCommand" OnPageIndexChanged="dgUsers_PageIndexChanging" EmptyDataText="No records has been added."
        DataKeyField="UserId">

        <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
        <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
        <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
            Mode="NumericPages" CssClass="normaltableheadercelluser" />
        <Columns>
            <asp:TemplateColumn HeaderText="Photo" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Width="50px" Height="50px"
                        ImageUrl='<%# "~"+Eval("ImageUrl")%>' />
                </ItemTemplate>
            </asp:TemplateColumn>

            <asp:BoundColumn DataField="Name" HeaderText="Name" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
            <asp:BoundColumn DataField="UserType" HeaderText="UserType" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
            <asp:BoundColumn DataField="Designation" HeaderText="Designation" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
            <asp:TemplateColumn HeaderText="Active" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Literal ID="ltStatus" runat="server" Text='<%# Convert.ToBoolean(Eval("IsActive")) ? "Yes" : "No" %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Edit" ItemStyle-Width="5%">
                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                <ItemTemplate>
                    <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("UserId")%>' AlternateText="click here to edit."
                        ID="imgbtnEdit"></asp:ImageButton>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%">
                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                <ItemTemplate>
                    <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("UserId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                        ID="ImagebtnDelete"></asp:ImageButton>
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
        <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
        <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
        <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
            Mode="NumericPages" CssClass="normaltableheadercelluser" />
    </asp:DataGrid>
    <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger;"></asp:Label>
</asp:PlaceHolder>

<asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">

    <div class="form-horizontal">

        <div class="row" style="width: 80%;">
            <div class="col-md-6" style="text-align: right;">
                <label>User Type:<span style="color: red">*</span></label>
            </div>
            <div class="col-md-6" style="text-align: left;">
                <asp:DropDownList ID="ddlUserType" runat="server" class="form-control">
                    <asp:ListItem>--Select--</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator CssClass="small" ID="rfvDrpUsertype" runat="server" ErrorMessage="Please select user type" ControlToValidate="ddlUserType" InitialValue="0"
                    Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row" style="width: 80%;">

            <div class="col-md-6" style="text-align: right;">
                <label>Name:<span style="color: red">*</span></label>
            </div>
            <div class="col-md-6" style="text-align: left;">
                <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="small" ID="rfvName" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="txtName"
                    Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row" style="width: 80%;">

            <div class="col-md-6" style="text-align: right;">
                <label>Designation:</label>
            </div>
            <div class="col-md-6" style="text-align: left;">
                <asp:TextBox ID="txtDesignation" runat="server" class="form-control"></asp:TextBox>
            </div>

        </div>

        <div class="row" style="width: 80%;">

            <div class="col-md-6" style="text-align: right;">
                <label>Image:</label>
            </div>
            <div class="col-md-6" style="text-align: left;">
                <asp:FileUpload ID="UploadImages" runat="server" Style="color: transparent;" onchange="getFileData(this);" />
                <asp:Label ID="listofuploadedfilesp" runat="server" />
                <asp:HiddenField ID="listofuploadedfiles" runat="server" />
                <asp:RegularExpressionValidator CssClass="small" Display="Dynamic" ID="rexp" runat="server" ControlToValidate="UploadImages" ForeColor="Red" ValidationGroup="MU" ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg" ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row" style="width: 80%;">

            <div class="col-md-6" style="text-align: right;">
                <label>IsActive:</label>
            </div>
            <div class="col-md-6" style="text-align: left;">
                <asp:CheckBox ID="ckbIsActive" runat="server" />
            </div>
        </div>

        <div class="row" style="width: 80%;">
            <div class="col-md-6" style="text-align: right;">
                <label>Description:</label>
            </div>
            <div class="col-md-6" style="text-align: left;">
                <asp:TextBox ID="reUser" runat="server" class="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-md-12" style="text-align: center;">
                <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="MU" OnClick="btnSubmit_Click" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />
            </div>
        </div>

        <asp:Label ID="Label2" Visible="false" runat="server" />
        <div class="form-group">

            <asp:HiddenField ID="hdnImagePath" runat="server" />
        </div>

    </div>
</asp:PlaceHolder>


<script type="text/javascript"> var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
     var keyCode = e.which ? e.which : e.keyCode
     var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
 } </script>
