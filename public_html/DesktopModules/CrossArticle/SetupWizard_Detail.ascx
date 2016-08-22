<%@ control language="C#" inherits="Cross.Modules.Article.View.SetupWizard_Detail, App_Web_setupwizard_detail.ascx.6c70b780" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="Portal" Namespace="DotNetNuke.Security.Permissions.Controls"
    Assembly="DotNetNuke" %>
<asp:Wizard ID="wizArticle" runat="server" CssClass="Normal" ActiveStepIndex="0"
    SideBarStyle-Width="100px" Font-Names="Verdana" CellPadding="5" CellSpacing="5"
    FinishCompleteButtonType="Link" FinishPreviousButtonType="Link" StartNextButtonType="Link"
    StepNextButtonType="Link" StepPreviousButtonType="Link" Width="98%" BackColor="#F7F6F3"
    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Size="0.8em"
    OnFinishButtonClick="wizArticle_FinishButtonClick">
    <StepStyle VerticalAlign="Top" Width="100%" BorderWidth="0px" ForeColor="#5D7B9D"
        CssClass="Normal" />
    <NavigationButtonStyle CssClass="Normal" BackColor="#FFFBFF" BorderColor="#CCCCCC"
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
            <table cellspacing="2" cellpadding="2" class="Normal">
                <tr>
                    <td>
                        <asp:Label ID="lblGeneralTips" runat="server" resourcekey="lblGeneralTips" />
                    </td>
                </tr>
                <tr>
                    <td id="Td16" class="Normal">
                        <asp:RadioButtonList ID="rblCreateType" runat="server" AutoPostBack="True" CssClass="Normal"
                            OnSelectedIndexChanged="rblCreateType_SelectedIndexChanged">
                            <asp:ListItem Value="CreateNew" ResourceKey="li_CreateType_CreateNew" />
                            <asp:ListItem Value="UseExisting" ResourceKey="li_CreateType_UseExisting" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsPage" runat="server" Title='<%# Localization.GetString("wsPage", LocalResourceFile) %>'>
            <h2>
                <asp:Label ID="lblPage" runat="server" resourcekey="lblPage" />
            </h2>
            <hr />
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblPageCreateNew">
                <tr>
                    <td class="SubHead" style="width: 200px">
                        <dnn:Label ID="plTabName" runat="server" ControlName="txtTabName" />
                    </td>
                    <td style="width: 525px">
                        <asp:TextBox ID="txtTabName" CssClass="NormalTextBox" runat="server" MaxLength="50"
                            Text="Article Detail" Width="300" />
                        <asp:RequiredFieldValidator ID="valTabName" CssClass="NormalRed" runat="server" resourcekey="valTabName.ErrorMessage"
                            Display="Dynamic" ControlToValidate="txtTabName" />
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" style="width: 200px">
                        <dnn:Label ID="plTabTitle" runat="server" ControlName="txtTabTitle" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtTabTitle" CssClass="NormalTextBox" runat="server" MaxLength="200"
                            Width="300" />
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" style="width: 200px">
                        <dnn:Label ID="plTabDescription" runat="server" Suffix=":" ControlName="txtTabDescription" />
                    </td>
                    <td class="NormalTextBox" width="525">
                        <asp:TextBox ID="txtTabDescription" CssClass="NormalTextBox" runat="server" MaxLength="500"
                            Width="300" TextMode="MultiLine" Rows="3" />
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" style="width: 200px">
                        <dnn:Label ID="plTabKeywords" runat="server" ControlName="txtTabKeyWords" />
                    </td>
                    <td class="NormalTextBox" width="525">
                        <asp:TextBox ID="txtTabKeyWords" CssClass="NormalTextBox" runat="server" MaxLength="500"
                            Width="300" TextMode="MultiLine" Rows="3" />
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" style="width: 200px">
                        <dnn:Label ID="plParentTab" runat="server" ControlName="ddlParentTab" />
                    </td>
                    <td style="width: 400px">
                        <asp:DropDownList ID="ddlParentTab" CssClass="NormalTextBox" runat="server" DataTextField="IndentedTabName"
                            DataValueField="TabId" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="SubHead">
                        <dnn:Label ID="plPermissions" runat="server" CssClass="SubHead" ControlName="dgPermissions" />
                        <div style="text-align: left">
                            <Portal:TabPermissionsGrid ID="dgPermissions" runat="server" />
                        </div>
                        <br />
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblExistingTab">
                <tr>
                    <td class="SubHead" style="width: 200px">
                        <dnn:Label ID="plExistingTab" runat="server" ControlName="ddlExistingTab" />
                    </td>
                    <td style="width: 400px">
                        <asp:DropDownList ID="ddlExistingTab" CssClass="NormalTextBox" runat="server" DataTextField="IndentedTabName"
                            DataValueField="TabId" />
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsFinish" runat="server" Title='<%# Localization.GetString("wsFinish", LocalResourceFile) %>'
            StepType="Finish">
            <h2>
                <asp:Label ID="lblFinish" runat="server" Text="Finish" resourcekey="lblFinish" Width="600px" /></h2>
            <hr />
            <asp:Label ID="lblFailure" runat="server" Visible="False" CssClass="NormalRed" 
                />
        </asp:WizardStep>
    </WizardSteps>
    <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top"
        CssClass="Normal" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
        ForeColor="White" HorizontalAlign="Left" />
</asp:Wizard>
