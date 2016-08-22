<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.ArticleDetail, App_Web_articledetail_standard.ascx.6a09bb52" %>
<%@ Register TagPrefix="Cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%--     Article information  table --%>
<table cellspacing="2" cellpadding="2" width="100%" class="Normal" runat="server"
    id="tblArticleInfo">
    <!--  Title -->
    <tr valign="top" id="trTitle" runat="server" visible="<%#DetailSettings.General.DisplayTitle %>"
        align="center">
        <td class="Head" colspan="2">
            <%#objArticle.Title %>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr style="border:1px dotted #999999; size:1"/>
        </td>
    </tr>
    <!--  Creator/date/author /source/views/recommend -->
    <tr valign="top" runat="server" class="Normal" align="center">
        <td colspan="2">
        <!-- Creator -->
            <asp:Label ID="lblCreator" ResourceKey="lblCreator" runat="server" >Created By</asp:Label>
               <!-- user avatar-->
            <asp:Image ID="imgAuthorAvatar" runat="server"  ImageUrl='<%#GetGravatarUrl(objAuthor.AvatarEmail,"32") %>' visible="<%#DetailSettings.General.DisplayAuthorAvatar %>" ImageAlign="AbsMiddle"></asp:Image>
            <!-- user name-->
            <asp:HyperLink ID="hlUserName" runat="server" Text="<%#objArticle.UserName%>" NavigateUrl='<%#GetUserNavigate(objArticle.UserId.ToString()) %>'
                                        Target="_blank" />
              <!-- date -->
              &nbsp;&nbsp;<asp:Label ID="lblCreateDate" runat="server" Text="<%#objArticle.CreatedDate.ToString()%>" visible="<%#DetailSettings.General.DisplayCreatedDate %>"/>
           
              <!-- author -->
              &nbsp;&nbsp;
              <asp:Label ID="lblAuthor" ResourceKey="lblAuthor" runat="server" visible='<%#DetailSettings.General.DisplayAuthor&&objArticle.Author.Trim()!="" %>'></asp:Label>
         
             <asp:Label ID="lblAuthorField" runat="server" Text="<%#objArticle.Author%>" visible='<%#DetailSettings.General.DisplayAuthor&&objArticle.Author.Trim()!="" %>'/>
             
             <!-- source -->
              &nbsp;&nbsp;<asp:Label ID="lblSource" runat="server" ResourceKey="lblSource" visible='<%#DetailSettings.General.DisplaySource&&objArticle.Source.Trim()!="" %>'></asp:Label>
                  <asp:Label ID="lblSourceField" runat="server" Text="<%#objArticle.Source%>" visible='<%#DetailSettings.General.DisplaySource&&objArticle.Source.Trim()!="" %>'/>
         
             <!-- views -->
              &nbsp;&nbsp;<asp:Label ID="lblViews" runat="server" resourcekey="lblViews" visible="<%#DetailSettings.General.DisplayViews%>"></asp:Label>
            <asp:Label ID="lblViewsField" runat="server" Text="<%#objArticle.Views %>" visible="<%#DetailSettings.General.DisplayViews%>"></asp:Label>
            
            <!-- recommend -->
           
           &nbsp;&nbsp; <asp:ImageButton ID="ibtnUp" runat="server" resourcekey="ibtnUp" CssClass="CommandButton"  CausesValidation="false"  AlternateText="Rate it up" ToolTip="Rete it up"
                ImageUrl="~/DesktopModules/CrossArticle/images/Up.gif" OnClick="ibtnUp_Click" visible="<%#ArticlePortalSettings.Recommend.Portal_ArticleAllowRecommend&&objArticle.AllowRecommend %>"/>
          
            <asp:Label ID="lblUpVotes" runat="server" visible="<%#ArticlePortalSettings.Recommend.Portal_ArticleAllowRecommend&&objArticle.AllowRecommend %>"></asp:Label>
            &nbsp;&nbsp;
            <asp:ImageButton ID="ibtngDown" runat="server" resourcekey="ibtnDown" CssClass="CommandButton"  CausesValidation="false"
                ImageUrl="~/DesktopModules/CrossArticle/images/Down.gif" OnClick="ibtnDown_Click" visible="<%#ArticlePortalSettings.Recommend.Portal_ArticleAllowRecommend&&objArticle.AllowRecommend %>"/>
           
            <asp:Label ID="lblDownVotes" runat="server" visible="<%#ArticlePortalSettings.Recommend.Portal_ArticleAllowRecommend&&objArticle.AllowRecommend %>"></asp:Label>&nbsp;&nbsp;
            <asp:Label ID="lblRecommendNeedLoggedIn" resourcekey="lblRecommendNeedLoggedIn" 
                ForeColor="red" runat="server" Visible="False"></asp:Label>       
                                      
        </td>
      
       
    </tr>
   
   
  
    <!--  summary  -->
    <tr id="trSummary" valign="top" runat="server" visible="<%#DetailSettings.General.DisplaySummary%>">
        <td colspan="2" >
            <asp:Label ID="lblSummary" runat="server" resourcekey="lblSummary"></asp:Label>
            <br />
            &nbsp;&nbsp;<%#Server.HtmlDecode(objArticle.Summary) %>
        </td>
    </tr>
    <!--  image  -->
    <tr id="trImage" valign="top" runat="server" visible="<%#DetailSettings.General.DisplayImage%>">
        <td align="center" runat="server" id="tdImage" valign="top" visible="false" style="width: 1%" colspan="2">
        <br />      
            <a href="<%=GetRelativeUrlByFileId(objArticle.Image) %>" target="_blank">
                <asp:Image BorderWidth="0" ID="imgArticleImage" runat="server" ImageUrl='<%#GetRelativeUrlByFileId(objArticle.Image) %>'>
                </asp:Image><br />
            </a>        
             <%#Server.HtmlDecode(objArticle.ImageDescription) %>
        </td>
    </tr>
    <!--  article  -->
    <tr id="trArticle" valign="top" runat="server" visible="<%#DetailSettings.General.DisplayArticle%>">
        <td colspan="2">
              <br /><%#Server.HtmlDecode(objArticle.Article)%>
        </td>
    </tr>
      <!--  tags  -->
    <tr id="trTags" runat="server" visible="<%#DetailSettings.General.DisplayTags %>" align="left">
   
        <td width="10%">
            <asp:Label ID="lblTags" runat="server" resourcekey="lblTags"></asp:Label>         
        </td>
        <td width="90%" >
             <asp:DataList ID="dlTags" runat="server" RepeatColumns="<%#DetailSettings.General.TagsPerRow%>" Width="100%" >
                <ItemTemplate>
                    <asp:HyperLink ID="hlTag" runat="server" NavigateUrl='<%#GetTagNavigate(Convert.ToString(Eval("TagId")))%>'
                        Target="_blank" Text='<%#Convert.ToString(Eval("Tag")) %>'>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
    <!--  attachments  -->
    <tr id="trAttachments" runat="server" visible="false" align="left">
        <td width="10%">
            <asp:Label ID="lblAttachments" runat="server" resourcekey="lblAttachments"></asp:Label>
            </td>
            <td  width="90%" >
            <asp:Label ID="lblAttacmentNeedLoggedIn" resourcekey="lblAttacmentNeedLoggedIn" ForeColor="red"
                runat="server" Visible="False"></asp:Label>
            <asp:DataList ID="dlAttachment" runat="server" Width="100%" ItemStyle-HorizontalAlign="Left" >
                <ItemTemplate>
                    <asp:HyperLink ID="hlAttachment" runat="server" NavigateUrl='<%#Convert.ToString(Eval("FilePath"))%>' Target="_blank"
                        Text='<%#Convert.ToString(Eval("FilePath")) %>'>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
