<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewSeminarEntries.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ViewSeminarEntries" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript">
    $(function () {


    });

    function ViewDetail() {
        $("#divViewSeminarDetail").dialog({
            autoOpen: false,
            show: {
                effect: "blind",
                duration: 1000
            },
            hide: {
                effect: "clip",
                duration: 1000
            }
        });


        $("#divViewSeminarDetail").dialog("open");

    }
</script>
<style>
    .ui-dialog {
        top:20px !important;
    }
    div.ui-dialog-titlebar > .ui-dialog-titlebar-close {
          right: 6px !important;
            top: 8px !important;
    }
</style>
<table cellpadding="4" cellspacing="4" width="100%">
    <tr>
        <td colspan="2">
             <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
            <asp:DataGrid ID="dgSeminarEntries" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user" OnPageIndexChanged="dgSeminarEntries_PageIndexChanging" OnItemCommand="dgSeminarEntries_ItemCommand"
                DataKeyField="EntryId" >

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
                    <asp:TemplateColumn HeaderText="TITLE">
                        <ItemTemplate>
                            <asp:LinkButton ID="title" runat="server" Text='<%# Bind("TITLE") %>' CommandName="TITLE" ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                   
                   
                    <asp:BoundColumn DataField="Name" HeaderText="Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Graduate" HeaderText="Graduate"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Institution" HeaderText="Institution"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Address" HeaderText="Address"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Phone" HeaderText="Phone"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Mobile" HeaderText="FunctionName"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Fax" HeaderText="Fax"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Email" HeaderText="Email"></asp:BoundColumn>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />

            </asp:DataGrid>
        </td>
    </tr>
</table>
<div id="divViewSeminarDetail" class="white_content" title="Seminar Details">
    
     <asp:DetailsView ID="SeminarDetailsView" runat="server" AutoGenerateRows="False"
         AllowPaging="false"
        EnableViewState="False" BorderStyle="None" GridLines="None" AlternatingRowStyle-BorderStyle="None">
        <Fields>
            <asp:BoundField DataField="Title" HeaderText="Title"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name"></asp:BoundField>
            <asp:BoundField DataField="Graduate" HeaderText="Graduate"></asp:BoundField>
            <asp:BoundField DataField="Institution" HeaderText="Institution" ></asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" ></asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone"></asp:BoundField>
            <asp:BoundField DataField="Mobile" HeaderText="FunctionName" ></asp:BoundField>
            <asp:BoundField DataField="Fax" HeaderText="Fax"></asp:BoundField>
               <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>            
            
            

        </Fields>
    </asp:DetailsView> 
    </div>