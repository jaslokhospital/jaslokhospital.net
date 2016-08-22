<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.Search, App_Web_search_standard.ascx.eec0c532" %>

            <asp:DropDownList ID="ddlCategory" runat="server" Width='<%#Convert.ToInt32(SearchSettings.General.CategoryWidth)%>'
                Visible='<%#SearchSettings.General.ShowCategory%>' CssClass="NormalTextBox" DataTextField="Name"
                DataValueField="Id">
            </asp:DropDownList>
            <%#GetCategoryBreakString() %>
            
              <asp:DropDownList ID="ddlAuthorList" runat="server" Width='<%#Convert.ToInt32(SearchSettings.General.AuthorListWidth)%>'
                Visible='<%#SearchSettings.General.ShowAuthorList%>' CssClass="NormalTextBox" DataTextField="UserName"
                DataValueField="UserId">
            </asp:DropDownList>
            <%#GetAuthorListBreakString() %>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="NormalTextBox" Width="<%#Convert.ToInt32(SearchSettings.General.InputWidth)%>"></asp:TextBox>
         
           <asp:Button ID="btnSearch" runat="server" CssClass="Normal" Width="60px" CausesValidation="false" ResourceKey="Search" OnClick="btnSearch_Click">
            </asp:Button>
  