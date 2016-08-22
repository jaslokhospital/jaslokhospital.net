<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.TagList, App_Web_taglist_standard.ascx.171f189e" %>
<asp:DataList ID="dlTag" runat="server"  CssClass="Normal" RepeatColumns="<%#TagListSettings.General.ColCount %>" >
    <ItemTemplate>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr align="left">
                <td align="left" valign="top">
                    <%if (TagListSettings.General.DisplayArticleCounts)
                      { %>
                    <asp:HyperLink CssClass="Normal" ID="lnkName" runat="server" Text='<%# Convert.ToString(Eval("Tag")) +"(" +Convert.ToString(Eval("ArticleCounts"))+")" %>'
                        Target="<%# TagListSettings.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' />
                    <%}
                      else
                      { %>
                    <asp:HyperLink CssClass="Normal" ID="HyperLink1" runat="server" Text='<%# Convert.ToString(Eval("Tag")) %>'
                        Target="<%# TagListSettings.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' />
                    <%} %>               
                    <asp:HyperLink CssClass="Normal" ID="lnkRss"  ImageUrl="~/desktopmodules/CrossArticle/Images/feed-icon-12x12.gif" runat="server" Visible="<%#TagListSettings.General.DisplayRss %>"
                        Target="_blank" NavigateUrl='<%#GetRssUrl(Convert.ToString(Eval("Id"))) %>' />
                  
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>