<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HealthTips.ascx.cs" Inherits="JSControls_MiddleContent_HealthTips" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="search-form">
    <div class="form-inline well">        
        <div class="input-group kayword-align">
            <label>Keywords : </label>
            <asp:TextBox ID="txtKeyword" runat="server" class="form-control keyword-txt"></asp:TextBox>
        </div>
        <div class="form-group">
            <%--<asp:Button ID="btnSearch" runat="server" Text="Submit" class="btn btn-default" OnClick="btnSearch_Click" />--%>
            <button type="submit" name="submit" class="btn btn-default" onclick="btnSearch_Click">Submit</button>
            <button type="reset" name="reset" class="btn btn-default" onclick="btnReset_Click">Reset</button>
            <button type="submit" name="archive" class="btn btn-default" onclick="btnArchive_Click">Archive</button>
        </div>
    </div>
</div>

<div class="all-categories">

    <asp:Repeater ID="rptHealthTips" runat="server">
        <ItemTemplate>
            <div class='<%#Container.ItemIndex==0?"categories cat-1 healtspacing":"categories healtspacing"%>'>     
           <table cellpadding="5" cellspacing="5" width="100%" border="0" >
               <tr>
                   <td> 
                       <%-- <a href="/healthdetails.aspx?HealthTipId=<%#Eval("HealthTipId")%>"><%#Eval("Title")%></a>--%>
                       <a href="/healthtip/<%#CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("Title")))+"/"+Eval("HealthTipId")%>"><%#Eval("Title")%></a>
                   </td>                   
               </tr>            
          </table>
          </div>
 </ItemTemplate>
    </asp:Repeater>

</div>