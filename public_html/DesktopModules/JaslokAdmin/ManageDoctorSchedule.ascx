<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageDoctorSchedule.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageDoctorSchedule" %>

<script language="javascript" type="text/javascript">
    function confirmdelete() {
        if (confirm("Are you sure you want to Delete this record?") == true)
            return true;
        else
            return false;

    }
</script>
<style>
    input[type="checkbox"] + label::before{
        content:none;
    }

    input[type="checkbox"]:checked + label::after {content:none;}

    .ckecklistLabel label{margin-bottom: 0px !important;}
    .ckecklistLabel td{padding-right:15px !important;}
</style>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <asp:HiddenField ID="hdnDoctorScheduleId" runat="server" />
    <div class="right_part">
        <div >&nbsp;</div>

        <div class="form-horizontal">
            <asp:Label ID="lblMessage" Visible="false"  runat="server"/>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Doctor Name:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                     <asp:DropDownList runat="server" ID="drpDoctorName" AutoPostBack="true" OnSelectedIndexChanged="drpDoctorNM_SelectedIndexChanged" Width="300px" Height="27px">
                            <Items>
                                <asp:ListItem Text="-Select-" Value="0" />
                            </Items>
                        </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ErrorMessage="Please Select Doctor Name" ControlToValidate="drpDoctorName"
                            Display="Dynamic" ValidationGroup="MT" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="drpSpeciality">Doctor Speciality:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                     <asp:DropDownList runat="server" ID="drpSpeciality" Width="300px" Height="27px">
                            <Items>
                                <asp:ListItem Text="-Select-" Value="0" />
                            </Items>
                        </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ErrorMessage="Please Select Doctor Speciality" ControlToValidate="drpSpeciality"
                            Display="Dynamic" ValidationGroup="MT" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Day:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                   <asp:CheckBoxList ID="chklstDay" CssClass="ckecklistLabel" RepeatDirection="Horizontal" runat="server">
                       <asp:ListItem Text="&nbsp;Mon" Value="Mon"></asp:ListItem>
                       <asp:ListItem Text="&nbsp;Tue" Value="Tue"></asp:ListItem>
                       <asp:ListItem Text="&nbsp;Wed" Value="Wed"></asp:ListItem>
                       <asp:ListItem Text="&nbsp;Thu" Value="Thu"></asp:ListItem>
                       <asp:ListItem Text="&nbsp;Fri" Value="Fri"></asp:ListItem>
                       <asp:ListItem Text="&nbsp;Sat" Value="Sat"></asp:ListItem>
                       <asp:ListItem Text="&nbsp;Sun" Value="Sun"></asp:ListItem>
                   </asp:CheckBoxList>
                    <asp:CustomValidator runat="server" ID="cvmodulelist" Display="Dynamic"
                  ClientValidationFunction="ValidateModuleList"
                  ErrorMessage="Please select atleast one DAY" ForeColor="Red" ValidationGroup="MT" ></asp:CustomValidator>
                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Time:<span style="color: red">*</span></label>
                <div class="col-xs-9">From
                    <asp:DropDownList ID="drpFromTime" Width="65" runat="server">
                        <asp:ListItem Text="12am" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1am" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2am" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3am" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4am" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5am" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6am" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7am" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8am" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9am" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10am" Value="10"></asp:ListItem>
                        <asp:ListItem Text="11am" Value="11"></asp:ListItem>
                        <asp:ListItem Text="12pm" Value="12"></asp:ListItem>
                        <asp:ListItem Text="1pm" Value="13"></asp:ListItem>
                        <asp:ListItem Text="2pm" Value="14"></asp:ListItem>
                        <asp:ListItem Text="3pm" Value="15"></asp:ListItem>
                        <asp:ListItem Text="4pm" Value="16"></asp:ListItem>
                        <asp:ListItem Text="5pm" Value="17"></asp:ListItem>
                        <asp:ListItem Text="6pm" Value="18"></asp:ListItem>
                        <asp:ListItem Text="7pm" Value="19"></asp:ListItem>
                        <asp:ListItem Text="8pm" Value="20"></asp:ListItem>
                        <asp:ListItem Text="9pm" Value="21"></asp:ListItem>
                        <asp:ListItem Text="10pm" Value="22"></asp:ListItem>
                        <asp:ListItem Text="11pm" Value="23"></asp:ListItem>
                    </asp:DropDownList>
                    To
                    <asp:DropDownList ID="drpToTime" Width="65" runat="server">
                        <asp:ListItem Text="12am" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1am" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2am" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3am" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4am" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5am" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6am" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7am" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8am" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9am" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10am" Value="10"></asp:ListItem>
                        <asp:ListItem Text="11am" Value="11"></asp:ListItem>
                        <asp:ListItem Text="12pm" Value="12"></asp:ListItem>
                        <asp:ListItem Text="1pm" Value="13"></asp:ListItem>
                        <asp:ListItem Text="2pm" Value="14"></asp:ListItem>
                        <asp:ListItem Text="3pm" Value="15"></asp:ListItem>
                        <asp:ListItem Text="4pm" Value="16"></asp:ListItem>
                        <asp:ListItem Text="5pm" Value="17"></asp:ListItem>
                        <asp:ListItem Text="6pm" Value="18"></asp:ListItem>
                        <asp:ListItem Text="7pm" Value="19"></asp:ListItem>
                        <asp:ListItem Text="8pm" Value="20"></asp:ListItem>
                        <asp:ListItem Text="9pm" Value="21"></asp:ListItem>
                        <asp:ListItem Text="10pm" Value="22"></asp:ListItem>
                        <asp:ListItem Text="11pm" Value="23"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:CompareValidator ID="cmpvalidator" runat="server" ErrorMessage="To time can not be less than From time" ValidationGroup="MT" Display="Dynamic" 
                        ControlToValidate="drpFromTime" ControlToCompare="drpToTime" Operator="LessThan" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Room:</label>
                <div class="col-xs-9">
                   <asp:TextBox ID="txtRoom" runat="server" class="form-control" Width="300px" MaxLength="50"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Room" ControlToValidate="txtRoom"
                            Display="Dynamic" ValidationGroup="MT" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Time Slot:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                   <asp:RadioButtonList ID="rbtSlots" CssClass="ckecklistLabel" RepeatDirection="Horizontal" runat="server">
                       <asp:ListItem Text="5 min" Value="5"></asp:ListItem>
                       <asp:ListItem Text="10 min" Value="10"></asp:ListItem>
                       <asp:ListItem Text="15 min" Value="15"></asp:ListItem>
                       <asp:ListItem Text="30 min" Value="30"></asp:ListItem>
                   </asp:RadioButtonList>
                    <asp:CustomValidator runat="server" ID="CustomValidator1" Display="Dynamic"
                  ClientValidationFunction="ValidateSlot"
                  ErrorMessage="Please select atleast one slot" ForeColor="Red" ValidationGroup="MT" ></asp:CustomValidator>
                </div>
            </div>             
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle"></label>
                <div class="col-xs-9">
                     <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="MT" OnClick="btnSubmit_Click" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2"/>
                </div>
            </div>
            
        </div>
    </div>
