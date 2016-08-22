<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAppQualifications.aspx.cs" Inherits="DesktopModules_JaslokAdmin_ViewAppQualifications" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Applicant Qualification</title>

     <style type="text/css">
        .normaltableuser {border-bottom: 1px solid #D1D1D3;border-right: 1px solid #D1D1D3; border-left: 1px solid #D1D1D3;border-top: 1px solid #D1D1D3; margin-bottom: 0px; font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;}
        .normaltable22user {border-bottom: 1px solid #808080;border-right:1px solid #808080; border-left: 2px solid #D1D1D3;border-top: 2px solid #D1D1D3; margin-bottom: 0px; font-family: "Helvetica Neue",Helvetica,Arial,sans-serif; font-size: 12px;}
        .normaltablecelluser {border-bottom: 1px solid #D1D1D3; border-right: 1px solid #D1D1D3; padding: 5px 8px; font-family: arial; font-size: 12px;}
        .normaltablecelluser td{border-bottom: 1px solid #D1D1D3; border-right: 1px solid #D1D1D3; padding: 5px 8px; font-family: arial; font-size: 12px;}
        .normaltableheadercelluser td{ line-height:25px; background-color: #E3E3E3; border-bottom: 1px solid #D1D1D3; border-right: 1px solid #D1D1D3; font-size: 14px; font-weight: bold; color: #000000; padding: 2px 8px; font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;}
        .normaltableheadercelluser { line-height:25px; background-color: #E3E3E3; border-bottom: 1px solid #D1D1D3; border-right: 1px solid #D1D1D3; font-size: 14px; font-weight: bold; color: #000000; padding: 2px 8px; font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;}
        .normaltabletitlecelluser { line-height:20px; background-color: #D1D1D3; border-bottom: 1px solid #D1D1D3; border-right: 1px solid #D1D1D3; font-size: 12px; font-weight: bold; color: #000000; padding: 2px 8px; font-family:"Helvetica Neue",Helvetica,Arial,sans-serif; font-size: 14px;}

    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
            <asp:DataGrid ID="dgAppQualification" runat="server" AutoGenerateColumns="true" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="AppQualification"  EmptyDataText="No records has been added.">

                 <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom" Width="100%"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />

            </asp:DataGrid>
    </div>
    </form>
</body>
</html>
