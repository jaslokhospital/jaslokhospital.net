<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewSeminarDetails.aspx.cs" Inherits="JSControls_MiddleContent_ViewSeminarDetails" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Seminar Info</title>

    <style type="text/css">

    </style>

</head>
<body>
    <form id="form1" runat="server">
    

        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="right_part">
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="form-horizontal">

            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Title:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                     <asp:TextBox ID="txtTitle" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Seminar Date:</label>
                <div class="col-xs-9">
                   <asp:TextBox ID="txtDateOfSeminar" runat="server" class="form-control"></asp:TextBox>

                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Timings:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                      <asp:TextBox ID="txtTimings" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>           
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Venue:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtVenue" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Officer InCharge:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtOfficerInCharge" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Contact:</label>
                <div class="col-xs-9">                   
                   <asp:TextBox ID="txtContact" runat="server" class="form-control" MaxLength="10" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return false;"></asp:TextBox>

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Email:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Brochure:</label>
                <div class="col-xs-9">                   
               
                            <asp:Label ID="listofuploadedfiles" runat="server" />
                         
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Time Topic:</label>
                <div class="col-xs-9">                   
                     <asp:Label ID="listofuploadedTimeTOPIC" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Expiry Date:</label>
                <div class="col-xs-9">                   
                    
                </div>
            </div>
         
        </div>
    </div>
</div>
<br />

    </form>
</body>
</html>
