<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageDoctorTabMapping.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageDoctorTabMapping" %>
<style>
	.newbnt { margin-bottom: 5px !important; margin-left:50px;}
</style>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="right_part">
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
         <asp:Label ID="Label1" Visible="false" runat="server" />
        <div class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-xs-3" for="">Doctor Name <span style="color: red">*</span></label>
                <div class="col-xs-9">
                    <%-- <input type="text"  id="Name" placeholder="Name">--%>
                   <asp:DropDownList runat="server" ID="drpDoctorName" AutoPostBack="true" OnSelectedIndexChanged="drpDoctorNM_SelectedIndexChanged" class="form-control">
                            <Items>
                                <asp:ListItem Text="-Select-" Value="0" />
                            </Items>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ErrorMessage="Please Select Doctor Name" ControlToValidate="drpDoctorName"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Specialty</label>
                <div class="col-xs-3">
                    <asp:ListBox ID="listspecialityAvl" runat="server" SelectionMode="Multiple" class="form-control" style="height: 200px;">
                             <asp:ListItem>--Select--</asp:ListItem>
                        </asp:ListBox>
                    
                </div>
                <div class="col-xs-3">
                    <asp:Button ID="btnAddMedicine" class="btn newbnt btn-primary2" runat="server" OnClick="btnAddSpecialty_Click"  Text="Add" /> 
                            <asp:Button ID="btnAddAll" class="btn newbnt btn-primary2" runat="server" OnClick="btnAddAll_Click" Text="Add All" />
                            <asp:Button ID="btnRemove" class="btn newbnt btn-primary2" runat="server" OnClick="btnRemove_Click" Text="Remove" />
                            <asp:Button ID="btnRemoveAll" class="btn newbnt btn-primary2" runat="server" OnClick="btnRemoveAll_Click" Text="Remove All" /><br />
                </div>
                <div class="col-xs-3">
                     <asp:ListBox ID="listspecialitySel" runat="server" SelectionMode="Multiple" class="form-control" style="height: 200px;">                             
                        </asp:ListBox>
                </div>
            </div>
           
            <div class="form-group">
                 <label class="control-label col-xs-3" for=""></label>
                 <div class="col-xs-3">
                      <div class="col-xs-6">
                 <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="JHCat" OnClick="btnSubmit_Click" class="btn btn-primary2"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           </div>
                     <div class="col-xs-6">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2 newbnt" />
               
                      </div>   </div>
            </div>
             <asp:Label ID="lblMessage" Visible="false" runat="server"/>
             <div class="form-group">
                  <asp:DataGrid ID="dgDoctortab" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="DoctorId" OnItemCommand="dgDoctorTab_ItemCommand" >

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
                    <asp:BoundColumn DataField="Name" HeaderText="Doctor Name"></asp:BoundColumn>
                     <asp:BoundColumn DataField="SpecialtyName" HeaderText="Specialty Name"></asp:BoundColumn>
                    
                   
                    <asp:TemplateColumn HeaderText="Edit">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/ed_copy.gif" CommandArgument='<%#Eval("DoctorId")%>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("DoctorId")%>' ImageUrl="../../images/del.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
            </asp:DataGrid>
            </div>
        </div>
    </div>
</div>





<script type="text/javascript">
    function DrpTabValidate() {
        if (document.getElementById('<%=listspecialityAvl.ClientID%>').selectedIndex == 0) {
            alert("Please select Specilty Name");
            return false;
        }
       
      
    }
</script>