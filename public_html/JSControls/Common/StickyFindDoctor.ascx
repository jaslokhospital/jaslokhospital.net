<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StickyFindDoctor.ascx.cs" Inherits="JSControls_Common_StickyFindDoctor" EnableViewState="true" ViewStateMode="Enabled" %>
  
   

<div class="side-slider" id="sideSlider">

            <a class="click_for finder" href=""></a>FHFHFHFG
    <asp:UpdatePanel ID="updatessfd" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlSpecialtySFD" />
                </Triggers>
                <ContentTemplate>
            <ul class="sliding-doc-info clearfix" style="top: -230px;">
                <li class="for scheduling" style="min-height: 230px; padding: 1.5em;">
                                            <!-- <h3>Schedule an <font class="bold white">Appointment</font></h3>
                              <ul class="clearfix">
                                <li class="call">1-800-221-166</li>
                                <li> <a href="frmBookAnAppointment.aspx">Book An Appointment</a> </li>
                              </ul>-->
                </li>
                <li class="for finding" style="padding: 1.5em;">
                    <h3>Find a Doctor</h3>
                    <%--<select id="dept" onchange="deptChange();">
                        <option value="-1" title="-select one-">Select Department</option>
                        <option value="Bariatric Surgery" title="Bariatric Surgery">Bariatric Surgery</option>
                        <option value="Blood Bank" title="Blood Bank">Blood Bank</option>
                        <option value="Cardiac Surgery" title="Cardiac Surgery">Cardiac Surgery</option>
                        <option value="Neonatology" title="Neonatology">Neonatology</option>
                        <option value="Neurology" title="Neurology">Neurology</option>
                        <option value="Neuro Surgery" title="Neurosurgery">Neuro Surgery</option>
                    </select>--%>

                     <asp:DropDownList runat="server" ID="ddlSpecialtySFD" OnSelectedIndexChanged="ddlSpecialtySFD_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true" ViewStateMode="Enabled" class="form-control appoint_form">
                                        </asp:DropDownList>     


                    <%--<select id="doc" onchange="doctorChange();">
                        <option value="-1" title="Doctor Name">Doctor Name</option>
                    </select>--%>
                       <asp:DropDownList runat="server" ID="ddlDoctorSFD" class="form-control appoint_form">
                                     </asp:DropDownList> 

                   <%-- <a class="" href="javascript:;" onclick="findDoctor()">SUBMIT</a>--%>
                    <asp:LinkButton ID="btnSubmitLPFD" runat="server" class="btn btn_submit" OnClick="btnSubmitLPFD_Click">Submit<i class="submit"></i></asp:LinkButton>
                    <div class="sid_bar1 pull-right">
                        <a href="#">Doctors' Directory</a>
                    </div>
                    <div class="clear"></div>
                </li>
                <li class="for manual" style="min-height: 230px; padding: 1.5em;">
                </li>
            </ul>
                      </ContentTemplate>
            </asp:UpdatePanel>
        </div>

