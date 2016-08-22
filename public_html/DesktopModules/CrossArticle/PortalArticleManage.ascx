<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.PortalArticleManage, App_Web_portalarticlemanage.ascx.6c70b780" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<script type="text/javascript">
    function CheckAll() {
        if ($(":checkbox[id*='chkAll']").attr("checked") == true) {
            $(":checkbox[id*='chkItem']").attr("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem']").attr("checked", false);
        }
    }
    function AddTag() {
        var tag = document.getElementById("<%=ddlPopularTag.ClientID%>").value;
        var allTag = $(":text[id*='txtTag']").get();
        for (var i = 0; i < allTag.length; i++) {
            if (allTag[i].value == "") {
                allTag[i].value = tag;
                break;
            }
        }
        return false;
    }
</script>

<asp:Label ID="lblNoCategory" runat="server" resourcekey="lbNoCategory" CssClass="NormalRed"
    Visible="false"></asp:Label>
<table width="100%" class="Normal" align="center" runat="server" id="tblButton">
    <tr valign="top">
        <td align="center">
           
          <asp:Image ImageUrl="~/images/save.gif" runat="server" ID="imgUpdateReturn" Visible="false" /><asp:LinkButton
                CssClass="CommandButton" ID="lbtnUpdateReturn" OnClick="lbtnUpdateReturn_Click"
                resourcekey="lbtnUpdateAndReturn" runat="server" BorderStyle="none"
                Visible="false"></asp:LinkButton>&nbsp;&nbsp;
            
            <asp:Image ImageUrl="~/images/delete.gif" runat="server" ID="imgDelete" Visible="false" /><asp:LinkButton
                CssClass="CommandButton" ID="lbtnDelete" resourcekey="lbtnDelete" runat="server"
                BorderStyle="none" Text="Delete" CausesValidation="False" OnClick="lbtnDelete_Click"
                Visible="false"></asp:LinkButton>&nbsp;&nbsp;
            <asp:Image ImageUrl="~/images/cancel.gif" runat="server" ID="imgReturn" Visible="false" /><asp:LinkButton
                CssClass="CommandButton" ID="lbtnReturn" resourcekey="lbtnReturn" runat="server"
                BorderStyle="none" Text="Return" CausesValidation="False" OnClick="lbtnReturn_Click"
                Visible="false"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td runat="server" id="tdArticleSelect" align="center">
            <asp:LinkButton ID="lbtnAll" runat="server" resourcekey="lbtnAll" CssClass="Normal"
                OnClick="lbtnAll_Click"></asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnUnAuthed" runat="server" resourcekey="lbtnUnAuthed" CssClass="Normal"
                OnClick="lbtnUnAuthed_Click"></asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnUnActive" runat="server" resourcekey="lbtnUnActive" CssClass="Normal"
                OnClick="lbtnUnActive_Click"></asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnFeatured" runat="server" resourcekey="lbtnFeatured" CssClass="Normal"
                OnClick="lbtnFeatured_Click"></asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnDraft" runat="server" resourcekey="lbtnDraft" CssClass="Normal"
                OnClick="lbtnDraft_Click"></asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnExpired" runat="server" resourcekey="lbtnExpired" CssClass="Normal"
                OnClick="lbtnExpired_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:LinkButton ID="lbtnAdminHome" runat="server" resourcekey="lbtnAdminHome" CssClass="CommandButton"
                CausesValidation="false" OnClick="lbtnAdminHome_Click"></asp:LinkButton>
        </td>
    </tr>
