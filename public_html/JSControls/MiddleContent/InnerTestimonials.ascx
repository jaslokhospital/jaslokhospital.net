<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InnerTestimonials.ascx.cs" Inherits="JSControls_MiddleContent_InnerTestimonials" %>

<script>
    function showpopupIT() {
        document.getElementById('light').style.display = 'block';
        document.getElementById('fade').style.display = 'block';

        return false;
    }
</script>

<div class="all-categories">

    <asp:Repeater ID="rptInnerTestimonials" runat="server" OnItemDataBound="rptInnerTestimonials_ItemDataBound">
        <ItemTemplate>
            <%--<asp:Literal ID="litTopDiv" Text="<div class='row'>" runat="server" Visible="false"></asp:Literal>--%>

            <div class="col-md-4 col-sm-4 col-xs-12">
                <a class="img-border" id="lnkTestimonial" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl"))) ? false : true %>' data-target='<%# ".pop-up-"+ (Container.ItemIndex+1).ToString() %>' data-toggle="modal" href="images/testimonial-1.jpg">
                    <img class="img-responsive" title="Testimonial-1" alt="Testimonial-1" style='<%#string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl"))) ? "display:none" : "display:block"%>' src='<%#Eval("ImageUrl")%>'>
                </a>
                <div class="appreciation_title">
                    <a href='<%#"/testimonial/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("Name")))+"/"+Eval("TestimonialId")%>' style="color:#5a5a5a">
                        <%# !string.IsNullOrEmpty(Convert.ToString(Eval("Title"))) ? Eval("Title") : CommonFn.TrimString(Convert.ToString(Eval("Comment")),100)%>
                    </a>
                <br>
                    <span> <%#Eval("Name") + " " + Eval("Surname")%></span>
                </div>
                <div class="appreciation_view" style='<%#string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl"))) ? "display:none" : "display:block"%>'>
                    <a data-target='<%# ".pop-up-"+ (Container.ItemIndex+1).ToString() %>' data-toggle="modal" href='<%#Eval("ImageUrl")%>'>
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
                        <img id="imgtestimonial" runat="server" visible='<%#string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl"))) ? false : true %>' class="img-responsive" title="Testimonial-1" alt="Testimonial-1" src='<%#Eval("ImageUrl")%>'>
                        <p></p>

                    </div>
                </div>
            </div>
            








            <%--<a href="#" data-toggle="modal" data-target='<%# ".pop-up-"+(Container.ItemIndex+1).ToString() %>'>
                <div class='<%#Container.ItemIndex==0?"categories cat-1":"categories"%>' runat="server" autopostback="false">

                    <img alt="testimonials" title='<%#Eval("Title")%>' src='<%#string.IsNullOrEmpty(Convert.ToString(Eval("ProfileImageUrl")))? CommonFn.DefaultImagePath:Convert.ToString(Eval("ProfileImageUrl"))%>' class="img-responsive col-xs-1 center-block">
                    <p><%#Eval("Comment")%></p>
                </div>
            </a>
            <div  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myLargeModalLabel-1"><%#Eval("Title")%></h4>
                        </div>
                        <div class="modal-body">
                            <img src='<%#string.IsNullOrEmpty(Convert.ToString(Eval("ProfileImageUrl")))? CommonFn.DefaultImagePath:Convert.ToString(Eval("ProfileImageUrl"))%>' alt="Testimonial-1" title="Testimonial-1" class="img-responsive" />

                            <p><%#Eval("Comment")%></p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>--%>
        </ItemTemplate>
    </asp:Repeater>
</div>

<!--Model dialog Box-->



