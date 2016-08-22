<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageEnquiries.ascx.cs" Inherits="DotNetNuke.Modules.JaslokAdmin.ManageEnquiries" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<script type="text/javascript">
    $(function () {


    });

    //function ViewDetail() {
    //    $("#divViewEnquiryDetail").dialog({
    //        autoOpen: false,
    //        minWidth: 700,
    //        show: {
    //            effect: "blind",
    //            duration: 1000
    //        },
    //        hide: {
    //            effect: "clip",
    //            duration: 1000
    //        }
    //    });

    //    $("#divViewEnquiryDetail").dialog("open");
    //    return false;
    //}
    $(document).ready(function () {

        $("#myEnqBtn").click(function () {
            $("#myEnqModal").modal();
        });

    });

</script>
<%--<style>
    .ui-dialog {
        top: 50%px !important;
    }

    .black_overlay {
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: black;
        z-index: 1001;
        -moz-opacity: 0.8;
        opacity: .80;
        filter: alpha(opacity=80);
    }

    .white_content {
        display: none;
        position: absolute;
        top: 25%;
        /*left: 25%;*/
        width: 50%;
        height: 90%;
        padding: 16px;
        border: 16px solid orange;
        background-color: white;
        z-index: 1002;
        overflow: auto;
    }

    div.ui-dialog-titlebar > .ui-dialog-titlebar-close {
        right: 6px !important;
        top: 8px !important;
    }

    ui-dialog.ui-widget.ui-widget-content.ui-corner-all.ui-front.ui-draggable.ui-resizable {
        width: 30% !important;
    }
</style>--%>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

    <%-- <h3>Quick Inquiry</h3>--%>
    <div class="border-3"></div>
    <div class="border-3"></div>
    <div class="border-3"></div>

    <div class="row" style="width: 80%">
        <div class="col-md-6" style="text-align: right;">
            <label>Enquiry Type:<span style="color: red">*</span></label>
        </div>
        <div class="col-md-6" style="text-align: left;">
            <asp:DropDownList ID="ddlEnquiry" runat="server" class="form-control" Width="300px" OnSelectedIndexChanged="ddlEnquiry_SelectedIndexChanged">
                <asp:ListItem Value="1">--Select--</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please Select Enquiry Type" ControlToValidate="ddlEnquiry" InitialValue="0"
                Display="Dynamic" ValidationGroup="MH" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>


    <div class="row">
        <div class="col-md-12" style="text-align: center;">
            <asp:Button ID="btnSubmit" runat="server" Text="Show" OnClick="btnSubmit_Click" ValidationGroup="MH" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />
        </div>
    </div>
    <asp:Label ID="lblMessage" Visible="false" runat="server" />
</div>

