<%@ control language="C#" inherits="Cross.Modules.Article.View.Admin, App_Web_admin.ascx.6c70b780" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<asp:Label ID="lblTrialTips" runat="server"  Visible="false" resourcekey="lblTrialTips"
    CssClass="Normal"></asp:Label>
<asp:Label ID="lblNoPermission" runat="server" resourcekey="lblNoPermission" Visible="true"
    CssClass="NormalRed"></asp:Label>
 
<table class="normal" id="tblAdmin" cellspacing="2" cellpadding="2" width="90%" align="center"
    visible="false" runat="server">
    <tr id="trPortalAdmin" runat="server">
        <td valign="top" align="left" width="100%">
            <dnn:SectionHead ID="secAdministrator" CssClass="SubHead" runat="server" Section="tblAdministrator"
                align="left" ResourceKey="secAdministrator" IncludeRule="True" IsExpanded="true">
            </dnn:SectionHead>
            <table style="width: 90%;" align="center" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblAdministrator">
                <tbody>
                    <tr runat="server" id="trPortalSettings" visible="false">
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnPortalSettings" runat="server" resourcekey="ibtnPortalSettings"
                                ImageUrl="~/DesktopModules/CrossArticle/images/GeneralSettings.gif" OnClick="ibtnPortalSettings_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnPortalSettings" runat="server" resourcekey="lbtnPortalSettings"
                                CssClass="NormalBold" OnClick="lbtnPortalSettings_Click"></asp:LinkButton><br />
                            <asp:Label ID="lblPortalSettings" runat="server" resourcekey="lblPortalSettings"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trCategoryManage" visible="false">
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnCategoryManage" runat="server" resourcekey="ibtnCategoryManage"
                                ImageUrl="~/DesktopModules/CrossArticle/images/Category.gif" OnClick="ibtnCategoryManage_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnCategoryManage" runat="server" resourcekey="lbtnCategoryManage"
                                CssClass="NormalBold" OnClick="lbtnCategoryManage_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblCategoryManage" runat="server" resourcekey="lblCategoryManage"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                     <tr runat="server" id="trImportFromAnnouncement" visible="false">
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnImportFromAnnouncement" runat="server" resourcekey="ibtnImportFromAnnouncement"
                                ImageUrl="~/DesktopModules/CrossArticle/images/Import.gif" OnClick="ibtnImportFromAnnouncement_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnImportFromAnnouncement" runat="server" resourcekey="lbtnImportFromAnnouncement"
                                CssClass="NormalBold" OnClick="lbtnImportFromAnnouncement_Click"></asp:LinkButton><br />
                            <asp:Label ID="lblImportFromAnnouncement" runat="server" resourcekey="lblImportFromAnnouncement"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                   
                    <tr runat="server" id="trPortalArticleManage" visible="false">
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnPortalArticleManage" runat="server" resourcekey="ibtnPortalArticleManage"
                                ImageUrl="~/DesktopModules/CrossArticle/images/Article.gif" OnClick="ibtnPortalArticleManage_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnPortalArticleManage" runat="server" resourcekey="lbtnPortalArticleManage"
                                CssClass="NormalBold" OnClick="lbtnPortalArticleManage_Click"></asp:LinkButton><br />
                            <asp:Label ID="lblPortalArticleManage" runat="server" resourcekey="lblPortalArticleManage"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr runat="server" id="trPortalCommentManage" visible="false">
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnPortalCommentManage" runat="server" resourcekey="ibtnPortalCommentManage"
                                ImageUrl="~/DesktopModules/CrossArticle/images/Comment.gif" OnClick="ibtnPortalCommentManage_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnPortalCommentManage" runat="server" resourcekey="lbtnPortalCommentManage"
                                CssClass="NormalBold" OnClick="lbtnPortalCommentManage_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblPortalCommentManage" runat="server" resourcekey="lblPortalCommentManage"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                     <tr runat="server" id="trPortalAuthorManage" visible="false">
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnPortalAuthorManage" runat="server" resourcekey="ibtnPortalAuthorManage"
                                ImageUrl="~/DesktopModules/CrossArticle/images/AuthorList.gif" OnClick="ibtnPortalAuthorManage_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnPortalAuthorManage" runat="server" resourcekey="lbtnPortalAuthorManage"
                                CssClass="NormalBold" OnClick="lbtnPortalAuthorManage_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblPortalAuthorManage" runat="server" resourcekey="lblPortalAuthorManage"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                      <tr runat="server" id="trPortalTagManage" visible="false">
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnPortalTagManage" runat="server" resourcekey="ibtnPortalTagManage"
                                ImageUrl="~/DesktopModules/CrossArticle/images/Tag.gif" OnClick="ibtnPortalTagManage_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnPortalTagManage" runat="server" resourcekey="lbtnPortalTagManage"
                                CssClass="NormalBold" OnClick="lbtnPortalTagManage_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblPortalTagManage" runat="server" resourcekey="lblPortalTagManage"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr id="trUserAdmin" runat="server" visible="false">
        <td valign="top" align="left" width="100%">
            <dnn:SectionHead ID="secUser" CssClass="SubHead" runat="server" Section="tblUser"
                align="left" ResourceKey="secUser" IncludeRule="True" IsExpanded="true"></dnn:SectionHead>
            <table style="width: 90%;" align="center" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblUser">
                <tbody>
                 <tr runat="server" id="trUserBiographyManage">
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnUserBiographyManage" runat="server" resourcekey="ibtnUserBiographyManage"
                                ImageUrl="~/DesktopModules/CrossArticle/images/Author.gif" OnClick="ibtnUserBiographyManage_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnUserBiographyManage" runat="server" resourcekey="lbtnUserBiographyManage"
                                CssClass="NormalBold" OnClick="lbtnUserBiographyManage_Click"></asp:LinkButton><br />
                            <asp:Label ID="lblUserBiographyManage" runat="server" resourcekey="lblUserBiographyManage"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trUserFileManager">
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnUserFileManager" runat="server" resourcekey="ibtnUserFileManager"
                                ImageUrl="~/DesktopModules/CrossArticle/images/FileManager.gif" OnClick="ibtnUserFileManager_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnUserFileManager" runat="server" resourcekey="lbtnUserFileManager"
                                CssClass="NormalBold" OnClick="lbtnUserFileManager_Click"></asp:LinkButton><br />
                            <asp:Label ID="lblUserFileManager" runat="server" resourcekey="lblUserFileManager"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnUserArticleManage" runat="server" resourcekey="ibtnUserArticleManage"
                                ImageUrl="~/DesktopModules/CrossArticle/images/Article.gif" OnClick="ibtnUserArticleManage_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnUserArticleManage" runat="server" resourcekey="lbtnUserArticleManage"
                                CssClass="NormalBold" OnClick="lbtnUserArticleManage_Click"></asp:LinkButton><br />
                            <asp:Label ID="lblUserArticleManage" runat="server" resourcekey="lblUserArticleManage"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="left">
                            <asp:ImageButton ID="ibtnUserCommentManage" runat="server" resourcekey="ibtnUserCommentManage"
                                ImageUrl="~/DesktopModules/CrossArticle/images/Comment.gif" OnClick="ibtnUserCommentManage_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnUserCommentManage" runat="server" resourcekey="lbtnUserCommentManage"
                                CssClass="NormalBold" OnClick="lbtnUserCommentManage_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblUserCommentManage" runat="server" resourcekey="lblUserCommentManage"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td class="Normal" valign="top" align="center" width="100%">
            &nbsp;
        </td>
    </tr>
</table>
