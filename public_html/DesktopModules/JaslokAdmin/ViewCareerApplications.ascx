<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewCareerApplications.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ViewCareerApplications" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script>
    function showpopup()
    {
        alert(111);
        document.getElementById('light').style.display='block';
        document.getElementById('fade').style.display = 'block';

        return false;
    }
</script>
 <style>
    .black_overlay{
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: black;
        z-index:1001;
        -moz-opacity: 0.8;
        opacity:.80;
        filter: alpha(opacity=80);
    }
    .white_content {
        display: none;
        position: absolute;
        top: 25%;
        left: 25%;
        width: 50%;
        height: 90%;
        padding: 16px;
        border: 16px solid orange;
        background-color: white;
        z-index:1002;
        overflow: auto;
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

        function ViewWorkExperience(ApplicantID) {
            var d = new Date();
            var s = d.getSeconds();

            var manager = $find("<%=RadWindowManager1.ClientID %>");
            manager.open("/DesktopModules/JaslokAdmin/ViewCandidateWorkExp.aspx?second=" + s + "&ApplicantID=" + ApplicantID + "&test=" + 1, "RadWindow1");

            return false;
        }

        function ViewQualification(ApplicantID) {
            var d = new Date();
            var s = d.getSeconds();

            var manager = $find("<%=RadWindowManager1.ClientID %>");
            manager.open("/DesktopModules/JaslokAdmin/ViewAppQualifications.aspx?second=" + s + "&ApplicantID=" + ApplicantID + "&test=" + 1, "RadWindow1");

            return false;
        }

    </script>

</telerik:RadScriptBlock> 



<table cellpadding="4" cellspacing="4" width="100%">
    <tr>
        <td colspan="2">
             <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
            <asp:DataGrid ID="dgApplication" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="ApplicantID" OnItemCommand="dgApplication_ItemCommand" OnPageIndexChanged="dgApplication_PageIndexChanging" EmptyDataText="No records has been added.">

                 <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>
                    <asp:TemplateColumn HeaderText="Sr No">
                        <ItemTemplate>
                            <asp:Label ID="lblSlNo" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="FunctionName" HeaderText="Function Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Position" HeaderText="Job Role"></asp:BoundColumn>
                    <asp:BoundColumn DataField="ApplicantName" HeaderText="Applicant Name"></asp:BoundColumn>
                    <%--<asp:BoundColumn DataField="MiddleName" HeaderText="LastName"></asp:BoundColumn>--%>
                    <%--<asp:BoundColumn DataField="LastName" HeaderText="Last Name"></asp:BoundColumn>--%>
                    <asp:BoundColumn DataField="ApplicantDOB" HeaderText="DOB" DataFormatString="{0:d}" ></asp:BoundColumn>
                    <asp:BoundColumn DataField="ApplicantGender" HeaderText="Gender"></asp:BoundColumn>
                    <%--<asp:BoundColumn DataField="Religion" HeaderText="Religion"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Nationality" HeaderText="Nationality"></asp:BoundColumn>
                    <asp:BoundColumn DataField="OfficeNo" HeaderText="OfficeNo"></asp:BoundColumn>
                    <asp:BoundColumn DataField="ResidenceNo" HeaderText="ResidenceNo"></asp:BoundColumn>--%>
                    <asp:BoundColumn DataField="ApplicantMobile" HeaderText="MobileNo"></asp:BoundColumn>
                    <asp:BoundColumn DataField="ApplicantEmail" HeaderText="EmailId"></asp:BoundColumn>
                    <%--<asp:BoundColumn DataField="CurrentAddress" HeaderText="CurrentAddress"></asp:BoundColumn>
                    <asp:BoundColumn DataField="PermanentAddress" HeaderText="PermanentAddress"></asp:BoundColumn>--%>
                    <asp:BoundColumn DataField="ApplicantCurrSal" HeaderText="Current Salary"></asp:BoundColumn>
                    <asp:BoundColumn DataField="ApplicantExpSal" HeaderText="Expected Salary"></asp:BoundColumn>
                     <%--<asp:BoundColumn DataField="UploadedResume" HeaderText="Uploaded Resume"></asp:BoundColumn>--%>
                    <asp:TemplateColumn HeaderText="View" Visible="false">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle> 
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Qualification">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <a href="#" onclick="ViewQualification('<%# DataBinder.Eval(Container.DataItem, "ApplicantID") %>'); return false;">
                                View
                            </a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Work Experience">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                             <a href="#" onclick="ViewWorkExperience('<%# DataBinder.Eval(Container.DataItem, "ApplicantID") %>'); return false;">
                                View
                            </a>                            
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Resume">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ApplicantCVPath") %>
                             <%--<a href='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "ApplicantCVPath"))==string.Empty?"#":DataBinder.Eval(Container.DataItem, "ApplicantCVPath") %>' target="_blank">
                                Resume
                            </a>  --%>                          
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />

            </asp:DataGrid>
        </td>
    </tr>