<table cellpadding="4" cellspacing="4" style="width: 100%;">

    <tr>
        <td colspan="2">
            <div id="divDataGride" runat="server" style="width: 100%;">
                <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: medium; color: red"></asp:Label>
                <asp:DataGrid ID="dgEnquiry" runat="server" AutoGenerateColumns="False" Width="100%"
                    AllowPaging="true" PageSize="10" CssClass="normaltable22user"
                    DataKeyField="EnquiryId" OnItemCommand="dgEnquiry_ItemCommand" OnPageIndexChanged="dgEnquiry_PageIndexChanged">
                    <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                    <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                        Mode="NumericPages" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Sl No" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Label ID="lblSlNo" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>

                        <%--<asp:TemplateColumn HeaderText="Enquiry Name">
                        <ItemTemplate>
                            <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.EnquiryType") %>' Width="400px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn> --%>

                        <asp:BoundColumn DataField="Name" HeaderText="Name" HeaderStyle-Width="10%" ItemStyle-Width="10%"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Age" HeaderText="Age" HeaderStyle-Width="7%" ItemStyle-Width="7%"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Gender" HeaderText="Gender" HeaderStyle-Width="7%" ItemStyle-Width="7%"></asp:BoundColumn>
                        <%--<asp:BoundColumn DataField="EnquiryTypeId" HeaderText="EnquiryTypeId"></asp:BoundColumn>--%>
                        <asp:BoundColumn DataField="MobileNo" HeaderText="Mobile" HeaderStyle-Width="10%" ItemStyle-Width="10%"></asp:BoundColumn>
                        <asp:BoundColumn DataField="EmailId" HeaderText="Email" HeaderStyle-Width="15%" ItemStyle-Width="15%"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FeedbackText" HeaderText="Feedback Text" HeaderStyle-Width="20%" ItemStyle-Width="20%"></asp:BoundColumn>


                        <asp:BoundColumn DataField="CommentText" HeaderText="Complaint Details" HeaderStyle-Width="20%" ItemStyle-Width="20%"></asp:BoundColumn>
                        <asp:BoundColumn DataField="QuestionText" HeaderText="Question" HeaderStyle-Width="15%" ItemStyle-Width="15%"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Comment1" HeaderText="Which Health<br/> Check Up would<br/> you opt for " HeaderStyle-Width="20%" ItemStyle-Width="20%"></asp:BoundColumn>

                        <asp:BoundColumn DataField="Comment2" HeaderText="Number of Individuals<br/> for which package<br/> is required" HeaderStyle-Width="20%" ItemStyle-Width="20%"></asp:BoundColumn>
                        <asp:BoundColumn DataField="AppointmentDate" HeaderText="1st Preferred<br/> day of Health Check<br/> appointment " HeaderStyle-Width="15%" ItemStyle-Width="15%"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Comment3" HeaderText="Comment" HeaderStyle-Width="15%" ItemStyle-Width="15%"></asp:BoundColumn>
                        <%--<asp:BoundColumn DataField="EnquiryId" HeaderText="EnquiryID"></asp:BoundColumn>--%>

                        <asp:TemplateColumn HeaderText="View" HeaderStyle-Width="7%" ItemStyle-Width="7%">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>

                                <%-- <asp:Button ID="ImagebtnView"  CommandName="View" CommandArgument='<%#Eval("EnquiryId")%>'  runat="server" Text="view" />
                                --%>
                                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target='<%#"#myModal"+Container.ItemIndex%>'>view</button>
                                <div id='<%#"myModal"+Container.ItemIndex%>' class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title"><%=EnqType%></h4>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table table-striped">
                                                    <tr id="divName" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("Name")))?false:true %>'>
                                                        <td><b>Name:-  </b></td>
                                                        <td><%#Eval("Name")%></td>
                                                    </tr>
                                                    <tr id="div1" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("Gender")))?false:true %>'>
                                                        <td><b>Gender:-  </b></td>
                                                        <td><%#Eval("Gender")%></td>
                                                    </tr>
                                                    <tr id="div2" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("Age")))?false:true %>'>
                                                        <td><b>Age:-  </b></td>
                                                        <td><%#Eval("Age")%></td>
                                                    </tr>
                                                    <tr id="Tr1" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("MobileNo")))?false:true %>'>
                                                        <td><b>Mobile:-  </b></td>
                                                        <td><%#Eval("MobileNo")%></td>
                                                    </tr>
                                                    <tr id="Tr2" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("EmailId")))?false:true %>'>
                                                        <td><b>Email:-  </b></td>
                                                        <td><%#Eval("EmailId")%></td>
                                                    </tr>
                                                    <tr id="Tr3" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("FeedbackText")))?false:true %>'>
                                                        <td><b>Feedback:-  </b></td>
                                                        <td><%#Eval("FeedbackText")%></td>
                                                    </tr>
                                                    <tr id="Tr4" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("CommentText")))?false:true %>'>
                                                        <td><b>Complaint:-  </b></td>
                                                        <td><%#Eval("CommentText")%></td>
                                                    </tr>
                                                    <tr id="Tr5" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("Comment1")))?false:true %>'>
                                                        <td><b>Which Health
