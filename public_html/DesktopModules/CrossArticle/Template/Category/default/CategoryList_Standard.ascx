<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.CategoryList, App_Web_categorylist_standard.ascx.2510342e" %>
<asp:TreeView ID="tvCategory" runat="server" NodeIndent="10" PathSeparator="/" ExpandDepth="0"
    OnSelectedNodeChanged="tvCategory_SelectedNodeChanged">
    <ParentNodeStyle Font-Bold="False" />
    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
        VerticalPadding="0px" />
    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
        NodeSpacing="0px" VerticalPadding="2px" />
</asp:TreeView>
<asp:DataList ID="dlCategory" runat="server" Visible="true" CssClass="Normal" RepeatColumns="<%#CategorySettings.General.CategoryColCount %>" 
    RepeatDirection="Horizontal" RepeatLayout="table">
    <ItemTemplate>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr align="left">
                <td width="1%" align="left">
                    <asp:HyperLink ID="hlImage" runat="server" Visible='<%# CategorySettings.General.ShowCategoryImage %>'
                        NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' Target="<%# CategorySettings.General.Target%>">
                        <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(CategorySettings.General.CategoryImageWidth)%>'
                            Visible='<%#CategorySettings.General.ShowCategoryImage%>' BorderStyle="Solid"
                            BorderWidth="1" BorderColor="DarkGray" ID='imgCategory' ImageAlign="Left" /></asp:HyperLink>
                </td>
            </tr>
            <tr align="left">
                <td align="left" valign="top">
                    <%if (CategorySettings.General.ShowArticleCount){ %>
                      
                    <asp:HyperLink CssClass="Normal" ID="lnkName" runat="server" Text='<%# Convert.ToString(Eval("Name")) +"(" +Convert.ToString(Eval("ArticleCounts"))+")" %>'
                        Target="<%# CategorySettings.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>'  />
                    <%}
                      else
                      { %>
                    <asp:HyperLink CssClass="Normal" ID="HyperLink1" runat="server" Text='<%# Convert.ToString(Eval("Name")) %>'
                        Target="<%# CategorySettings.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' />
                    <%} %>
                    <asp:HyperLink CssClass="Normal" ID="lnkRss" ImageUrl="~/desktopmodules/CrossArticle/Images/feed-icon-12x12.gif"
                        runat="server" Visible="<%#CategorySettings.General.DisplayRss %>" Target="_blank"
                        NavigateUrl='<%#GetRssUrl(Convert.ToString(Eval("Id"))) %>' />
                </td>
            </tr>
            <%if (CategorySettings.General.ShowCategoryDescription)
              { %>
            <tr align="left">
                <td align="left" valign="top">
                    <asp:Label CssClass="Normal" runat="server" Text='<%#Convert.ToString(Eval("Description"))%>' />
                </td>
            </tr>
            <%}%>
        </table>
    </ItemTemplate>
</asp:DataList>
