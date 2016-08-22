<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.ArticleList, App_Web_articlelist_standard.ascx.267931e0" %>
<%@ Register TagPrefix="Cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<table width="100%" cellpadding="0" cellspacing="0" id="tblSearch" runat="server"
    visible='<%# ArticleListSettings.Content.ShowSearch %>'>
    <tr>
        <td colspan="4">
            &nbsp; &nbsp;
            <asp:Label ID="lblSearchPrefix" runat="server" resourcekey="lblSearchPrefix" CssClass="Normal"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="NormalTextBox" MaxLength="30"
                Columns="30"></asp:TextBox>&nbsp;
            <asp:LinkButton ID="lbtnSearch" runat="server" resourcekey="lbtnSearch" CssClass="CommandButton"
                BorderStyle="none" OnClick="lbtnSearch_Click"></asp:LinkButton>&nbsp; &nbsp;
            <asp:LinkButton ID="lbtnClear" runat="server" resourcekey="lbtnClear" CssClass="CommandButton"
                CausesValidation="False" OnClick="lbtnClear_Click"></asp:LinkButton>
        </td>
    </tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <td valign="top" align="left" height="<%=GetHeight()%>">
            <% =GetMarqueeBegin()%>
            <asp:DataList ID="dlArticle" runat="server" CssClass="Normal" RepeatColumns="<%#ArticleListSettings.Paging.ColCount %>"
                RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" Visible="false" >
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false">
                    </asp:Label>
                    <table width="100%" border="0" cellpadding="0" cellspacing="1">
                        <tr align="left">
                            <td width="1%" align="left">
                                <asp:HyperLink ID="hlImage" runat="server" Visible='<%#ArticleListSettings.Image.ShowImage %>'
                                    NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")))%>' Target="<%#ArticleListSettings.General.LinkTarget%>"
                                    rel="<%#GetLightBoxRel()%>" Title='<%#Convert.ToString(Eval("Title")) %>'>
                                    <%if (ArticleListSettings.Image.ForceImageWidth && ArticleListSettings.Image.ForceImageHeight)
                                      { %>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(ArticleListSettings.Image.ImageWidth)%>'
                                        Height='<%#Convert.ToInt32(ArticleListSettings.Image.ImageHeight)%>' Visible='<%#ArticleListSettings.Image.ShowImage %>'
                                        BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='imgArticle' ImageAlign="Left" />
                                    <%}
                                      else if (ArticleListSettings.Image.ForceImageWidth)
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(ArticleListSettings.Image.ImageWidth)%>'
                                        Visible='<%#ArticleListSettings.Image.ShowImage %>' BorderStyle="Solid" BorderWidth="1"
                                        BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                    <%}
                                      else if (ArticleListSettings.Image.ForceImageHeight)
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(ArticleListSettings.Image.ImageHeight)%>'
                                        Visible='<%#ArticleListSettings.Image.ShowImage %>' BorderStyle="Solid" BorderWidth="1"
                                        BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                    <% }
                                      else
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Visible='<%#ArticleListSettings.Image.ShowImage %>'
                                        BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
                                    <%} %>
                                </asp:HyperLink>
                            </td>
                            <td align="left" valign="top">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Normal" align="left">
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgPrefix" runat="server" ImageUrl='<%#GetPrefixImage() %>' Visible="<%#!ArticleListSettings.Image.ShowImage&&ArticleListSettings.Image.ShowPrefixImage %>" />
                                            <%if (ArticleListSettings.Content.ShowFeaturedField)
                                              { %>
                                            <asp:Image ID="Image5" runat="server" ImageUrl="~/DesktopModules/CrossArticle/images/hot.jpg"
                                                Visible='<%#Convert.ToBoolean(Eval("Featured")) %>' />
                                            <%} %>
                                            <%if (ArticleListSettings.Content.ShowTitle)
                                              { %>
                                            <asp:HyperLink CssClass="Normal" ID="hlTitle" runat="server" Text='<%# Server.HtmlDecode(GetShortenTitle(Convert.ToString(Eval("Title")))) %>'
                                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' rel="<%#GetLightBoxRel()%>"
                                                Target="<%#ArticleListSettings.General.LinkTarget%>" />
                                            <%} %>
                                            <%if (ArticleListSettings.Content.ShowCreatedDate)
                                              { %>
                                            <asp:Label ID="Label3" runat="server" Text='<%# "("+Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString()+")"%>' />
                                            <%} %>
                                            <%if (ArticleListSettings.Content.ShowRecommend)
                                              { %>
                                            <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossArticle/images/up.gif" />
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("UpVotes") %>' />&nbsp;
                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossArticle/images/down.gif" />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("DownVotes") %>' />&nbsp;
                                            <%} %>
                                        </td>
                                    </tr>
                                    <%if (ArticleListSettings.Content.ShowUserName)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName" />
                                            <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("UserName") %>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                                Target="<%#ArticleListSettings.General.LinkTarget%>" />&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <%} %>
                                    <tr align="left">
                                        <td>
                                            <%if (ArticleListSettings.Content.ShowAuthor)
                                              { %>
                                            <asp:Label ID="lblAuthor" runat="server" resourcekey="lblAuthor" />
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Author") %>' />&nbsp;&nbsp;
                                            <%} %>
                                            <%if (ArticleListSettings.Content.ShowSource)
                                              { %>
                                            <asp:Label ID="lblSource" runat="server" resourcekey="lblSource" />
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Source") %>' />
                                            <%} %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%if (ArticleListSettings.Content.ShowViews)
                                              { %>
                                            <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" />
                                            <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>' />
                                            <%} %>
                                            <%if (ArticleListSettings.Content.ShowRating)
                                              { %>
                                            <asp:Image ID="imgRating" runat="server" ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>'>
                                            </asp:Image>
                                            <%} %>
                                        </td>
                                    </tr>
                                    <%if (ArticleListSettings.Content.ShowSummary)
                                      { %>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<asp:Label ID="SummaryLabel" runat="server" Text='<%# GetShortenSummary(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Summary"))) %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <%} %>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:GridView ID="grArticle" runat="server" AutoGenerateColumns="False" Visible="False"
                CssClass="Normal" CellPadding="4" AllowSorting="True" ForeColor="#333333" GridLines="Both"
                OnDataBinding="grArticle_DataBinding" >
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlImage" runat="server" Visible='<%#ArticleListSettings.Image.ShowImage %>'
                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' Target="<%#ArticleListSettings.General.LinkTarget%>"
                                rel="<%#GetLightBoxRel()%>" Title='<%#Convert.ToString(Eval("Title")) %>'>
                                <%if (ArticleListSettings.Image.ForceImageWidth && ArticleListSettings.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(ArticleListSettings.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(ArticleListSettings.Image.ImageHeight)%>' Visible='<%#ArticleListSettings.Image.ShowImage %>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='imgArticle' ImageAlign="Left" />
                                <%}
                                  else if (ArticleListSettings.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(ArticleListSettings.Image.ImageWidth)%>'
                                    Visible='<%#ArticleListSettings.Image.ShowImage %>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                <%}
                                  else if (ArticleListSettings.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(ArticleListSettings.Image.ImageHeight)%>'
                                    Visible='<%#ArticleListSettings.Image.ShowImage %>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Visible='<%#ArticleListSettings.Image.ShowImage %>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
                                <%} %>
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Recommend" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image ID="Image6" runat="server" ImageUrl="~/DesktopModules/CrossArticle/images/up.gif" />
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("UpVotes") %>' />&nbsp;
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossArticle/images/down.gif" />
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("DownVotes") %>' />&nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblTitleHead" resourcekey="lblTitleHead" runat="server"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlTitle" runat="server" Text='<%# Server.HtmlDecode(GetShortenTitle(Convert.ToString(Eval("Title")))) %>'
                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' rel="<%#GetLightBoxRel()%>"
                                Target="<%#ArticleListSettings.General.LinkTarget%>"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UserName" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblUserNameHead" resourcekey="lblUserNameHead" runat="server"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlUserName" runat="server" Text='<%#Eval("UserName")%>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                Target="<%#ArticleListSettings.General.LinkTarget%>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Author" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAuthorHead" resourcekey="lblAuthorHead" runat="server">Author</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="AuthorLabel" runat="server" Text='<%#Eval("Author")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Source" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblSourceHead" resourcekey="lblSourceHead" runat="server">Source</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="SourceLabel" runat="server" Text='<%#Eval("Source")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rating" SortExpression="Rating" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblRatingHead" resourcekey="lblRatingHead" runat="server"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgRating" runat="server" Visible="<%#ArticleListSettings.Content.ShowRating %>"
                                ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>'></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Views" SortExpression="Views" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblViewsHead" resourcekey="lblViewsHead" runat="server">Views</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Featured" SortExpression="Featured" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblFeaturedHead" resourcekey="lblFeaturedHead" runat="server">Featured</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%#Convert.ToBoolean(Eval("Featured")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Summary" SortExpression="Summary" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblSummaryHead" resourcekey="lblSummaryHead" runat="server">Summary</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            &nbsp;&nbsp;<asp:Label ID="SummaryLabel" runat="server" Text='<%# GetShortenSummary(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Summary")))%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CreatedDate" SortExpression="CreatedDate" HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDateHead" resourcekey="lblCreatedDateHead" runat="server">Created Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <%=GetMarqueeEnd()%>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <asp:HyperLink ID="hlRss" Visible="<%#ArticleListSettings.Rss.DisplayRss %>" runat="server"
                ImageUrl="~/DesktopModules/CrossArticle/Images/feed-icon-12x12.gif" CssClass="NormalBold"
                Target="_blank"></asp:HyperLink>
            <asp:HyperLink ID="hlMoreArticles" Visible="<%#ArticleListSettings.MoreArticle.ShowMoreArticles %>"
                runat="server" resourcekey="MoreArticles" Text="More Articles..." CssClass="NormalBold"></asp:HyperLink>
        </td>
    </tr>
</table>
<table width="100%" cellpadding="1" cellspacing="1" runat="server" id="tblPaging"
    visible="false">
    <tr valign="top">
        <td width="100%">
             <hr style="border:1px dotted #999999; size:1"/>
        </td>
    </tr>
    <tr valign="top">
        <td>
            <Cross:PagingControl ID="ctlPagingControl" runat="server" OnPageChanged="ctlPagingControl_PageChanged"
                Mode="PostBack"></Cross:PagingControl>
        </td>
    </tr>
</table>
