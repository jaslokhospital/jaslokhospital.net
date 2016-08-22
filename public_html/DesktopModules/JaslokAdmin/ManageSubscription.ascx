<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageSubscription.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageSubscription" %>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="right_part">
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search"></asp:TextBox> <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </div>
            <div class="form-group">
               <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger; color:red"></asp:Label>
            <asp:DataGrid ID="dgSubscription" runat="server" AutoGenerateColumns="False" Width="100%" PageSize="10"
                AllowPaging="True" CssClass="normaltable22user" DataKeyField="Id" OnItemCommand="dgSubscription_ItemCommand" OnPageIndexChanged="dgSubscription_PageIndexChanged">
                 <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>
                    <asp:TemplateColumn HeaderText="Sr. No">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# Container.ItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="email" HeaderText="Email"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("Id") %>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
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