</div>




<table cellpadding="4" cellspacing="4" width="100%">
    <tr>
        <td colspan="2">
            <asp:GridView ID="dgscgrid" runat="server" AutoGenerateColumns="false" DataKeyNames="DSId"
                OnRowCommand="dgscgrid_RowCommand">
                 <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <RowStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></RowStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" 
                     CssClass="normaltableheadercelluser" />                
                <Columns>
                     <asp:TemplateField HeaderText="Sl No" ItemStyle-Width="50">
                        <ItemTemplate>
                            <asp:Label ID="lblSlNo" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Speciality" ItemStyle-Width="250">
                        <ItemTemplate>
                            <asp:Label ID="lblSpeciality" runat="server" Text='<%# Eval("SpecialityWithCategory") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Day" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblDay" runat="server" Text='<%# Eval("Day") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:TextBox ID="txtDay" runat="server" Width="200px" Text='<%# Eval("Day") %>' MaxLength="12"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvGVDay" runat="server" ErrorMessage="Please Enter Day" ControlToValidate="txtDay"
                            Display="Dynamic" ForeColor="Red" Font-Size="10px"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Time" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblTime" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:TextBox ID="txtTime" runat="server" Width="200px" Text='<%# Eval("Time") %>' MaxLength="100"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvGVTime" runat="server" ErrorMessage="Please Enter Time" ControlToValidate="txtTime"
                            Display="Dynamic" ForeColor="Red" Font-Size="10px"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Room" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblRoom" runat="server" Text='<%# Eval("Room") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRoom" runat="server" Width="200px" Text='<%# Eval("Room") %>' MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvGVRoom" runat="server" ErrorMessage="Please Enter Room" ControlToValidate="txtRoom"
                            Display="Dynamic" ForeColor="Red" Font-Size="10px"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:LinkButton ID="lkbEdit" runat="server" Text="Edit" CommandName="editsch" CommandArgument='<%# Eval("DSId") %>'></asp:LinkButton>
                            <asp:LinkButton ID="lkbDelete" runat="server" Text="Delete" CommandName="deletesch" CommandArgument='<%# Eval("DSId") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
           

        </td>
    </tr>
</table>
<script type="text/javascript">
    function ValidateModuleList(source, args) {
        var chkListModules = document.getElementById('<%= chklstDay.ClientID %>');
        var chkListinputs = chkListModules.getElementsByTagName("input");
        for (var i = 0; i < chkListinputs.length; i++) {
            if (chkListinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
        args.IsValid = false;
    }

    function ValidateSlot(source, args) {
        var chkListModules = document.getElementById('<%= rbtSlots.ClientID %>');
        var chkListinputs = chkListModules.getElementsByTagName("input");
        for (var i = 0; i < chkListinputs.length; i++) {
            if (chkListinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
        args.IsValid = false;
    }
</script>
