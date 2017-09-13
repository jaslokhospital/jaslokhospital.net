<%@ Control Language="C#" AutoEventWireup="true" CodeFile="JaslokCareer.ascx.cs" Inherits="JSControls_MiddleContent_JaslokCareer" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style type="text/css">
    .rptHeader {
    background-color: #EBF2F6;
    font-size: 12px;
    font-weight: 400;
    line-height: 20px;
    padding: 6px;
    text-align: left;
    vertical-align: top;  
    font-size: 12px;
    line-height: 18px;
    font-weight:bold;
}

    .rptItemsStype {
    background-color: #ffffff;
    font-size: 12px;
    font-weight: 400;
    line-height: 20px;
    padding: 6px;
    text-align: left;
    vertical-align: top;
    font-size: 12px;
    line-height: 30px;
}
    .loading
    {
        background-color: #EFFBFB;
        border-width: 1px;
        border-style: solid;
        border-color: Gray;
        height: 100%;
        width: 100%;
    }

</style>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

    <script type="text/javascript">

        function ViewPostionInfo(JobId) {
            var d = new Date();
            var s = d.getSeconds();

            var manager = $find("<%=RadWindowManager1.ClientID %>");
            manager.open("/JSControls/MiddleContent/ViewPositionDetails.aspx?second=" + s + "&JobId=" + JobId + "&test=" + 1, "RadWindow1");

            return false;
        }
       
    </script>

</telerik:RadScriptBlock> 


<div class="search-form">
    <div class="form-inline well">
        <div class="input-group">
            <label>Category : </label><br />
            <asp:DropDownList ID="ddlCategory" runat="server" Height="25px"></asp:DropDownList>
        </div>
        <div class="input-group career-pos" style="padding-left:80px;">
            <label>Position : </label><br />
            <asp:DropDownList ID="ddlPosition" runat="server" Height="25px"></asp:DropDownList>
        </div>
        <div class="form-group career-grp" style="padding-left:50px;">              
            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-default btn-src" OnClick="btnSearch_Click" BackColor="#00bcd4" ForeColor="White"  />
            <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-default btn-src" OnClick="btnReset_Click" BackColor="#00bcd4" ForeColor="White" />
            
        </div>
    </div>
</div>

<br />

<table cellpadding="0" cellspacing="0" width="100%">
                
<telerik:RadGrid ID="rgCareerPost" BackColor="#f5f2ee" AllowSorting="false"
                AllowPaging="true" PageSize="5" EnableViewState="true" AutoGenerateColumns="false"
                runat="server" EnableLinqExpressions="false" EnableEmbeddedSkins="false" GridLines="None"
                ShowStatusBar="true" PagerStyle-Mode="NumericPages" OnNeedDataSource="rgCareerPost_NeedDataSource" OnPageIndexChanged="rgCareerPost_PageIndexChanged" 
    OnPageSizeChanged="rgCareerPost_PageSizeChanged">    
    <MasterTableView ShowFooter="false" DataKeyNames="JobId" EditMode="InPlace" AllowFilteringByColumn="false" >
        <NoRecordsTemplate>
            &nbsp;&nbsp;&nbsp;No Data Found
        </NoRecordsTemplate>
        <PagerStyle AlwaysVisible="true" Mode="NumericPages" ShowPagerText="false"  PageSizeControlType="None" />
        <CommandItemSettings ShowExportToWordButton="false" ShowExportToExcelButton="false"
            ShowExportToCsvButton="false" ShowAddNewRecordButton="false" />
        <Columns>
              <telerik:GridTemplateColumn UniqueName="BusinessName">
                <HeaderTemplate>
                    <tr>
                    <td class="rptHeader">Function Name
                        </td>
                        <td class="rptHeader">Position
                        </td>
                        <td class="rptHeader">Location
                        </td>
                        <td class="rptHeader">Total Experience<br />
                            (Years)
                        </td>
                        <td class="rptHeader">Total Vacancy
                        </td>
                        <td class="rptHeader">Apply
                        </td>
                    </tr>
                </HeaderTemplate>
                    <ItemTemplate>  
                        <tr>
                            <td class="rptItemsStype">
                                <asp:Label ID="lblFName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FunctionName") %>'></asp:Label>
                            </td>
                            <td class="rptItemsStype">
                                <a href="#" onclick="ViewPostionInfo('<%# DataBinder.Eval(Container.DataItem, "JobId") %>'); return false;">
                                    <%# DataBinder.Eval(Container, "DataItem.Position") %>
                                </a>                               
                            </td>
                            <td class="rptItemsStype">
                                <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Location") %>'></asp:Label>
                            </td>
                            <td class="rptItemsStype">
                                <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.TotalExperience") %>'></asp:Label>
                            </td>
                            <td class="rptItemsStype">
                                <asp:Label ID="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.TotalVacantPosition") %>'></asp:Label>
                            </td>
                            <td class="rptItemsStype">
                                <asp:LinkButton ID="lnkApply" runat="server" CommandName="Apply" ToolTip="Edit" Visible="false">Apply</asp:LinkButton>
                                <a href="/applytojaslok.aspx?JobId=<%# DataBinder.Eval(Container, "DataItem.JobId") %>" >Apply</a>
                            </td>
                        </tr>
                                
                    </ItemTemplate>
              </telerik:GridTemplateColumn>    
        </Columns>
    </MasterTableView>
                
    <ClientSettings>
        <%--<Scrolling  AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" >
        </Scrolling> --%>
                          
    </ClientSettings>
</telerik:RadGrid>

</table>


<telerik:RadWindowManager ID="RadWindowManager1" runat="server" InitialBehaviors="none"
    VisibleStatusbar="false" ShowOnTopWhenMaximized="true" Left="150px" KeepInScreenBounds="true"
    AutoSize="false" ShowContentDuringLoad="false" Modal="true" Opacity="100" Overlay="false">
    <windows>
        <telerik:RadWindow ID="RadWindow1" Skin="Telerik" runat="server" Behaviors="Close,Move,Maximize" width="750px" height="600px"/>
    </windows>
</telerik:RadWindowManager>