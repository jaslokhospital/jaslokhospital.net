<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.PortalAuthorManage, App_Web_portalauthormanage.ascx.6c70b780" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table width="98%" cellpadding="1" cellspacing="1" class="Normal" align="center"
    runat="server" id="tblAuthorList">
    <tr>
       <td>
            <asp:Label ID="lblAuthorList" runat="server" ResourceKey="lblAuthorList"></asp:Label>
      
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnAdminHome" runat="server" resourcekey="lbtnAdminHome" CausesValidation="false"
                OnClick="lbtnAdminHome_Click"></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                PageSize="30" DataKeyNames="UserId" ForeColor="#333333" CssClass="Normal" 
                AllowPaging="True" OnRowCommand="gvList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="UserId" SortExpression="UserId">
                        <HeaderTemplate>
                            <asp:Label ID="lblUserId" runat="server" resourcekey="lblUserId"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUserIdField" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Avatar" SortExpression="Avatar" >
                        <HeaderTemplate>
                            <asp:Label ID="lblAvatar" runat="server" resourcekey="lblAvatar"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgAvatar" runat="server"  ImageUrl='<%#GetGravatarUrl(Eval("AvatarEmail").ToString(),"48") %>'></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText="DisplayName" SortExpression="DisplayName" >
                        <HeaderTemplate>
                            <asp:Label ID="lblDisplayName" runat="server" resourcekey="lblDisplayName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayNameField" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="AvatarEmail" SortExpression="AvatarEmail">
                        <HeaderTemplate>
                            <asp:Label ID="lblAvatarEmail" runat="server" resourcekey="lblAvatarEmail"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAvatarEmailField" runat="server" Text='<%# Eval("AvatarEmail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ArticleCounts" SortExpression="ArticleCounts">
                        <HeaderTemplate>
                            <asp:Label ID="lblArticleCounts" runat="server" resourcekey="lblArticleCounts"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblArticleCountsField" runat="server" Text='<%# Eval("ArticleCounts") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderImageUrl="~/images/register.gif">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Sel"
                                CommandArgument='<%# Eval("UserId")%>' ToolTip='<%#Localization.GetString("imgEdit", LocalResourceFile)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgDelete" runat="server" AlternateText='<%#Localization.GetString("imgDelete", LocalResourceFile)%>'
                                ToolTip='<%#Localization.GetString("imgDelete", LocalResourceFile)%>' CommandArgument='<%#Eval("UserId") %>'
                                CausesValidation="False" CommandName="Del" ImageUrl="~/images/delete.gif"
                                OnClientClick="return confirm('Delete author will also delete his/her articles,Are you sure to delete this item?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
                <PagerSettings FirstPageImageUrl="~/DesktopModules/CrossArticle/images/First.gif"
                    LastPageImageUrl="~/DesktopModules/CrossArticle/images/Last.gif" NextPageImageUrl="~/DesktopModules/CrossArticle/images/Next1.gif"
                    PreviousPageImageUrl="~/DesktopModules/CrossArticle/images/Previous.gif" Mode="NextPreviousFirstLast" />
            </asp:GridView>
        </td>
    </tr>
</table>

<table width="98%" cellpadding="1" cellspacing="1" class="Normal" align="center" runat="server" id="tblAuthorInfo">
    <tr >
        <td  style="width:200px">
            <dnn:Label ID="plEmail" runat="server" Suffix=":"></dnn:Label>
        </td>
        <td valign="top" align="left">
            <asp:TextBox ID="txtEmail" TabIndex="1" runat="server" Width="30%"></asp:TextBox><asp:Label ID="lblEmailExplanation" runat="server" ResourceKey="lblEmailExplanation"
              ></asp:Label>
        </td>
    </tr>
    <tr >
        <td>
            <asp:Image ID="imgGravatarPreview" runat="server"></asp:Image>
        </td>
        <td>
            <br />
             <br />
              <br />
        </td>
    </tr>
     <tr >
        <td  colspan="2">
            <dnn:Label ID="plBiography" runat="server" ></dnn:Label><br />
        </td>
     
    </tr>
     <tr valign="top" >
        <td style="width:100%" colspan="2">
             <hr style="border:1px dotted #999999; size:1"/>
        </td>
    </tr>
    <tr >
        <td  colspan="2">
             <dnn:TextEditor ID="txtBiography" Width="100%" Height="250" runat="server" />
        </td>
    </tr>
   
</table>
<p align="center" id="pInfo" runat="server">
    <asp:LinkButton ID="lbtnUpdate" OnClick="lbtnUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="False"></asp:LinkButton>&nbsp;&nbsp;
    <asp:LinkButton  ID="lbtnCancel" OnClick="lbtnCancel_Click"
        resourcekey="cmdCancel" runat="server" BorderStyle="none" Text="Cancel" CausesValidation="False"></asp:LinkButton>&nbsp;
</p>

