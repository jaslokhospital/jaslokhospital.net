<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.CategoryManage, App_Web_categorymanage.ascx.6c70b780" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="url" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<asp:Label ID="lblTips" runat="server" resourcekey="lblTips" Visible="false" CssClass="normal"></asp:Label>
<br />
<table cellspacing="1" cellpadding="1" width="100%" border="0" align="center">
    <tr align="left">
        <td valign="top" align="left" width="30%">
         <asp:TreeView ID="tvNavigate" runat="server" ImageSet="XPFileExplorer" NodeIndent="10"
                PathSeparator="/" ExpandDepth="2" OnSelectedNodeChanged="tvNavigate_SelectedNodeChanged">
                <ParentNodeStyle Font-Bold="False" />
                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                    VerticalPadding="0px" />
                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                    NodeSpacing="0px" VerticalPadding="2px" />
            </asp:TreeView>
            
           
        </td>
        <td valign="top" align="left" width="70%">
            <table cellspacing="0" cellpadding="0" width="100%" border="0" runat="server" id="tblDetail">
                <tr>
                    <td class="Normal" valign="top" width="150">
                        <dnn:Label ID="plName" runat="server" ControlName="txtName">
                        </dnn:Label>
                    </td>
                    <td valign="top">
                        <asp:TextBox ID="txtName" CssClass="NormalTextBox" runat="server" Width="350"></asp:TextBox><asp:Image
                            ID="Image1" runat="server" ImageUrl="~/images/required.gif" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="valCategoryNameRequired" runat="server" Text="<BR>Category Name Required."
                            ControlToValidate="txtName" Display="Dynamic" ErrorMessage="<BR>Category Name Required."
                            resourcekey="valCategoryNameRequired" CssClass="NormalRed"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" valign="top" width="150">
                        <dnn:Label ID="plDescription" runat="server" ControlName="txtDescription">
                        </dnn:Label>
                    </td>
                    <td valign="top">
                        <asp:TextBox ID="txtDescription" CssClass="NormalTextBox" runat="server" Width="350"
                            Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" valign="top" width="150">
                        <dnn:Label ID="plParent" runat="server" Text="Parent:" ControlName="cboParent">
                        </dnn:Label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="cboParent" CssClass="NormalTextBox" runat="server" Width="350"
                            DataTextField="Name" DataValueField="Id">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="imagerow" runat="server" visible="true">
                    <td class="Normal" valign="top" width="150">
                        <dnn:Label ID="plImage" runat="server" Text="Image:" ControlName="ctlURL">
                        </dnn:Label>
                    </td>
                    <td valign="top" nowrap>
                        <dnn:url ID="ctlImage" runat="server" FileFilter="jpg,jpeg,jpe,gif,bmp,png" Required="False"
                            ShowLog="false" ShowNewWindow="false" ShowNone="false" ShowTabs="false" ShowTrack="false"
                            ShowUrls="false" ShowFiles="true" ShowUpLoad="true" Width="350">
                        </dnn:url>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" valign="top" width="150">
                        <dnn:Label ID="plViewOrder" runat="server" Text="View Order:">
                        </dnn:Label>
                    </td>
                    <td valign="top" align="left">
                        <asp:ImageButton ID="ibtnUp" runat="server" AlternateText="Move category  order up "
                            resourcekey="ibtnUp.Help" CommandName="up" ImageUrl="~/images/up.gif" OnClick="ibtnUp_Click">
                        </asp:ImageButton>
                        <asp:ImageButton ID="ibtnDown" runat="server" AlternateText="Move category  order down"
                            resourcekey="ibtnDown.Help" CommandName="down" ImageUrl="~/images/dn.gif" OnClick="ibtnDown_Click">
                        </asp:ImageButton>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" valign="top" colspan="6" height="2">
                        <hr>
                    </td>
                </tr>
                <tr align="center">
                    <td align="center" colspan="2" height="36">
                        <asp:LinkButton ID="lbtnUpdate" runat="server" resourcekey="lbtnUpdate" CssClass="CommandButton"
                            OnClick="lbtnUpdate_Click"></asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="lbtnDelete" runat="server" resourcekey="lbtnDelete" CssClass="CommandButton"
                            OnClick="lbtnDelete_Click"> Delete</asp:LinkButton>
                        <asp:LinkButton ID="lbtnAddNew" runat="server" resourcekey="lbtnAddNew" CssClass="CommandButton"
                            Visible="False" OnClick="lbtnAddNew_Click"></asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="lbtnAddSibling" runat="server" resourcekey="lbtnAddSibling" CssClass="CommandButton"
                            OnClick="lbtnAddSibling_Click"></asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="lbtnAddChild" runat="server" Text="Add Child" resourcekey="lbtnAddChild"
                            CssClass="CommandButton" OnClick="lbtnAddChild_Click"></asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton CssClass="Normal" ID="lbtnReturn" OnClick="lbtnReturn_Click"
                            resourcekey="lbtnReturn" runat="server" BorderStyle="none" CausesValidation="False"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
