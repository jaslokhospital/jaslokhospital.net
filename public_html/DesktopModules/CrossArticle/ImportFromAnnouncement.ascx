<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.ImportFromAnnouncement, App_Web_importfromannouncement.ascx.6c70b780" %>
<asp:Label ID="lblNoCategory" runat="server" resourcekey="lbNoCategory" CssClass="NormalRed"
    Visible="false"></asp:Label>
<table cellspacing="1" cellpadding="1" width="90%" border="0" class="Normal" runat="server" align="center"
    id="tblImport">
    <tr align="left">
        <td>
            <asp:Label ID="lblImportTips" runat="server" resourcekey="lblImportTips" />
        </td>
    </tr>
    <tr align="left">
        <td>
            <asp:TreeView ID="tvCategory" runat="server" ImageSet="XPFileExplorer" NodeIndent="10"
                PathSeparator="/" ShowCheckBoxes="All" ExpandDepth="0">
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
    <tr align="left">
        <td>
            <asp:LinkButton ID="lbtnImport" runat="server" resourcekey="lbtnImport" CausesValidation="false" CssClass="CommandButton"
                OnClick="lbtnImport_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnAdminHome" runat="server" resourcekey="lbtnAdminHome" CausesValidation="false"  CssClass="CommandButton"
                OnClick="lbtnAdminHome_Click"></asp:LinkButton>
        </td>
    </tr>
    <tr align="left">
        <td>
            <asp:Label ID="lblImportResult" runat="server" Visible="false" CssClass="NormalBold" />
        </td>
    </tr>
</table>
