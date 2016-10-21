<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageFormEmailId.ascx.cs" Inherits="DotNetNuke.Modules.JaslokAdmin.ManageFormEmailId" ViewStateMode="Enabled" EnableTheming="true" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="border-3"></div>
    <div class="border-3"></div>
    <div class="border-3"></div>

    <div class="form-horizontal">
        <asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">
            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label for="">Select Form:<span style="color: red">*</span></label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <%-- <input type="text"  id="Name" placeholder="Name">--%>
                    <asp:DropDownList ID="ddlFormType" runat="server" class="form-control">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Complaint</asp:ListItem>
                        <asp:ListItem>Estimate Request</asp:ListItem>
                        <asp:ListItem>FeedBack</asp:ListItem>
                        <asp:ListItem>Quick Enquiry</asp:ListItem>
                         <asp:ListItem>Fix An Appointment</asp:ListItem>
                         <asp:ListItem>Jaslok Times Subscription</asp:ListItem>
                        <asp:ListItem>Apply Jaslok Career</asp:ListItem>
                        <asp:ListItem>Bed reservations</asp:ListItem>
                         <asp:ListItem>Permanent registration</asp:ListItem>
                         <asp:ListItem>Health Checkup</asp:ListItem>
                        <asp:ListItem>All Payment Gateway</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvformType" runat="server" ErrorMessage="Please Select Form Type" ControlToValidate="ddlFormType" InitialValue="--Select--"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
            </div>
            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label for="PageMail">Mail To:<span style="color: red">*</span></label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <%-- <input type="text"  id="Name" placeholder="Name">--%>
                    <asp:TextBox ID="txtMailTo" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please Enter Email Id" ControlToValidate="txtMailTo"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtxtMailto" runat="server" ErrorMessage="Please Enter Valid Email Id" ControlToValidate="txtMailTo"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                    <label for="PageMailcc">Mail CC:</label>
                </div>
                <div class="col-md-6" style="text-align: left;">
                    <%-- <input type="text"  id="Name" placeholder="Name">--%>
                    <asp:TextBox ID="txtMailcc" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revMailCc" runat="server" ErrorMessage="Please Enter Valid Email Id" ControlToValidate="txtMailcc"
                        Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*?(\s*[,;]\s*\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*?)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <%--<div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Album Description:</label>
                <div class="col-xs-9">
                    <telerik:RadEditor runat="server" ID="txtAlbumDesc">
                         <ImageManager ViewPaths="/Content/Album" UploadPaths="~/" DeletePaths="/Content/bks" />
                    </telerik:RadEditor>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageKeyword">Album Iamge Alternate Text:</label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtAltText" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>--%>
            <%--<div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label  for="redPageContent">Image:</label></div>
                <div class="col-md-6" style="text-align: left;">
                    <asp:FileUpload ID="UploadImages" runat="server" onchange="getFileData(this);" Style="color: transparent;" />
                    <asp:Label ID="listofuploadedfiles" runat="server" />
                   
                    <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="UploadImages" ValidationGroup="JHCat" ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg" ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                </div>
            </div>--%>
            <div class="row">
                <div class="col-xs-12" style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="JHCat" OnClick="btnSubmit_Click" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />
                </div>
            </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder ID="plcView" runat="server">
            <div class="form-group">
                <asp:Label ID="lblMessage" Visible="false" runat="server" /><br />
                <br />
               <%-- <asp:Button ID="btnAddMailDetail" runat="server" Text="Add Form Mail Details" CssClass="btn btn-default" OnClick="btnAddMailDetail_Click" /><br />--%>
                <br />


                <asp:Label ID="lblempty" Visible="false" runat="server" Text="No Record Found" Style="font-size: larger;"></asp:Label>
                <asp:DataGrid ID="dgFormMail" runat="server" AutoGenerateColumns="false" Width="100%"
                    AllowPaging="True" CssClass="normaltable22user"
                    DataKeyField="Id" OnItemCommand="dgFormMail_ItemCommand" OnPageIndexChanged="dgFormMail_PageIndexChanged">

                    <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                    <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                        Mode="NumericPages" CssClass="normaltableheadercelluser" />
                    <Columns>
                        <asp:BoundColumn DataField="FormType" HeaderText="Form" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
                        <asp:BoundColumn DataField="EmailToId" HeaderText="Email To" ItemStyle-Width="10%"></asp:BoundColumn>
                        <asp:BoundColumn DataField="EmailCCId" HeaderText="Email CC" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Edit" ItemStyle-Width="5%">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("Id")%>' AlternateText="click here to edit."
                                    ID="imgbtnEdit"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <%--<asp:TemplateColumn HeaderText="Delete">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("Id")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                                    ID="ImagebtnDelete"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>--%>
                    </Columns>
                    <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                    <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                        Mode="NumericPages" CssClass="normaltableheadercelluser" />

                </asp:DataGrid>

            </div>
        </asp:PlaceHolder>
    </div>

</div>












