<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.Author, App_Web_author_standard.ascx.7a894b37" %>
<asp:DataList ID="dlAuthor" runat="server"  CssClass="Normal" RepeatColumns="<%#AuthorSettings.General.ColCount %>" >
    <ItemTemplate>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr align="left" valign="top">
                <td align="left" valign="top"  style="white-space:nowrap">
                 <%if (AuthorSettings.General.DisplayAvatar)
                      { %>
                    <asp:Image ID="imgAvatar" runat="server"  ImageUrl='<%#GetGravatarUrl(Eval("AvatarEmail").ToString(),"32") %>' ImageAlign="AbsMiddle"></asp:Image>
                    <%}%>   
                        
                    <%if (AuthorSettings.General.DisplayArticleCounts)
                      { %>
                    <asp:HyperLink CssClass="Normal" ID="lnkName" runat="server" Text='<%# Convert.ToString(Eval("DisplayName")) +"(" +Convert.ToString(Eval("ArticleCounts"))+")" %>'
                        Target="<%# AuthorSettings.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("UserId"))) %>' />
                    <%}
                      else
                      { %>
                    <asp:HyperLink CssClass="Normal" ID="HyperLink1" runat="server" Text='<%# Convert.ToString(Eval("DisplayName")) %>'
                        Target="<%# AuthorSettings.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("UserId"))) %>' />
                    <%} %>               
                    <asp:HyperLink CssClass="Normal" ID="lnkRss"  ImageUrl="~/desktopmodules/CrossArticle/Images/feed-icon-12x12.gif" runat="server" Visible="<%#AuthorSettings.General.DisplayRss %>"
                        Target="_blank" NavigateUrl='<%#GetRssUrl(Convert.ToString(Eval("UserId"))) %>' />
                  
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>