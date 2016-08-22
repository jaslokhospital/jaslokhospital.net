<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PressRelease.ascx.cs" Inherits="JSControls_Common_PressRelease" %>

<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 foot hidden-xs">
    <div class="carousel slide" id="fade-quote-carousel" data-ride="carousel" data-interval="3000">
        <!-- Carousel indicators -->
       
        <ol class="carousel-indicators">
            <asp:Repeater ID="rptPager" runat="server">                               
            <ItemTemplate>
                    <% if (iCounterPager == 1)
                       { %>
                        <li data-target="#fade-quote-carousel" data-slide-to="0" class="active">
                     <% } else { %>
                        <li data-target="#fade-quote-carousel" data-slide-to='<%= (iCounterPager - 1) %>'>
                    <% }
                        iCounterPager++;
                       %> 
                            				        
                    </li>                
            </ItemTemplate> 
        </asp:Repeater>
        </ol>
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="title">Press Release</div>
            <asp:Repeater ID="rptPressRelease" runat="server">
                <ItemTemplate>
                   <div runat="server" class='<%#Container.ItemIndex==0?"active item":"item"%>'>
                        <a id="A1" href='<%#"/press/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("NewsTitle")))+"/"+ Eval("NewsId")%>' target="_blank" runat="server">
                            <div class="subtitle"><%#Eval("NewsTitle")%></div>
                        </a>
                        <address>
                            <%#CommonFn.TrimString(Convert.ToString(Eval("NewsContent")),200)%>
                        </address>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>

<%--<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 foot hidden-xs">
    <div class="title">Press Release</div>
    <div id="myCarousel" class="carousel slide" data-interval="false">

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">

            <asp:Repeater ID="rptPressRelease" runat="server">
                <ItemTemplate>
                    <div runat="server" class='<%#Container.ItemIndex==0?"item active":"item"%>'>
                        
                        <a class="press-anq" href='<%#"/newsdetail.aspx?newsid="+ Eval("NewsId")%>' target="_blank" runat="server">
                           
                             <%#CommonFn.TrimString(Convert.ToString(Eval("NewsTitle")),200)%>
                                
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>

    </div>
</div>--%>
