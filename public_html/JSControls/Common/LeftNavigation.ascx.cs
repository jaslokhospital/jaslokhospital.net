using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public class MenuItems
{
    public string MenuText { get; set; }
    public string MenuLink { get; set; }
}

public partial class JSControls_Common_LeftNavigation : System.Web.UI.UserControl
{
    List<MenuItems> menus;
    public string styling = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        menus = new List<MenuItems>();
        if (Request.RawUrl.Contains("/corporate-profile") || Request.RawUrl.Contains("/newsdetail"))
        {
            menus.Add(new MenuItems { MenuText = "From The Chairman's Desk", MenuLink = "/corporate-profile/from-the-chairmans-desk" });
            menus.Add(new MenuItems { MenuText = "Vision and Mission", MenuLink = "/corporate-profile/vision-and-mission" });
            menus.Add(new MenuItems { MenuText = "Trustees", MenuLink = "/corporate-profile/trustees" });
            menus.Add(new MenuItems { MenuText = "Management", MenuLink = "/corporate-profile/management-team" });
            menus.Add(new MenuItems { MenuText = "Hospital Facilities", MenuLink = "/corporate-profile/hospital-facilities" });
            menus.Add(new MenuItems { MenuText = "Certifications", MenuLink = "/corporate-profile/certifications" });
            menus.Add(new MenuItems { MenuText = "Jaslok in News", MenuLink = "/corporate-profile/jaslok-news" });
            menus.Add(new MenuItems { MenuText = "Scope Of Services", MenuLink = "/corporate-profile/scope-of-services" });
            menus.Add(new MenuItems { MenuText = "Frequently Asked Questions", MenuLink = "/corporate-profile/frequently-asked-questions" });
            menus.Add(new MenuItems { MenuText = "Quality Corner", MenuLink = "/corporate-profile/quality-corner" });
        }
        else if (Request.RawUrl.Contains("/patients") || Request.RawUrl.Contains("/success"))
        {
            menus.Add(new MenuItems { MenuText = "Patient Facilities", MenuLink = "/patients/patient-facilities" });
            menus.Add(new MenuItems { MenuText = "View Billing Details", MenuLink = "/patients/vision-and-mission" });
            menus.Add(new MenuItems { MenuText = "View Lab Reports", MenuLink = "/patients/hospital-facilities" });
            menus.Add(new MenuItems { MenuText = "Feedback Form", MenuLink = "/patients/feedback" });
            menus.Add(new MenuItems { MenuText = "Complaint Form", MenuLink = "/patients/complaint" });
            menus.Add(new MenuItems { MenuText = "Quick Enquiry", MenuLink = "/patients/quick-enquiry" });
            menus.Add(new MenuItems { MenuText = "Estimate Request", MenuLink = "/patients/estimate-request" });
        }
        else if (Request.RawUrl.Contains("/international-patients") || Request.RawUrl.Contains("/testimonial"))
        {
            //menus.Add(new MenuItems { MenuText = "Hospital Facilities", MenuLink = "/international-patients/hospital-facilities" });
            menus.Add(new MenuItems { MenuText = "Hospital Facilities for International patients", MenuLink = "/international-patients/facilities-for-international-patients" });
            menus.Add(new MenuItems { MenuText = "Doctors Availability", MenuLink = "/international-patients/doctors-availability" });
            menus.Add(new MenuItems { MenuText = "Virtual Tour", MenuLink = "/international-patients/virtual-tour" });
            menus.Add(new MenuItems { MenuText = "Feedback", MenuLink = "/international-patients/feedback" });
            menus.Add(new MenuItems { MenuText = "Testimonials", MenuLink = "/international-patients/testimonials" });
            menus.Add(new MenuItems { MenuText = "Estimate Request", MenuLink = "/international-patients/estimate-request" });
        }
        else if (Request.RawUrl.Contains("/education-and-research") || Request.RawUrl.Contains("/healthdetails/"))
        {
            menus.Add(new MenuItems { MenuText = "DNB Program", MenuLink = "/education-and-research/dnb-program" });
            menus.Add(new MenuItems { MenuText = "Fellowship", MenuLink = "/education-and-research/fellowship" });
            menus.Add(new MenuItems { MenuText = "Internship", MenuLink = "/education-and-research/internship" });
            menus.Add(new MenuItems { MenuText = "Advance Courses", MenuLink = "/education-and-research/advance-courses" });
            menus.Add(new MenuItems { MenuText = "Nursing Program", MenuLink = "/education-and-research/nursing-program" });
            menus.Add(new MenuItems { MenuText = "Health Tips", MenuLink = "/education-and-research/health-tips" });
            menus.Add(new MenuItems { MenuText = "Research Paper", MenuLink = "/education-and-research/research-paper" });
        }
        else if (Request.RawUrl.Contains("/specialties/health-check-up") )
        {
            divHelthCheckUp.Visible = true;
        }
        rptMenus.DataSource = menus;
        rptMenus.DataBind();

