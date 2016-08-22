<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FindDoctor.ascx.cs" Inherits="JSControls_MiddleContent_FindDoctor" %>
<!--//// FEATURED ARTICLES /////-->
<div class="col-md-9">
    <div class="right_part">
        <h3>sdfsdfsdf</h3>
        <hr>
        <div>
        <asp:Label ID="lblDoctorId" runat="server"  /></br>
        <asp:Image ID="lblImage" runat="server"  />
        <asp:Label ID="lblName" runat="server"  /></br>
</div>
        
       
        <asp:Label ID="lblDescription" runat="server"  />

        <%--<p>This permits us to perform Primary Angioplasty for patients with acute heart attack in the shortest time, thereby saving many lives.</p>--%>

        <div id="accordion-first" class="clearfix">
            <div class="accordion" id="accordion2">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne" aria-expanded="true">
                            <em class="icon-fixed-width fa fa-minus"></em>Service Available
                             <asp:Label ID="lblSpecialization" runat="server"  />
                            <asp:Label ID="lblDesignation" runat="server" />
                        </a>
                    </div>
                    <div id="collapseOne" class="accordion-body collapse in">
                        <div class="accordion-inner">
                            <asp:Label ID="lblMobileNo" runat="server"  />
                            <asp:Label ID="lblPhoneNo" runat="server"  />
                            <asp:Label ID="lblEmailId" runat="server"  />
                            <%--<p>To facilitate successful angioplasty in complex cases, the cath labs are equipped with intravascular ultrasound, Rotablator, PTMR, IAPB, special thrombus extraction catheters and delivery catheters.</p>
                                <p>Insertion of a variety of stents including the latest medicated, drug coated stents.</p>
                                <p>Latest equipment for EP study and Radio frequency ablation for diagnosis and treatment of Cardiac arrhythmias.</p>
                                <p>Implantation of AICDS and combination devices.</p>
                                <p>Biventricular pacing for heart failure.</p>
                                <p>Balloon Mitral Valvuloplasty.</p>--%>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                            <em class="icon-fixed-width fa fa-plus"></em>Non-Invasive Cardiology
                        </a>
                    </div>
                    <div style="height: 0px;" id="collapseTwo" class="accordion-body collapse">
                        <div class="accordion-inner">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor...
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                            <em class="icon-fixed-width fa fa-plus"></em>Paediatric Cardiology
                        </a>
                    </div>
                    <div style="height: 0px;" id="collapseThree" class="accordion-body collapse">
                        <div class="accordion-inner">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor...
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
                            <em class="icon-fixed-width fa fa-plus"></em>Heart Failure Clinic
                        </a>
                    </div>
                    <div style="height: 0px;" id="collapseFour" class="accordion-body collapse">
                        <div class="accordion-inner">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor...
                        </div>
                    </div>
                </div>

            </div>
            <!-- end accordion -->
        </div>
    </div>
</div>
