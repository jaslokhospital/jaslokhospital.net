<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Article.View.UserBiographyManage, App_Web_userbiographymanage.ascx.6c70b780" %>
    <%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
    <%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table width="90%" cellpadding="1" cellspacing="1" class="Normal" align="center">
    <tr >
        <td  style="width:200px">
            <dnn:Label ID="plEmail" runat="server" Suffix=":"></dnn:Label>
        </td>
        <td valign="top" align="left">
            <asp:TextBox ID="txtEmail" TabIndex="1" runat="server" Width="30%"></asp:TextBox><asp:Label ID="lblEmailExplanation" runat="server" ResourceKey="lblEmailExplanation"
              ></asp:Label>
        </td>
    </tr>
    <tr >
        <td>
            <asp:Image ID="imgGravatarPreview" runat="server"></asp:Image>
        </td>
        <td>
            <br />
             <br />
              <br />
        </td>
       
    </tr>
     <tr >
        <td  colspan="2">
            <dnn:Label ID="plBiography" runat="server" ></dnn:Label><br />
        </td>
     
    </tr>
     <tr valign="top" >
        <td width="100%" colspan="2">
             <hr style="border:1px dotted #999999; size:1"/>
        </td>
    </tr>
    <tr >
        <td  colspan="2">
             <dnn:TextEditor ID="txtBiography" Width="100%" Height="250" runat="server" />
        </td>
    </tr>
</table>
<p  align="center">     
             <asp:LinkButton ID="lbtnUpdate" runat="server" resourcekey="lbtnUpdate" CausesValidation="false" CssClass="CommandButton"
                OnClick="lbtnUpdate_Click"></asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnAdminHome" runat="server" resourcekey="lbtnAdminHome" CausesValidation="false" CssClass="CommandButton"
                OnClick="lbtnAdminHome_Click"></asp:LinkButton>
    </p>