Check Up would
you opt for:-  </b></td>
                                                        <td><%#Eval("Comment1")%></td>
                                                    </tr>
                                                    <tr id="Tr6" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("Comment2")))?false:true %>'>
                                                        <td><b>Number of Individuals
for which package
is required:-  </b></td>
                                                        <td><%#Eval("Comment2")%></td>
                                                    </tr>
                                                    <tr id="Tr7" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("Comment3")))?false:true %>'>
                                                        <td><b>Comment:-</b></td>
                                                        <td><%#Eval("Comment3")%></td>
                                                    </tr>
                                                    <tr id="Tr8" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("AppointmentDate")))?false:true %>'>
                                                        <td><b>1st Preferred
day of Health Check
appointment:-  </b></td>
                                                        <td><%#Eval("AppointmentDate")%></td>
                                                    </tr>
                                                </table>




                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <%-- <button id="ImagebtnViewid" CommandArgument='<%#Eval("EnquiryId")%>' onclick='<%#string.Format("ViewEnquiry({0})", Eval("EnquiryId")) %>'>view</button>
                                --%>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <%--<asp:TemplateColumn HeaderText="View">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%--<asp:HyperLink ID="lnkView" Text="View" OnClientClick="return ViewDetail();"  runat="server" />
                            <a href="javascript:void(0);" onclick="return ViewDetail();">View</a>
                        </ItemTemplate>
                    </asp:TemplateColumn>--%>
                        <asp:TemplateColumn HeaderText="Delete" HeaderStyle-Width="7%" ItemStyle-Width="7%">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("EnquiryId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                                    ID="ImagebtnDelete"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                    <HeaderStyle BackColor="Silver" />
                    <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                        Mode="NumericPages" CssClass="normaltableheadercelluser" />
                </asp:DataGrid>

            </div>
        </td>
    </tr>
</table>

<%--<div id="divViewEnquiryDetail" class="white_content" title="Enquiry Details" style="width: 750px; height: 600px">


    <asp:DetailsView ID="EnquiryDetailsView" runat="server" AutoGenerateRows="False"
        AllowPaging="false" AlternatingRowStyle-BorderColor="#999966" FieldHeaderStyle-Font-Bold="true"
        EnableViewState="False" BorderStyle="None" GridLines="None" RowStyle-BackColor="LightBlue">

        <Fields>
            <asp:BoundField DataField="Name" HeaderText="Name: "></asp:BoundField>
            <asp:BoundField DataField="Age" HeaderText="Age: "></asp:BoundField>
            <asp:BoundField DataField="Gender" HeaderText="Gender: "></asp:BoundField>
            <asp:BoundField DataField="EnquiryTypeId" HeaderText="EnquiryTypeId: "></asp:BoundField>
            <asp:BoundField DataField="MobileNo" HeaderText="Mobile: "></asp:BoundField>
            <asp:BoundField DataField="EmailId" HeaderText="Email: "></asp:BoundField>
            <asp:BoundField DataField="FeedbackText" HeaderText="Feedback Text: "></asp:BoundField>

            <asp:BoundField DataField="CommentText" HeaderText="Complaint Details: "></asp:BoundField>
            <asp:BoundField DataField="QuestionText" HeaderText="Question: "></asp:BoundField>
            <asp:BoundField DataField="Comment1" HeaderText="Which Health Check Up would you opt for: "></asp:BoundField>
            <asp:BoundField DataField="Comment2" HeaderText="Number of Individuals for which package is required: "></asp:BoundField>
            <asp:BoundField DataField="AppointmentDate" HeaderText="1st Preferred day of Health Check appointment: "></asp:BoundField>
            <asp:BoundField DataField="Comment3" HeaderText="Comment: "></asp:BoundField>
            <asp:BoundField DataField="EnquiryId" HeaderText="EnquiryID "></asp:BoundField>
        </Fields>
    </asp:DetailsView>
</div>--%>
