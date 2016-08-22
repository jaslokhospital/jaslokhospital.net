<%@ control language="C#" inherits="Cross.Modules.Article.View.ListDashboardSettings, App_Web_listdashboardsettings.ascx.6c70b780" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<asp:Wizard ID="wizFlash" runat="server" CssClass="normal" ActiveStepIndex="0" Font-Names="Verdana"
    CellPadding="5" CellSpacing="5" FinishCompleteButtonType="Link" FinishPreviousButtonType="Link"
    StartNextButtonType="Link" StepNextButtonType="Link" StepPreviousButtonType="Link"
    Width="98%" BackColor="#F7F6F3" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
    Font-Size="0.8em" OnFinishButtonClick="wizFlash_FinishButtonClick">
    <StepStyle VerticalAlign="Top" Width="100%" BorderWidth="0px" ForeColor="#5D7B9D"
        CssClass="normal" />
    <NavigationButtonStyle CssClass="normal" BackColor="#FFFBFF" BorderColor="#CCCCCC"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
        ForeColor="#284775" />
    <StepNavigationTemplate>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td align="right">
                    <asp:LinkButton ID="StepPreviousButton" runat="server" CommandName="MovePrevious"
                        Text='<%#Localization.GetString("StepPreviousButton", LocalResourceFile)%>' CssClass="CommandButton" />
                </td>
                <td align="right">
                    <asp:LinkButton ID="StepNextButton" runat="server" CommandName="MoveNext" Text='<%#Localization.GetString("StepNextButton", LocalResourceFile)%>'
                        CssClass="CommandButton" />
                </td>
                <td align="right">
                    <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" CssClass="CommandButton"
                        resourcekey="cmdCancel" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(this.TabId)%>" />
                </td>
            </tr>
        </table>
    </StepNavigationTemplate>
    <WizardSteps>
        <asp:WizardStep ID="wsGeneral" runat="server" Title='<%# Localization.GetString("wsGeneral", LocalResourceFile) %>'
            StepType="Start">
            <h2>
                <asp:Label ID="lblGeneral" runat="server" resourcekey="lblGeneral" />
            </h2>
            <hr />
            
            <table id="tblGeneral" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
           
              <tr>
                    <td class="normal" width="200">
                        <dnn:Label ID="plPlayMode" runat="server" Suffix=":" ControlName="ddlPlayMode" Text="Choose Play Mode">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbPlayModeList" runat="server" AutoPostBack="True" CssClass="normal"
                            OnSelectedIndexChanged="rbPlayModeList_SelectedIndexChanged">
                            <asp:ListItem Value="ImageNavigate" resourcekey="liPlayModeList_ImageNavigate" />
                            <asp:ListItem Value="ImageNavigateIntegrative" resourcekey="liPlayModeList_ImageNavigateIntegrative" />
                            <asp:ListItem Value="ImageNavigateBlack" resourcekey="liPlayModeList_ImageNavigateBlack" />
                           
                        </asp:RadioButtonList>
                        </td>
                </tr>
                
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plViewTemplate" runat="server" Suffix=":" ControlName="ddlViewTemplate">
                        </dnn:label>
                    </td>
                    <td valign="top">
                        <asp:DropDownList ID="ddlViewTemplate" CssClass="normal" runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plDetailTab" runat="server" Suffix=":" ControlName="ddlDetailTab">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDetailTab" DataValueField="TabId" DataTextField="IndentedTabName"
                            CssClass="NormalTextBox" runat="server"  Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
              
               <tr valign="top" align="left">
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plRows" runat="server"  
                            ControlName="txtRows">
                        </dnn:Label>
                    </td>
                    <td class="normal">
                        <asp:TextBox ID="txtRows" runat="server" CssClass="NormalTextBox" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" resourcekey="MustBeInteger" runat="server"
                            ValidationExpression="\d*" ControlToValidate="txtRows"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plFeatured" runat="server" Suffix=":" ControlName="chkFeatured">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFeatured" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" width="200">
                        <dnn:label ID="plSortField" runat="server" Text="Sort By" Suffix=":" ControlName="ddlSortField">
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
                    <td class="Normal" width="200">
                        <dnn:label ID="plCategory" runat="server" Suffix=":" ControlName="ctlCategories">
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
            
          
            <dnn:sectionhead ID="secPlayModeTips" runat="server" Section="tblPlayModeTips" ResourceKey="secPlayModeTips"
                IncludeRule="True" IsExpanded="False" CssClass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" class="normal" runat="server" id="tblPlayModeTips">
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgImageNavigate_Classical" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossArticle/Images/ImageNavigate_Classical.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_Classical" resourcekey="lblImageNavigate_Classical"
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgImageNavigate_Integrative" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossArticle/Images/ImageNavigate_Integrative.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_Integrative" resourcekey="lblImageNavigate_Integrative"
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgImageNavigate_Black" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/CrossArticle/Images/ImageNavigate_Black.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_Black" resourcekey="lblImageNavigate_Black" runat="server"></asp:Label>
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblPlayModeTips" resourcekey="lblPlayModeTips" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsFlashSettings" runat="server" Title='<%# Localization.GetString("wsFlashSettings",LocalResourceFile) %>'>
            <h2>
                <asp:Label ID="lblFlashSettings" runat="server" resourcekey="lblFlashSettings"/>
               
            </h2>
            <hr />
               <dnn:sectionhead ID="secFlashGeneral" runat="server" Section="tblFlashGeneral" ResourceKey="secFlashGeneral"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" class="normal" runat=server id="tblFlashGeneral">
              
               
                <tr valign="top" align="left">
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plFlashWidth" runat="server" Text="Flash Width" ResourceKey="plFlashWidth"
                            ControlName="txtFlashWidth">
                        </dnn:Label>
                    </td>
                    <td class="normal">
                        <asp:TextBox ID="txtFlashWidth" runat="server" CssClass="NormalTextBox" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regWidth" resourcekey="MustBeInteger" runat="server"
                            ValidationExpression="\d*" ControlToValidate="txtFlashWidth"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plFlashHeight" runat="server" ResourceKey="plFlashHeight" ControlName="txtFlashHeight"
                            Text="Flash Height">
                        </dnn:Label>
                    </td>
                    <td align="left" class="normal">
                        <asp:TextBox ID="txtFlashHeight" runat="server" CssClass="NormalTextBox" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regHeight" resourcekey="MustBeInteger" runat="server"
                            ValidationExpression="\d*" ControlToValidate="txtFlashHeight"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plFlashBgColor" runat="server" ControlName="txtFlashBgColor" Text="Background Color">
                        </dnn:Label>
                    </td>
                    <td align="left" class="normal">
                        <asp:TextBox ID="txtFlashBgColor" runat="server" CssClass="NormalTextBox" Columns="16"></asp:TextBox>
                        <a id="pickFlashBgColor" name="pickFlashBgColor" href="javascript:void(PickFlashBgColor())"
                            target="_self">
                            <asp:Image ID="Image13" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossArticle/Images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtFlashBgColor"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server"
                            ControlToValidate="txtFlashBgColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
                <tr>
                    <td class="normal" width="200">
                        <dnn:Label ID="plFlashAlign" runat="server" Suffix=":" ControlName="ddlFlashAlign"
                            Text="Flash Align">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFlashAlign" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="left" ResourceKey="liFlashAlign_left" />
                            <asp:ListItem Value="center" ResourceKey="liFlashAlign_center" />
                            <asp:ListItem Value="right" ResourceKey="liFlashAlign_right" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="Tr29" runat="server">
                    <td id="Td55" class="normal" width="200" runat="server">
                        <dnn:Label ID="plFlashWmode" runat="server" Suffix=":" ControlName="ddlFlashWmode"
                            Text="Flash Wmode Option">
                        </dnn:Label>
                    </td>
                    <td id="Td56" runat="server">
                        <asp:DropDownList ID="ddlFlashWmode" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="window" resourcekey="liFlashWmode_window" />
                            <asp:ListItem Value="opaque" resourcekey="liFlashWmode_opaque" />
                            <asp:ListItem Value="transparent" resourcekey="liFlashWmode_transparent" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
               <dnn:sectionhead ID="secNavigateSettings" runat="server" Section="tblNavigateSettings" ResourceKey="secNavigateSettings"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" class="normal" runat="server" id="tblNavigateSettings"
                visible="false">
                <tr>
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plIntervalTime" runat="server" ControlName="txtIntervalTime" Text="Rotator Internal(sec)">
                        </dnn:Label>
                    </td>
                    <td align="left" class="normal">
                        <asp:TextBox ID="txtIntervalTime" runat="server" CssClass="NormalTextBox" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtIntervalTime"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plTextHeight" runat="server" ResourceKey="plTextHeight" ControlName="txtTextHeight"
                            Text="Image Title Height">
                        </dnn:Label>
                    </td>
                    <td align="left" class="normal">
                        <asp:TextBox ID="txtTextHeight" runat="server" CssClass="NormalTextBox" Width="100px"></asp:TextBox>
                        <asp:Label ID="lblTextHeightTips" runat="server" resourcekey="lblTextHeightTips"
                            Text="Set it to zero if you don't want to show image title"></asp:Label>
                        <asp:RegularExpressionValidator ID="regTextHeight" resourcekey="MustBeInteger" runat="server"
                            ValidationExpression="\d*" ControlToValidate="txtTextHeight"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="normal" width="200">
                        <dnn:Label ID="plTextAlign" runat="server" Suffix=":" ControlName="ddlTextAlign"
                            Text="Text Align">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTextAlign" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="left" ResourceKey="liTextAlign_left" />
                            <asp:ListItem Value="center" ResourceKey="liTextAlign_center" />
                            <asp:ListItem Value="right" ResourceKey="liTextAlign_right" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
              <dnn:sectionhead ID="secNavigateIntegrativeSettings" runat="server" Section="tblNavigateIntegrativeSettings" ResourceKey="secNavigateIntegrativeSettings"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" class="normal" runat="server" id="tblNavigateIntegrativeSettings"
                visible="false">
                <tr>
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plNavigateIntegrative_TextSize" runat="server" ControlName="txtNavigateIntegrative_TextSize">
                        </dnn:Label>
                    </td>
                    <td align="left" class="normal">
                        <asp:TextBox ID="txtNavigateIntegrative_TextSize" runat="server" CssClass="NormalTextBox"
                            Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator14" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNavigateIntegrative_TextSize"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plNavigateIntegrative_TxtColor" runat="server" ControlName="txtNavigateIntegrative_TxtColor">
                        </dnn:Label>
                    </td>
                    <td align="left" class="normal">
                        <asp:TextBox ID="txtNavigateIntegrative_TxtColor" runat="server" CssClass="NormalTextBox"
                            Columns="16"></asp:TextBox>
                        <a id="pickNavigateIntegrative_TxtColor" name="pickNavigateIntegrative_TxtColor" href="javascript:void(PickNavigateIntegrative_TxtColor())"
                            target="_self">
                            <asp:Image ID="Image9" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossArticle/Images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtNavigateIntegrative_TxtColor"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server"
                            ControlToValidate="txtNavigateIntegrative_TxtColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
                <tr>
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plNavigateIntegrative_Speed" runat="server" ControlName="txtNavigateIntegrative_Speed">
                        </dnn:Label>
                    </td>
                    <td align="left" class="normal">
                        <asp:TextBox ID="txtNavigateIntegrative_Speed" runat="server" CssClass="NormalTextBox"
                            Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator15" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNavigateIntegrative_Speed"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            
                <tr>
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plNavigateIntegrative_BtnBg" runat="server" ControlName="txtNavigateIntegrative_BtnBg">
                        </dnn:Label>
                    </td>
                    <td align="left" class="normal">
                        <asp:TextBox ID="txtNavigateIntegrative_BtnBg" runat="server" CssClass="NormalTextBox"
                            Columns="16"></asp:TextBox>
                        <a id="pickNavigateIntegrative_BtnBg" name="pickNavigateIntegrative_BtnBg" href="javascript:void(PickNavigateIntegrative_BtnBg())"
                            target="_self">
                            <asp:Image ID="Image8" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossArticle/Images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtNavigateIntegrative_BtnBg"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server"
                            ControlToValidate="txtNavigateIntegrative_BtnBg" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
            </table>
            
              <dnn:sectionhead ID="secNavigateBlackSettings" runat="server" Section="tblNavigateBlackSettings" ResourceKey="secNavigateBlackSettings"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" class="normal" runat="server" id="tblNavigateBlackSettings"
                visible="false">
                <tr>
                    <td class="normal" style="width: 200px">
                        <dnn:Label ID="plNavigateBlack_Speed" runat="server" ControlName="txtNavigateBlack_Speed">
                        </dnn:Label>
                    </td>
                    <td align="left" class="normal">
                        <asp:TextBox ID="txtNavigateBlack_Speed" runat="server" CssClass="NormalTextBox"
                            Width="60px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNavigateBlack_Speed"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
      
        </asp:WizardStep>
   
        <asp:WizardStep ID="wsFinish" runat="server" Title='<%# Localization.GetString("wsFinish", LocalResourceFile) %>'
            StepType="Finish">
            <h2>
                <asp:Label ID="lblFinish" runat="server" Text="Finish" resourcekey="lblFinish" Width="600" /></h2>
            <hr />
            <asp:Label ID="lblFailure" runat="server" Visible="False" CssClass="normalred" Text="Submit Failure" />
        </asp:WizardStep>
    </WizardSteps>
    <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top"
        CssClass="normal" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
        ForeColor="White" HorizontalAlign="Left" />
</asp:Wizard>
