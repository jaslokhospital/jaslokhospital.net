<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.SearchSettings, App_Web_searchsettings.ascx.6c70b780" %>
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
        <td class="Normal" width="200">
            <dnn:label ID="plInputWidth" runat="server"  ControlName="txtInputWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtInputWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtInputWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal" width="200">
            <dnn:label ID="plShowCategory" runat="server"  ControlName="chkShowCategory">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCategory" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="Normal" width="200">
            <dnn:label ID="plCategoryWidth" runat="server"  ControlName="txtCategoryWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtCategoryWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtCategoryWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal" width="200">
            <dnn:label ID="plBreakOnCategory" runat="server"  ControlName="chkBreakOnCategory">
            </dnn:label>
        </td>
        <td valign="top">
            <asp:CheckBox ID="chkBreakOnCategory" CssClass="Normal" runat="server"  />
        </td>
    </tr>
     <tr>
        <td class="Normal" width="300">
            <dnn:label ID="plShowAuthorList" runat="server"  ControlName="chkShowAuthorList">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuthorList" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="Normal" width="300">
            <dnn:label ID="plAuthorListWidth" runat="server"  ControlName="txtAuthorListWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtAuthorListWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtAuthorListWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal" width="300">
            <dnn:label ID="plBreakOnAuthorList" runat="server"  ControlName="chkBreakOnAuthorList">
            </dnn:label>
        </td>
        <td valign="top">
            <asp:CheckBox ID="chkBreakOnAuthorList" CssClass="Normal" runat="server"  />
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdCancel" OnClick="cmdCancel_Click"
        resourcekey="cmdCancel" runat="server" BorderStyle="none" Text="Cancel" CausesValidation="False"></asp:LinkButton>&nbsp;
</p>
