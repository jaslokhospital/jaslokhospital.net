<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewPaymentDetails.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ViewPaymentDetails" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="border-3"></div>
<div class="border-3"></div>
<br />

<div class="form-horizontal">
    <div class="row" style="width: 80%">
        <div class="col-md-6" style="text-align: right;">
            <label>Select Type:</label>
        </div>
        <div class="col-md-6" style="text-align: left;">
                  <asp:DropDownList runat="server" ID="drpType" AutoPostBack="true"   class="form-control" Width="250px" OnSelectedIndexChanged="drpType_SelectedIndexChanged">
                      <asp:ListItem Value="0">All Transaction</asp:ListItem>
                      <asp:ListItem Value="1">Service Failed Transaction</asp:ListItem>
                           
                        </asp:DropDownList>
            <%--<asp:TextBox ID="txtBannerLink" class="form-control" runat="server"></asp:TextBox>--%>
        </div>
    </div>
</div>
<asp:Label ID="lblMessage" runat="server" />
<asp:PlaceHolder ID="plcView" runat="server">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger;"></asp:Label>
        
        <asp:DataGrid ID="dgPaymentDetails" runat="server" OnPageIndexChanged="dgPaymentDetails_PageIndexChanging" AutoGenerateColumns="False" Width="100%" CssClass="normaltable22user" EmptyDataText="No records has been added." AllowPaging="true" PageSize="10">
            <Columns>
               <asp:BoundColumn DataField="MRNumber" HeaderText="MR Number/User Name"  ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                 <asp:BoundColumn DataField="TransactionId" HeaderText="Txtn. Id"  ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
               <asp:BoundColumn DataField="PaidAgainst" HeaderText="Paid Against"  ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
               <asp:BoundColumn DataField="amount" HeaderText="Amount Paid"  ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                <asp:BoundColumn DataField="Date" HeaderText="Date"  ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
               <asp:BoundColumn DataField="JeevaStatus" HeaderText="Status"  ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
              
            </Columns>
            <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
            <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom" Mode="NumericPages" CssClass="normaltableheadercelluser" />
        </asp:DataGrid>
    </div>
</asp:PlaceHolder>

