<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PagingControl.ascx.cs" Inherits="TL_Controls_Common_PagingControl" ClientIDMode="Static" %>
<style type="text/css">
    .PagingControl {
        padding: 5px;
    }

        .PagingControl a {
            text-decoration: none;
            padding: 6px 12px;
            background-color: #fff;
        }

        .PagingControl .linkDisabled {
            background-color:#317ba8;
            color:#fff;
        }
 @media screen and (max-width: 768px) {
    .PagingControl a {
            text-decoration: none;
            padding: 6px 8px;
            background-color: #fff;
    }
    .PagingControl {
       padding: 4px;
       margin: 1px;
    }
    
}

</style>
<div class="categoryarticles-pager otherarticles-pager articles-pager row PagingControl">
    <asp:LinkButton runat="server" Text="FIRST"  CssClass="paginglink" CommandName="MoveFirst" CommandArgument='<%= CurrentPage %>' ID="btnFirst"></asp:LinkButton>&nbsp;
    <asp:LinkButton runat="server" Text="PREVIOUS" CssClass="paginglink" CommandName="MovePrev" CommandArgument='<%= CurrentPage %>' ID="btnPrev"></asp:LinkButton>   
    <asp:PlaceHolder runat="server" ID="PagesPlaceHolder"></asp:PlaceHolder>
    <asp:LinkButton runat="server" Text="NEXT" CssClass="paginglink" CommandName="MoveNext" CommandArgument='<%= CurrentPage %>' ID="btnNext"></asp:LinkButton>
    <asp:LinkButton runat="server" Text="LAST" CssClass="paginglink" CommandName="MoveLast" CommandArgument='<%= CurrentPage %>' ID="btnLast"></asp:LinkButton>&nbsp;
</div>
<script>

    $(document).ready(function(){
        if ($(window).width() < 768)
        {
           
            $('#btnFirst').text('<<');
            $('#btnPrev').text('<');
            $('#btnNext').text('>');
            $('#btnLast').text('>>');

            }
    });
</script>
