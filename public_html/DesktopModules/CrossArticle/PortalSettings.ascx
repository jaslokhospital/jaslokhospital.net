<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.ArticlePortalSettings, App_Web_portalsettings.ascx.6c70b780" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<table cellspacing="0" cellpadding="2" width="80%" summary="CrossArticle Settings Design Table"
    align="center">
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secGeneral" runat="server" Section="tblGeneral" ResourceKey="secGeneral"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblGeneral" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plCategoryManageRoles" runat="server"  ControlName="chkCategoryManageRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkCategoryManageRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                  <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plCategorySelectCount" runat="server"  ControlName="txtCategorySelectCount">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCategorySelectCount" runat="server" Columns="10"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtCategorySelectCount" resourcekey="MustBetween1To10"
                                MinimumValue="1" MaximumValue="10" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                
                 <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plTagManageRoles" runat="server"  ControlName="chkTagManageRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkTagManageRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                  <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plTagSelectCount" runat="server"  ControlName="txtTagSelectCount">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTagSelectCount" runat="server" Columns="10"></asp:TextBox>
                   
                            <asp:RangeValidator ID="rang1" runat="server" ControlToValidate="txtTagSelectCount" resourcekey="MustBetween1To10"
                                MinimumValue="1" MaximumValue="10" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plArticleManageRoles" runat="server"  ControlName="chkArticleManageRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkArticleManageRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plCommentManageRoles" runat="server"  ControlName="chkCommentManageRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkCommentManageRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plArticleEditRoles" runat="server"  ControlName="chkArticleEditRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkArticleEditRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                  <tr>
                    <td class="Normal"  style="width:200px">
                        <dnn:label ID="plAuthorManageRoles" runat="server"  ControlName="chkAuthorManageRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkAuthorManageRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
              
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plUserDiskQuote" runat="server"  ControlName="txtUserDiskQuote">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserDiskQuote" runat="server" Columns="10"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtUserDiskQuote"></asp:RegularExpressionValidator>
                    </td>
                </tr>
              
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plRequireApproval" runat="server"  ControlName="chkRequireApproval">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRequireApproval" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plViewRoles" runat="server"  ControlName="chkViewRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkViewRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2">
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plGenerateThumb" runat="server"  ControlName="chkGenerateThumb">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkGenerateThumb" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plThumbnailSize" runat="server"  ControlName="txtThumbnailSize">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtThumbnailSize" runat="server" Columns="10"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtThumbnailSize"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secComment" runat="server" Section="tblComment" ResourceKey="secComment"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblComment" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plAllowComment" runat="server"  ControlName="chkAllowComment">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAllowComment" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plCommentRoles" runat="server"  ControlName="chkCommentRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkCommentRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2" ResourceKey="chkCommentRoles">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plAutoAuthComment" runat="server"  ControlName="chkAutoAuthComment">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAutoAuthComment" runat="server"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secRating" runat="server" Section="tblRating" ResourceKey="secRating"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblRating" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plAllowRating" runat="server"  ControlName="chkAllowRating">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAllowRating" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plRatingRoles" runat="server"  ControlName="chkRatingRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkRatingRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2">
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    
     <tr>
        <td valign="top">
            <dnn:sectionhead ID="secRecommend" runat="server" Section="tblRecommend" ResourceKey="secRecommend"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblRecommend" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plAllowRecommend" runat="server"  ControlName="chkAllowRecommend">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAllowRecommend" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plRecommendRoles" runat="server"  ControlName="chkRecommendRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkRecommendRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2">
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    
      <tr>
        <td valign="top">
            <dnn:sectionhead ID="secDownload" runat="server" Section="tblDownload" ResourceKey="secDownload"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblDownload" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
              
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plDownloadRoles" runat="server"  ControlName="chkDownloadRoles">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="chkDownloadRoles" runat="server" CssClass="Normal" Width="300"
                            CellSpacing="0" CellPadding="0" RepeatColumns="2">
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    
       <tr>
        <td valign="top">
            <dnn:sectionhead ID="secListSettings" runat="server" Section="tblListSettings"
                ResourceKey="secListSettings" IncludeRule="True" IsExpanded="false" CssClass="SubHead"
                Text="List Setting"></dnn:sectionhead>
            <table id="tblListSettings" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plListTab" runat="server"  ControlName="ddlListTab">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlListTab" DataValueField="TabId" DataTextField="IndentedTabName"
                            CssClass="NormalTextBox" runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secDetailSettings" runat="server" Section="tblDetailSettings"
                ResourceKey="secDetailSettings" IncludeRule="True" IsExpanded="false" CssClass="SubHead"
                Text="Detail Setting"></dnn:sectionhead>
            <table id="tblDetailSettings" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td class="Normal" style="width:200px">
                        <dnn:label ID="plDetailTab" runat="server"  ControlName="ddlDetailTab">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDetailTab" DataValueField="TabId" DataTextField="IndentedTabName"
                            CssClass="NormalTextBox" runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    
   
</table>
<p align="center">
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdReturn" OnClick="cmdReturn_Click"
        resourcekey="cmdReturn" runat="server" BorderStyle="none" Text="Return" CausesValidation="False"></asp:LinkButton>
</p>