<%--    about author --%>
<table cellspacing="2" cellpadding="2" width="100%" class="Normal" runat="server" id="tblAboutAuthor" 
visible='<%#DetailSettings.General.DisplayAuthorBiography&&objArticle.Quote==false&&objAuthor.Biography!=""%>'>
    <tr>
        <td >
        <br />
         <asp:Label ID="lblAboutAuthor" runat="server" resourcekey="lblAboutAuthor" CssClass="SubHead"></asp:Label><br />
         <hr style="border:1px dotted #999999; size:1"/>
        </td>
    </tr>
    <tr><td>
    <%#Server.HtmlDecode(objAuthor.Biography)%>
    </td></tr>
</table>

<%--     Article information  end --%>
<%--    social bookmarks--%>
<table cellspacing="2" cellpadding="2" width="100%" class="Normal">
    <tr>
        <td id="ShareBadgePRO_Toolbar">
        </td>
    </tr>
</table>

<%--    rating information  table --%>
<table cellspacing="2" cellpadding="2" width="100%" class="Normal" runat="server"
    id="tblRating" visible="false">
    <tr><td colspan=2> 
     <hr style="border:1px dotted #999999; size:1"/>
    </td></tr>
    <tr align="left">
        <td colspan=2>
            <asp:Label ID="lblRatingVotes" resourcekey="lblRatingVotes" runat="server"></asp:Label>
            <asp:Label ID="lblVotes" runat="server"></asp:Label>&nbsp;&nbsp;
            <asp:Label ID="lblAverage" resourcekey="lblAverage" runat="server"></asp:Label>&nbsp;&nbsp;
            <asp:Image ID="imgAverage" runat="server"></asp:Image>&nbsp;&nbsp;
            <asp:Label ID="lblRatingNeedLoggedIn" resourcekey="lblRatingNeedLoggedIn" Text="You have no rights to rating:"
                ForeColor="red" runat="server" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr align="left">
        <td>
            <asp:RadioButtonList ID="rblRating"  RepeatDirection="Horizontal"
                runat="server" CssClass="Normal">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
                <asp:ListItem Value="6">6</asp:ListItem>
                <asp:ListItem Value="7">7</asp:ListItem>
                <asp:ListItem Value="8">8</asp:ListItem>
                <asp:ListItem Value="9">9</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
            </asp:RadioButtonList>
            </td>
            <td  width="50%">
            <asp:Button ID="btnPost" runat="server" Text="Rating" resourcekey="bthPost" OnClick="btnPost_Click"
                CssClass="CommandButton" CausesValidation="false"></asp:Button>
        </td>
    </tr>
