<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.Archive, App_Web_archive_standard.ascx.12940a9" %>
<table>
  <tr>
    <td><asp:label id="lblArchive" runat="server" cssclass="SubHead" ResourceKey="lblArchive">Archive</asp:label>
    </td>
  </tr>
  <tr>
    <td>
    <asp:calendar 
    	id="calMonth" 
        runat="server" 
        cssclass="Normal"
        DayHeaderStyle-CssClass="Article_Archive_DayHeader"
        DayStyle-CssClass="Article_Archive_Day"
        NextPrevStyle-CssClass="Article_Archive_NextPrev"
        OtherMonthDayStyle-CssClass="Article_Archive_OtherMonth"
        SelectedDayStyle-CssClass="Article_Archive_SelectedDay"
        SelectorStyle-CssClass="Article_Archive_Selector"
        TitleStyle-CssClass="Article_Archive_Title"
        TodayDayStyle-CssClass="Article_Archive_TodayDay"
        WeekendDayStyle-CssClass="Article_Archive_WeekendDay" 
            onselectionchanged="calMonth_SelectionChanged" 
            onvisiblemonthchanged="calMonth_VisibleMonthChanged">
<TodayDayStyle CssClass="Article_Archive_TodayDay">
</TodayDayStyle>

<SelectorStyle CssClass="Article_Archive_Selector">
</SelectorStyle>

<DayStyle CssClass="Article_Archive_Day">
</DayStyle>

<NextPrevStyle CssClass="Article_Archive_NextPrev">
</NextPrevStyle>

<DayHeaderStyle CssClass="Article_Archive_DayHeader">
</DayHeaderStyle>

<SelectedDayStyle CssClass="Article_Archive_SelectedDay">
</SelectedDayStyle>

<TitleStyle CssClass="Article_Archive_Title">
</TitleStyle>

<WeekendDayStyle CssClass="Article_Archive_WeekendDay">
</WeekendDayStyle>

<OtherMonthDayStyle CssClass="Article_Archive_OtherMonth">
</OtherMonthDayStyle></asp:calendar>
    </td>
  </tr>
  <tr>
    <td><asp:label id="lblMonthly" runat="server" cssclass="SubHead" ResourceKey="lblMonthly">Monthly</asp:label>
    </td>
  </tr>
  <tr>
    <td><asp:datalist id="dlArchiveMonths" runat="server" Width="100%" 
            CssClass="CommandButton" CellPadding="0" CellSpacing="0" BorderWidth="0" 
            onitemdatabound="dlArchiveMonths_ItemDataBound">
        <itemtemplate>
          <table width="100%" cellpadding="0" cellspacing="0" border="0" align="left">
            <tr>
              <td align="left">
<asp:hyperlink runat="server" id="lnkMonthYear" cssclass="CommandButton"></asp:hyperlink>
              </td>
              <td align="right">
<asp:HyperLink ImageUrl="~/desktopmodules/CrossArticle/Images/feed-icon-12x12.gif" cssclass="CommandButton" Runat="server" ID="lnkArticleRSS" Visible="False" target="_blank"></asp:HyperLink>
              </td>
            </tr>
          </table>
        </itemtemplate>
      </asp:datalist>
    </td>
  </tr>
</table>
