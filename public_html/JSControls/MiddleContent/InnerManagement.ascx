<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InnerManagement.ascx.cs" Inherits="JSControls_MiddleContent_InnerManagement" %>

<asp:Repeater ID="rptInnerManagement" runat="server">
    <ItemTemplate>
        <div class='<%#Container.ItemIndex==0?"media trustees-accordion":"media" %>'>
            <div class='<%#Container.ItemIndex+1%2==0?"media-left media-top col-sm-3 col-xs-12":"media-left col-sm-3 col-xs-12 mgt-main-space" %>' >
                <a data-toggle="collapse" data-parent="#accordion" href="#media-collapse-1" aria-expanded="true"  aria-controls="media-collapse-1" >
                    <img class="media-object media-border img-responsive profile-bg" style="width:150px" src='<%#Eval("ImageUrl")%>'>
                </a>
            </div>
            <div class="media-body col-sm-9 col-xs-12 mgt-main-info" >
                <footer class="panel-footer ft-space">
                    <%--<img src="../../images/Dicon.png" />--%>
                    <span class="s-bold"><%#Eval("Name")%>,</span><span class="s-regular"> <%#Eval("Designation")%> </span>
                </footer>
                <div class="panel-body panel-bg" style='display:<%# string.IsNullOrEmpty(CommonFn.StripHTML(Convert.ToString(Eval("Description")))) ? "none" : "" %>'>
                   <p> <%#CommonFn.TrimString(CommonFn.StripHTML(Convert.ToString(Eval("Description"))),500)%></p>
                    <br>
                    <a href='<%#"/management/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("Name")))+"/"+Eval("UserId")%>' class="read-more pull-right">Read More<i class="fa fa-chevron-circle-right"></i>
                    </a>
                </div>

            </div>
        </div>

    </ItemTemplate>
</asp:Repeater>

<img src="../../Content/UsersGallery/M-1.jpg" class="img-responsive" style="margin-bottom:1%;" />
<div class="divManagementPics">
<p>
    Front row : Left to Right – Dr. Satyadeo Malik (Director Clinical Operation), Regina Raj (Head Quality), Dr. Tarang Gianchandani (CEO), Shatrujeet Rai (COO), Veepasha Kulkarni (Head ER), Sabina Sawliwala (Head Stores and Procurement).
</p>
<p>
    Back row : Left to Right – George Alex (CMO), Viloo Williams (CIO), Jitendra Haryan (CFO), Mrs. Bobby Ramesh (Director Nursing Service)
</p></div>
<div  class="dicMobManagementPics">
   Front row – Left to Right:
    <ul style="list-style:disc; margin-left:14px;">
       
        <li>Dr. Satyadeo Malik (Director Clinical Operation)</li>
        <li>Regina Raj (Head Quality)</li>
        <li>Dr. Tarang Gianchandani</li>
        <li>Shatrujeet Rai (COO)</li>
        <li>Veepasha Kulkarni (Head ER)</li>
        <li>Sabina Sawliwala (Head Stores and Procurement).</li>
    </ul>
    Back row – Left to Right:
    <ul style="list-style:disc; margin-left:14px;">      
        <li>George Alex (CMO)</li>
        <li>Viloo Williams (CIO)</li>
        <li>Jitendra Haryan (CFO)</li>
      
    </ul>



</div>
