<h2 id="image_navigator"> Image Navigator </h2>

<i>Image Navigator</i> tool uses <i>Sliders</i> and <i>Spinboxes</i> to set the scan slice for each sagittal, coronal and axial planes.
Changing the principal planes scan slice changes the changes the location of the crosshairs in the 2D views and vice versa.  

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/gui/images/image-navigator.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<table class="table table-bordered" style="width:100%">
  <caption> <b> Image Navigator Controls </b> </caption>
  <tr>
    <th> Control </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/image-navigator-sbox-1.png" width="63" height="27"> </td>
    <td> Changes the sagittal plane scan slice using image coordinates </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/image-navigator-sbox-2.png" width="63" height="27"> </td>
    <td> Changes the coronal plane scan slice using image coordinates </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/image-navigator-sbox-3.png" width="63" height="27"> </td>
    <td> Changes the axial plane scan slice using image coordinates </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/image-navigator-slider-1.png" width="250" height="27"> </td>
    <td> Changes the axial plane scan slice using image slice number </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/image-navigator-slider-2.png" width="245" height="22"> </td>
    <td> Changes the sagittal plane scan slice using image slice number </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/image-navigator-slider-3.png" width="245" height="22"> </td>
    <td> Changes the coronal plane scan slice using image slice number </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/image-navigator-time.png" width="245" height="22"> </td>
    <td> Changes the time step for time-resolved image data. </td>
  </tr>
</table>

<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
SimVascular does not support time-resolved image data.
</div>

<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
Although the <i>Image Navigator</i> label <b>Loc: (mm)</b> implies image units are in mm, SimVascular does not have
any explicit units. Units are only important when specifying simulation parameters and data.
</div>



