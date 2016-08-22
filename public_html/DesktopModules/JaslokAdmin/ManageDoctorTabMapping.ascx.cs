using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ManageDoctorTabMapping : PortalModuleBase
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    ArrayList arraylist1 = new ArrayList();
    ArrayList arraylist2 = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDoctor();            
            bindSpecialtyName();
           //BindPage();
            ViewState["DoctorId"] = 0;
            ViewState["optype"] = "UpdateTabs";          
        }
        objDAEntities.SelectTabId = "";
    }
    protected void drpDoctorNM_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ds = null;

        int SelectedDid = Int32.Parse(drpDoctorName.SelectedValue);
        objDAEntities.DoctorId = Convert.ToInt32(drpDoctorName.SelectedValue);
        //listspecialitySel = objBusinessLogic.GetSpecialtyMap(SelectedDid);
        ds = (DataSet)objBusinessLogic.GetSpecialtyMap(objDAEntities);
        listspecialitySel.DataValueField = "SpecialtyId";
        listspecialitySel.DataTextField = "SpecialtyName";
        listspecialitySel.DataSource = ds;
        listspecialitySel.DataBind();
        lblMessage.Visible = false;
    }
    private void bindDoctor()
    {
        DataSet ds = new DataSet();
        ds = null;
       // objDAEntities.CategoryId = Convert.ToInt32(drpspecialCategory.SelectedValue);
        objDAEntities.DoctorId = Convert.ToInt32(drpDoctorName.SelectedValue);
        ds = (DataSet)objBusinessLogic.GetDoctorById(objDAEntities);
        drpDoctorName.DataValueField = "DoctorId";
        drpDoctorName.DataTextField = "Name";

        drpDoctorName.DataSource = ds;
        drpDoctorName.DataBind();
        drpDoctorName.Items.Insert(0, new ListItem("-Select-", "0"));
    }   
    private void bindSpecialtyName()
    {
        DataSet ds = new DataSet();
        ds = null;
      //objDAEntities.SpecialtyId = Convert.ToInt32(drpSpecilty.SelectedValue);
        ds = (DataSet)objBusinessLogic.GetSpeciality();
        listspecialityAvl.DataValueField = "SpecialtyId";
        listspecialityAvl.DataTextField = "SpecialtyName";
        listspecialityAvl.DataSource = ds;
        listspecialityAvl.DataBind();

        //listspecialityAvl.Items.Insert(0, new ListItem("-Select-", "0"));
        //while (listspecialitySel.Items.Count == 0)
        //{
        //    for (int i = 0; i < listspecialitySel.Items.Count; i++)
        //    {
        //        listspecialitySel.Items.Add(listspecialitySel.Items[i]);
        //        listspecialitySel.Items.Remove(listspecialitySel.Items[i]);
        //    }
        //}
    }
    public void Clear()
    {
        drpDoctorName.ClearSelection();
        listspecialityAvl.ClearSelection();
        //lbSpecialtytabs.ClearSelection();
        drpDoctorName.Enabled = true;

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
        lblMessage.Visible = false;
        Response.Redirect(Request.RawUrl);
    }
    protected void btnAddSpecialty_Click(object sender, EventArgs e)
    {
        if (listspecialityAvl.SelectedIndex >= 0)
        {
            for (int i = 0; i < listspecialityAvl.Items.Count; i++)
            {
                if (listspecialityAvl.Items[i].Selected)
                {
                    listspecialitySel.Items.Add(listspecialityAvl.Items[i]);
                    listspecialityAvl.Items.Remove(listspecialityAvl.Items[i]);
                    i = i - 1;
                }
            }
        }
    }
    protected void btnAddAll_Click(object sender, EventArgs e)
    {
        while (listspecialityAvl.Items.Count != 0)
        {
            for (int i = 0; i < listspecialityAvl.Items.Count; i++)
            {
                listspecialitySel.Items.Add(listspecialityAvl.Items[i]);
                listspecialityAvl.Items.Remove(listspecialityAvl.Items[i]);
            }
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        lbselectedSpecialtyRemove();

    }
    public void lbselectedSpecialtyRemove()
    {
        if (listspecialitySel.SelectedIndex >= 0)
        {
            for (int i = 0; i < listspecialitySel.Items.Count; i++)
            {
                if (listspecialitySel.Items[i].Selected)
                {
                    if (!arraylist1.Contains(listspecialitySel.Items[i]))
                    {
                        arraylist1.Add(listspecialitySel.Items[i]);
                    }
                }
            }
            for (int i = 0; i < arraylist1.Count; i++)
            {
                if (!listspecialityAvl.Items.Contains(((ListItem)arraylist1[i])))
                {
                    listspecialityAvl.Items.Add(((ListItem)arraylist1[i]));
                }
                listspecialitySel.Items.Remove(((ListItem)arraylist1[i]));
            }
            listspecialityAvl.SelectedIndex = -1;
        }
    }
    protected void btnRemoveAll_Click(object sender, EventArgs e)
    {
        while (listspecialitySel.Items.Count != 0)
        {
            for (int i = 0; i < listspecialitySel.Items.Count; i++)
            {
                listspecialityAvl.Items.Add(listspecialitySel.Items[i]);
                listspecialitySel.Items.Remove(listspecialitySel.Items[i]);
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        //objDAEntities.DoctorId = Convert.ToInt16(drpDoctorName.SelectedItem.Value);
        //try
        //{
        //    for (int i = 0; i < listspecialitySel.Items.Count; i++)
        //    {
        //        objDAEntities.SelectTabId = objDAEntities.SelectTabId + "," + listspecialitySel.Items[i].Value;
        //    }
        //    DataSet ds = new DataSet();
        //    ds = null;
        //    //objDAEntities.SpecialtyId = Convert.ToInt32(drpSpecilty.SelectedValue);
        //    objDAEntities.DoctorId = Convert.ToInt32(drpDoctorName.SelectedValue);

        //    if (ViewState["optype"].ToString() == "UpdateTabs")
        //    {
        //        objDAEntities.optype = "UpdateTabs";
        //        objBusinessLogic.UpdateDeleteDoctorTab(objDAEntities);
        //        //listspecialityavl.Enabled = false;
        //    }
        //   // objBusinessLogic.AddSpecialtyMappingCtr(objDAEntities);
        //  // BindPage();
        //    Clear();
        //    lblMessage.Visible = true;
        //    lblMessage.CssClass = "successlbl";
        //    lblMessage.Text = "Data Updated successfully!!!";
        //    btnSubmit.Text = "Save";
        //}
        //catch (Exception ex)
        //{

        //}
    }
    protected void dgDoctorTab_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        lblMessage.Visible = true;
        if (e.CommandName == "Update")
        {
            btnSubmit.Text = "Update";
            listspecialityAvl.Enabled = true;
            if (drpDoctorName.Items.FindByText(e.Item.Cells[1].Text) != null)
            {
                drpDoctorName.ClearSelection();
                drpDoctorName.Items.FindByText(e.Item.Cells[1].Text).Selected = true;
            }
            bindDoctor();
            if (listspecialityAvl.Items.FindByText(e.Item.Cells[2].Text) != null)
            {
                listspecialityAvl.ClearSelection();
                listspecialityAvl.Items.FindByText(e.Item.Cells[2].Text).Selected = true;
            }
            //drpDoctorName.Enabled = false;
            //listspeciality.Enabled = false;
            string TabName = e.Item.Cells[3].Text;

            string[] TabArray = TabName.Split(',');
            int DoctorId = Convert.ToInt32(e.CommandArgument);
            ViewState["DoctorId"] = DoctorId;
            ViewState["optype"] = "UpdateTabs";
        }
        else if (e.CommandName == "Delete")
        {
            objDAEntities.optype = "DELETE";
            int DoctorId = Convert.ToInt32(e.CommandArgument);
            ViewState["DoctorId"] = DoctorId;
            objDAEntities.DoctorId = DoctorId;

            objBusinessLogic.UpdateDeleteDoctor(objDAEntities);
            ViewState["optype"] = "DELETE";
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Data deleted successfully!!!";
            ViewState["optype"] = "INSERT";
        }
       // BindPage();

    }
    
    //public void BindPage()
    //{
    //    try
    //    {
    //        DataSet ds = new DataSet();
    //        ds = null;
    //        ds = (DataSet)objBusinessLogic.GetDoctorTabMapDetails();

    //        dgDoctortab.DataSource = ds;
    //        dgDoctortab.DataBind();
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}    
}