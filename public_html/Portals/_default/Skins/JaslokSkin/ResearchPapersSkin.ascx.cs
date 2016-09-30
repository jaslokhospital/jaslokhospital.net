using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using DotNetNuke;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Portals__default_Skins_JaslokSkin_ResearchPapersSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (Request.RawUrl.Contains("research-paper"))
        {
            h3header.InnerHtml = "Research Papers";
            BindResearchPapersPageDetail();       

            SubRootSpan.InnerText = "Research Paper";
        }
    }

    public void BindResearchPapersPageDetail()
    {
        try
        {
            DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;

            DataSet ds = new DataSet();

            ds = (DataSet)objBusinessLogic.GetResearchPapersPageContentDetail();
           
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptResearchPapers.DataSource = ds;
                rptResearchPapers.DataBind();
            }
            else
            {
                contentpane.Visible = false;
            }


        }
        catch (Exception ex)
        {

        }
        
    }
}