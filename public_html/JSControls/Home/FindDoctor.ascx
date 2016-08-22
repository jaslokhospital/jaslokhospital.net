<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FindDoctor.ascx.cs" Inherits="JSControls_Home_FindDoctor"  %>

<div class="col-md-4">
    <div class="left_form">
        <div class="form-horizontal">
            

                
            <div class="form-group">
                <h3 class="find">Find a <span>Doctor</span></h3>
            </div>
          
            <div class="form-group">
             
                <asp:DropDownList ID="ddlSpecialty" runat="server" AutoPostBack = "true" EnableViewState="true" 
             OnSelectedIndexChanged="ddlSpecialty_SelectedIndexChanged1" class="form-control">
</asp:DropDownList>
            </div>
          
                    <div class="form-group">
                       
                        <asp:DropDownList ID="drpDoctorName" runat="server" AutoPostBack = "true"
 OnSelectedIndexChanged="drpDoctorName_SelectedIndexChanged" class="form-control">
</asp:DropDownList>
                    </div>
                
            <div class="form-group">
                <asp:LinkButton ID="lnkbtn" class="btn btn_submit" runat="server" OnClientClick="return Val();" OnClick="lnkbtn_Click">Submit<i class="glyphicon glyphicon-chevron-right"></i></asp:LinkButton>
            </div>

            
        </div>
    </div>
</div>


<script type="text/javascript">
    function Val() {
        if (document.getElementById('<%=ddlSpecialty.ClientID%>').selectedIndex == "0" && document.getElementById('<%=drpDoctorName.ClientID%>').selectedIndex == "0") {
            alert("Please select Speciality and Doctor Name!");

            return false;
        }
        return true;
    }
</script>
