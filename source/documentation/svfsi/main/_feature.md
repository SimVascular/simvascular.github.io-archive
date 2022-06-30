##Main features

**svFSI** provides many functionalities not only for cardiac modeling but for general-purpose computational studies as well. It can model heat transfer, diffusion, linear elasticity, nonlinear elastodynamics, Newtonian/Non-Newtonian flow, fluid-structure interaction, electrophysiology and so on. For an exhaustive list of functionalities provided by **svFSI** along with the examples, please refer to our [example repository](https://github.com/SimVascular/svFSI-Tests). Here we provide documentation for the main features of **svFSI**.


<style type="text/css">
.tg  {border-collapse:collapse;border-color:#9ABAD9;border-spacing:0;margin:0px auto;}
.tg td{background-color:#EBF5FF;border-bottom-width:1px;border-color:#9ABAD9;border-style:solid;border-top-width:1px;
  border-width:0px;color:#444;font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;
  word-break:normal;}
.tg th{background-color:#409cff;border-bottom-width:1px;border-color:#9ABAD9;border-style:solid;border-top-width:1px;
  border-width:0px;color:#fff;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;
  padding:10px 5px;word-break:normal;}
.tg .tg-1wig{font-weight:bold;text-align:left;vertical-align:top}
.tg .tg-hmp3{background-color:#D2E4FC;text-align:left;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
</style>
<table class="tg" style="undefined;table-layout: fixed; width: 758px">
<colgroup>
<col style="width: 154px">
<col style="width: 204px">
<col style="width: 400px">
</colgroup>
<tbody>
  <tr>
    <td class="tg-1wig">Physics Solved</td>
    <td class="tg-1wig">Documentation/Tutorial</td>
    <td class="tg-1wig">Examples</td>
  </tr>
  <tr>
    <td class="tg-hmp3">Fluid</td>
    <td class="tg-hmp3"><a href="http://simvascular.github.io/docssvFSI-Fluid.html" target="_blank" rel="noopener noreferrer">Webpage</a></td>
    <td class="tg-hmp3"><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/04-fluid/01-pipe3D_RCR" target="_blank" rel="noopener noreferrer">pipe flow with RCR BC</a>; <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/04-fluid/02-dye_AD" target="_blank" rel="noopener noreferrer">dye transportation</a>; <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/04-fluid/04-3D0D-coupling-BC" target="_blank" rel="noopener noreferrer">GenBC/cplBC</a>; <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/04-fluid/05-nonNewtonian" target="_blank" rel="noopener noreferrer">Non-Newtonian flow</a> </td>
  </tr>
  <tr>
    <td class="tg-0lax">Structure</td>
    <td class="tg-0lax"><a href="http://simvascular.github.io/docssvFSI-Structure.html" target="_blank" rel="noopener noreferrer">Webpage</a><span style="font-weight:400;font-style:normal;text-decoration:none">; </span><a href="https://www.youtube.com/watch?v=Jm3VSi6Aci8&list=PL1CBZ8Wh-xvRnux0eMmbZPbx-C078Qzqu&index=2" target="_blank" rel="noopener noreferrer">YouTube</a></td>
    <td class="tg-0lax">struct: <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/05-struct/01-block-compression" target="_blank" rel="noopener noreferrer">block compression</a>; <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/05-struct/02-LV-Guccione-passive" target="_blank" rel="noopener noreferrer">passive inflation of LV model</a><br>ustruct: <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/06-ustruct/01-block-compression" target="_blank" rel="noopener noreferrer">block compression</a>; <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/06-ustruct/02-tensile-adventitia_HGO" target="_blank" rel="noopener noreferrer">tension of arterial strip</a>; <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/06-ustruct/03-LV-Guccione-active" target="_blank" rel="noopener noreferrer">active inflation of LV model</a></td>
  </tr>
  <tr>
    <td class="tg-hmp3">Electrophysiology</td>
    <td class="tg-hmp3"><a href="http://simvascular.github.io/docssvFSI-CEP.html" target="_blank" rel="noopener noreferrer">Webpage</a><span style="font-weight:400;font-style:normal;text-decoration:none">; </span><a href="https://www.youtube.com/watch?v=TCK3SmGwBa8&list=PL1CBZ8Wh-xvRnux0eMmbZPbx-C078Qzqu&index=1" target="_blank" rel="noopener noreferrer">YouTube</a></td>
    <td class="tg-hmp3"><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/08-cep/01-2Dsqr_AP" target="_blank" rel="noopener noreferrer">Aliev-Panfilov model</a><span style="font-style:normal;text-decoration:none">; </span><br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/08-cep/03-benchmark_tTP" target="_blank" rel="noopener noreferrer">ten-Tusscher-Panfilov model</a>; <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/08-cep/04-2Dspiral_BO" target="_blank" rel="noopener noreferrer">Bueno-Orovio-Cherry-Fenton model</a>; <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/08-cep/05-Purkinje" target="_blank" rel="noopener noreferrer">Purkinje network</a></td>
  </tr>
  <tr>
    <td class="tg-0lax">FSI</td>
    <td class="tg-0lax"><a href="http://simvascular.github.io/docssvFSI-FSI.html" target="_blank" rel="noopener noreferrer">Webpage</a><span style="font-weight:400;font-style:normal;text-decoration:none">; </span><a href="https://www.youtube.com/watch?v=QIpyThIAD7k&list=PL1CBZ8Wh-xvRnux0eMmbZPbx-C078Qzqu&index=3" target="_blank" rel="noopener noreferrer">YouTube</a></td>
    <td class="tg-0lax">ALE:<br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/07-fsi/ale/01-channel-leaflets_2D" target="_blank" rel="noopener noreferrer">2D heart valve</a>; <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/07-fsi/ale/02-channel-block-flag_2D" target="_blank" rel="noopener noreferrer">2D flag behind a block</a>; <br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/07-fsi/ale/03-pipe_3D" target="_blank" rel="noopener noreferrer">pressure pulse inside aorta</a><br>CMM:<br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/07-fsi/cmm/01-pipe_RCR" target="_blank" rel="noopener noreferrer">pipe flow with RCR BC</a>;<br><a href="https://github.com/SimVascular/svFSI-Tests/tree/master/07-fsi/cmm/02-vein-graft" target="_blank" rel="noopener noreferrer">vein graft</a></td>
  </tr>
</tbody>
</table>