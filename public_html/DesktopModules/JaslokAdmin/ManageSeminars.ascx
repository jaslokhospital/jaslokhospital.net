<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageSeminars.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageSeminars" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">

<script type="text/javascript">
    $(document).on("click", "lnkbtnView", function () {
        $("#id").html($(".Id", $(this).closest("tr")).html());
        $("#name").html($(".Name", $(this).closest("tr")).html());
        $("#description").html($(".Description", $(this).closest("tr")).html());
        $("#dialog").dialog({
            title: "View Details",
            buttons: {
                Ok: function () {
                    $(this).dialog('close');
                }
            },
            modal: true
        });
        return false;
    });
</script>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
    Telerik.Web.UI.RadDatePicker.prototype._actionBeforeShowPopup_original = Telerik.Web.UI.RadDatePicker.prototype._actionBeforeShowPopup;
    Telerik.Web.UI.RadDatePicker.prototype._actionBeforeShowPopup = function () {
        this._actionBeforeShowPopup_original();
        if (Telerik.Web.UI.RadDateTimePicker) {
            Telerik.Web.UI.RadDateTimePicker.prototype._hideAllTimePopups();
        }
    }
</script>

<script type="text/javascript">
    $(function () {


    });

    function ViewDetail() {
        $("#divViewSeminarDetail").dialog({
            autoOpen: false,
            show: {
                effect: "blind",
                duration: 1000
            },
            hide: {
                effect: "clip",
                duration: 1000
            }
        });


        $("#divViewSeminarDetail").dialog("open");

    }
</script>
<style>
    .ui-dialog {
        top:20px !important;
    }
    div.ui-dialog-titlebar > .ui-dialog-titlebar-close {
          right: 6px !important;
            top: 8px !important;
    }
</style>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="right_part">
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="form-horizontal">

            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Title:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                     <asp:TextBox ID="txtTitle" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Please Enter Title" ControlToValidate="txtTitle"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Seminar Date:</label>
                <div class="col-xs-9">
                   <asp:TextBox ID="txtDateOfSeminar" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDateOfSeminar" runat="server" ErrorMessage="Please Enter Date Of Seminar" ControlToValidate="txtDateOfSeminar"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Timings:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                      <asp:TextBox ID="txtTimings" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTimings" runat="server" ErrorMessage="Please Enter Timings" ControlToValidate="txtTimings"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>           
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Venue:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtVenue" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvVenue" runat="server" ErrorMessage="Please Enter Venue" ControlToValidate="txtVenue"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Officer InCharge:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtOfficerInCharge" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOfficerInCharge" runat="server" ErrorMessage="Please Enter Officer InCharge" ControlToValidate="txtOfficerInCharge"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Contact:</label>
                <div class="col-xs-9">                   
                   <asp:TextBox ID="txtContact" runat="server" class="form-control" MaxLength="10" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtContact" runat="server" ErrorMessage="Please Enter Contact" ControlToValidate="txtContact"
                            Display="Dynamic" ValidationGroup="MU" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Email:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="MU" ErrorMessage="Please Enter Email ID"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="MU" ControlToValidate="txtEmail" CssClass="requiredFieldValidateStyle"
                            ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Brochure:</label>
                <div class="col-xs-9">                   
                    <asp:FileUpload ID="UploadImages" runat="server" style="color: transparent;"/>

                            <asp:Label ID="listofuploadedfiles" runat="server" />
                            <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="UploadImages" ForeColor="Red" ValidationGroup="MU" ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg" ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Time Topic:</label>
                <div class="col-xs-9">                   
                    <asp:FileUpload ID="FileUploadTOPIC" runat="server" style="color: transparent;"/>

                            <%--  <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />--%>
                            <asp:Label ID="listofuploadedTimeTOPIC" runat="server" />
                            <asp:RegularExpressionValidator ID="revFileUploadTOPIC" runat="server" ControlToValidate="FileUploadTOPIC" ForeColor="Red" ValidationGroup="MU" ErrorMessage="Only .docx,.pdf,.txt,.doc" ValidationExpression="(.*\.([dD][oO][cC][xX])|.*\.([pP][dD][fF])|.*\.([tT][xX][tT])|.*\.([dD][oO][cC][xX])$)"></asp:RegularExpressionValidator>
                    
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Expiry Date:</label>
                <div class="col-xs-9">                   
                    <telerik:RadDateTimePicker ID="datetimepick" runat="server" class="form-control"></telerik:RadDateTimePicker>
                </div>
            </div>
           

             <div class="form-group">
               <label class="control-label col-xs-3" for=""></label>
                <div class="col-xs-9">

                    <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="MU" OnClick="btnSubmit_Click" class="btn btn-primary2"/>&nbsp;&nbsp;&nbsp;&nbsp
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2"/>    

                </div>
            </div>
            <asp:Label ID="lblMessage" Visible="false"  runat="server"/>
        </div>
    </div>
