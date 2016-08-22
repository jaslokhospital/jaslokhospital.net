<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.TagListSettings, App_Web_taglistsettings.ascx.6c70b780" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2" width="95%" border="0" align="center">
    <tr>
        <td class="Normal" width="200">
            <dnn:label ID="plViewTemplate" runat="server"  ControlName="ddlViewTemplate">
            </dnn:label>
        </td>
        <td valign="top">
            <asp:DropDownList ID="ddlViewTemplate" CssClass="Normal" runat="server" Width="60%">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="Normal" width="200">
            <dnn:label ID="plArticleListPage" runat="server"  ControlName="ddlArticleListPage">
            </dnn:label>
        </td>
        <td valign="top">
            <asp:DropDownList ID="ddlArticleListPage" CssClass="Normal" DataValueField="TabId"
                DataTextField="IndentedTabName" runat="server" Width="60%">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="Normal" valign="top" width="200" height="27">
            <dnn:label ID="plLinkTarget" ControlName="ddlLinkTarget"  runat="server">
            </dnn:label>
        </td>
        <td valign="top" align="left" height="27">
            <asp:DropDownList ID="ddlLinkTarget" runat="server" CssClass="NormalTextBox">
                <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self">_Self</asp:ListItem>
                <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank">_Blank</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="Normal" valign="top" width="200" height="27">
            <dnn:label ID="plSortFiled" ControlName="ddlSortFiled"  runat="server">
            </dnn:label>
        </td>
        <td valign="top" align="left" height="27">
            <asp:DropDownList ID="ddlSortFiled" runat="server" CssClass="NormalTextBox">
                <asp:ListItem Value="TagName" resourcekey="li_SortFiled_TagName">TagName</asp:ListItem>
                <asp:ListItem Value="ArticleCounts" resourcekey="li_SortFiled_ArticleCounts">ArticleCounts</asp:ListItem>
                 <asp:ListItem Value="CreatedDate" resourcekey="li_SortFiled_CreatedDate">CreatedDate</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plRowCount" runat="server"  ControlName="txtRowCount">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRowCount" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRowCount"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plColCount" runat="server"  ControlName="txtColCount">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtColCount" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtColCount"></asp:RegularExpressionValidator>
                    </td>
                </tr>
     <tr>
        <td class="Normal" width="200">
            <dnn:label ID="plDisplayArticleCounts" runat="server"  ControlName="chkDisplayArticleCounts">
            </dnn:label>
        </td>
        <td valign="top">
            <asp:checkbox ID="chkDisplayArticleCounts"  runat="server" />
        </td>
    </tr>
    <tr>
        <td class="Normal" width="200">
            <dnn:label ID="plDisplayRss" runat="server"  ControlName="chkDisplayRss">
            </dnn:label>
        </td>
        <td valign="top">
            <asp:checkbox ID="chkDisplayRss"  runat="server" />
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdCancel" OnClick="cmdCancel_Click"
        resourcekey="cmdCancel" runat="server" BorderStyle="none" Text="Cancel" CausesValidation="False"></asp:LinkButton>&nbsp;
</p>