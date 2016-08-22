<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageTestinomial.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageTestinomial" EnableViewState="true" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<script>
    function getFileData(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= listofuploadedfiles.ClientID %>");

        lbl.innerHTML = filename;

    }
    function getFileDataP(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename1 = file.name;
        var lbl1 = document.getElementById("<%=listofuploadedfilesP.ClientID%>");
        lbl1.innerHTML = filename1;

    }
</script>
<style>
    .small{font-size: 12px; color: red; font-weight: bold;}
</style>
<div class="border-3"></div>
<div class="border-3"></div>
<div class="border-3"></div>

<asp:PlaceHolder ID="plcView" runat="server">
         <asp:Label ID="lblMessage" Visible="false" runat="server" />
<br /><br />
    <asp:Button ID="btnAdd" runat="server" Text="Add New Testimonials" CssClass="btn btn-default" OnClick="btnAdd_Click" />
    <table cellpadding="4" cellspacing="4" width="100%">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger;"></asp:Label>
                <asp:DataGrid ID="dgTestinomial" runat="server" AutoGenerateColumns="False" Width="100%" PageSize="10" AllowPaging="true"
                    CssClass="normaltable22user" OnItemDataBound="dgTestinomial_ItemDataBound"
                    DataKeyField="TestimonialId" OnItemCommand="dgTesti_ItemCommand" ViewStateMode="Enabled" OnPageIndexChanged="dgTestinomial_PageIndexChanging">

                    <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                    <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                        Mode="NumericPages" CssClass="normaltableheadercelluser" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Image" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Image ID="ImageUrl" runat="server" Height="50px" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="Name" HeaderText="Name" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Active" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("IsActive")) ? "Yes" : "No" %>
                            </ItemTemplate>
                        </asp:TemplateColumn>

                        <asp:TemplateColumn HeaderText="Edit" ItemStyle-Width="5%">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Update" CommandArgument='<%# Eval("TestimonialId") %>' runat="server" ImageUrl="../../images/edit.gif" AlternateText="click here to edit." ID="imgbtnEdit"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%# Eval("TestimonialId") %>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
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
                <asp:HiddenField ID="hdnImagePathP" runat="server" />
            </td>
        </tr>
    </table>
    <div style="margin-bottom: 5%"></div>
</asp:PlaceHolder>

<asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">
    
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="form-horizontal">

            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>Name:<span style="color: red">*</span></label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="txtName"
                        Display="Dynamic" ValidationGroup="MT" CssClass="small"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>Mobile Number:<span style="color: #ff0000; font-size: 13px">*</span></label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:TextBox ID="txtMob" runat="server" class="form-control" onkeypress="return Numeric(event);" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="small" ID="rfvmob" ControlToValidate="txtMob" runat="server" ForeColor="Red" Display="Dynamic" ValidationGroup="MT" ErrorMessage="Please Enter Mobile Number"></asp:RequiredFieldValidator>
                    <asp:RangeValidator CssClass="small" ID="rgvMob" MinimumValue="1000000000" Type="Double" MaximumValue="9999999999" Display="Dynamic" ControlToValidate="txtMob" runat="server" ForeColor="Red" ValidationGroup="MT" ErrorMessage="Please Enter valid Mobile Number"></asp:RangeValidator>
                </div>
            </div>

            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>Email Id:<span style="color: #ff0000; font-size: 13px">*</span></label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="small" ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="MT" ErrorMessage="Please Enter Email ID"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="small" ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="MT" ControlToValidate="txtEmail"
                        ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                </div>
            </div>

              <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>Testimonial As Image:</label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:FileUpload ID="UploadImages" runat="server" onchange="getFileData(this);" Style="color: transparent;" />
                    <asp:Label ID="listofuploadedfiles" runat="server" />
                    <asp:RegularExpressionValidator Display="Dynamic" CssClass="small" ID="rexp" runat="server" ControlToValidate="UploadImages" ForeColor="Red" ValidationGroup="MT" ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg"
                        ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>Profile Image:</label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:FileUpload ID="ProfileImg" runat="server" onchange="getFileDataP(this);" Style="color: transparent;" />
                    <asp:Label ID="listofuploadedfilesP" runat="server" />
                    <asp:RegularExpressionValidator Display="Dynamic" CssClass="small" ID="RegularExpressionValidator4" runat="server" ControlToValidate="UploadImages" ForeColor="Red" ValidationGroup="MT" ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg"
                        ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                </div>
            </div>

             <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>Is Active:</label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:CheckBox ID="chkApprove" runat="server" Font-Size="Large" />
                </div>
            </div>

            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label>Comment<span style="color: #ff0000; font-size: 13px">*</span></label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:TextBox ID="txtComment" runat="server" class="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="small" ID="RequiredFieldValidator2" ControlToValidate="txtComment" runat="server" ForeColor="Red" ValidationGroup="MT" ErrorMessage="Please Enter Comment"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12" style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="MT" OnClick="btnSubmit_Click" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />
                </div>
            </div>
            
        </div>
    </div>
</asp:PlaceHolder>
<script type="text/javascript"> var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
     var keyCode = e.which ? e.which : e.keyCode
     var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
 } </script>
