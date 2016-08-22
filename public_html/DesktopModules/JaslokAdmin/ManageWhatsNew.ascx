<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageWhatsNew.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageWhatsNew" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script language="javascript" type="text/javascript">
    function confirmdelete() {
        if (confirm("Are you sure you want to Delete this record?") == true)
            return true;
        else
            return false;

    }
</script>


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
                     <asp:TextBox ID="txtWhatsNewTitle" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter file name" ControlToValidate="txtWhatsNewTitle"
                            Display="Dynamic" ValidationGroup="JaslokTimes" ForeColor="Red"></asp:RequiredFieldValidator> 
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Choose File:</label>
                <div class="col-xs-9">
                   <asp:FileUpload ID="fileUploadWNew" runat="server" />
                        <asp:Label ID="lblfileName" runat="server" Visible="false" />
                        <asp:RegularExpressionValidator ID="revFileUploadTOPIC" runat="server" ControlToValidate="fileUploadWNew"
                             Display="Dynamic" ForeColor="Red" ValidationGroup="JaslokTimes" ErrorMessage="Only .docx,.pdf,.txt,.doc" ValidationExpression="(.*\.([dD][oO][cC][xX])|.*\.([pP][dD][fF])|.*\.([tT][xX][tT])|.*\.([dD][oO][cC][xX])$)"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please choose file" ControlToValidate="fileUploadWNew"
                            Display="Dynamic" ValidationGroup="JaslokTimes" ForeColor="Red"></asp:RequiredFieldValidator> 
                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Summury:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                     <telerik:RadEditor runat="server" SkinID="BasicSetOfTools" ID="reWhatsNewSummary"
                                         Width="100%" Height="400px" ToolbarMode="ShowOnFocus">
                                    </telerik:RadEditor>
                </div>
            </div>  
            
                     
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Is Active:</label>
                <div class="col-xs-9">                   
                    <asp:CheckBox ID="chkFileActive" runat="server" />
                </div>
            </div>
             <div class="form-group">
               <label class="control-label col-xs-3" for=""></label>
                <div class="col-xs-9">
                   <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="JaslokTimes" />&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        

                </div>
            </div>
            <asp:Label ID="lblMessage" runat="server" ></asp:Label>
        </div>
    </div>
</div>
<br /><br />



<table cellpadding="4" cellspacing="4" width="100%">
   
    <tr>
        <td>
            <asp:DataGrid ID="dgWhatsNew" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="true" PageSize="10" CssClass="normaltable22user"
                DataKeyField="WhatsNewId" OnItemCommand="dgWhatsNew_ItemCommand" >
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center" Height="27px"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>                    
                    <asp:TemplateColumn HeaderText="Whats New Title">
                        <ItemTemplate>
                            <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.WhatsNewTitle") %>' Width="400px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn> 
                    <asp:TemplateColumn HeaderText="Summury">
                        <ItemTemplate>
                            <asp:Label ID="lblSummury" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.WNSummury") %>' Width="400px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn> 
                    <asp:TemplateColumn HeaderText="Summury">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkActive" runat="server"  Checked='<%# DataBinder.Eval(Container, "DataItem.IsActiveWhatsNew") %>' />
                        </ItemTemplate>
                    </asp:TemplateColumn>                    
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="WNDelete" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.WhatsNewId") %>'>Delete</asp:LinkButton>
                            <%--<asp:ImageButton CommandName="WNDelete" runat="server"   CommandArgument='<%# DataBinder.Eval(Container, "DataItem.WhatsNewId") %>' ImageUrl="/images/del.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>--%>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <HeaderStyle BackColor="Silver" />
                <PagerStyle Mode="NumericPages" HorizontalAlign="Right" />
            </asp:DataGrid>
        </td>
    </tr>
</table> 