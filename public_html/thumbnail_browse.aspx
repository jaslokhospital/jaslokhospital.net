<%@ Page Language="C#" AutoEventWireup="true" CodeFile="thumbnail_browse.aspx.cs" Inherits="thumbnail_browse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript">

        function RadioCheck(rb) {
            var gv = document.getElementById("<%=grdThumbnails.ClientID%>");
            var rbs = gv.getElementsByTagName("input");

            var row = rb.parentNode.parentNode;
            for (var i = 0; i < rbs.length; i++) {
                if (rbs[i].type == "radio") {
                    if (rbs[i].checked && rbs[i] != rb) {
                        rbs[i].checked = false;
                        break;
                    }
                }
            }
        }

        function SetPath(rbval1) {
            if (window.opener != null && !window.opener.closed) {
                window.opener.document.getElementById('<%= Request["txtName"] %>').value = rbval1;
            }
                        
            window.close();
        }

        function SetPathwithCaption(rbval2, rbCaption) {
            if (window.opener != null && !window.opener.closed) {
                window.opener.document.getElementById('<%= Request["txtName"] %>').value = rbval2;
                window.opener.document.getElementById('<%= Request["ImageCaption"] %>').value = rbCaption;
            }
            window.close();
        }
    </script>
    <script>
        $('#btUpload').click(function () { if (fileUpload.value.length == 0) { alert('No files selected.'); return false; } });
    </script>
    <style>
        #grdThumbnails tr td table tr td a {
            background-color: #DEBA84;
            color: #000 !important;
            font: bold 12px calibri,arial;
            text-decoration: none;
        }

        #grdThumbnails tr td table tr td span {
            background-color: #8C4510;
            font: bold 12px calibri,arial;
            color: #fff;
            padding: 2px 7px;
        }

        #grdThumbnails tr td {
            border: 1px solid #DEBA84;
            padding: 2px 7px;
            vertical-align: middle;
        }

        #btnSearch {
            height: 30px;
            margin-right: 10px;
            padding: 6px;
        }

        .Thumbnail_browse_btn {
            height: 30px;
            padding: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <table>
                        <tr>
                            <td style="vertical-align: top">
                                <img src="/images/loading.gif" /></td>
                            <td style="vertical-align: top; color: red; font: bold 14px calibri,arial;">Please wait while we process your request...</td>
                        </tr>
                    </table>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <div style="text-align: center;">
                <label id="lblError"></label>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div style="padding-bottom: 10px; padding-top: 10px; padding-left: 10px;">
                        Search: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text="Search" /><asp:Button ID="btnBack" runat="server" CssClass="Thumbnail_browse_btn" Text="Back" OnClick="btnBack_Click" />
                    </div>
                    <asp:GridView runat="server" EmptyDataText="<div style='color:red; font:bold 14px calibri,arial'>No Matching Records Found.</div>" ID="grdThumbnails" AllowPaging="True" AutoGenerateColumns="False" Width="100%" ShowHeader="False" OnPageIndexChanging="grdThumbnails_PageIndexChanging" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="10">
                                <ItemTemplate>
                                    <asp:RadioButton ID="RadioButton1" runat="server" onclick="RadioCheck(this);" />
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# GetPath(Container.DataItem) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="THUMBNAIL" ItemStyle-Width="50">
                                <ItemTemplate>
                                    <asp:Image ID="imgThumbnail" runat="server" ImageUrl='<%# GetPath(Container.DataItem) %>' Width="50" />
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="THUMBNAIL PATH" ItemStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <div style="font: bold 14px calibri, arial"><%# System.IO.Path.GetFileName(Container.DataItem.ToString()) %></div>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Left" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:Panel ID="pnlImageCaption" runat="server" Style="padding: 10px !important; display: none;">Image Caption:&nbsp;<asp:TextBox ID="txtImageCaption" runat="server" Style="width: 100%;"></asp:TextBox></asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:FileUpload ID="fileUpload" multiple="false" runat="server" />
            <asp:Button ID="btUpload" Text="Upload Files" OnClick="btUpload_Click" runat="server" CssClass="Thumbnail_browse_btn" />
            <asp:Label ID="lblFileList" runat="server"></asp:Label>
            <asp:Label ID="lblUploadStatus" runat="server"></asp:Label>
            <asp:Label ID="lblFailedStatus" runat="server"></asp:Label>
            <br />
            <asp:Button ID="btnSubmit" CssClass="Thumbnail_browse_btn" OnClientClick="return Validate();" runat="server" Text="Submit" OnClick="btnSubmit_Click" />

        </div>
        <script type="text/javascript">
            function Validate() {
                var gridView = document.getElementById("<%=grdThumbnails.ClientID %>");

		        for (var row = 0; row < gridView.rows.length; row++) {
		            var checkBoxes = gridView.rows[row].cells[0].getElementsByTagName("input");
		            for (var i = 0; i < checkBoxes.length; i++) {
		                if (checkBoxes[i].type == "radio" && checkBoxes[i].checked) {
		                    return true;
		                }
		            }
		        }
		        //alert('Please select thumbnail.');
		        $("#lblError").html("Please select thumbnail.");
		        $("#lblError").removeClass("success").addClass("error");

		        return false;
		    }
        </script>
    </form>
</body>
</html>
