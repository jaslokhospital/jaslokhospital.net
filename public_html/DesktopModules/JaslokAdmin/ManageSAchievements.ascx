<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageSAchievements.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageSAchievements" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="right_part">
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="form-horizontal">

            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Achievement Title:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                     <asp:TextBox ID="txtAchievementTitle" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter title" ControlToValidate="txtAchievementTitle"
                            Display="Dynamic" ValidationGroup="JaslokTimes" ForeColor="Red"></asp:RequiredFieldValidator> 
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Publish Date:</label>
                <div class="col-xs-9">
                  <telerik:RadDatePicker runat="server" ID="txtPublishDate"  Width="250px"></telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select News Date" ControlToValidate="txtPublishDate"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Achievement Summery:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                     <telerik:RadEditor runat="server" SkinID="BasicSetOfTools" ID="reAchievementSummary"
                                         Width="100%" Height="400px" ToolbarMode="ShowOnFocus">
                                    </telerik:RadEditor>
                </div>
            </div>
             <div class="form-group">
               <label class="control-label col-xs-3" for=""></label>
                <div class="col-xs-9">
                   <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="JaslokTimes" />&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        

                </div>
            </div>
            <asp:Label ID="lblMessage" runat="server" ></asp:Label>
        </div>
    </div>
</div>
<br />


<%--<asp:DataGrid ID="dgAchievement" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="NewsId" OnItemDataBound="dgNews_ItemDataBound" OnPageIndexChanged="dgNews_PageIndexChanging" EmptyDataText="No records has been added.">

                <HeaderStyle BackColor="Silver" />
                <PagerStyle Mode="NumericPages" HorizontalAlign="Right" />
                <Columns>
                    <asp:TemplateColumn HeaderText="Sr No">
                        <ItemTemplate>
                            <asp:Label ID="lblSlNo" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="NewsTitle" HeaderText="Title"></asp:BoundColumn>
                    <asp:BoundColumn DataField="NewsDate" HeaderText="Date"></asp:BoundColumn>
                    <asp:BoundColumn DataField="isActive" HeaderText="IsActive"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Edit">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />

            </asp:DataGrid>--%>
