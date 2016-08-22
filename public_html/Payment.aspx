<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<%
//Need to replace the last part of URL("your-vanityUrlPart") with your Testing/Live URL
//string formPostUrl = "https://sandbox.citruspay.com/sslperf/jaslokhospital";
////Need to change with your Secret Key
//string secret_key = "66fc8c3cca181b8954338bb5d5bd0cbb18b99b6d";
////Need to change with your Vanity URL Key from the citrus panel
//string vanityUrl = "jaslokhospital";
////Should be unique for every transaction
//string merchantTxnId = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");

////Need to change with your Order Amount
//string orderAmount = "1.00";
//string currency = "INR";
//string data = vanityUrl + orderAmount + merchantTxnId + currency;
//System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
//System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
//string securitySignature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();

//Response.Write("txm:" + merchantTxnId + "  " + securitySignature);
%>
<body>
    <form method="post" name="pay" action="<%=formPostUrl%>">
        <input type="hidden" id="merchantTxnId" name="merchantTxnId" value="<%=merchantTxnId%>" />
        <input type="hidden" id="orderAmount" name="orderAmount" value="<%=orderAmount%>" />
        <input type="hidden" id="currency" name="currency" value="<%=currency%>" />
        <input type="hidden" name="returnUrl" value="<%= returnUrl %>" />
        <input type="hidden" id="notifyUrl" name="notifyUrl" value="<%= returnUrl %>" />
        <input type="hidden" id="secSignature" name="secSignature" value="<%=securitySignature%>" />
        <div style="display: none;">
            <input type="submit" value="Pay Now" />
        </div>
    </form>
    <script type="text/javascript">
        window.onload = document.pay.submit();
    </script>
</body>
</html>
