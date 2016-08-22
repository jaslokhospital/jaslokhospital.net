<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SeminarDetails.aspx.cs" Inherits="SeminarDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div align="center">
                <table width="700" cellspacing="0" cellpadding="0" border="0">
                </table>
                <table width="700" cellspacing="0" cellpadding="0" border="0" class="popup_tble popup_tble_tit">
                    <tbody>
                        <tr>
                            <th colspan="2">
                                <span class="heading_popup" id="lblTitle1">Conference Details </span>
                            </th>
                        </tr>
                    </tbody>
                </table>
                <table width="700" cellspacing="0" cellpadding="0" border="0" class="popup_tble">
                    <tbody>
                        <tr id="trDate">
                            <td width="195" valign="top" align="left">
                                <strong>Date</strong>
                            </td>
                            <td width="505" align="left" valign="top">
                                <span id="lblDate">21 Nov To 22 Nov 2015    </span>
                            </td>
                        </tr>

                        <tr id="trTitle">
                            <td valign="top" align="left">
                                <strong>Title</strong>
                            </td>
                            <td valign="top" align="left">
                                <strong style="font-size: 12px;">
                                    <span id="lblTitle">8TH JASLOK CRITICON 2015 - CLICK HERE </span></strong>
                            </td>
                        </tr>

                        <tr id="trOfficer">
                            <td valign="top" align="left">
                                <strong>Officer In charge</strong>
                            </td>
                            <td valign="top" align="left">
                                <span id="lblIncharge">Miss Vijeta Kamath    </span>
                            </td>
                        </tr>

                        <tr id="trNumber">
                            <td valign="top" align="left">
                                <strong>Contact Number </strong>
                            </td>
                            <td valign="top" align="left">
                                <span id="lblNumber">912266573299</span>
                            </td>
                        </tr>

                        <tr id="trMail">
                            <td valign="top" align="left">
                                <strong>Email Id</strong>
                            </td>
                            <td valign="top" align="left">
                                <span id="lblEmail">jaslokicu@gmail.com</span>
                            </td>
                        </tr>

                        <tr id="trVenu">
                            <td valign="top" align="left">
                                <strong>Venue</strong>
                            </td>
                            <td valign="top" align="left">
                                <span id="lblVenu">Hotel Trident, Nariman Point, Mumbai</span>
                            </td>
                        </tr>

                        <tr id="trTime">
                            <td valign="top" align="left">
                                <strong>Timings</strong>
                            </td>
                            <td valign="top" align="left">
                                <span id="lblTime">09:00 AM To 05:00 PM</span>
                            </td>
                        </tr>


                        <tr id="trView">
                            <td valign="top" align="left">
                                <strong>View Documents </strong>
                            </td>
                            <td valign="top" align="left">&nbsp;
                    
                            </td>
                        </tr>

                        <tr id="trone">
                            <td valign="top" align="left">
                                <span id="lblone"><strong>Brochure </strong></span>
                            </td>
                            <td valign="top" align="left">
                                <div class="download_popup">
                                    <img alt="download_icon1.gif" src="/Images/download_icon.gif">
                                    <a href="Common/Uploads/ConfAndWork/1_6_8TH%20JASLOK%20CRITICON%202015.jpg" id="A1" target="_blank">Download</a>
                                </div>
                            </td>
                        </tr>

                        <tr id="trtwo">
                            <td valign="top" align="left">
                                <span id="lblTwo"><strong>Time-TOPIC</strong></span>
                            </td>
                            <td valign="top" align="left">
                                <div class="download_popup">
                                    <img alt="download_icon1.gif" src="/Images/download_icon1.gif"><a href="Common/Uploads/ConfAndWork/2_6_8TH%20JASLOK%20CRITICON%202015.pdf" id="A2" target="_blank">Download</a>
                                </div>
                            </td>
                        </tr>




                        <tr>
                            <td valign="top" align="left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<input type="Button" value="Close" id="btnClose" class="testimonial_btn" onclick="javascript: window.close()" name="Close">
                            </td>
                        </tr>
                        <tr>
                        </tr>
                    </tbody>
                </table>
                <table width="700" cellspacing="0" cellpadding="0" border="0">
                    <tbody>
                        <tr>
                            <td valign="top" colspan="2">
                                <div class="popup_bottom">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
