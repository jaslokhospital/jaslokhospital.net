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

<script>

    $(document).ready(function () {
        var str = "<div class='divManagementPics'>";
        var dash = $(document).width() > 800 ? "&nbsp;–&nbsp;" : "";
        $(".divManagementPics p").each(function (index, item) {
            var divhtml = $(item).html().replace(/<.*?>/g, "");
            var array = divhtml.split(",");
            str += (index == 0) ? "<ul class='img-p-details fornt_row'>" : "<ul class='img-p-details back_row'>";
            $(array).each(function (index, item) {
                if (index == 0) {
                    var firstLI = item.split("–");
                    str += "<li class='navigation-details'>" + (firstLI[0] + dash) + "</li><li>" + firstLI[1] + ",&nbsp;&nbsp;</li>";
                }
                else {
                    if (index + 1 < array.length)
                        str += "<li>" + item + ",&nbsp;&nbsp;</li>";
                    else
                        str += "<li>" + item + "</li>";
                }
            });
            str += "</ul>";
        })
        str += "</div>";
        $(".divManagementPics").remove();
        $(".dicMobManagementPics").remove();

        $(".management_details").append(str)
    });

</script>

 <style>
    .divManagementPics .navigation-details {margin:0; padding-left:21px;font-size: 20px;}
    .divManagementPics .img-p-details {margin-top:0px;}
    .divManagementPics .img-p-details li.navigation-details {/*display: block;*/}
    .divManagementPics .img-p-details li.navigation-details {
      display: inline-block;
      left: -18px;
      padding-left: 0;
      position: relative;
    }
    .divManagementPics .img-p-details li {font-family: 'Roboto';font-weight: 300;font-size: 16px;}
    @media(max-width:768px) {
      .divManagementPics .img-p-details li {margin-left: 30px;list-style-type: disc;}
      .divManagementPics .img-p-details li.navigation-details {left: -30px;}
    }
    @media(min-width:992px) {
      .divManagementPics .navigation-details {padding-left: 0px;}
      .divManagementPics .img-p-details { margin-top: 0px; padding-left: 0px; }
      .divManagementPics .img-p-details li {display: inline-block;}
      .divManagementPics .img-p-details li.navigation-details {left: 0px;}
    }
   
  </style>