<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewJaslokTimes.ascx.cs" Inherits="JSControls_MiddleContent_ViewJaslokTimes" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>




<div class="all-categories">

    <%--<div class='<%#Container.ItemIndex==0?"categories cat-1":"categories"%>'>
                <%#Eval("FileFriendlyName")%><br />
                <a href="<%#string.IsNullOrEmpty(Convert.ToString(Eval("FilePath")))? CommonFn.DefaultImagePath:Convert.ToString(Eval("FilePath"))%>">
                 <img alt="jasloktimes" title='<%#Eval("FileFriendlyName")%>' class="img-responsive col-xs-1 center-block" style="width:60px;height:30px;">
                </a><br />
            </div> --%>

    <div class='row'>
    <asp:Repeater ID="rptJaslokTimes" runat="server" OnItemDataBound="rptJaslokTimes_ItemDataBound">
        <ItemTemplate>
            
            <div class="col-md-4 col-sm-4 col-xs-12">
                
                    <img src='<%# CommonFn.DbSave + CommonFn.DbJaslokTimesImages + "/" + Eval("FileName") %>' alt="jasloktimes" title='<%#Eval("FileFriendlyName")%>' onclick="javascript:return false;" class="img-responsive" />
               
                <div class="appreciation_title">
                    <%#Convert.ToString(Eval("FileFriendlyName")).ToUpper()%>
                    <br>
                  <%--  <span><%#Convert.ToDateTime(Eval("DateCreated")).ToString("MMMM, yyyy").ToUpper() %></span>--%>
                </div>
                <div class="appreciation_view">
                    <a href='<%#Eval("PdfPath")%>' target="_blank" data-toggle="modal">
                        <i class="glyphicon glyphicon-eye-open"></i>View 
                    </a>
                </div>
            </div>
            <asp:Literal ID="litBottomDiv" runat="server" Text="</div>" Visible="false"></asp:Literal>
            
            <%--<div class='<%# "modal fade pop-up-" + (Container.ItemIndex + 1) %>' tabindex='<%# "-" + (Container.ItemIndex + 1) %>' role="dialog" aria-labelledby='<%# "myLargeModalLabel-" + (Container.ItemIndex + 1) %>' aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myLargeModalLabel-1"><%#Convert.ToString(Eval("FileFriendlyName")).ToUpper() %>
                    <br>
                                <%#Convert.ToDateTime(Eval("DateCreated")).ToString("MMMM, yyyy").ToUpper() %></h4>
                        </div>
                        <div class="modal-body">
                            <img src='<%# CommonFn.DbSave + CommonFn.DbJaslokTimesImages + "/" + Eval("FileName") %>' alt="Jaslok-times" title='<%#Eval("FileFriendlyName")%>' class="img-responsive" />

                            <p></p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>--%>
            <asp:Literal ID="litTopDiv" Text="<div class='row'>" runat="server" Visible="false"></asp:Literal>
        </ItemTemplate>
    </asp:Repeater>

    </div>


</div>


<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script>

<script type="text/javascript">
    (function ($) {
        "use strict"
                    
        // Accordion Toggle Items
        var iconOpen = 'fa fa-minus',
             iconClose = 'fa fa-plus';

        $(document).on('show.bs.collapse hide.bs.collapse', '.accordion', function (e) {
            var $target = $(e.target)
            $target.siblings('.accordion-heading')
            .find('em').toggleClass(iconOpen + ' ' + iconClose);
            if (e.type == 'show')
                $target.prev('.accordion-heading').find('.accordion-toggle').addClass('active');
            if (e.type == 'hide')
                $(this).find('.accordion-toggle').not($target).removeClass('active');
        });

    })(jQuery);
</script>--%>
