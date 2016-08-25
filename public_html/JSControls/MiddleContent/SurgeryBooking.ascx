<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SurgeryBooking.ascx.cs" Inherits="JSControls_MiddleContent_SurgeryBooking" ClientIDMode="Static" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

  <asp:PlaceHolder ID="plcDivError" runat="server" Visible="false">                
                <div class="alert alert-danger">
                    <img src="content/photogallery/cancel_24.png" width="24" height="24" class="img_check">
                    <strong>You are not Authorized to access this page!</strong>
                </div>

            </asp:PlaceHolder>
<div id="contentpane" runat="server">




<div class="bs-example scopeofservices surgeryBooking">
    <div id="accordion" class="panel-group">
       
        <asp:Repeater ID="rptOuter" runat="server" OnItemDataBound="rptOuter_ItemDataBound">
            <ItemTemplate>
                <div class="panel panel-default" style="border-bottom-width: medium; border-bottom-style: none;">

                    <div class="panel-heading">
                        <div class="panel-title" style="background: none 0% 0% repeat scroll #fff; border-bottom: 1px solid #cccccc; border-right: 1px solid #cccccc; border-top: 1px solid #cccccc;">
                            <a href='<%#"#collapse"+Container.ItemIndex+1 %>' data-parent="#accordion" data-toggle="collapse"><span class="fa fa-chevron-right" style="color: #ffffff;"></span>
                                <h4 style="margin: 0px; color: #00bcd4;"><%#Eval("Name") %></h4>
                            </a>
                        </div>
                    </div>

                    <div class='<%#Container.ItemIndex==0?"panel-collapse collapse in":"panel-collapse collapse" %>' id='<%#"collapse"+Container.ItemIndex+1 %>'>
                        <div class="panel-body panel-leftside">

                            <asp:Repeater ID="InnerRepeater" runat="server">
                                <ItemTemplate>
                                    
                                    <div class="radio border3">
                                        <label class="a_idc surgeryBookingRadio"> 
                                                                   
                                            <input type="radio" style="display: none;" class="button" id="Radio1" aria-valuetext="<%#Eval("Type") %>" data-admission="<%#Eval("Price") %>" name="<%#Eval("Type")+""+Container.ItemIndex+1 %>" value="<%#Eval("Price") %>" title='<%#Eval("NAME") %>'>
                                            <span class="lable_box">| <%#Eval("Type") %> </span>
                                         
                                        </label>
                                        <span class="lable_box price"><b>Price: &#8377; <%#Eval("Price") %></b></span>
                                    </div>



                                </ItemTemplate>
                            </asp:Repeater>

                        </div>

                    </div>
                    </div>
                
            </ItemTemplate>
        </asp:Repeater>


                
                    <div class="col-md-12 col-sm-12 col-xs-12 js-each-boxes">
                        <div class="col-md-4 col-sm-6 col-lg-4 col-xs-12 js-right-line js-right-spacing">
                            <%--<select class="form-control appoint_form" id="" name="dnn$LeftPaneBookAppointment1$ddlSpecialtyLPB">
                        <option value="0" selected="selected">Search by Doctor</option>
                        <option value="45">Accupressure</option>
                    </select>--%>
                            <asp:Label runat="server" ID="lbldoctor" Text="Doctors"></asp:Label>


                              <asp:DropDownList runat="server" ID="drpDoctorName" class="form-control doctorDropdown">
                            </asp:DropDownList>
                       <asp:RequiredFieldValidator ID="rfvDoctor" runat="server" CssClass="errormsg" ErrorMessage="Please select Doctor" ControlToValidate="drpDoctorName" InitialValue="0" Display="Dynamic" ValidationGroup="SB" ForeColor="Red"></asp:RequiredFieldValidator><br />
         
                        </div>
                        <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12 js-right-line js-right-spacing">
                            <asp:Label runat="server" ID="lblEnterdatetime" Text="Enter date time"></asp:Label>

                             <telerik:RadDateTimePicker ID="txtdatetime" DateInput-CssClass="riEmpty form-control" Style="height: 34px !important; Width:100% !important;" DateInput-EmptyMessageStyle-Font-Names="Roboto" runat="server"></telerik:RadDateTimePicker>
                            <asp:RequiredFieldValidator ID="rfvDate" runat="server" CssClass="errormsg" ErrorMessage="Please select Date" ControlToValidate="txtdatetime" Display="Dynamic" ValidationGroup="SB" ForeColor="Red"></asp:RequiredFieldValidator><br />

                                    <%-- <input type="text" value="Enter Date & time" class="riEmpty form-control" name="" id="Text1"> 
                    <span class="js-add-on"> <i class="fa fa-calendar" aria-hidden="true"></i></span>
                    <span class="js-add-on-clock"> <i class="fa fa-clock-o fa-lg" aria-hidden="true"></i></span>--%>
                        </div>


                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <asp:Label runat="server" ID="lblSurgeryFee" Text="Deposit Amount"></asp:Label>
                            <asp:TextBox ID="txtSurgeryFee" type="text" class="riEmpty form-control" onkeypress="return Numeric(event);" runat="server"></asp:TextBox>
                             <asp:HiddenField ID="hdnSurgeryFeeSB" runat="server" />
                        </div>
                    </div>

        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 js-zero-padding">

            <div class="form-group write-each">
                <%-- <a onclick="" id="A1" class="btn js-btn-primary3 pull-right">Submit</a>--%>
                <asp:LinkButton ID="btnSubmitSB" class="btn js-btn-primary3 pull-right" runat="server" ValidationGroup="SB" OnClientClick="return validateSURBooking()" OnClick="btnSubmitSB_Click">Pay</asp:LinkButton>
            </div>

            <div class="form-group">
                <div class="col-xs-8 col-md-12 text-right">
                    <asp:HiddenField ID="hdnFacilityNameSB" runat="server" />
                    <asp:HiddenField ID="hdnCategorySB" runat="server" />
                </div>
            </div>
        </div> 
    </div>
     
</div>
</div>