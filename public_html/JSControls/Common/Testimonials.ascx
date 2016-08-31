<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Testimonials.ascx.cs" Inherits="JSControls_Common_Testimonials" %>
<div class="container-fluid testimonials img-responsive">
    <div class="row">
        <div class="container containerspace">
            <div class="carouseller row-fluid for-car">
                <h2 class="testheading">
                    <img src="/Portals/_default/Skins/JaslokSkin/images/chat.png" alt="chat" />
                    Testimonials</h2>

                <span class="line4">
                    <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
                    <a href="#" class="jcarousel-control-next">&rsaquo;</a></span>
                <div class="carousel-wrapper">
                    <div class="jcarousel">  
                        <ul>
                            <asp:Repeater ID="rptTestimonials" OnItemDataBound="rptTestimonials_ItemDataBound" runat="server">
                                <ItemTemplate>
                                    <li style="cursor:auto;">
                                      <%--  <a href='<%#"/testimonial/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("Name")))+"/"+Eval("TestimonialId")%>'>--%>
                                            <div class="carousel-block" style="width:100%">
                                               <div class='<%#string.IsNullOrEmpty(Eval("ProfileImageUrl").ToString())?"":"col-lg-3 col-md-3 col-sm-4 col-xs-5"%>'>
                                                    <%--<img alt="testimonials" title="testimonials" src='<%#Eval("ProfileImageUrl")%>' class="img-responsive img-circle">--%>
                                                   <asp:Image ImageUrl='<%#Eval("ProfileImageUrl")+"?scale=both&maxwidth=111&maxheight=111"%>' Visible='<%#string.IsNullOrEmpty(Eval("ProfileImageUrl").ToString())?false:true%>' alt='<%#Eval("Name")%>' runat="server" class="img-responsive img-circle" />
                                                </div>


                                                <div class='<%#string.IsNullOrEmpty(Eval("ProfileImageUrl").ToString())?"col-lg-9 col-md-9 col-sm-8 col-xs-12 test":"col-lg-9 col-md-9 col-sm-8 col-xs-7 test"%>'>
                                                    <div class="name">
                                                        <img src="/Portals/_default/Skins/JaslokSkin/images/quote-right.png" alt="Quote-right" title="Quote-right" />
                                                        <%#Eval("Name")%>
                                                    </div>
                                                    <p>
                                                        <%--<%# Convert.ToString(Eval("Comment")).Length>100?(CommonFn.TrimString(Convert.ToString(Eval("Comment")),100)+"....More"):Convert.ToString(Eval("Comment"))%>--%>
                                                        
                                                        <asp:Literal ID="ltrComments" runat="server"></asp:Literal>

                                                        <img src="/images/quote-right.png" class="quote-rotate img-responsive" alt="Quote-right" title="Quote-right" />
                                                    </p>
                                                </div>
                                            </div>
                                       <%-- </a>--%>

                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
