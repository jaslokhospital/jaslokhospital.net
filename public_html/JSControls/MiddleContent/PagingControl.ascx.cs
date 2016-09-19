﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TL_Controls_Common_PagingControl : System.Web.UI.UserControl
    {
        /// <summary>
        /// Number of records per page
        /// </summary>
        int Linkcount = 10;

        public int PageSize
        {
            get
            {                
                if (ViewState["PageSize"] == null)
                    return 20;  
              
                return (int) ViewState["PageSize"];               
            }
            set
            {
                ViewState["PageSize"] = value;
            }
        }

        /// <summary>
        /// Index of the current page
        /// </summary>
        public int CurrentPage
        {
            get
            {                
                if (ViewState["CurrentPage"] == null)
                    return 0;

                return (int)ViewState["CurrentPage"];                
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        /// <summary>
        /// Total number of records
        /// </summary>
        public int TotalRecordsCount
        {
            get
            {                
                if (ViewState["TotalRecordsCount"] == null)
                    return 0;

                return (int)ViewState["TotalRecordsCount"];                
            }
            set
            {
                ViewState["TotalRecordsCount"] = value;
            }
        }

        /// <summary>
        /// total number of pages
        /// </summary>
        public int Pages
        {
            get
            {                
                return (int)Math.Ceiling((double)TotalRecordsCount / PageSize);
            }            
        }

        /// <summary>
        /// The index of the first item shown on the current page
        /// </summary>
        public int FirstItemIndex
        {
            get
            {
                return CurrentPage * PageSize;
            }
        }

        /// <summary>
        /// The index of the last item shown on the current page. 
        /// Could be less than the MaxItemIndex if on the last page, and the number of records displayed are less than the page size
        /// </summary>
        public int LastItemIndex
        {
            get
            {
                int index = FirstItemIndex + PageSize - 1;
                
                if (index >= TotalRecordsCount)
                    return TotalRecordsCount - 1;

                return index;
            }
        }

        /// <summary>
        /// The last possible index on the current page
        /// </summary>
        public int MaxItemIndex
        {
            get
            {
                return FirstItemIndex + PageSize - 1;                
            }
        }

        protected override void OnLoad(EventArgs e)
        {           
            BuildPages();            
        }

        protected override Boolean OnBubbleEvent(Object sender, System.EventArgs args)
        {
            CommandEventArgs e = (CommandEventArgs)args;

            if (e != null)
            {
                if (string.Equals(e.CommandName, "MoveNext", StringComparison.OrdinalIgnoreCase))
                {
                    if (CurrentPage < Pages - 1)
                        CurrentPage++;
                    BuildPages();
                    
                }
                else if (string.Equals(e.CommandName, "MovePrev", StringComparison.OrdinalIgnoreCase))
                {
                    if (CurrentPage > 0)
                        CurrentPage--;
                    BuildPages();                    
                }
                else if (string.Equals(e.CommandName, "MoveFirst", StringComparison.OrdinalIgnoreCase))
                {
                    CurrentPage = 0;
                    BuildPages();                    
                }
                else if (string.Equals(e.CommandName, "MoveLast", StringComparison.OrdinalIgnoreCase))
                {
                    if (Pages > 0)
                        CurrentPage = Pages - 1;

                    BuildPages();                    
                }
                else if (string.Equals(e.CommandName, "GoToPage", StringComparison.OrdinalIgnoreCase))
                {
                    int newPage = int.Parse(e.CommandArgument.ToString());
                    CurrentPage = newPage - 1;

                    BuildPages();                    
                }
            }

            base.OnBubbleEvent(sender, e);
            return false;
        }

        private void AdjustLayout()
        {
            btnFirst.Visible = btnPrev.Visible = (Pages > 1 && CurrentPage != 0);
            btnLast.Visible = btnNext.Visible = (Pages > 1 && CurrentPage != Pages - 1);
            //btnFirst.Visible = (Pages > 1 && CurrentPage != 0);
            //btnLast.Visible = (Pages > 1 && CurrentPage != Pages - 1);
            LinkButton pageLink = (LinkButton) FindControl("page_" + (CurrentPage + 1));
            if (pageLink != null)
            {
                pageLink.Enabled = false;
                pageLink.CssClass = "goto-page linkDisabled";
            }
        }

        public void BuildPages()
        {
            PagesPlaceHolder.Controls.Clear();
            if (CommonFn.IsMobileDevice())
            {
                Linkcount = 2;
            }
            //If pages are less than 25 show all page numbers
            if (Pages < Linkcount)
            {
                for (int i = 1; i <= Pages; i++)
                {
                    CreatePageLink(i);
                }
            }
            //show only 25 page numbers if the total number of pages is more than 25
            else
            {
                int max = 4;

                if (CurrentPage >= 2)
                    max = CurrentPage + 2;

                if (max > Pages)
                    max = Pages;

                int min = max - 3;
                if (min < 1)
                    min = 1;

                for (int i = min; i <= max; i++)
                {
                    CreatePageLink(i);
                }
            }

            AdjustLayout();
        }  
        //public void BuildPages()
        //{
        //    PagesPlaceHolder.Controls.Clear();
        //    //If pages are less than 25 show all page numbers
        //    if (Pages < 10)
        //    {
        //        for (int i = 1; i <= Pages; i++)
        //        {
        //            CreatePageLink(i);
        //        }
        //    }
        //    //show only 25 page numbers if the total number of pages is more than 25
        //    else
        //    {
        //        int max = 5;
                
        //        if(CurrentPage >= 3)
        //            max = CurrentPage + 3;

        //        if(max > Pages)
        //            max = Pages;
                
        //        int min = max - 4;
        //        if (min < 1)
        //            min = 1;

        //        for (int i = min; i <= max; i++)
        //        {
        //            CreatePageLink(i);
        //        }
        //    }

        //    AdjustLayout();
        //}        

        private void CreatePageLink(int i)
        {            
            LinkButton lnk = new LinkButton();
            lnk.Text = i.ToString();
            lnk.CommandName = "GoToPage";
            lnk.CommandArgument = i.ToString();
            lnk.CssClass = "goto-page";            
            lnk.ID = "page_" + i;
            lnk.Enabled = true;
            PagesPlaceHolder.Controls.Add(lnk);
            PagesPlaceHolder.Controls.Add(new LiteralControl("&nbsp;"));
        }
    }