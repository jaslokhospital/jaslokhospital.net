<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageHealthTips.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageHealthTips" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<script>
    function getFileData(myFile) {
        debugger;
        var file = myFile.files[0];
        var filename = file.name;
        var lbl = document.getElementById("<%= listofuploadedfiles.ClientID %>");
        lbl.innerHTML = filename;
    }
</script>


<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
   
        <%-- <h3>Quick Inquiry</h3>--%>
        <div class="border-3"></div>
        <div class="border-3"></div>
        <div class="border-3"></div>
          
        <div class="form-horizontal">
            <asp:PlaceHolder ID="plcAdd" runat="server" Visible="false">
           
               <div class="row" style="width: 80%; margin: 10px 25%;">
               <div class="col-md-8">
                <label for="PageTitle">Title: <span style="color: red">*</span></label>
               
                    <asp:TextBox ID="txtTitle" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Please Enter  Title" ControlToValidate="txtTitle"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>     </div>  
                 <div class="row" style="width: 80%; margin: 10px 25%;">     
            <div class="col-md-4">
                <label for="PageDescription">Image: </label>
               
                  <asp:FileUpload ID="UploadImages" runat="server" onchange="getFileData(this);" style="color: transparent;" />
                     <asp:Label ID="listofuploadedfiles" runat="server" />    
                    <%--  <asp:RequiredFieldValidator ID="RfvUploadImages" runat="server" ErrorMessage="Please Select Description" ControlToValidate="UploadImages"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator> --%>
                             <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="UploadImages" ValidationGroup="JHCat" ErrorMessage="Only .jpg, .png and .jpeg" ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>                                                     
                               
                </div>           
                     <div class="col-md-4">
                <label for="redPageContent">IsActive:</label> <br />              
                    <asp:CheckBox ID="chkActive" runat="server"/>               
            </div>
                    </div>
            <div class="row">
               
                <div class="col-xs-12">
                     <label for="PageKeyword">Description: <span style="color: red">*</span></label>
                     <telerik:RadEditor runat="server" ID="txtDesc" CssClass="form-control" Width="100%">
                           <ImageManager ViewPaths="/Content" UploadPaths="~/" DeletePaths="/Content/bks" />
                                    </telerik:RadEditor>
                        <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="Please Select Description" ControlToValidate="txtDesc"
                            Display="Dynamic" ValidationGroup="JHCat" ForeColor="Red"></asp:RequiredFieldValidator>      
                </div>
            </div>           
            <div class="row">
                <label for=""></label>
                <div class="col-xs-12" style="text-align:center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Save" ValidationGroup="JHCat" OnClick="btnSubmit_Click" class="btn btn-primary2"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary2"/>
                </div>
            </div>
           </asp:PlaceHolder>

            <asp:PlaceHolder ID="plcView" runat="server">
                 <div class="form-group">
                      <asp:Label ID="lblMessage" Visible="false"  runat="server"/><br /><br />
                      <asp:Button ID="btnAddHeltip" runat="server" Text="Add New Health Tips" CssClass="btn btn-default" OnClick="btnAddHeltip_Click" /><br /><br />
          
                <asp:label ID="lblempty" Visible="false" runat="server" Text="No Record Found" style="font-size:larger;"></asp:label>
            <asp:DataGrid ID="dgHealthTip" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" CssClass="normaltable22user" OnItemDataBound="dgHealthTip_ItemDataBound"
                DataKeyField="HealthTipId" OnItemCommand="dgHealthTip_ItemCommand" OnPageIndexChanged="dgHealthTip_PageIndexChanging" EmptyDataText="No records has been added.">

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
                      <asp:TemplateColumn HeaderText="Image" ItemStyle-Width="5%">
                        <ItemTemplate>                           
                            <asp:Image ID="ImageHealthTips" runat="server" Height="50px" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="Title" HeaderText="Title" ItemStyle-HorizontalAlign="Justify"></asp:BoundColumn>
                   
               

                    <%--<asp:BoundColumn DataField="Description" HeaderText="Description"></asp:BoundColumn>--%>
                   
                   <asp:TemplateColumn HeaderText="Active" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("IsActive")) ? "Yes" : "No" %>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Edit" ItemStyle-Width="5%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Update" runat="server" ImageUrl="../../images/edit.gif" CommandArgument='<%#Eval("HealthTipId")%>' AlternateText="click here to edit."
                                ID="imgbtnEdit"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')" CommandArgument='<%#Eval("HealthTipId")%>' ImageUrl="../../images/delete.gif" AlternateText="click here to Delete."
                                ID="ImagebtnDelete"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <HeaderStyle Wrap="False" CssClass="normaltableheadercelluser" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" CssClass="normaltablecelluser"></ItemStyle>
                <PagerStyle HorizontalAlign="Left" BorderStyle="None" BorderWidth="0" Position="Bottom"
                    Mode="NumericPages" CssClass="normaltableheadercelluser" />

            </asp:DataGrid>
            <asp:HiddenField ID="hdnImagePath" runat="server" />                 
            </div>

            </asp:PlaceHolder>

       
    </div>
</div>