</table>
<table width="100%" class="Normal" align="center" runat="server" id="tblList">
 <tr id="trSearch" runat="server" visible="true">
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
            <br />
            <asp:DropDownList ID="ddlCategory" runat="server" Width="180px" CssClass="NormalTextBox"
                DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlAuthor" runat="server" Width="120px" CssClass="NormalTextBox"
                DataTextField="UserName" DataValueField="UserId">
            </asp:DropDownList>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="NormalTextBox" Width="150px"></asp:TextBox>
            <asp:LinkButton ID="lbtnSearch" runat="server" CssClass="Normal" CausesValidation="false"
                ResourceKey="lbtnSearch" OnClick="lbtnSearch_Click"></asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="lbtnClear" runat="server" CssClass="Normal" CausesValidation="false"
                ResourceKey="lbtnClear" OnClick="lbtnClear_Click"></asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="lbtnAuthSelected" runat="server" CssClass="Normal" CausesValidation="false"
                ResourceKey="lbtnAuthSelected" OnClick="lbtnAuthSelected_Click"></asp:LinkButton> &nbsp;&nbsp;
            <asp:LinkButton ID="lbtnDeleteSelected" runat="server" CssClass="Normal" CausesValidation="false"
                ResourceKey="lbtnDeleteSelected" OnClick="lbtnDeleteSelected_Click" OnClientClick="return confirm('Are you sure to delete these items?');"></asp:LinkButton>
                   
        </td>
    </tr>
    <tr visible="true" id="trGrid" runat="server" valign="top">   
        <td align="left" valign="top">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            GridLines="Both" ForeColor="#333333" CssClass="Normal" DataKeyNames="Id" OnRowCommand="gvList_RowCommand">
                            
                             <EmptyDataTemplate>
                                            <asp:Label ID="Label1" Text='<%# Localization.GetString("NoRecords", LocalResourceFile) %>'
                                                runat="server" CssClass="Normal"></asp:Label>
                                        </EmptyDataTemplate>
                            <Columns>
                            <asp:TemplateField>
                                    <HeaderTemplate>
                                        <input type="checkbox" id="chkAll" runat="server" onclick="CheckAll()" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkItem" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='40' BorderStyle="Solid"
                                            BorderWidth="1" BorderColor="DarkGray" ID='imgArticle' ImageAlign="Left" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title" SortExpression="Title" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle">Title</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblTitleField" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              <asp:TemplateField HeaderText="User" SortExpression="UserName" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblUserName" runat="server" resourcekey="lblUserName"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserNameField" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Views" SortExpression="Views">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblViews" runat="server" resourcekey="lblViews">Views</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Views") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CreatedDate" SortExpression="CreatedDate">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate">Created Date</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%#  Convert.ToDateTime(Eval("CreatedDate")).ToShortDateString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              
                                <asp:TemplateField HeaderText="Authed" SortExpression="Authed">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblAuthed" runat="server" resourcekey="lblAuthed">Authed</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkAuthedField" runat="server" Checked='<%# Eval("Authed") %>'
                                            Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active" SortExpression="Featured">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblActive" runat="server" resourcekey="lblActive">Active</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkActiveField" runat="server" Checked='<%# Eval("Active") %>'
                                            Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Draft" SortExpression="Draft">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblDraft" runat="server" resourcekey="lblDraft">Draft</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkDraftField" runat="server" Checked='<%# Eval("Draft") %>' Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Featured" SortExpression="Featured">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured">Featured</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkFeaturedField" runat="server" Checked='<%# Eval("Featured") %>'
                                            Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Expired" SortExpression="Expired">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblExpired" runat="server" resourcekey="lblExpired">Expired</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkExpiredField" runat="server" Checked='<%# Eval("Expired") %>'
                                            Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderImageUrl="~/images/register.gif" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgEditArticle" runat="server" CausesValidation="False" CommandName="Select"
                                            CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEditArticle", LocalResourceFile)%>'
                                            ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEditArticle", LocalResourceFile)%>' />
                                        
                                        <asp:ImageButton ID="imgToggleAuthed" runat="server" CausesValidation="False" CommandName="Auth" 
                                            CommandArgument='<%# Eval("Id")%>' AlternateText='<%#Localization.GetString("imgToggleAuthed", LocalResourceFile)%>'
                                            ImageUrl="~/images/icon_authentication_16px.gif" ToolTip='<%#Localization.GetString("imgToggleAuthed", LocalResourceFile)%>' />
                                        <asp:ImageButton ID="imgToggleActive" runat="server" CausesValidation="False" CommandName="Active"
                                            CommandArgument='<%# Eval("Id")%>' AlternateText='<%#Localization.GetString("imgToggleActive", LocalResourceFile)%>'
                                            ImageUrl="~/images/icon_moduledefinitions_16px.gif" ToolTip='<%#Localization.GetString("imgToggleActive", LocalResourceFile)%>' />
                                      
                                        <asp:ImageButton ID="imgToggleFeatured" runat="server" CausesValidation="False" CommandName="Featured" 
                                            CommandArgument='<%# Eval("Id")%>' AlternateText='<%#Localization.GetString("imgToggleFeatured", LocalResourceFile)%>'
                                            ImageUrl="~/images/icon_dashboard_16px.gif" ToolTip='<%#Localization.GetString("imgToggleFeatured", LocalResourceFile)%>' />
                                        
                                        <asp:ImageButton ID="imgDelArticle" runat="server" CausesValidation="False" CommandName="Del"
                                            CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDelArticle", LocalResourceFile)%>'
                                            ToolTip='<%#Localization.GetString("imgDelArticle", LocalResourceFile)%>' OnClientClick="return confirm('Are you sure to delete this item?');" />
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
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                         <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <cross:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" OnPageChanged="ctlPagingControl_PageChanged">
                        </cross:PagingControl>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr visible="false" runat="server" id="trDetail">
        <td align="left" valign="top" colspan="2">
            <table width="98%" cellspacing="2" cellpadding="2" border="0" summary="Edit Article Design Table">
                <tr>
                    <td valign="top" colspan="2">
                     <dnn:SectionHead ID="secBasic" CssClass="SubHead" runat="server" Section="tblBasic"
                            ResourceKey="secBasic" IncludeRule="True" IsExpanded="true"></dnn:SectionHead>
                        <table id="tblBasic" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                            <tr valign="top">
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plTitle" runat="server" ControlName="txtTitle" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTitle" CssClass="NormalTextBox" Width="95%" runat="server" /><asp:Image
                                        ID="Image1" runat="server" ImageUrl="~/images/required.gif" ToolTip="Reuired"
                                        AlternateText="Required" />
                                    <asp:RequiredFieldValidator ID="varTitle" runat="server" CssClass="NormalRed" ErrorMessage="You Must Enter article title"
                                        resourcekey="Title.ErrorMessage" Display="Dynamic" ControlToValidate="txtTitle">* Required</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plAuthor" runat="server" ControlName="txtAuthor" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAuthor" CssClass="NormalTextBox" Width="60%" runat="server" />
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plSource" runat="server" ControlName="txtSource" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSource" CssClass="NormalTextBox" Width="95%" runat="server" />
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plQuote" runat="server" ControlName="chkQuote" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td class="Normal">
                                    <asp:CheckBox ID="chkQuote" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plDraft" runat="server" ControlName="chkDraft" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td class="Normal">
                                    <asp:CheckBox ID="chkDraft" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="Normal">
                                    <dnn:Label ID="plLinkUrl" runat="server" ControlName="ctlInfo" Suffix=":" Text="Link Url">
                                    </dnn:Label>
                                </td>
                                <td valign="middle">
                                    <dnn:URL ID="ctlLinkUrl" runat="server" Width="400" ShowLog="False" ShowNone="True"
                                        ShowFiles="true" ShowTabs="true" ShowTrack="False">
                                    </dnn:URL>
                                </td>
                            </tr>
                            <tr  valign="top" >
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plPinOrder" runat="server" ControlName="txtName" Suffix=":" Text="Order">
                                    </dnn:Label>
                                </td>
                                <td class="Normal">
                                    <asp:TextBox ID="txtPinOrder" CssClass="NormalTextBox" Width="10%" runat="server" />&nbsp;&nbsp;
                                    <asp:CheckBox ID="chkFeatured" runat="server" resourcekey="chkFeatured" Text="Featured">
                                    </asp:CheckBox>&nbsp;
                                    <asp:CheckBox ID="chkAuthed" runat="server" Text="Authed" resourcekey="chkAuthed"
                                        Checked="true"></asp:CheckBox>&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plActive" runat="server" ControlName="chkActive" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td class="Normal">
                                    <asp:CheckBox ID="chkActive" runat="server" Text="Active" resourcekey="chkActive"
                                        Checked="true"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plImage" runat="server" ControlName="ctlImage" Suffix=":" />
                                </td>
                                <td>
                                    <dnn:URL ID="ctlImage" runat="server" ShowTabs="False" ShowUrls="false" UrlType="F"
                                        ShowUpLoad="true" FileFilter="jpg,jpeg,jpe,gif,bmp,png" Width="350" ShowTrack="False"
                                        ShowLog="False" Required="False">
                                    </dnn:URL>
                                </td>
                            </tr>
                             <tr valign="top">
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plImageDescription" runat="server" ControlName="txtImageDescription" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtImageDescription" CssClass="NormalTextBox" Width="95%" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:SectionHead ID="secCategory" CssClass="SubHead" runat="server" Section="tblCategory"
                            ResourceKey="secCategory" IncludeRule="True" IsExpanded="true">
                        </dnn:SectionHead>
                        <table id="tblCategory" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                            <tr>
                                <td>
                                    <asp:TreeView ID="tvCategory" runat="server" ImageSet="XPFileExplorer" NodeIndent="10"
                                        PathSeparator="/" ShowCheckBoxes="All" ExpandDepth="0" >
                                        <ParentNodeStyle Font-Bold="False" />
                                        <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                        <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                            VerticalPadding="0px" />
                                        <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                            NodeSpacing="0px" VerticalPadding="2px" />
                                    </asp:TreeView>
                                    <asp:Label ID="lblInvalidCategory" runat="server" Visible="false" CssClass="NormalRed" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:SectionHead ID="secTag" CssClass="SubHead" runat="server" Section="tblTag" ResourceKey="secTag"
                            IncludeRule="True" IsExpanded="false">
                        </dnn:SectionHead>
                        <table id="tblTag" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="txtTag1" CssClass="NormalTextBox" Width="300" runat="server" Visible="true" /><br />
                                    <asp:TextBox ID="txtTag2" CssClass="NormalTextBox" Width="300" runat="server" /><br />
                                    <asp:TextBox ID="txtTag3" CssClass="NormalTextBox" Width="300" runat="server" /><br />
                                    <asp:TextBox ID="txtTag4" CssClass="NormalTextBox" Width="300" runat="server" /><br />
                                    <asp:TextBox ID="txtTag5" CssClass="NormalTextBox" Width="300" runat="server" /><br />
                                    <asp:TextBox ID="txtTag6" CssClass="NormalTextBox" Width="300" runat="server" /><br />
                                    <asp:TextBox ID="txtTag7" CssClass="NormalTextBox" Width="300" runat="server" /><br />
                                    <asp:TextBox ID="txtTag8" CssClass="NormalTextBox" Width="300" runat="server" /><br />
                                    <asp:TextBox ID="txtTag9" CssClass="NormalTextBox" Width="300" runat="server" /><br />
                                    <asp:TextBox ID="txtTag10" CssClass="NormalTextBox" Width="300" runat="server" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td class="Normal">
                                    <dnn:Label ID="plPopularTag" runat="server" ControlName="ddlPopularTag" Suffix=":" />
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlPopularTag" runat="server" Width="250" DataTextField="Tag" DataValueField="Tag">
                                    </asp:DropDownList>
                                    <asp:LinkButton ID="lbtnAddTag" runat="server" resourcekey="lbtnAddTag" CssClass="CommandButton"
                                         OnClientClick="AddTag();return false;"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="2">
                        <dnn:SectionHead ID="secDate" CssClass="SubHead" runat="server" Section="tblDate"
                            Text="Date" ResourceKey="secDate" IncludeRule="True" IsExpanded="false">
                        </dnn:SectionHead>
                        <table id="tblDate" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                            <tr>
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plPublishDate" runat="server" ControlName="txtPublishDate" Suffix=":"
                                        Text="Publish Date" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPublishDate" MaxLength="10" Columns="10" runat="server" CssClass="NormalTextBox" />
                                    <asp:HyperLink ID="lbtnCalendar" Text="Calendar" resourcekey="Calendar" CssClass="CommandButton"
                                        runat="server" />
                                    <asp:CompareValidator ID="valPublishDate" runat="server" CssClass="NormalRed" ControlToValidate="txtPublishDate"
                                        resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                                        Display="Dynamic" Type="Date" Operator="DataTypeCheck" />
                                </td>
                            </tr>
                            <tr>
                                <td class="Normal" style="width:150">
                                    <dnn:Label ID="plExpireDate" runat="server" ControlName="txtExpireDate" Suffix=":"
                                        Text="Expire Date" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtExpireDate" MaxLength="10" Columns="10" runat="server" CssClass="NormalTextBox" />
                                    <asp:HyperLink ID="lbtnCalendarExpire" resourcekey="Calendar" CssClass="CommandButton"
                                        runat="server" />
                                    <asp:CompareValidator ID="valExpireDate" runat="server" CssClass="NormalRed" ControlToValidate="txtExpireDate"
                                        resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                                        Display="Dynamic" Type="Date" Operator="DataTypeCheck" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="2">
                        <dnn:SectionHead ID="secViewRoles" CssClass="SubHead" runat="server" Section="tblViewRoles"
                            Text="View Roles" ResourceKey="secViewRoles" IncludeRule="True" IsExpanded="false">
                        </dnn:SectionHead>
                        <table id="tblViewRoles" cellspacing="0" cellpadding="2" width="100%" border="0"
                            runat="server">
                            <tr>
                                <td class="Normal" style="width:150" valign="top">
                                    <dnn:Label ID="plViewRoles" runat="server" Suffix=":" ControlName="cblViewRoles"
                                        Text="View Roles">
                                    </dnn:Label>
                                </td>
                                <td valign="top">
                                    <asp:CheckBoxList ID="cblViewRoles" runat="server" CssClass="Normal" RepeatColumns="4"
                                        CellPadding="0" CellSpacing="0" Width="600">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="2">
                        <dnn:SectionHead ID="secRating" CssClass="SubHead" runat="server" Section="tblRating"
                            Text="Rating" ResourceKey="secRating" IncludeRule="True" IsExpanded="false">
                        </dnn:SectionHead>
                        <table id="tblRating" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                        <tr>
                        <td colspan="2">
                        <asp:Label ID="lblPortalDisableRating" runat="server" resourcekey="lblPortalDisableRating" CssClass="NormalRed"
                            Visible="false"></asp:Label>
                        </td>
                        </tr>
                            <tr>
                                <td class="Normal" style="width:150" valign="top">
                                    <dnn:Label ID="plAllowRating" runat="server" Text="Allow Rating" Suffix=":" ControlName="chkAllowRating">
                                    </dnn:Label>
                                </td>
                                <td valign="top">
                                    <asp:CheckBox ID="chkAllowRating" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="Normal" style="width:150" valign="top">
                                    <dnn:Label ID="plRatingRoles" runat="server" Suffix=":" ControlName="cblRatingRoles"
                                        Text="Rating Roles">
                                    </dnn:Label>
                                </td>
                                <td valign="top">
                                    <asp:CheckBoxList ID="cblRatingRoles" runat="server" CssClass="Normal" RepeatColumns="4"
                                        CellPadding="0" CellSpacing="0" Width="600">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="2">
                        <dnn:SectionHead ID="secRecommend" CssClass="SubHead" runat="server" Section="tblRecommend"
                            ResourceKey="secRecommend" IncludeRule="True" IsExpanded="false">
                        </dnn:SectionHead>
                        <table id="tblRecommend" cellspacing="0" cellpadding="2" width="100%" border="0"
                            runat="server">
                            <tr>
                        <td colspan="2">
                             <asp:Label ID="lblPortalDisableRecommend" runat="server" resourcekey="lblPortalDisableRecommend" CssClass="NormalRed"
                            Visible="false"></asp:Label>
                            </td>
                            </tr>
                            <tr>
                                <td class="Normal" style="width:150" valign="top">
                                    <dnn:Label ID="plAllowRecommend" runat="server" Suffix=":" ControlName="chkAllowRecommend">
                                    </dnn:Label>
                                </td>
                                <td valign="top">
                                    <asp:CheckBox ID="chkAllowRecommend" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="Normal" style="width:150" valign="top">
                                    <dnn:Label ID="plRecommendRoles" runat="server" Suffix=":" ControlName="cblRecommendRoles">
                                    </dnn:Label>
                                </td>
                                <td valign="top">
                                    <asp:CheckBoxList ID="cblRecommendRoles" runat="server" CssClass="Normal" RepeatColumns="4"
                                        CellPadding="0" CellSpacing="0" Width="600">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="2">
                        <dnn:SectionHead ID="secComment" CssClass="SubHead" runat="server" Text="Comment"
                            Section="tblComment" ResourceKey="secComment" IncludeRule="True" IsExpanded="false">
                        </dnn:SectionHead>
                        <table id="tblComment" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                        <tr>
                        <td colspan="2">
                         <asp:Label ID="lblPortalDisableComment" runat="server" resourcekey="lblPortalDisableComment" CssClass="NormalRed"
                            Visible="false"></asp:Label>
                            </td>
                            </tr>
                            <tr>
                                <td class="Normal" width="200">
                                    <dnn:Label ID="plAllowComment" runat="server" Text="Allow Comment" Suffix=":" ControlName="chkAllowComment">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkAllowComment" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="Normal" width="200">
                                    <dnn:Label ID="plCommentRoles" runat="server" Text="Comment Roles" Suffix=":" ControlName="cblCommentRoles">
                                    </dnn:Label>
                                </td>
                                <td valign="top">
                                    <asp:CheckBoxList ID="cblCommentRoles" runat="server" CssClass="Normal" ResourceKey="chkCommentRoles"
                                        RepeatColumns="4" CellPadding="0" CellSpacing="0" Width="600">
                                    </asp:CheckBoxList>
                                    <br>
                                </td>
                            </tr>
                            <tr>
                                <td class="Normal" width="300">
                                    <dnn:Label ID="plAutoAuthComment" runat="server" Text="Auto Authorize Comment" Suffix=":"
                                        ControlName="chkAutoAuthComment">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkAutoAuthComment" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
               
                <tr>
                    <td valign="top" colspan="2">
                        <dnn:SectionHead ID="secAttachment" CssClass="SubHead" runat="server" Section="tblAttachment"
                            ResourceKey="secAttachment" IncludeRule="True" IsExpanded="false">
                        </dnn:SectionHead>
                        
                        <table id="tblAttachment" cellspacing="0" cellpadding="2" width="100%" border="0"
                            runat="server">
                            
                            <tr>
                                <td id="Td1" colspan="2" runat="server">
                                    <asp:GridView ID="gvAttachment" runat="server" CellPadding="4"  
                                        DataKeyNames="Id" Width="100%" AutoGenerateColumns="False" 
                                        OnRowCommand="gvAttachment_RowCommand" ForeColor="#333333" GridLines="Both">
                                        <RowStyle CssClass="DataGrid_Item" BackColor="#F7F6F3" ForeColor="#333333" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <EmptyDataTemplate>
                                            <asp:Label ID="Label1" Text='<%# Localization.GetString("NoRecords", LocalResourceFile) %>'
                                                runat="server" CssClass="Normal"></asp:Label>
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle CssClass="DataGrid_Header" BackColor="#5D7B9D" Font-Bold="True" 
                                            ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblId" runat="server" resourcekey="lblId">Id</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIdField" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="20px" />
                                                <HeaderStyle Width="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblFilePath" runat="server" resourcekey="lblFilePath"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFilePathField" runat="server" Text='<%# Bind("FilePath") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgDelete" runat="server" ResourceKey="imgDelete" ImageUrl="~/images/delete.gif"
                                                        CommandName="DeleteItem" CommandArgument='<%#Eval("Id") %>' />
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" />
                                                <HeaderStyle Width="100px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr id="Tr2" runat="server">
                                <td id="Td2" valign="middle" class="Normal" runat="server">
                                    <dnn:Label ID="plAttachment" runat="server" ControlName="ctlAttachment" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td id="Td3" valign="middle" runat="server">
                                    <dnn:URL runat="server" ID="ctlAttachment" ShowDatabase="false" ShowLog="false" ShowNewWindow="false"   ShowUpLoad="true"
                                        ShowSecure="False" ShowTabs="false" Width="400" ShowTrack="false" ShowUrls="false"
                                        ShowUsers="false" />
                                    
                                </td>
                            </tr>
                            <tr valign="top">
                                <td />
                                <td>
                                    <asp:Button ID="btnAddAttachment" runat="server" CssClass="CommandButton" ResourceKey="btnAddAttachment"
                                        CausesValidation="False" OnClick="btnAddAttachment_Click" />
                                </td>
                            </tr>
                             <tr>
                                <td class="Normal" style="width:150" valign="top">
                                    <dnn:Label ID="plDownloadRoles" runat="server" Suffix=":" ControlName="cblDownloadRoles">
                                    </dnn:Label>
                                </td>
                                <td valign="top">
                                    <asp:CheckBoxList ID="cblDownloadRoles" runat="server" CssClass="Normal" RepeatColumns="4"
                                        CellPadding="0" CellSpacing="0" Width="600">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:SectionHead ID="secSummary" CssClass="SubHead" runat="server" Section="tblSummary"
                            ResourceKey="secSummary" IncludeRule="True" IsExpanded="false">
                        </dnn:SectionHead>
                        <table id="tblSummary" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="txtSummary" Width="100%" Height="100" runat="server" TextMode="MultiLine" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="2">
                        <dnn:SectionHead ID="secDetail" CssClass="SubHead" runat="server" Section="tblDetail"
                            Text="Detail" ResourceKey="secDetail" IncludeRule="True" IsExpanded="true">
                        </dnn:SectionHead>
                        <table id="tblDetail" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                            <tr>
                                <td colspan="2">
                                    <dnn:TextEditor ID="txtDetail" Width="100%" Height="400" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                     <td align="center">
          <asp:Image ImageUrl="~/images/save.gif" runat="server" ID="imgUpdateReturn1" Visible="false" /><asp:LinkButton
                CssClass="CommandButton" ID="lbtnUpdateReturn1" OnClick="lbtnUpdateReturn_Click"
                resourcekey="lbtnUpdateAndReturn" runat="server" BorderStyle="none"
                Visible="false"></asp:LinkButton>&nbsp;&nbsp;
           
            <asp:Image ImageUrl="~/images/delete.gif" runat="server" ID="imgDelete1" Visible="false" /><asp:LinkButton
                CssClass="CommandButton" ID="lbtnDelete1" resourcekey="lbtnDelete" runat="server"
                BorderStyle="none" Text="Delete" CausesValidation="False" OnClick="lbtnDelete_Click"
                Visible="false"></asp:LinkButton>&nbsp;&nbsp;
            <asp:Image ImageUrl="~/images/cancel.gif" runat="server" ID="imgReturn1" Visible="false" /><asp:LinkButton
                CssClass="CommandButton" ID="lbtnReturn1" resourcekey="lbtnReturn" runat="server"
                BorderStyle="none" Text="Return" CausesValidation="False" OnClick="lbtnReturn_Click"
                Visible="false"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
                </tr>
            </table>
        </td>
    </tr>
</table>