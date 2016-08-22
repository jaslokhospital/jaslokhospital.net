<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageCareerCategory.ascx.cs" Inherits="DotNetNuke.Modules.JaslokAdmin.ManageCareerCategory" %>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
    <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
   
        <div class="form-horizontal">
             <asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">
          <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label for="PageTitle">Function Name:<span style="color: red">*</span></label>
                </div> <div class="col-md-6" style="text-align: left;">
                     <asp:TextBox ID="txtFunctionName" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please Enter Function Name" ControlToValidate="txtFunctionName"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="row" style="width: 80%">
                <div class="col-md-6" style="text-align: right;">
                <label for="PageDescription">IsActive:</label>  
                     </div> <div class="col-md-6" style="text-align: left;">             
                   <asp:CheckBox ID="ckbIsActive" runat="server" />
                </div>
            </div> 
            <div class="row">
                <div class="col-md-12" style="text-align: center;">
                     <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="JHCat" OnClick="btnSubmit_Click" class="btn btn-primary2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2" />
                </div>
            </div>
           </asp:PlaceHolder>

              <asp:PlaceHolder ID="plcView" runat="server">
                    <asp:Label ID="lblMessage" Visible="false" runat="server"/><br /><br />
                   <asp:Button ID="btnAddJobCategory" runat="server" Text="Add Job Category" CssClass="btn btn-default" OnClick="btnAddJobCategory_Click"/><br /><br />
           
             <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
            <asp:DataGrid ID="dgCareer" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="FunctionId" OnItemCommand="dgCareer_ItemCommand" OnPageIndexChanged="dgCareer_PageIndexChanging" EmptyDataText="No records has been added.">

                 <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>
                    <%--<asp:TemplateColumn HeaderText="Sl No">
                        <ItemTemplate>
                            <asp:Label ID="lblSlNo" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>--%>
                    <asp:BoundColumn DataField="FunctionName" HeaderText="Title" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
                   <%-- <asp:BoundColumn DataField="IsActive" HeaderText="Active" ItemStyle-Width="5%"></asp:BoundColumn>--%>
                    <asp:TemplateColumn HeaderText="Active" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Literal ID="ltstatus" runat="server" Text='  <%# Convert.ToBoolean(Eval("IsActive")) ? "Yes" : "No" %>'></asp:Literal>
                              
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Edit" ItemStyle-Width="5%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("FunctionId")%>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')"  CommandArgument='<%#Eval("FunctionId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />

            </asp:DataGrid>
                  </asp:PlaceHolder>
        </div>
   
</div>







