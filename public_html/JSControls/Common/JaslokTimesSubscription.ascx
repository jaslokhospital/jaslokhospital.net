﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="JaslokTimesSubscription.ascx.cs" Inherits="JSControls_Common_JaslokTimesSubscription" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function ShowPopup(message) {
        $(function () {
            $("#dialog").html(message);
            $("#dialog").dialog({
                title: "Subscribe",
                buttons: {
                    Close: function () {
                        $(this).dialog('close');
                    }
                },
                modal: true
            });
        });
    };
</script>
<div id="dialog"  style="display: none">
</div>




<div class="form-inline">
    <div class="form-group">
        <div class="input-group input1">
            <asp:TextBox ID="txtemail" runat="server" CssClass="exampleInputAmount" placeholder="Email Id"></asp:TextBox>
            
        </div>
    </div>
    <asp:Button ID="btnSubscription" runat="server" Text="Subscribe" CssClass="btn subscribe" ValidationGroup="timessub" OnClick="btnSubscription_Click" />
</div>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemail" ForeColor="Red" Display="Dynamic" CssClass="requiredFieldValidateStyle" ErrorMessage="Please Enter Email ID" ValidationGroup="timessub"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please Enter Valid Email ID" Display="Dynamic" ValidationGroup="timessub" ControlToValidate="txtemail" CssClass="requiredFieldValidateStyle"
                ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
            </asp:RegularExpressionValidator>