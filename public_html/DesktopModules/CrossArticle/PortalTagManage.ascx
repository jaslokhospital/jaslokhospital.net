<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.PortalTagManage, App_Web_portaltagmanage.ascx.6c70b780" %>
<table width="90%" cellpadding="1" cellspacing="1" class="Normal" align="center">
    <tr>
        <td>
            <asp:TextBox ID="txtTag" CssClass="NormalTextBox" Width="250" runat="server" />
            <asp:RequiredFieldValidator ID="valRequired" runat="server" Text="Required." ControlToValidate="txtTag"
                Display="Dynamic" ErrorMessage="Required." resourcekey="valRequired" CssClass="NormalRed"></asp:RequiredFieldValidator>&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnAdd" runat="server" resourcekey="lbtnAdd" CausesValidation="true"
                OnClick="lbtnAdd_Click"></asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnAdminHome" runat="server" resourcekey="lbtnAdminHome" CausesValidation="false"
                OnClick="lbtnAdminHome_Click"></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                PageSize="30" DataKeyNames="Id" ForeColor="#333333" CssClass="Normal" DataSourceID="a1"
                AllowPaging="True" OnRowDeleting="gvList_RowDeleting">
                <Columns>
                    <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="false">
                        <HeaderTemplate>
                            <asp:Label ID="lblId" runat="server" resourcekey="lblId"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblIdField" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tag" SortExpression="Tag" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblTag" runat="server" resourcekey="lblTag"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTagField" runat="server" Text='<%# Eval("Tag") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" SortExpression="CreatedDate">
                        <HeaderTemplate>
                            <asp:Label ID="lblDate" runat="server" resourcekey="lblDate">Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDateField" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ArticleCounts" SortExpression="ArticleCounts">
                        <HeaderTemplate>
                            <asp:Label ID="lblArticleCounts" runat="server" resourcekey="lblArticleCounts"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblArticleCountsField" runat="server" Text='<%# Eval("ArticleCounts") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderImageUrl="~/images/register.gif">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDeleteTag" runat="server" AlternateText='<%#Localization.GetString("imgDeleteTag", LocalResourceFile)%>'
                                ToolTip='<%#Localization.GetString("imgDeleteTag", LocalResourceFile)%>' CommandArgument='<%#Eval("Id") %>'
                                CausesValidation="False" CommandName="Delete" ImageUrl="~/images/delete.gif" />
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
                <PagerSettings FirstPageImageUrl="~/DesktopModules/CrossArticle/images/First.gif"
                    LastPageImageUrl="~/DesktopModules/CrossArticle/images/Last.gif" NextPageImageUrl="~/DesktopModules/CrossArticle/images/Next1.gif"
                    PreviousPageImageUrl="~/DesktopModules/CrossArticle/images/Previous.gif" Mode="NextPreviousFirstLast" />
            </asp:GridView>
        </td>
    </tr>
</table>
<asp:ObjectDataSource ID="a1" TypeName="Cross.Modules.Article.Business.TagController"
    runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListByPortals"
    OnSelecting="a1_Selecting" DeleteMethod="Delete" DataObjectTypeName="Cross.Modules.Article.Business.TagInfo">
    <SelectParameters>
        <asp:Parameter Name="portalId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
