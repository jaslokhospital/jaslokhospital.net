    <%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.ArticleListSettings, App_Web_articlelistsettings.ascx.6c70b780" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>

<table cellspacing="0" cellpadding="2" width="90%" summary="Article list Settings Design Table"
    align="center">
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secGeneral" runat="server" Section="tblGeneral" ResourceKey="secGeneral"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead">
            </dnn:sectionhead>
            <table id="tblGeneral" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plListTemplate" runat="server"  ControlName="ddlListTemplate">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlListTemplate" CssClass="normal" runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plDetailTab" runat="server"  ControlName="ddlDetailTab">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDetailTab" DataValueField="TabId" DataTextField="IndentedTabName"
                            CssClass="NormalTextBox" runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="100">
                        <dnn:label ID="plListType" ControlName="ddlListType"  runat="server" Text="List Style">
                        </dnn:label>
                    </td>
                    <td align="left" height="26">
                        <asp:DropDownList ID="ddlListStyle" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="List" resourcekey="li_ListStyle_List">List</asp:ListItem>
                            <asp:ListItem Value="Grid" resourcekey="li_ListStyle_Grid">Grid</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                  
                   <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plAcceptSearchParm" runat="server"  ControlName="chkAcceptSearchParm">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAcceptSearchParm" runat="server"></asp:CheckBox>
                    </td>
                </tr>
              
                
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plFeatured" runat="server"  ControlName="chkFeatured">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFeatured" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plSortField" runat="server" Text="Sort By"  ControlName="ddlSortField">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSortField" runat="server">
                            <asp:ListItem Value="CreationDate" Selected="True"  resourcekey="li_SortField_CreationDate" />
                            <asp:ListItem Value="PublishDate" Text="Publish Date" resourcekey="li_SortField_PublishDate" />
                            <asp:ListItem Value="LastModifiedDate" Text="Last Modified Date" resourcekey="li_SortField_LastModifiedDate" />
                            <asp:ListItem Value="Views" Text="View Numbers" resourcekey="li_SortField_Views" />
                      
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" valign="top" width="200" height="27">
                        <dnn:label ID="plLinkTarget" ControlName="ddlLinkTarget"  runat="server">
                        </dnn:label>
                    </td>
                    <td valign="top" align="left">
                        <asp:DropDownList ID="ddlLinkTarget" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self">_Self</asp:ListItem>
                            <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank">_Blank</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secCategory" runat="server" Section="tblCategory" ResourceKey="secCategory"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead">
            </dnn:sectionhead>
            <table id="tblCategory" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plCategory" runat="server"  ControlName="ctlCategories">
                        </dnn:label>
                    </td>
                    <td colspan="3">
                     <asp:RadioButtonList ID="rbCategory" runat="server" AutoPostBack="True" CssClass="normal"
                            OnSelectedIndexChanged="rbCategory_SelectedIndexChanged">
                            <asp:ListItem Value="All" resourcekey="li_Category_All" />
                            <asp:ListItem Value="Customize" resourcekey="li_Category_Customize" />
                        </asp:RadioButtonList><br />
                      
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
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secImage" runat="server" Section="tblImage" ResourceKey="secImage"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead">
            </dnn:sectionhead>
            <table id="tblImage" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
            <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowPrefixImage" runat="server"  ControlName="chkShowPrefixImage">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowPrefixImage" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                
                 <tr>
                    <td class="Normal" valign="top" width="200" height="27">
                        <dnn:label ID="plPrefixImage" ControlName="ddlPrefixImage"  runat="server">
                        </dnn:label>
                    </td>
                    <td valign="top" align="left">
                        <asp:DropDownList ID="ddlPrefixImage" runat="server" CssClass="NormalTextBox">
                          
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowImage" runat="server"  ControlName="chkShowImage">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowImage" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowImageOnly" runat="server"  ControlName="chkShowImageOnly">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowImageOnly" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plUseLightBoxEffect" runat="server"  ControlName="chkUseLightBoxEffect">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkUseLightBoxEffect" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plImageWidth" runat="server"  ControlName="txtImageWidth">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtImageWidth" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtImageWidth"></asp:RegularExpressionValidator><asp:CheckBox
                                ID="chkForceImageWidth" CssClass="normal" runat="server" Text="Force Image Width"
                                resourcekey="chkForceImageWidth"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plImageHeight" runat="server"  ControlName="txtImageHeight">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtImageHeight" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator13" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtImageHeight"></asp:RegularExpressionValidator><asp:CheckBox
                                ID="chkForceImageHeight" CssClass="normal" runat="server" Text="Force Image Height"
                                resourcekey="chkForceImageHeight"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secPaging" runat="server" Section="tblPaging" ResourceKey="secPaging"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead">
            </dnn:sectionhead>
            <table id="tblPaging" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plPaging" runat="server"  ControlName="chkShowPage">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowPage" runat="server"></asp:CheckBox>
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
                        <dnn:label ID="plPageSpan" runat="server"  ControlName="txtPageSpan">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPageSpan" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtPageSpan"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                  <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowPageInfo" runat="server"  ControlName="chkShowPageInfo">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowPageInfo" runat="server"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secRoll" runat="server" Text="Roll" Section="tblRoll" ResourceKey="secRoll"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead">
            </dnn:sectionhead>
            <table id="tblRoll" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plRoll" runat="server" Text="Roll"  ControlName="chkRoll">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRoll" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plDirection" runat="server"  ControlName="ddlDirection">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDirection" runat="server">
                            <asp:ListItem Value="UP" resourcekey="li_Direction_Up">UP</asp:ListItem>
                            <asp:ListItem Value="DOWN" resourcekey="li_Direction_Down">DOWN</asp:ListItem>
                            <asp:ListItem Value="LEFT" resourcekey="li_Direction_Left">LEFT</asp:ListItem>
                            <asp:ListItem Value="RIGHT" resourcekey="li_Direction_Right">RIGHT</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plMarHeight" runat="server"  ControlName="txtMarHeight">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMarHeight" CssClass="NormalTextBox" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator5" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtMarHeight"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plScrollAmount" runat="server"  ControlName="txtScrollAmount">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtScrollAmount" CssClass="NormalTextBox" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtScrollAmount"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secMoreArticles" runat="server" Section="tblMoreArticles" ResourceKey="secMoreArticles"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead">
            </dnn:sectionhead>
            <table id="tblMoreArticles" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plMoreArticles" runat="server"  ControlName="chkMoreArticles">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkMoreArticles" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plMoreArticlesText" runat="server"  ControlName="txtMoreArticlesText">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMoreArticlesText" runat="server"
                            Columns="40" CssClass="NormalTextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plMoreArticlesLink" runat="server"  ControlName="ddlMoreArticlesLink">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlMoreArticlesLink" DataValueField="TabId" DataTextField="IndentedTabName"
                            CssClass="NormalTextBox" runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
      <tr>
        <td valign="top">
            <dnn:sectionhead ID="secRss" runat="server" Section="tblRss" ResourceKey="secRss"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead">
            </dnn:sectionhead>
            <table id="tblRss" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                 
                   <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plDisplayRss" runat="server"  ControlName="chkDisplayRss">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkDisplayRss" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plRssItemCounts" runat="server"  ControlName="txtRssItemCounts">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRssItemCounts" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator9" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRssItemCounts"></asp:RegularExpressionValidator>
                    </td>
                </tr>
              
              
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dnn:sectionhead ID="secContent" runat="server" Section="tblContent" ResourceKey="secContent"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead">
            </dnn:sectionhead>
            <table id="tblContent" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowSearch" runat="server"  ControlName="chkShowSearch">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowSearch" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowTitle" runat="server"  ControlName="chkShowTitle">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowTitle" runat="server"></asp:CheckBox>
                    </td>
                </tr>
              <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowUserName" runat="server"  ControlName="chkShowUserName">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowUserName" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowAuthor" runat="server"  ControlName="chkShowAuthor">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowAuthor" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowSource" runat="server"  ControlName="chkShowSource">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowSource" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowRecommend" runat="server"  ControlName="chkShowRecommend">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowRecommend" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowSummary" runat="server"  ControlName="chkShowSummary">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowSummary" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                
                  <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plTitleLength" runat="server"  ControlName="txtTitleLength">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitleLength" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator8" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtTitleLength"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plSummaryLength" runat="server"  ControlName="txtSummaryLength">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSummaryLength" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator7" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtSummaryLength"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                
               
                
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowCreatedDate" runat="server"  ControlName="chkShowCreatedDate"
                            Text="Show Created Date">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowCreatedDate" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowFeaturedField" runat="server"  ControlName="chkShowFeaturedField"
                            Text="Show Featured Field">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowFeaturedField" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowViews" runat="server"  ControlName="chkShowViews"
                          >
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowViews" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                   <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plShowRating" runat="server"  ControlName="chkShowRating"
                           >
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowRating" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" valign="top" width="200">
                        <dnn:label ID="plRatingImage" runat="server"  ControlName="ddlRatingImage">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlRatingImage" CssClass="normal" runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
              
            </table>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="true"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdReturn" OnClick="cmdReturn_Click"
        resourcekey="cmdReturn" runat="server" BorderStyle="none" Text="Return" CausesValidation="False"></asp:LinkButton>
</p>
