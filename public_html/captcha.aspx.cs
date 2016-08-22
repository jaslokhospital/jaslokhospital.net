using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class captcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
	Response.Write(DateTime.Now.ToString()+"<br/>");	
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if(captch001.IsValid)
            Response.Write("Successfully validated");
    }
}