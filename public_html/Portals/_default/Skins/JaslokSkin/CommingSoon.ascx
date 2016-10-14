<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CommingSoon.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_CommingSoon" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>


<style>

#particles-js{
  width: 100%;
  height: 400px;
  background-color: #00BCD4;
  background-image: url('../images/can_bg.png');
  background-size: contain;
  background-position: 50% 50%;
  background-repeat: repeat;
}
</style>

<div id="contentpaneHeader" runat="server"></div>
<div id="ContentPane" runat="server"></div>



<div class="container-fluid" style="position: relative">
            <div class="content">
                <p>We are working on something very interesting!</p>
                <p>Coming soon by 1<sup>st</sup> Nov '16</p>
            </div>

            <div id="particles-js"></div>


        </div>
<JS:Footer runat="server" ID="Footer" />



<script src="../../../../js/stats.js"></script>
<script src="../../../../js/particles.js"></script>
<script src="../../../../js/app.js"></script>


<script>
    var count_particles, stats, update;
    //stats = new Stats;
    //stats.setMode(0);
    // stats.domElement.style.position = 'absolute';
    // stats.domElement.style.left = '0px';
    // stats.domElement.style.top = '0px';
    document.body.appendChild(stats.domElement);
    count_particles = document.querySelector('.js-count-particles');
    update = function () {
        stats.begin();
        stats.end();
        if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
            count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
        }
        requestAnimationFrame(update);
    };
    requestAnimationFrame(update);
</script>

