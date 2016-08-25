<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InnerTrustees.ascx.cs" Inherits="JSControls_MiddleContent_InnerTrustees" %>
<div style="width:auto; text-align:center;">
    <img class="img-responsive trustees-pic" style="width: 80%; display: inline;" src="../../Content/UsersGallery/Mp-256-compressor.jpg" />
</div>
<asp:Repeater ID="rptInnerTrustees" runat="server">
    <ItemTemplate>


        <div class='<%#Container.ItemIndex==0?"media trustees-accordion":"media" %>'>
            <div class='<%#Container.ItemIndex+1%2==0?"media-left media-top col-sm-3 col-xs-4":"media-left col-sm-3 col-xs-4 mgt-main-space" %>'>
                <a data-toggle="collapse" data-parent="#accordion" href="#media-collapse-1" aria-expanded="true" aria-controls="media-collapse-1">
                    <img class="media-object media-border img-responsive profile-bg"  style="width:150px" src='<%#Eval("ImageUrl")%>'>
                </a>
            </div>
            <div class="media-body col-sm-9 col-xs-12 mgt-main-info">
                <footer class="panel-footer ft-space">
                    <%--<img src="../../images/Dicon.png" />--%>
                    <span class="s-bold"><%#Eval("Name")%>,</span><span class="s-regular"> <%#Eval("Designation")%> </span>
                </footer>
                <div class="panel-body panel-bg" style='display:<%# string.IsNullOrEmpty(CommonFn.StripHTML(Convert.ToString(Eval("Description")))) ? "none" : "block" %>'>
                    <p>
                    <%#CommonFn.TrimString(CommonFn.StripHTML(Convert.ToString(Eval("Description"))),500)%></p>
                    <br>
                  <%--  <a href='<%#"/Managementdetails?uid="+Eval("UserId")%>' class="read-more pull-right">Read More <i class="fa fa-chevron-circle-right"></i>--%>
                          <a href='<%#"/trustees/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("Name")))+"/"+Eval("UserId")%>' class="read-more pull-right">Read More <i class="fa fa-chevron-circle-right"></i>
                    </a>
                </div style='display:<%# string.IsNullOrEmpty(CommonFn.StripHTML(Convert.ToString(Eval("Description")))) ? "none" : "block" %>'>

            </div>
        </div>

    </ItemTemplate>
</asp:Repeater>
