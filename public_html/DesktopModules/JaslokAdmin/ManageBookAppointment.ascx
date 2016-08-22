<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageBookAppointment.ascx.cs" Inherits="DotNetNuke.Modules.JaslokAdmin.ManageBookAppointment" %>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="right_part">
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-xs-3" for="Name">Search by Doctor:<span style="color: red">*</span></label>
                <div class="col-xs-9">                   
                    <asp:DropDownList runat="server" ID="drpDoctorName" Width="250px" Height="27px">
                        <Items>
                            <asp:ListItem>--Select--</asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvDoctor" runat="server" ErrorMessage="Please select  Doctor" ControlToValidate="drpDoctorName" InitialValue="0"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            
             <div class="form-group">
               <label class="control-label col-xs-3" for=""></label>
                <div class="col-xs-9">
                  <asp:Button ID="btnSearch" runat="server" Text="Search" ValidationGroup="JHCat" OnClick="btnSearch_Click" class="btn btn-primary2" />
                </div>
            </div>
            <asp:Label ID="lblMessage" Visible="false" runat="server" />
        </div>
    </div>
</div>


<div style="padding-top:20px" ></div>
<table cellpadding="4" cellspacing="4"  style="padding-top:12px" width="100%">
   
    <tr>
        <td colspan="2"></td>
    </tr>    
   
    <tr>
        <td colspan="2">
             <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
            <asp:DataGrid ID="dgAppointment" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="BookId" OnPageIndexChanged="dgAppointment_PageIndexChanging" EmptyDataText="No records has been added.">

                 <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>
                    <asp:TemplateColumn HeaderText="Sl No">
                        <ItemTemplate>
                            <asp:Label ID="lblSlNo" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="SpecialtyName" HeaderText="Specialty Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="ClientName" HeaderText="Client Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="BookedDate" HeaderText="Booked Date"></asp:BoundColumn>
                     <asp:BoundColumn DataField="Email" HeaderText="Email"></asp:BoundColumn>
                     <asp:BoundColumn DataField="PhoneNo" HeaderText="Phone"></asp:BoundColumn>
                     <asp:BoundColumn DataField="MobileNo" HeaderText="Mobile"></asp:BoundColumn>
                     <asp:BoundColumn DataField="Country" HeaderText="Country"></asp:BoundColumn>
                     <asp:BoundColumn DataField="StateName" HeaderText="State Name"></asp:BoundColumn>
                     <asp:BoundColumn DataField="Enquiry" HeaderText="Enquiry"></asp:BoundColumn>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />

            </asp:DataGrid>
             <asp:HiddenField ID="hdnImagePath" runat="server" />
        </td>
    </tr>
</table>

