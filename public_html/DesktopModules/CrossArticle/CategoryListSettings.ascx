<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.CategoryListSettings, App_Web_categorylistsettings.ascx.6c70b780" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<table cellspacing="0" cellpadding="2" width="95%" summary="CrossArticle Category Settings Design Table"
    align="center" class="Normal">
    <tr>
        <td valign="top" colspan="2">
            <dnn:sectionhead ID="secGeneral" runat="server" Section="tblGeneral" ResourceKey="secGeneral"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblGeneral" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td width="200">
                        <dnn:label ID="plCategoryTemplate" runat="server" ControlName="ddlCategoryTemplate">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlCategoryTemplate" CssClass="Normal" runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="200">
                        <dnn:label ID="plArticleListPage" runat="server" ControlName="ddlArticleListPage">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlArticleListPage" CssClass="Normal" DataValueField="TabId"
                            DataTextField="IndentedTabName" runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="200">
                        <dnn:label ID="plLinkTarget" ControlName="ddlLinkTarget" runat="server"></dnn:label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlLinkTarget" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self">_Self</asp:ListItem>
                            <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank">_Blank</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="200">
                        <dnn:label ID="plDisplayType" runat="server" ControlName="ddlDisplayType"></dnn:label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlDisplayType" CssClass="Normal" runat="server" Width="60%">
                            <asp:ListItem Value="List" Selected="True" Text="List" resourcekey="li_DisplayType_List" />
                            <asp:ListItem Value="Tree" Text="Tree" resourcekey="li_DisplayType_Tree" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="200">
                        <dnn:label ID="plShowArticleCount" runat="server" ControlName="chkShowArticleCount">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBox ID="chkShowArticleCount" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plDisplayRss" runat="server" ControlName="chkDisplayRss"></dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBox ID="chkDisplayRss" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secTree" runat="server" Section="tblTree" ResourceKey="secTree"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblTree" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td width="200">
                        <dnn:label ID="plTreeViewImageSet" runat="server" ControlName="ddlTreeViewImageSet">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlTreeViewImageSet" CssClass="Normal" runat="server" Width="60%">
                            <asp:ListItem Value="Arrows" Text="Arrows" />
                            <asp:ListItem Value="BulletedList" Text="BulletedList" />
                            <asp:ListItem Value="BulletedList2" Text="BulletedList2" />
                            <asp:ListItem Value="BulletedList3" Text="BulletedList3" />
                            <asp:ListItem Value="BulletedList4" Text="BulletedList4" />
                            <asp:ListItem Value="Contacts" Text="Contacts" />
                            <asp:ListItem Value="Events" Text="Events" />
                            <asp:ListItem Value="Faq" Text="Faq" />
                            <asp:ListItem Value="Inbox" Text="Inbox" />
                            <asp:ListItem Value="Msdn" Text="Msdn" />
                            <asp:ListItem Value="News" Text="News" />
                            <asp:ListItem Value="Simple" Text="Simple" />
                            <asp:ListItem Value="Simple2" Text="Simple2" />
                            <asp:ListItem Value="WindowsHelp" Text="WindowsHelp" />
                            <asp:ListItem Value="XPFileExplorer" Text="XPFileExplorer" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="200">
                        <dnn:label ID="plTreeExpandDepth" runat="server" ControlName="ddlTreeExpandDepth">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlTreeExpandDepth" runat="server" Width="60%">
                            <asp:ListItem Value="-1" Text="All" resourcekey="li_TreeExpandDepth_All" />
                            <asp:ListItem Value="0" Text="0" />
                            <asp:ListItem Value="1" Text="1" />
                            <asp:ListItem Value="2" Text="2" />
                            <asp:ListItem Value="3" Text="3" />
                            <asp:ListItem Value="4" Text="4" />
                            <asp:ListItem Value="5" Text="5" />
                            <asp:ListItem Value="6" Text="6" />
                            <asp:ListItem Value="7" Text="7" />
                            <asp:ListItem Value="8" Text="8" />
                            <asp:ListItem Value="9" Text="9" />
                            <asp:ListItem Value="10" Text="10" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secList" runat="server" Section="tblList" ResourceKey="secList"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblList" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td width="200">
                        <dnn:label ID="plCategory" runat="server" ControlName="ctlCategories"></dnn:label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbCategory_SelectedIndexChanged">
                            <asp:ListItem Value="All" resourcekey="li_Category_All" />
                            <asp:ListItem Value="Customize" resourcekey="li_Category_Customize" />
                        </asp:RadioButtonList>
                        <br />
                        <asp:TreeView ID="tvCategory" runat="server" ImageSet="XPFileExplorer" NodeIndent="10"
                            PathSeparator="/" ShowCheckBoxes="All" ExpandDepth="0">
                            <ParentNodeStyle Font-Bold="False" />
                            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                VerticalPadding="0px" />
                            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                NodeSpacing="0px" VerticalPadding="2px" />
                        </asp:TreeView>
                    </td>
                </tr>
                <tr>
                    <td width="200">
                        <dnn:label ID="plShowCategoryImage" runat="server" ControlName="chkShowCategoryImage">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowCategoryImage" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td width="200">
                        <dnn:label ID="plShowCategoryDescription" runat="server" ControlName="chkShowCategoryDescription">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowCategoryDescription" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td width="200">
                        <dnn:label ID="plCategoryImageWidth" runat="server" ControlName="txtCategoryImageWidth">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCategoryImageWidth" runat="server" Columns="4"></asp:TextBox>px
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtCategoryImageWidth"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td width="200">
                        <dnn:label ID="plCategoryCol" runat="server" ControlName="txtCategoryColCount"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCategoryColCount" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtCategoryColCount"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdCancel" OnClick="cmdCancel_Click"
        resourcekey="cmdCancel" runat="server" BorderStyle="none" Text="Cancel" CausesValidation="False"></asp:LinkButton>&nbsp;
</p>
