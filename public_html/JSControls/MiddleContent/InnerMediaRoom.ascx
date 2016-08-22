<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InnerMediaRoom.ascx.cs" Inherits="JSControls_MiddleContent_InnerMediaRoom" %>

<div class="search-form">
    <div class="form-horizontal well">
        <div class="input-group">
            <label>Name : </label>
            <input type="text" class="form-control">
        </div>
        <div class="form-group">
            <button type="submit" name="submit" class="btn btn-default">Submit</button>
            <button type="reset" name="reset" class="btn btn-default">reset</button>
        </div>
    </div>
</div>
<div class="row">
 <asp:Repeater ID="rptInnerManagement" runat="server">
                <ItemTemplate>

    <div class="col-md-6 col-sm-6">
        <div class="management-bg well">
           
                    <img class="pull-right img-responsive" src='<%#Eval("ImageUrl")%>' alt="" title='<%#Eval("Title")%>'>
                    <div class="description">
                        <span class="center-block"><a href="#" class="default-color">Dr. Tarang Gianchandani</a></span>
                        <span class="center-block"><%#Eval("Title")%></span>
                        <p><%#Eval("Description")%></p>
                        <a href="#" class="read_more">Read more >></a>
                    </div>
               
        </div>
    </div>


                     </ItemTemplate>
            </asp:Repeater>
    </div>