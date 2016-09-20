<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsListing.ascx.cs" Inherits="JSControls_MiddleContent_NewsListing" %>
<%@ Register Src="~/JSControls/MiddleContent/PagingControl.ascx" TagPrefix="JH" TagName="PagingControl" %>




<div class="all-categories">
    
    <asp:HiddenField ID="hdnValue" runat="server" />
    <asp:Repeater ID="rptNews" runat="server" OnItemDataBound="rptNews_ItemDataBound">
        <ItemTemplate>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <a class="img-border" data-target='<%# ".pop-up-"+ (Container.ItemIndex+1).ToString() %>' data-toggle="modal" href="images/testimonial-1.jpg">
                    <img class="img-responsive newsimg" title="Testimonial-1" style="max-height:248px;" alt="Testimonial-1" src='<%#Eval("Thumbnail")+"?w=180&h=180"%>'>
                </a>
                <div class="appreciation_title">
                    <%#Eval("NewsTitle")%>                
                </div>
                <div class="appreciation_view">
                    <a data-target='<%# ".pop-up-"+ (Container.ItemIndex+1).ToString() %>' data-toggle="modal" href='<%#Eval("Thumbnail")%>'>
                        <i class="glyphicon glyphicon-eye-open"></i>View 
                    </a>
                </div>
            </div>
            <%--<asp:Literal ID="litBottomDiv" runat="server" Text="</div>" Visible="false"></asp:Literal>--%>
             <div id="divNewLine" runat="server" visible="false" style="clear:both"></div>
            <div aria-hidden="true" role="dialog" tabindex="-1" class='<%# "modal fade pop-up-"+ (Container.ItemIndex+1).ToString() %>' style="display: none;">
                <div class="modal-dialog modal-lg">
                    <button data-dismiss="modal" class="close close-pb" type="button">×</button>
                    <div class="modal-body">
                        <img class="img-responsive" title="Testimonial-1" alt="Testimonial-1" src='<%#Eval("Thumbnail")%>'>
                        <p></p>
                    </div>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>
    
       

</div>
<div id="divPAgerControl" runat="server" class="pager">
        <JH:PagingControl runat="server" ID="PagingControl" />
</div>


