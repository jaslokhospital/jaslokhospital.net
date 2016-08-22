<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SemminarListing.ascx.cs" Inherits="JSControls_MiddleContent_SemminarListing" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style type="text/css">

    .loading
    {
        background-color: #EFFBFB;
        border-width: 1px;
        border-style: solid;
        border-color: Gray;
        height: 100%;
        width: 100%;
    }

</style>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

    <script type="text/javascript">

        function ViewPostDetails(SeminarId) {
            var d = new Date();
            var s = d.getSeconds();

            var manager = $find("<%=RadWindowManager1.ClientID %>");
            manager.open("JSControls/MiddleContent/ViewSeminarDetails.aspx?second=" + s + "&SeminarId=" + SeminarId + "&test=" + 1, "RadWindow1");

            return false;
        }

    </script>

</telerik:RadScriptBlock> 

<div class="search-form">
    <div class="form-inline well">        
        <div class="input-group">
            <label>Keywords : </label><br />
            <asp:TextBox ID="txtKeyword" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <%--<asp:Button ID="btnSearch" runat="server" Text="Submit" class="btn btn-default" OnClick="btnSearch_Click" />--%>
            <button type="submit" name="submit" class="btn btn-default" onclick="btnSearch_Click">Submit</button>
            <button type="reset" name="reset" class="btn btn-default" onclick="btnReset_Click">Reset</button>
        </div>
    </div>
</div>

<div class="all-categories">

    <asp:Repeater ID="rptSeminars" runat="server">
        <ItemTemplate>
            <div class='<%#Container.ItemIndex==0?"categories cat-1":"categories"%>'>     
           <table cellpadding="0" cellspacing="0" width="100%" border="0">
               <tr>
                   <td width="25%"> 
                       <a href="#" onclick="ViewPostDetails('<%# DataBinder.Eval(Container.DataItem, "SeminarId") %>'); return false;">
                                <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Title")%>'></asp:Label>
                            </a>
                   </td>
                   <td  width="20%">
                        <%#Eval("DateOfSeminar")%>
                   </td>                   
                   <td  width="20%">
                       <%#Eval("Timings")%>
                   </td>
                   <td  width="20%">
                       <%#Eval("Venue")%>
                   </td>
                   <td width="10%"> 
                       <a href="applyseminar.aspx?SeminarId=<%#Eval("SeminarId")%>">Apply</a>
                   </td>
               </tr>
            
          </table>
          </div>
 </ItemTemplate>
    </asp:Repeater>

</div>

<telerik:RadWindowManager ID="RadWindowManager1" runat="server" InitialBehaviors="none"
    VisibleStatusbar="false" ShowOnTopWhenMaximized="true" Left="150px" KeepInScreenBounds="true"
    AutoSize="false" ShowContentDuringLoad="false" Modal="true" Opacity="100" Overlay="false">
    <windows>
        <telerik:RadWindow ID="RadWindow1" Skin="Telerik" runat="server" Behaviors="Close,Move,Maximize" Width="700px" Height="450px" />
    </windows>
</telerik:RadWindowManager>