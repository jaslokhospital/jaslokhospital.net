<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageMainNavigation.ascx.cs" Inherits="DesktopModules_JaslokAdmin_ManageMainNavigation" %>
<style>
    .small {
        font-size: 11px;
        color: red;
        font-weight: bold;
        text-transform: capitalize;
    }
</style>
<h2>Manage Menu Items</h2>
<div class="border-3"></div>
<div class="border-3"></div>
<div class="border-3"></div>
<asp:Label ID="lblMessage" Visible="false" runat="server" />
<div class="form-horizontal">

            <asp:Panel ID="pnlItemListing" class="row" runat="server">
                <div class="col-md-10">
                    <label>Select Parent Item:&nbsp;&nbsp;</label>
                    <asp:DropDownList ID="ddlParentMenuItem" Width="400" AutoPostBack="true" OnSelectedIndexChanged="ddlParentMenuItem_SelectedIndexChanged" Style="display: inline;" class="form-control" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnAddNewPage" runat="server" Text="Add Page" CssClass="btn btn-info btn-sm" OnClick="btnAddNewPage_Click" />
                </div>

                <div class="col-md-12" style="padding-top: 10px;">
                    <table class="normaltable22user" style="width: 100%;">
                        <asp:Repeater ID="rptMenuItems" OnItemCommand="rptMenuItems_ItemCommand" runat="server">
                            <HeaderTemplate>
                                <tr class="normaltableheadercelluser">
                                    <td>Page Name</td>
                                    <td>Path</td>
                                    <td>Published</td>
                                    <td>Action</td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr class="normaltablecelluser">
                                    <td>
                                        <%# Eval("Name") %>
                                    </td>
                                    <td>
                                        <%# Eval("Url") %>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkPublished" Enabled="false" runat="server" Checked='<%# Eval("Published") %>' />
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="imgEdit" ToolTip="Edit" runat="server" CommandArgument='<%# Eval("Id") %>' ImageUrl="/images/edit.gif" CommandName="editpage" />&nbsp;
                                <asp:ImageButton ID="imgDelete" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete this item?');" CommandArgument='<%# Eval("Id") %>' runat="server" ImageUrl="/images/delete.gif" CommandName="deletePage" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </asp:Panel>
    <asp:Panel ID="pnlEditItem" Visible="false" runat="server">
        <asp:HiddenField ID="hdnPageId" runat="server" />
        <asp:HiddenField ID="hdnTabId" runat="server" />
        <div class="row">
            <div class="col-md-12">
                <h3>
                    <asp:Literal ID="litType" runat="server" Text="Add Page"></asp:Literal></h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label>Select Parent:</label>
            </div>
            <div class="col-md-10">
                <asp:DropDownList ID="drpParentItem" Width="400" Style="display: inline;" class="form-control" runat="server">
                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label>Page Name:</label>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="txtPageName" Style="width: 55%;" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Page name" ControlToValidate="txtPageName"
                    Display="Dynamic" ValidationGroup="JHCat" CssClass="small"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label>Set Url:</label>
            </div>
            <div class="col-md-10">
                <i>https://www.jaslokhospital.net</i>
                <asp:TextBox ID="txtPageUrl" Style="width: 35%; display: inline;" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please set page url" ControlToValidate="txtPageUrl"
                    Display="Dynamic" ValidationGroup="JHCat" CssClass="small"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <label>Published:</label>
            </div>
            <div class="col-md-10">
                <asp:CheckBox ID="chkPublished" runat="server"/> 
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Button ID="btnAdd" ValidationGroup="JHCat" runat="server" Text="Add Page" CssClass="btn btn-info btn-sm" OnClick="btnAdd_Click" />&nbsp;
               <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-info btn-sm" OnClick="btnCancel_Click" />
            </div>
        </div>
    </asp:Panel>
</div>
<script type="text/javascript">
    $("#<%= txtPageName.ClientID %>").keyup(function (event) {
        var urlContent = $("#<%= txtPageName.ClientID %>").val().toLowerCase();
        urlContent = urlContent.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
        if ($("#<%= hdnPageId.ClientID %>").val() == "") {
            $("#<%= txtPageUrl.ClientID %>").val("/" + urlContent);
        }
    });/*.keydown(function (event) {
        if (event.which == 13) {
            event.preventDefault();
        }
    });*/
</script>
