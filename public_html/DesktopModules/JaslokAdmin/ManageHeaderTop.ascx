<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageHeaderTop.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageHeaderTop" %>
<style>
    .headerstyle {text-align:center;}
    .Itemstyle {padding:5px 8px;}
</style>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="col-md-12">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </div>
    <asp:GridView ID="gvContent" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" ShowFooter="true" Style="margin-left: 50px" Width="1049px" OnRowCancelingEdit="gvContent_RowCancelingEdit"
        OnRowDeleting="gvContent_RowDeleting" OnRowEditing="gvContent_RowEditing" OnRowUpdating="gvContent_RowUpdating" OnPageIndexChanging="gvContent_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderText="Label" HeaderStyle-Width="30%" HeaderStyle-CssClass="headerstyle" ItemStyle-CssClass="Itemstyle">
                <EditItemTemplate>
                    <asp:TextBox ID="txtkey" AutoPostBack="false" Width="100%" runat="server" Text='<%#DataBinder.Eval(Container. DataItem,"key") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text='<%#DataBinder.Eval(Container. DataItem,"key") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Content" HeaderStyle-Width="35%" HeaderStyle-CssClass="headerstyle" ItemStyle-CssClass="Itemstyle">
                <EditItemTemplate>
                    <asp:TextBox ID="txtvalue" AutoPostBack="false" Width="100%" runat="server" Text='<%#DataBinder.Eval(Container. DataItem,"value") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblvalue" runat="server" Text='<%#DataBinder.Eval(Container. DataItem,"value") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Alias" HeaderStyle-Width="15%" HeaderStyle-CssClass="headerstyle" ItemStyle-CssClass="Itemstyle">               
                <ItemTemplate>
                    <asp:Label ID="lblAlias" runat="server" Text='<%#DataBinder.Eval(Container. DataItem,"alias") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="headerstyle">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False"
                        CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this record');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" ShowHeader="true" HeaderText="Action" CausesValidation="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="headerstyle" />
            <%--<asp:CommandField ShowDeleteButton="true" CausesValidation="false" />--%>
        </Columns>
        <HeaderStyle BackColor="#666666" Font-Names="Cambria" ForeColor="White"
            Height="30px" />
        <RowStyle Font-Names="Calibri" />
    </asp:GridView>
</div>
