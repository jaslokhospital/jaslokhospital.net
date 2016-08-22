<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.ArticleDetailSettings, App_Web_articledetailsettings.ascx.6c70b780" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2" width="95%" border="0">
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDetailTemplate" runat="server" ControlName="ddlDetailTemplate">
            </dnn:label>
        </td>
        <td valign="top">
            <asp:DropDownList ID="ddlDetailTemplate" CssClass="normal" runat="server" Width="60%">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayTitle" runat="server" ControlName="chkDisplayTitle"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayTitle" runat="server"></asp:CheckBox>
        </td>
    </tr>
    
     <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayImage" runat="server" ControlName="chkDisplayImage"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayImage" runat="server"></asp:CheckBox>
        </td>
    </tr>
    
    
      <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plImageWidth" runat="server" ControlName="txtImageWidth"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtImageWidth" runat="server" Columns="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtImageWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
  
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayUserName" runat="server" ControlName="chkDisplayUserName">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayUserName" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayCreatedDate" runat="server" ControlName="chkDisplayCreatedDate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayCreatedDate" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayAuthor" runat="server" ControlName="chkDisplayAuthor">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayAuthor" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayAuthorAvatar" runat="server" ControlName="chkDisplayAuthorAvatar">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayAuthorAvatar" runat="server"></asp:CheckBox>
        </td>
    </tr>
      <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayAuthorBiography" runat="server" ControlName="chkDisplayAuthorBiography">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayAuthorBiography" runat="server"></asp:CheckBox>
        </td>
    </tr>
    
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplaySource" runat="server" ControlName="chkDisplaySource">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplaySource" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayTags" runat="server" ControlName="chkDisplayTags"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayTags" runat="server"></asp:CheckBox>
        </td>
    </tr>
     <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plTagsPerRow" runat="server" ControlName="txtTagsPerRow">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtTagsPerRow" runat="server" Columns="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtTagsPerRow"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplaySummary" runat="server" ControlName="chkDisplaySummary">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplaySummary" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayArticle" runat="server" ControlName="chkDisplayArticle">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayArticle" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayViews" runat="server" ControlName="chkDisplayViews">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayViews" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayRelatedArticles" runat="server" ControlName="chkDisplayRelatedArticles">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayRelatedArticles" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplaySocialBookmarks" runat="server" ControlName="chkDisplaySocialBookmarks">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplaySocialBookmarks" runat="server"></asp:CheckBox>
        </td>
    </tr>
    
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plRelatedArticleRows" runat="server" ControlName="txtRelatedArticleRows">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedArticleRows" runat="server" Columns="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedArticleRows"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plCommentRowCount" runat="server" ControlName="txtCommentRowCount">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtCommentRowCount" runat="server" Columns="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtCommentRowCount"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <%-- <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayCommentAvatar" runat="server" ControlName="chkDisplayCommentAvatar">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayCommentAvatar" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width:200px">
            <dnn:label ID="plDisplayCommentWebLink" runat="server" ControlName="chkDisplayCommentWebLink">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayCommentWebLink" runat="server"></asp:CheckBox>
        </td>
    </tr>--%>
    <tr>
        <td class="Normal" valign="top" style="width:200px">
            <dnn:label ID="plRatingImage" runat="server" ControlName="ddlRatingImage"></dnn:label>
        </td>
        <td valign="top">
            <asp:DropDownList ID="ddlRatingImage" CssClass="normal" runat="server" Width="60%">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdReturn" OnClick="cmdReturn_Click"
        resourcekey="cmdReturn" runat="server" BorderStyle="none" Text="Return" CausesValidation="False"></asp:LinkButton>
</p>