        rptMenusMobile.DataSource = menus;
        rptMenusMobile.DataBind();
    }
    protected void rptMenus_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
       /* if (e.Item.ItemIndex == menus.Count - 1)
        {
            PlaceHolder plc = e.Item.FindControl("plcDivider") as PlaceHolder;
            plc.Visible = false;
        }
        */
        
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        string[] pageTitle = Request.RawUrl.Split('/');
        string selectedItem;
        if (Request.RawUrl.Contains("/healthdetails/"))
        {
           // Literal ltState = e.Item.FindControl("ltState") as Literal;
            //ltState.Text = "class='active'";
        }
        else if (Request.RawUrl.Contains("/newsdetail") || Request.RawUrl.Contains("/jaslok-news"))
        {
            Literal ltState = e.Item.FindControl("ltState") as Literal;
            Literal ltMenuText = e.Item.FindControl("ltMenuText") as Literal;
            if (ltMenuText.Text == "Jaslok in News")
                ltState.Text = "class='active'";
        }
        else if (Request.RawUrl.Contains("/management-team"))
        {
            Literal ltState = e.Item.FindControl("ltState") as Literal;
            Literal ltMenuText = e.Item.FindControl("ltMenuText") as Literal;
            if (ltMenuText.Text == "Management")
                ltState.Text = "class='active'";
        }
        else
        {
            if (pageTitle.Length > 2)
            {
                selectedItem = pageTitle[2].Replace("-", " ");
            }
            else
            {
                selectedItem = pageTitle[1].Replace("-", " ");
            }
            Literal ltMenuText = e.Item.FindControl("ltMenuText") as Literal;
            //Response.Write(ltMenuText.Text + " : " + selectedItem + "<br />");
            if (ltMenuText.Text.ToLower().Replace("'", "").Contains(selectedItem.ToLower()))
            {
                Literal ltState = e.Item.FindControl("ltState") as Literal;
                ltState.Text = "class='active'";
            }
        }
    }
    
    protected void rptMenusMobile_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        string[] pageTitle = Request.RawUrl.Split('/');
        string selectedItem;
        if (Request.RawUrl.Contains("/healthdetails/"))
        {
            // Literal ltState = e.Item.FindControl("ltState") as Literal;
            //ltState.Text = "class='active'";
        }
        else if (Request.RawUrl.Contains("/newsdetail") || Request.RawUrl.Contains("/jaslok-news"))
        {
            Literal ltState = e.Item.FindControl("ltMenuTextMobile") as Literal;
            Literal ltMenuText = e.Item.FindControl("ltMenuTextMobile") as Literal;
            if (ltMenuText.Text == "Jaslok in News")
                ltState.Text = "class='active'";
        }
        else if (Request.RawUrl.Contains("/management-team"))
        {
            Literal ltState = e.Item.FindControl("ltMenuTextMobile") as Literal;
            Literal ltMenuText = e.Item.FindControl("ltMenuTextMobile") as Literal;
            if (ltMenuText.Text == "Management")
                ltState.Text = "class='active'";
        }
        else
        {
            if (pageTitle.Length > 2)
            {
                selectedItem = pageTitle[2].Replace("-", " ");
            }
            else
            {
                selectedItem = pageTitle[1].Replace("-", " ");
            }
            Literal ltMenuText = e.Item.FindControl("ltMenuTextMobile") as Literal;
            //Response.Write(ltMenuText.Text + " : " + selectedItem + "<br />");
            if (ltMenuText.Text.ToLower().Replace("'", "").Contains(selectedItem.ToLower()))
            {
                Literal ltState = e.Item.FindControl("ltStateMobile") as Literal;
                ltState.Text = "class='active'";
            }
        }
    }
   
}