</table>
<%--    rating information  end --%>
<%--    comment information table  --%>
<table cellspacing="2" cellpadding="2" width="100%" id="tblComment" runat="server"
    visible="false">
    <tr>
        <td>
            <asp:Label ID="lblCommentHead" resourcekey="lblCommentHead" runat="server" CssClass="SubHead" />
        </td>
    </tr>
      <tr><td > 
     <hr style="border:1px dotted #999999; size:1"/>
    </td></tr>
    <tr align="left">
        <td>
            <asp:DataList ID="dlComments" runat="Server" Width="100%" CssClass="Normal" BackColor="White"
                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" >
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <ItemTemplate>
                <blockquote>
                <asp:Image runat="server" width="48" id="imgUserGravatar" ImageUrl='<%#GetGravatarUrl(Eval("Mail").ToString(),"48") %>'  ImageAlign="AbsMiddle"></asp:Image>
                <%# Eval("Comment").ToString()%>
                </blockquote>
                <%# "By  " + Convert.ToString(DataBinder.Eval(Container.DataItem,"CreatedUser")) %>
                     <%# "    on  "+Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"CreatedDate")).ToShortDateString()  %>
                    
                </ItemTemplate>
                <AlternatingItemStyle BackColor="#F7F7F7" />
                <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:DataList>
        </td>
    </tr>
    <tr>
        <td>
           <hr style="border:1px dotted #999999; size:1"/>
        </td>
    </tr>
    <tr>
        <td>
            <Cross:PagingControl ID="ctlPagingControl" runat="server" OnPageChanged="ctlPagingControl_PageChanged"
                Mode="PostBack"></Cross:PagingControl>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblCommentNeedLoggedIn" Text="You must be logged in to submit a comment."
                CssClass="Normal" resourcekey="lblCommentNeedLoggedIn" Visible="false" runat="server"
                ForeColor="red" />
            <asp:Label ID="lblCommentNeedAuth" Text="Your comment must be authorized before display."
                resourcekey="lblCommentNeedAuth" Visible="false" runat="server" ForeColor="red" />
            <br />
             <hr style="border:1px dotted #999999; size:1"/>
        </td>
    </tr>
    <tr id="trComment" runat="server" visible="false">
        <td>
            <asp:Label ID="lblEnter" runat="server" resourcekey="lblEnter" Text="Leave a Comment"
                CssClass="SubHead"></asp:Label><br />
            <hr style="border:1px dotted #999999; size:1"/>
            <br />
            <asp:Label ID="lblName" runat="server" resourcekey="lblName"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" Columns="60"></asp:TextBox><asp:Image ID="Image1"
                runat="server" ImageUrl="~/images/required.gif" ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="varName" runat="server" CssClass="NormalRed" ErrorMessage="You Must Enter a name"
                resourcekey="Name.ErrorMessage" Display="Dynamic" ControlToValidate="txtName"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblEmail" runat="server" resourcekey="lblEmail"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" Columns="26"></asp:TextBox>
            <asp:Label id="lblEmailExplanation" Runat="server" ResourceKey="lblEmailExplanation" CssClass="Normal"/>
            <br />
            <asp:Label ID="lblUrl" runat="server" resourcekey="lblUrl"></asp:Label>
            <asp:TextBox ID="txtUrl" runat="server" Columns="60"></asp:TextBox>
            <br />
            <dnn:CaptchaControl ID="ctlCaptcha" TabIndex="6" runat="server" CssClass="Normal"
                CaptchaLength="4" ErrorStyle-CssClass="NormalRed" CaptchaWidth="130" CaptchaHeight="40">
            </dnn:CaptchaControl>
            <br />
            <asp:Label ID="lblComment" runat="server" resourcekey="lblComment" Text="Comment:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox
                ID="chkPrivate" runat="server" Text="Private" resourcekey="chkPrivate"></asp:CheckBox>&nbsp;&nbsp;&nbsp;
            &nbsp;
            <asp:Button ID="btnAddComment" runat="server" resourcekey="btnAddComment" Text="Submit Comment"
                OnClick="btnAddComment_Click" CssClass="CommandButton"></asp:Button><br />
            <asp:TextBox ID="txtComment" runat="server" Columns="80" TextMode="Multiline" Rows="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="varComment" runat="server" CssClass="NormalRed" ErrorMessage="You Must Enter comment info"
                resourcekey="Comment.ErrorMessage" Display="Dynamic" ControlToValidate="txtComment">* Required</asp:RequiredFieldValidator><br />
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border:1px dotted #999999; size:1"/>
        </td>
    </tr>
</table>
<%--    comment information end  --%>
<%--     related articles table --%>
<table cellspacing="2" cellpadding="2" width="98%" class="Normal" visible="<%#DetailSettings.General.DisplayRelatedArticles %>"
    runat="server" id="tblRelatedArticles">
    <tr>
        <td align="left" class="SubHead">
            <asp:Label ID="lblRelated" runat="server" Text="Related Articles" resourcekey="lblRelated"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:DataList ID="dlRelatedArticles" runat="server" Visible="true" RepeatColumns="3" 
                Width="100%">
                <ItemTemplate>
                    <asp:HyperLink CssClass="Normal" ID="hlTitle" runat="server" Text='<%# Convert.ToString(Eval("Title")) +"("+ Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() +")"%>'
                        NavigateUrl='<%#GetArticleNavigate(Convert.ToString(Eval("Id"))) %>' />
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
<%--     related articles end--%>