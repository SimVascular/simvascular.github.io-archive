## Wall Properites Panel
The Wall Properites panel is used to set the material properties for vessel walls. The following material models are supported
<ol>
  <li>Linear</li>
  <li>Olufsen</li>
</ol>

###Panel Layout
The panel GUI contains parameters that vary with the material model selected by the **Material Model** combination box.

<br>
<figure>
  <img src="documentation/rom_simulation/tool/images/wall-props-linear.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <img src="documentation/rom_simulation/tool/images/wall-props-olufsen.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
  <figcaption> <i>The panel displays different material parameters depending on the material model selected.</i></figcaption>
</figure>
<br>


###Usage 
The boundary condition type and associated parameter values are changed by double clicking on a face name in the **Name** column. 
This displays a **Set Inlet/Outlet BCs** popup window. The parameters displayed in the window depend on the boundary condition
type
<br>


####Linear 
The **Linear** material model.

#####<u>Usage</u>
Eh/r - The product of elastic modulus and thickness divided by the radius.
<br>
Pressure - The material reference pressure.
<br>
<br>


####Olufsen
The **Olufsen** material model.

#####<u>Usage</u>
K1, K2, K3 - The empirically-derived constants used to best fit the equation $Eh/r\_0(z) = k\_1 \exp(k\_2 r\_0(z)) \+ k\_3 $.
<br>
Exponent - The material exponent.
<br>
Pressure - The material reference pressure.
<br>


