<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageSpecialties.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageSpecialties" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<script>
    function getFileData(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= listofuploadedfilesp.ClientID %>");
        lbl.innerHTML = filename;
    }
</script>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
  
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
           
        <div class="form-horizontal">

              <asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">

           <div class="row">
            <div class="col-md-4">
                <label for="PageTitle">Specialty Category:<span style="color: red">*</span></label>
              
                    <asp:DropDownList runat="server" ID="drpspecialCategory" AutoPostBack="true"  OnSelectedIndexChanged="drpspecialCategory_SelectedIndexChanged" class="form-control" Width="250px">
                            <Items>
                               <asp:ListItem>--Select--</asp:ListItem>
                            </Items>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvDrpspecialCategory" runat="server" ErrorMessage="Please select specialty category" ControlToValidate="drpspecialCategory" InitialValue="0"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>  
                
            </div>
             <div class="col-md-4">
                <label  for="PageDescription">Specialty Name:<span style="color: red">*</span></label>
               
                    <asp:TextBox ID="txtSpecialtyName" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqfvSpecialtyName" runat="server" ErrorMessage="Please enter specialty name" ControlToValidate="txtspecialtyname"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
              
            </div>
             <div class="col-md-4">
                <label  for="redPageContent">Image:</label>
              
                    <asp:FileUpload ID="UploadImages" runat="server" onchange="getFileData(this);" Style="color: transparent;"/>
                     <asp:Label ID="listofuploadedfilesp" runat="server"/>
                            <asp:HiddenField ID="listofuploadedfiles" runat="server" />
                </div>
            </div>
           <%-- <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Image Title:</label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtimageTitle" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Image Alternative Text:</label>
                <div class="col-xs-9">
                     <asp:TextBox ID="txtImageAltTag" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>--%>
            <div class="row">
               
                 <div class="col-md-12">
                      <label for="redPageContent">About the Department:</label>
                    <telerik:RadEditor runat="server" ID="txtSpecialtyDesc" Width="100%">
                            <ImageManager ViewPaths="/Content" UploadPaths="/Content/EditorUpload" DeletePaths="/Content/bks" />
                                    </telerik:RadEditor>
                </div>
           </div>
                   <div class="row">
              <div class="col-md-12">
                <label for="redPageContent">Facilities & Services:</label>
               
                    <telerik:RadEditor runat="server" ID="txtFacilitiesServices" Width="100%">
                            <ImageManager ViewPaths="/Content" UploadPaths="/Content/EditorUpload" DeletePaths="/Content/bks" />
                                    </telerik:RadEditor>
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
                    <div class="form-group">
                  <asp:Button ID="btnAddSpecialty" runat="server" Text="Add Specialty" CssClass="btn btn-default" OnClick="btnAddJaslokTimes_Click" /><br /><br />
            <div class="row" style="text-align:center;">
                        <div class="col-md-10"><asp:TextBox ID="txtSearchSpecialty" CssClass="form-control" runat="server" Style="float: left;"></asp:TextBox></div>
                        <div class="col-md-2" style="text-align:left;"><asp:Button ID="btnSearch" runat="server" Text="Search Specialty" OnClick="btnSearch_Click" CssClass="btn btn-default" /></div>
                    </div>
                <br />
           
                <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
            <asp:DataGrid ID="dgSpecialty" runat="server" AutoGenerateColumns="False" Width="100%" PageSize="10" AllowPaging="true"
                 CssClass="normaltable22user"
                DataKeyField="SpecialtyId" OnItemCommand="dgSpecialty_ItemCommand" OnPageIndexChanged="dgSpecialty_PageIndexChanged" EmptyDataText="No records has been added.">

                 <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />
                <Columns>
                   <%-- <asp:TemplateColumn HeaderText="S.No">
                        <ItemTemplate>
                            <asp:Label ID="lblsnumber" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>--%>
                    <asp:BoundColumn DataField="CategoryName" HeaderText="Specialty Category" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
                    <asp:BoundColumn DataField="SpecialtyName" HeaderText="Specialty Name" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
                 <%--   <asp:BoundColumn DataField="SpecialtyDescription" HeaderText="Specialty Description"></asp:BoundColumn>--%>
                    <asp:TemplateColumn HeaderText="Edit">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("SpecialtyId") %>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("SpecialtyId") %>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
               <PagerStyle Mode="NumericPages" HorizontalAlign="Left" />
            </asp:DataGrid>
            </div>
</asp:PlaceHolder>

        </div>
  
</div>



<%--<script type="text/javascript">
    function DropdwnValidate() {
        if (document.getElementById('<%=drpspecialCategory.ClientID%>').selectedIndex == 0) {
        alert("Please select Category");
        return false;
    }
    return true;
}
</script>--%>
