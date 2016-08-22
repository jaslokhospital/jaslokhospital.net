<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewPositionDetails.aspx.cs" Inherits="JSControls_MiddleContent_ViewPositionDetails" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Position Details </title>

    <style type="text/css">    

        .normaltableuser {border-bottom: 1px solid #D1D1D3;border-right: 1px solid #D1D1D3; border-left: 1px solid #D1D1D3;border-top: 1px solid #D1D1D3; margin-bottom: 0px; font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;}
        .normaltableheadercelluser td{ line-height:25px; background-color: #E3E3E3; border-bottom: 1px solid #D1D1D3; border-right: 1px solid #D1D1D3; font-size: 14px; font-weight: bold; color: #000000; padding: 2px 8px; font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;}
        .normaltableheaderTitle { line-height:25px; background-color: #24B6B4; border-bottom: 1px solid #FFF; border-right: 1px solid #FFF; font-size: 14px; font-weight: bold; color:white; padding: 2px 8px; font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;}
        .normaltableheadercelluser { line-height:25px; background-color: #F1EFEF; border-bottom: 1px solid #FFF; border-right: 1px solid #FFF; font-size: 14px; font-weight: bold; color: #000000; padding: 2px 8px; font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;}
        .normaltableInputcelluser { line-height:25px; background-color: #F1EFEF; border-bottom: 1px solid #FFF; border-right: 1px solid #FFF; font-size: 14px; color: #000000; padding: 2px 8px; font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;}

    </style> 

</head>
<body>
    <form id="form1" runat="server">
        
        <table cellpadding="0" cellspacing="0" width="100%" class="normaltableuser">
            <tr>
                <td class="normaltableheaderTitle">
                    Details
                </td>
            </tr>
            <tr>
                <td class="normaltableInputcelluser">&nbsp;</td>
            </tr>
            <tr>
                <td class="normaltableheadercelluser">
                    Function Name
                </td>
            </tr>
            <tr>
                <td class="normaltableInputcelluser">
                    <asp:Label ID="lblFunctionName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="normaltableheadercelluser">
                    Post
                </td>
            </tr>
            <tr>
                <td class="normaltableInputcelluser">
                    <asp:Label ID="lblPost" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="normaltableheadercelluser">
                    Location
                </td>
            </tr>
            <tr>
                <td class="normaltableInputcelluser">
                    <asp:Label ID="lblLocation" runat="server"></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="normaltableheadercelluser">
                    Total Vacant Position
                </td>
            </tr>
            <tr>
                <td class="normaltableInputcelluser">
                    <asp:Label ID="lblTotalVacancy" runat="server"></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="normaltableheadercelluser">
                    Total Experience Required
                </td>
            </tr>
            <tr>
                <td class="normaltableInputcelluser">
                    <asp:Label ID="lblTotalExpReq" runat="server"></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="normaltableheadercelluser">
                    Key Role & Responsibilities
                </td>
            </tr>
            <tr>
                <td class="normaltableInputcelluser">
                    <asp:Label ID="lblRolesAndResp" runat="server"></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="normaltableheadercelluser">
                    Education Qualification
                </td>
            </tr>
            <tr>
                <td class="normaltableInputcelluser">
                    <asp:Label ID="lblEducation" runat="server"></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="normaltableheadercelluser">
                    Application to be submitted at
                </td>
            </tr>
            <tr>
                <td class="normaltableInputcelluser">
                    <asp:Label ID="lblSubmittedAt" runat="server"></asp:Label>&nbsp;
                </td>
            </tr>                               

        </table>

    </form>
</body>
</html>
