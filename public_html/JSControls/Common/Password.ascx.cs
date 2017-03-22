using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessDataLayer;

public partial class JSControls_Common_Password : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private string Encrypt(string clearText)
    {
        string EncryptionKey = "AVZMAKV2SPBNI9921200CBCZZSMGM";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        string password = HttpUtility.UrlEncode(Encrypt(txtPassword.Text.Trim()));
        BusinessLogic objBusinessLogic = new BusinessLogic();
        objBusinessLogic.UpdateSmtpCredential(password);
        lblPassword.CssClass = "dnnFormMessage dnnFormSuccess";
        lblPassword.Text = "<span style='font-size:10px;font-weight:bold;text-transform:uppercase;'>Your password updated successfully</span>";
        txtPassword.Text = "";
        Cache.Remove("SMTPCred");
    }
}