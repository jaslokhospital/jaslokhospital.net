<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WriteToUs.ascx.cs" Inherits="JSControls_Home_WriteToUs" %>
<div class="col-md-4 col-sm-4 col-lg-4 col-xs-12">
    <div class="contact-left writeusform">
        <div role="form" class="form-horizontal right_part">
            <h3 class="dnn_h3header">Write to us</h3>
            <div>
                <asp:UpdatePanel ID="updateWTU" runat="server">
                    <ContentTemplate>
                        <%-- <asp:CheckBoxList ID="" runat="server" class="" OnSelectedIndexChanged="df_SelectedIndexChanged" AutoPostBack="true">
                     <asp:ListItem id=""  Value=""><span></span></asp:ListItem>
                        <asp:ListItem id="" Text="" Value="complaint"></asp:ListItem>
                    </asp:CheckBoxList>--%>
                        <asp:RadioButtonList runat="server" CssClass="form-group writetous" ID="radioWTU" >
                            <asp:ListItem id="feedback" Value="feedback"><span>feedback</span></asp:ListItem>
                            <asp:ListItem id="complaint" Value="complaint"><span>Complaint</span></asp:ListItem>
                        </asp:RadioButtonList>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
            <div class="form-group write-each1">
                <asp:TextBox ID="txtname" runat="server" class="form-control control" placeholder="Name:"></asp:TextBox>
            </div>
            <div class="form-group write-each">
                <asp:TextBox ID="txtemail" runat="server" class="form-control control" placeholder="Email ID:"></asp:TextBox>

            </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="WTU" ControlToValidate="txtEmail" CssClass="requiredFieldValidateStyle"
                ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
            </asp:RegularExpressionValidator>
            <div class="form-group write-each">
                <asp:LinkButton ID="lnkbtn" class="btn btn-primary2" runat="server" ValidationGroup="WTU" OnClientClick="return ValidationWTU();" OnClick="lnkbtn_Click">Submit</asp:LinkButton>
            </div>
        </div>
    </div>
</div>
<%-- <div class="form-group">
                                    <input type="checkbox" name="Feedback" value="Feedback" id="feedback" checked="checked">
                                    <label for="feedback">Feed-Back</label>
                                    <input type="checkbox" name="complaint" value="complaint" id="complaint">
                                    <label for="complaint">Complaint</label>
                                </div>--%>

<%--<script type="text/javascript">
    function ValWTU() {
        
        if ($('#<%=radioWTU.ClientID %> input[type=radio]:checked').val() != 'feedback' && $('#<%=radioWTU.ClientID %> input[type=radio]:checked').val() != 'complaint') {
            alert("Please select Feedback or Compaint option");
            return false;
        }
        else if (document.getElementById('<%=txtname.ClientID%>').value == "" && document.getElementById('<%=txtemail.ClientID%>').value == "") {
            alert("Please enter Name and Email !");
            return false;
        }
        return true;
    }
</script>--%>
