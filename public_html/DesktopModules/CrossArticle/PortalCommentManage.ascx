<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.PortalCommentManage, App_Web_portalcommentmanage.ascx.6c70b780" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<table width="100%">
    <tr>
        <td align="center">
            <asp:LinkButton ID="lbtnAll" runat="server" resourcekey="lbtnAll" OnClick="lbtnAll_Click"></asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnUnAuthed" runat="server" resourcekey="lbtnUnAuthed" OnClick="lbtnUnAuthed_Click"></asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnPrivate" runat="server" resourcekey="lbtnPrivate" OnClick="lbtnPrivate_Click"></asp:LinkButton>&nbsp;&nbsp;
        </td>
        <td align="center">
            <asp:LinkButton ID="lbtnAdminHome" runat="server" resourcekey="lbtnAdminHome" CausesValidation="false" CssClass="CommandButton"
                OnClick="lbtnAdminHome_Click"></asp:LinkButton>&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                ForeColor="#333333" CssClass="Normal" DataKeyNames="Id" OnRowCommand="gvList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" Text='<%# Localization.GetString("NoRecords", LocalResourceFile) %>'
                        runat="server" CssClass="Normal"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="ArticleTitle" SortExpression="ArticleTitle"  HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblArticleTitle" runat="server" resourcekey="lblArticleTitle">Title</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblArticleTitleField" runat="server" Text='<%# Eval("ArticleTitle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comment Unit/Person" SortExpression="CreatedByUser" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblUser" runat="server" resourcekey="lblUser">Comment Unit/Person</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUserField" runat="server" Text='<%# Eval("CreatedUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mail" SortExpression="Mail" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblContact" runat="server" resourcekey="lblContact" >Contact</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblContactField" runat="server" Text='<%# Eval("Mail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Url" SortExpression="Url">
                        <HeaderTemplate>
                            <asp:Label ID="lblUrl" runat="server" resourcekey="lblUrl" HeaderStyle-HorizontalAlign="Center">Url</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUrlField" runat="server" Text='<%# Eval("Url") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comment" SortExpression="Comment" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblComment" runat="server" resourcekey="lblComment">Comment</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCommentField" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" SortExpression="CreatedDate" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblDate" runat="server" resourcekey="lblDate">Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDateField" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Require Private" SortExpression="IsPrivate" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblPrivate" runat="server" resourcekey="lblPrivate">Require Private</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkPrivate" runat="server" Checked='<%# Eval("IsPrivate") %>' Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Authed" SortExpression="Authed" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAuthed" runat="server" resourcekey="lblAuthed">Authed</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkAuthed" runat="server" Checked='<%# Eval("Authed") %>' Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderImageUrl="~/images/register.gif" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgAuthedComment" runat="server" CausesValidation="False" CommandName="Auth"
                                AlternateText='<%#Localization.GetString("imgAuthedComment", LocalResourceFile)%>'
                                ToolTip='<%#Localization.GetString("imgAuthedComment", LocalResourceFile)%>'
                                ImageUrl="~/images/view.gif" CommandArgument='<%# Eval("Id")%>' />
                            <asp:ImageButton ID="imgDeleteComment" runat="server" AlternateText='<%#Localization.GetString("imgDeleteComment", LocalResourceFile)%>'
                                ToolTip='<%#Localization.GetString("imgDeleteComment", LocalResourceFile)%>'
                                CommandArgument='<%# Eval("Id")%>' CausesValidation="False" CommandName="Del" OnClientClick="return confirm('Are you sure to delete this item?');" 
                                ImageUrl="~/images/delete.gif" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border:1px dotted #999999; size:1"/>
        </td>
    </tr>
    <tr>
        <td>
            <cross:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" OnPageChanged="ctlPagingControl_PageChanged">
            </cross:PagingControl>
        </td>
    </tr>
</table>
