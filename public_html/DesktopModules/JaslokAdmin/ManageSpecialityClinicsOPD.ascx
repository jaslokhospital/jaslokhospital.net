<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageSpecialityClinicsOPD.ascx.cs" Inherits="DotNetNuke.Modules.JaslokAdmin.ManageSpecialityClinicsOPD" %>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="right_part">
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="form-horizontal">
             <asp:Label ID="lblMessage" Visible="false"  runat="server"/>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Speciality Clinics OPD:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtSpecialityClinics" runat="server" class="form-control"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rqfvtxtSpecialityClinics" runat="server" ErrorMessage="Please enter Speciality Clinics" ControlToValidate="txtSpecialityClinics"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Doctor:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                    <asp:ListBox ID="lbDoctortabs" runat="server" SelectionMode="Multiple" class="form-control">                           
                         </asp:ListBox>
                <asp:RequiredFieldValidator ID="rqfvlbDoctortabs" InitialValue="" runat="server" ErrorMessage="Please select atleast one doctor" ControlToValidate="lbDoctortabs"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                           
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">IsActive:</label>
                <div class="col-xs-9">
                      <asp:CheckBox ID="ckbIsActive" runat="server" />
                </div>
            </div>
                  
            
            <div class="form-group">
                <label class="control-label col-xs-3" for=""></label>
                <div class="col-xs-9">
                     <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="JHCat" OnClick="btnSubmit_Click" class="btn btn-primary2"/>
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2"/>
                 
                </div>
            </div>
          

            <div class="form-group">
                  <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
                     <asp:DataGrid ID="dgSpecialityClinics" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user" OnItemCommand="dgSpecialityClinics_ItemCommand" OnPageIndexChanged="dgSpecialityClinics_PageIndexChanging" EmptyDataText="No records has been added."
                DataKeyField="SpecialityClinicId">


                 <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>
                   <%-- <asp:DataGrid ID="dgSpecialityClinics" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user"
                DataKeyField="SpecialityClinicId" OnItemCommand="dgSpecialityClinics_ItemCommand" OnPageIndexChanged="dgSpecialityClinics_PageIndexChanging">

                <HeaderStyle BackColor="Silver" />
                <PagerStyle Mode="NumericPages" HorizontalAlign="Right" />
                <Columns>--%>
                    <asp:TemplateColumn HeaderText="Sl No">
                        <ItemTemplate>
                            <asp:Label ID="SN" runat="server" Text='<%#Eval("SN")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                   
                    <asp:BoundColumn DataField="SpecialityClinicOPD" HeaderText="Speciality Clinic OPD"></asp:BoundColumn>
                    <asp:BoundColumn DataField="DoctorName" HeaderText="Doctor Name"></asp:BoundColumn>
                     <asp:BoundColumn DataField="IsActive" HeaderText="Active"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="Edit">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("SpecialityClinicId")%>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete Doctor Name">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("SpecialityClinicId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>

                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser" ></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser"  />
            
            </asp:DataGrid>
            <asp:HiddenField ID="hdnImagePath" runat="server" />

            </div>


        </div>
    </div>
</div>





