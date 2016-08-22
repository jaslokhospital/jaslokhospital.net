<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageSpecialtyTabMapping.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageSpecialtyTabMapping" %>

<script type="text/javascript">
    function DrpTabValidate() {
        if (document.getElementById('<%=lbSpecialtytabs.ClientID%>').selectedIndex == -1) {
            alert("Please select atleast one tabs");
            return false;
        }
    }
</script>
<table cellpadding="4" cellspacing="4" width="100%">
   
    <tr>
        <td colspan="2"></td>
    </tr>
    <tr>
        <td colspan="2">
            <table class="normaltable" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="normaltableheadercellnewwithoutbold">Specialty Category<span style="color: red">*</span>
                    </td>
                    <td class="normaltablecellnewwithoutbold">
                        <asp:DropDownList runat="server" ID="drpspecialCategory" AutoPostBack="true"  OnSelectedIndexChanged="drpspecialCategory_SelectedIndexChanged">
                            <Items>
                               <asp:ListItem>--Select--</asp:ListItem>
                            </Items>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvDrpspecialCategory" runat="server" ErrorMessage="Please select specialty category" ControlToValidate="drpspecialCategory" InitialValue="0"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>     
                       
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="normaltableheadercellnewwithoutbold">Specialty<span style="color: red">*</span>
                    </td>
                    <td class="normaltablecellnewwithoutbold">
                        <asp:DropDownList runat="server" ID="drpSpecilty"  Enabled="false">
                            <Items>
                               <asp:ListItem>--Select--</asp:ListItem>
                            </Items>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvdrpSpecilty" runat="server" ErrorMessage="Please select specialty name" ControlToValidate="drpSpecilty" InitialValue="0"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>  
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="normaltableheadercellnewwithoutbold">Specialty Tabs<span style="color: #ff0000; font-size: 13px">*</span>
                    </td>                   
                    <td class="normaltablecellnewwithoutbold">
                         <asp:ListBox ID="lbSpecialtytabs" runat="server" SelectionMode="Multiple">
                           
                         </asp:ListBox>
                           <asp:RequiredFieldValidator ID="rfvlbSpecialtytabs" runat="server" ErrorMessage="Please select specialty Tabs" ControlToValidate="lbSpecialtytabs" InitialValue="0"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>     
                       
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;" class="normaltableheadercellnewwithoutbold">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="JHCat" OnClientClick="return DrpTabValidate();"  OnClick="btnSubmit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
     <tr>
        <div>
            <asp:Label ID="lblMessage" Visible="false" runat="server"/>
        </div>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
             <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
            <asp:DataGrid ID="dgSpecialtyTabs" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="SpecialtyId" OnItemCommand="dgSpecialtyTab_ItemCommand" OnPageIndexChanged="dgSpecialtyTabs_PageIndexChanging" EmptyDataText="No records has been added.">

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
                    <asp:BoundColumn DataField="CategoryName" HeaderText="Category Name"></asp:BoundColumn>
                     <asp:BoundColumn DataField="SpecialtyName" HeaderText="Specialty Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="TabsName" HeaderText="TabsName"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Edit">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("SpecialtyId")%>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                   <%-- <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" ImageUrl="images/del.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>--%>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
            </asp:DataGrid>
        </td>
    </tr>
</table>