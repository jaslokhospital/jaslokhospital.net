<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InnerManagement.ascx.cs" Inherits="JSControls_MiddleContent_InnerManagement" %>

<asp:Repeater ID="rptInnerManagement" runat="server">
    <ItemTemplate>
        <div class='<%#Container.ItemIndex==0?"media trustees-accordion":"media" %>'>
            <div class='<%#Container.ItemIndex+1%2==0?"media-left media-top col-sm-3 col-xs-12":"media-left col-sm-3 col-xs-12 mgt-main-space" %>' >
                <a data-toggle="collapse" data-parent="#accordion" href="#media-collapse-1" aria-expanded="true" >
                    <img class="media-object media-border img-responsive profile-bg" alt="<%#Eval("Name")%>" style="width:150px" src='<%#Eval("ImageUrl")%>'>
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