</table>

<div class="modal pop-up-2" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>




<div id="light" style="display:none;"  >
     <a style="text-align:right" href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">Close</a>
    <asp:DetailsView ID="dvWorkExp" runat="server" AutoGenerateRows="False"
                             AllowPaging="false"
                            EnableViewState="False" BorderStyle="None" GridLines="None" AlternatingRowStyle-BorderStyle="None">
                            <Fields>
                                <asp:BoundField DataField="FunctionName" HeaderText="FunctionName: "></asp:BoundField>
                                <asp:BoundField DataField="Job_Role" HeaderText="Job_Role: "></asp:BoundField>
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName: "></asp:BoundField>
                                <asp:BoundField DataField="MiddleName" HeaderText="LastName: "></asp:BoundField>
                                <asp:BoundField DataField="LastName" HeaderText="MiddleName: "></asp:BoundField>
                                <asp:BoundField DataField="DOB" HeaderText="DOB: "></asp:BoundField>
                                <asp:BoundField DataField="Gender" HeaderText="Gender:"></asp:BoundField>
                                <asp:BoundField DataField="Religion" HeaderText="Religion: "></asp:BoundField>
                                <asp:BoundField DataField="Nationality" HeaderText="Nationality: "></asp:BoundField>
                                <asp:BoundField DataField="OfficeNo" HeaderText="OfficeNo: "></asp:BoundField>
                                <asp:BoundField DataField="ResidenceNo" HeaderText="ResidenceNo: "></asp:BoundField>
                                <asp:BoundField DataField="MobileNo" HeaderText="MobileNo: "></asp:BoundField>
                                <asp:BoundField DataField="EmailId" HeaderText="EmailId: "></asp:BoundField>
                                <asp:BoundField DataField="CurrentAddress" HeaderText="CurrentAddress: "></asp:BoundField>
                                <asp:BoundField DataField="PermanentAddress" HeaderText="PermanentAddress: "></asp:BoundField>
                                <asp:BoundField DataField="CurrentSalary" HeaderText="CurrentSalary: "></asp:BoundField>
                                <asp:BoundField DataField="ExpectedSalary" HeaderText="ExpectedSalary: "></asp:BoundField>

                            </Fields>
                        </asp:DetailsView> 

</div>
<div id="fade" class="black_overlay">
   
</div>

<telerik:RadWindowManager ID="RadWindowManager1" runat="server" InitialBehaviors="none"
    VisibleStatusbar="false" ShowOnTopWhenMaximized="true" Left="150px" KeepInScreenBounds="true"
    AutoSize="false" ShowContentDuringLoad="false" Modal="true" Opacity="100" Overlay="false">
    <windows>
        <telerik:RadWindow ID="RadWindow1" Skin="Telerik" runat="server" Behaviors="Close,Move,Maximize" AutoSize="true"/>
    </windows>
</telerik:RadWindowManager>



<script type="text/javascript">
    (function ($) {
        "use strict"

        // Accordion Toggle Items
        var iconOpen = 'fa fa-minus',
             iconClose = 'fa fa-plus';

        $(document).on('show.bs.collapse hide.bs.collapse', '.accordion', function (e) {
            var $target = $(e.target)
            $target.siblings('.accordion-heading')
            .find('em').toggleClass(iconOpen + ' ' + iconClose);
            if (e.type == 'show')
                $target.prev('.accordion-heading').find('.accordion-toggle').addClass('active');
            if (e.type == 'hide')
                $(this).find('.accordion-toggle').not($target).removeClass('active');
        });

    })(jQuery);
</script>

