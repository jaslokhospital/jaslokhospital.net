using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Collections;
using BusinessDataLayer;



public partial class thumbnail_browse : System.Web.UI.Page
{
    CommonFn objTransactions = new CommonFn();
    ArrayList arr;

    public ArrayList SearchList
    {
        get
        {
            return (ArrayList)ViewState["SearchList"];
        }
        set
        {
            ViewState["SearchList"] = value;
        }
    }

    public bool IsSearched
    {
        get
        {
            return Convert.ToBoolean(ViewState["IsSearched"]);
        }
        set
        {
            ViewState["IsSearched"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ImageCaption"] != null)
        {
            pnlImageCaption.Attributes.Add("style", "padding-top:10px;");
        }
        else
        {
            pnlImageCaption.Attributes.Add("style", "padding-top:10px;display:none;");
        }
        //if (Convert.ToString(Request.QueryString["id"]) != "")
        //{
        //    if (!Directory.Exists(Server.MapPath(AppGlobal.SlideShowDirectoryPath + Convert.ToString(Request.QueryString["id"]))))
        //        Directory.CreateDirectory(Server.MapPath(AppGlobal.SlideShowDirectoryPath + Convert.ToString(Request.QueryString["id"])));
        //}
        arr = objTransactions.GetArticleThumbnails(0, Convert.ToString(Request.QueryString["Image"]), Convert.ToString(Request.QueryString["id"]));
        if (!IsPostBack)
        {
            SearchList = new ArrayList();
            IsSearched = false;
            grdThumbnails.DataSource = arr;
            grdThumbnails.DataBind();
            // GetSelectedRecord();
        }
    }

    protected void grdThumbnails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdThumbnails.PageIndex = e.NewPageIndex;
        grdThumbnails.DataSource = (IsSearched) ? SearchList : arr;
        grdThumbnails.DataBind();
        //SetSelectedRecord();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        grdThumbnails.PageIndex = 0;
        grdThumbnails.DataSource = arr;
        grdThumbnails.DataBind();
        txtSearch.Text = "";
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        grdThumbnails.PageIndex = 0;
        IsSearched = true;
        if (txtSearch.Text != String.Empty)
        {
            SearchList.Clear();
            txtSearch.Text = txtSearch.Text.ToString().Trim();
            foreach (String str in arr)
            {
                if (str.ToLower().Contains(txtSearch.Text.ToString().ToLower()))
                {
                    SearchList.Add(str);
                }
            }
        }
        else
        {
            SearchList = arr;
        }
        grdThumbnails.DataSource = SearchList;
        grdThumbnails.DataBind();
    }
    public String GetPath(object img)
    {
        string imgPath = string.Empty;

        if (Convert.ToString(Request.QueryString["Image"]) != "" && Convert.ToString(Request.QueryString["id"]) != "")
        {
            imgPath = "/Portals/0/" + Request.QueryString["Image"] + "/" + Request.QueryString["id"] + "/" + img.ToString();
        }
        else if (Request.QueryString["Image"] != "")
        {
            imgPath = "/Portals/0/" + Request.QueryString["Image"] + "/" + img.ToString();
        }
        else
        {
            imgPath = "/Portals/0/" + img.ToString();
        }
        //imgPath = "/Portals/0/" + img.ToString();
        return imgPath;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string iPath = string.Empty;

        foreach (GridViewRow row in grdThumbnails.Rows)
        {
            RadioButton rb = (RadioButton)row.FindControl("RadioButton1");
            Image img = (Image)row.FindControl("imgThumbnail");
            if (rb.Checked)
            {
                iPath = img.ImageUrl.ToString();
                break;
            }
        }

        if (Request.QueryString["ImageCaption"] != null)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "SetPathwithCaption('" + iPath + "','" + txtImageCaption.Text.Trim() + "');", true);
        else
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "SetPath('" + iPath + "');", true);
    }

    protected void btUpload_Click(object sender, EventArgs e)
    {
        string iPath = string.Empty;
        int iUploadedCnt = 0;
        int iFailedCnt = 0;
        int nUploadCnt = 0;
        int extCount = 0;


        if (fileUpload.HasFile)     // CHECK IF ANY FILE HAS BEEN SELECTED.
        {

            String ext = System.IO.Path.GetExtension(fileUpload.FileName);
            if (ext.ToLower() == ".jpg" || ext.ToLower() == ".png" || ext.ToLower() == ".gif" || ext.ToLower() == ".jpeg")
            {
                HttpFileCollection hfc = Request.Files;
                lblFileList.Text = "Select <b>" + hfc.Count + "</b> file(s)";

                string sPath = string.Empty;

                if (Convert.ToString(Request.QueryString["Image"]) != "" && Convert.ToString(Request.QueryString["id"]) != "")
                {
                    sPath = Server.MapPath("\\Portals\\0\\" + Request.QueryString["Image"] + "\\" + Request.QueryString["id"] + "\\");
                }
                else if (Convert.ToString(Request.QueryString["Image"]) != "")
                {
                    sPath = Server.MapPath("\\Portals\\0\\" + Request.QueryString["Image"] + "\\");
                }
                else
                {
                    sPath = Server.MapPath("\\Portals\\0\\");
                }

                //sPath = Server.MapPath("\\Portals\\0\\");

                if (hfc.Count <= 10)    // 10 FILES RESTRICTION.
                {
                    for (int i = 0; i <= hfc.Count - 1; i++)
                    {
                        HttpPostedFile hpf = hfc[i];
                        if (hpf.ContentLength > 0 && hpf.ContentLength <= 20480000)
                        {

                            if (!File.Exists(sPath + Path.GetFileName(hpf.FileName)))
                            {
                                DirectoryInfo objDir = new DirectoryInfo(sPath);
                                string sFileName = Path.GetFileName(hpf.FileName);
                                string sFileExt = Path.GetExtension(hpf.FileName);
                                if (Convert.ToString(Request.QueryString["Image"]) != "" && Convert.ToString(Request.QueryString["id"]) != "")
                                {
                                    iPath = "/Portals/0/" + Request.QueryString["Image"] + "/" + Request.QueryString["id"] + "/" + sFileName;
                                }
                                else if (Convert.ToString(Request.QueryString["Image"]) != "")
                                {
                                    iPath = "/Portals/0/" + Request.QueryString["Image"] + "/" + sFileName;
                                }
                                else
                                {
                                    iPath = "/Portals/0/" + sFileName;
                                }
                                //iPath = "/Portals/0/" + sFileName;
                                // CHECK FOR DUPLICATE FILES.
                                FileInfo[] objFI = objDir.GetFiles(sFileName.Replace(sFileExt, "") + ".*");

                                if (objFI.Length > 0)
                                {
                                    // CHECK IF FILE WITH THE SAME NAME EXISTS (IGNORING THE EXTENTIONS).
                                    foreach (FileInfo file in objFI)
                                    {
                                        string sFileName1 = objFI[0].Name;
                                        string sFileExt1 = Path.GetExtension(objFI[0].Name);

                                        if (sFileName1.Replace(sFileExt1, "") == sFileName.Replace(sFileExt, ""))
                                        {
                                            iFailedCnt += 1;        // NOT ALLOWING DUPLICATE.
                                            break;
                                        }
                                    }
                                }
                                else
                                {
                                    // SAVE THE FILE IN A FOLDER.
                                    hpf.SaveAs(sPath + Path.GetFileName(hpf.FileName));
                                    iUploadedCnt += 1;
                                    iFailedCnt = 0;
                                    nUploadCnt = 0;
                                }
                            }
                            else
                            {
                                //if file already exists
                                iFailedCnt += 1;
                            }
                        }
                        else
                        {
                            //if the upload file limit exceeds more than 200kb
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('The uploaded file should not exceed more than 200kb');", true);
                            return;
                        }
                    }

                    lblUploadStatus.Text = "<b>" + iUploadedCnt + "</b> file(s) Uploaded.";
                    lblFailedStatus.Text = "<b>" + iFailedCnt + "</b> duplicate file(s) could not be uploaded.";

                }
                else
                {
                    //if multiple files exceeds more than 10
                    lblUploadStatus.Text = "Max. 10 files allowed.";
                }
            }
            else
            {
                extCount = 1;
            }

        }

        else
        {
            //if no file is selected

            lblUploadStatus.Text = "No files selected.";
            nUploadCnt = 1;
        }



        //finall execution
        if (iFailedCnt == 0 && nUploadCnt == 0 && extCount == 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('File uploaded successfully');", true);

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "setimagepath", "SetPath('" + iPath + "');", true);

            if (Request.QueryString["ImageCaption"] != null)
                Page.ClientScript.RegisterStartupScript(this.GetType(), "setimagepath", "SetPathwithCaption('" + iPath + "','" + txtImageCaption.Text.Trim() + "');", true);
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "setimagepath", "SetPath('" + iPath + "');", true);
        }
        else
        {
            if (nUploadCnt != 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert1", "alert('Please select a file');", true);
            }
            else if (extCount != 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert1", "alert('Only .jpg, .png, .gif images are allowed.');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert1", "alert('File already exists');", true);
            }


        }
    }
}