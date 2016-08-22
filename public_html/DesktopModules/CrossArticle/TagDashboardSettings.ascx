<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.TagDashboardSettings, App_Web_tagdashboardsettings.ascx.6c70b780" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<table id="tblGeneral" cellspacing="0" cellpadding="2" width="95%" border="0" runat="server" class="Normal" align="center">
    <tr>
        <td class="Normal" width="200">
            <dnn:Label ID="plViewTemplate" runat="server" Suffix=":" ControlName="ddlViewTemplate">
            </dnn:Label>
        </td>
        <td valign="top">
            <asp:DropDownList ID="ddlViewTemplate" CssClass="Normal" runat="server" Width="60%">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="Normal" width="200">
            <dnn:Label ID="plListTab" runat="server" Suffix=":" ControlName="ddlListTab"></dnn:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlListTab" DataValueField="TabId" DataTextField="IndentedTabName"
                CssClass="NormalTextBox" runat="server" Width="60%">
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
            <dnn:Label ID="plAlign" runat="server" Suffix=":" ControlName="ddlAlign" />
   
        </td>
        <td>
            <asp:DropDownList ID="ddlAlign" runat="server" CssClass="NormalTextBox">
                <asp:ListItem Value="left" ResourceKey="liAlign_left" />
                <asp:ListItem Value="center" ResourceKey="liAlign_center" />
                <asp:ListItem Value="right" ResourceKey="liAlign_right" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr valign="top" align="left">
        <td class="Normal" style="width: 200px">
            <dnn:Label ID="plRows" runat="server" ControlName="txtRows"></dnn:Label>
        </td>
        <td class="Normal">
            <asp:TextBox ID="txtRows" runat="server" CssClass="NormalTextBox" Width="100px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRows"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr valign="top" align="left">
        <td class="Normal" style="width: 200px">
            <dnn:Label ID="plFlashWidth" runat="server" Text="Flash Width" ResourceKey="plFlashWidth"
                ControlName="txtFlashWidth"></dnn:Label>
        </td>
        <td class="Normal">
            <asp:TextBox ID="txtFlashWidth" runat="server" CssClass="NormalTextBox" Width="100px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regWidth" resourcekey="MustBeInteger" runat="server"
                ValidationExpression="\d*" ControlToValidate="txtFlashWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width: 200px">
            <dnn:Label ID="plFlashHeight" runat="server" ResourceKey="plFlashHeight" ControlName="txtFlashHeight"
                Text="Flash Height"></dnn:Label>
        </td>
        <td align="left" class="Normal">
            <asp:TextBox ID="txtFlashHeight" runat="server" CssClass="NormalTextBox" Width="100px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regHeight" resourcekey="MustBeInteger" runat="server"
                ValidationExpression="\d*" ControlToValidate="txtFlashHeight"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="width: 200px">
            <dnn:Label ID="plFlashBgColor" runat="server" ControlName="txtFlashBgColor" Text="Background Color">
            </dnn:Label>
        </td>
        <td align="left" class="Normal">
            <asp:TextBox ID="txtFlashBgColor" runat="server" CssClass="NormalTextBox" Columns="16"></asp:TextBox>
            <a id="pickFlashBgColor" name="pickFlashBgColor" href="javascript:void(PickFlashBgColor())"
                target="_self">
                <asp:Image ID="Image13" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossProduct/Images/ColorPick.jpg" /></a>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtFlashBgColor"
                CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server"
                ControlToValidate="txtFlashBgColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
        </td>
    </tr>
   
    <tr id="Tr29" runat="server">
        <td id="Td55" class="Normal" width="200" runat="server">
            <dnn:Label ID="plFlashWmode" runat="server" Suffix=":" ControlName="ddlFlashWmode"
                Text="Flash Wmode Option"></dnn:Label>
        </td>
        <td id="Td56" runat="server">
            <asp:DropDownList ID="ddlFlashWmode" runat="server" CssClass="NormalTextBox">
                <asp:ListItem Value="window" resourcekey="liFlashWmode_window" />
                <asp:ListItem Value="opaque" resourcekey="liFlashWmode_opaque" />
                <asp:ListItem Value="transparent" resourcekey="liFlashWmode_transparent" />
            </asp:DropDownList>
        </td>
    </tr>
     <tr>
        <td class="Normal" width="200">
            <dnn:Label ID="plDistr" runat="server" Suffix=":" ControlName="chkDistr" />
        </td>
        <td>
            <asp:checkbox ID="chkDistr" runat="server" />
        </td>
    </tr>
     <tr>
        <td class="Normal" style="width: 200px">
            <dnn:Label ID="plTcolor" runat="server" ControlName="txtTcolor">
            </dnn:Label>
        </td>
        <td align="left" class="Normal">
            <asp:TextBox ID="txtTcolor" runat="server" CssClass="NormalTextBox" Columns="16"></asp:TextBox>
            <a id="pickTcolor" name="pickTcolor" href="javascript:void(PickTcolor())"
                target="_self">
                <asp:Image ID="Image1" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossProduct/Images/ColorPick.jpg" /></a>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTcolor"
                CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ControlToValidate="txtTcolor" CssClass="NormalRed" ResourceKey="InvalidHex"
                SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
        </td>
    </tr>
    
      <tr>
        <td class="Normal" style="width: 200px">
            <dnn:Label ID="plTcolor2" runat="server" ControlName="txtTcolor2">
            </dnn:Label>
        </td>
        <td align="left" class="Normal">
            <asp:TextBox ID="txtTcolor2" runat="server" CssClass="NormalTextBox" Columns="16"></asp:TextBox>
            <a id="pickTcolor2" name="pickTcolor2" href="javascript:void(PickTcolor2())"
                target="_self">
                <asp:Image ID="Image2" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossProduct/Images/ColorPick.jpg" /></a>&nbsp;
        </td>
    </tr>
    
     <tr>
        <td class="Normal" style="width: 200px">
            <dnn:Label ID="plHicolor" runat="server" ControlName="txtHicolor">
            </dnn:Label>
        </td>
        <td align="left" class="Normal">
            <asp:TextBox ID="txtHicolor" runat="server" CssClass="NormalTextBox" Columns="16"></asp:TextBox>
            <a id="pickHicolor" name="pickHicolor" href="javascript:void(PickHicolor())"
                target="_self">
                <asp:Image ID="Image3" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossProduct/Images/ColorPick.jpg" /></a>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtHicolor"
                CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                ControlToValidate="txtHicolor" CssClass="NormalRed" ResourceKey="InvalidHex"
                SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
        </td>
    </tr>
    <tr valign="top" align="left">
        <td class="Normal" style="width: 200px">
            <dnn:Label ID="plTspeed" runat="server"  
                ControlName="txtTspeed"></dnn:Label>
        </td>
        <td class="Normal">
            <asp:TextBox ID="txtTspeed" runat="server" CssClass="NormalTextBox" Width="100px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" resourcekey="MustBeInteger" runat="server"
                ValidationExpression="\d*" ControlToValidate="txtTspeed"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdCancel" OnClick="cmdCancel_Click"
        resourcekey="cmdCancel" runat="server" BorderStyle="none" Text="Cancel" CausesValidation="False"></asp:LinkButton>&nbsp;
</p>