</div>





<table cellpadding="4" cellspacing="4" width="100%">

    
    <tr>
        <td colspan="2">
             <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
            <asp:DataGrid ID="dgSeminars" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user" OnItemCommand="dgSeminars_ItemCommand" OnPageIndexChanged="dgSeminars_PageIndexChanging" EmptyDataText="No records has been added."
                DataKeyField="SeminarId">

                <HeaderStyle CssClass="normaltableheadercelluser" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle Mode="NumericPages" HorizontalAlign="Right" CssClass="normaltableheadercelluser" />

                <Columns>
                    <asp:TemplateColumn HeaderText="S.No">
                        <ItemTemplate>
                            <asp:Label ID="lblsnumber" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                   <%-- <asp:BoundColumn DataField="Title" HeaderText="Title"></asp:BoundColumn>--%>
                    <asp:TemplateColumn HeaderText="Title">
                        <ItemTemplate>
                           <%-- <asp:LinkButton ID="lnkbtnView" runat="server" Text='<%# Bind("TITLE") %>' CommandName="TITLE" ></asp:LinkButton>--%>
                             <asp:Label ID="lnkbtnView" runat="server"><%#Eval("TITLE")%></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="DateOfSeminar" HeaderText="Date Of Seminar"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Timings" HeaderText="Timings"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Venue" HeaderText="Venue"></asp:BoundColumn>
                    <asp:BoundColumn DataField="OfficerInCharge" HeaderText="Officer InCharge"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Contact" HeaderText="Contact"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Email" HeaderText="Email"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Edit">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("SeminarId")%>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("SeminarId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
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
<br />
<br />
<div id="dialog" style="display: none">
    <b>Title:</b> <span id="Title"></span>
    <br />
    <b>DateOfSeminar:</b> <span id="DateOfSeminar"></span>
    <br />
    <b>Timings:</b> <span id="Timings"></span>
     <br />
    <b>Venue:</b> <span id="Venue"></span>
     <br />
    <b>Officer In Charge:</b> <span id="Officer In Charge"></span>
     <br />
    <b>Contact:</b> <span id="Contact"></span>
     <br />
    <b>Email:</b> <span id="Email"></span>
     <br />
    <b>Brochure:</b> <span id="Brochure"></span>
     <br />
    <b>TimeTOPIC:</b> <span id="Time Topic"></span>
</div>


<div id="divViewSeminarDetail" class="white_content" title="Seminar Details">
    
     <asp:DetailsView ID="SeminarDetailsView" runat="server" AutoGenerateRows="False"
         AllowPaging="false"
        EnableViewState="False" BorderStyle="None" GridLines="None" AlternatingRowStyle-BorderStyle="None">
        <Fields>
            <asp:BoundField DataField="DateOfSeminar" HeaderText="DateOfSeminar"></asp:BoundField>
            <asp:BoundField DataField="Timings" HeaderText="Timings"></asp:BoundField>
            <asp:BoundField DataField="Venue" HeaderText="Venue"></asp:BoundField>
            <asp:BoundField DataField="OfficerInCharge" HeaderText="OfficerInCharge"></asp:BoundField>
            <asp:BoundField DataField="Contact" HeaderText="Contact"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>
        </Fields>
    </asp:DetailsView> 
    </div>

<script type="text/javascript"> var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
var keyCode = e.which ? e.which : e.keyCode
     var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
 } </script>
