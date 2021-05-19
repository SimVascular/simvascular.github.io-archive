
##Inlet and Outlet BCs Panel
The Inlet and Outlet BCs panel is used to set the boundary condition type and parameter values for each inlet and outlet 
face defined for the model. The following types of boundary conditions are supported
<ol>
  <li>Prescribed velocites</li>
  <li>Resistance</li>
  <li>RCR</li>
</ol>

###Panel Layout
The panel GUI contains a single table listing the inlet and outlet faces defined for the model. The panel shown below has 
three inlet and outlet faces defined.

<br>
<figure>
  <img src="documentation/rom_simulation/tool/images/bcs-panel.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

###Usage 
The boundary condition type and associated parameter values are changed by double clicking on a face name in the **Name** column. 
This displays a **Set Inlet/Outlet BCs** popup window. The parameters displayed in the window depend on the boundary condition
type

<br>
<figure>
  <img src="documentation/rom_simulation/tool/images/bcs-pres-vel.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <img src="documentation/rom_simulation/tool/images/bcs-res.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <img src="documentation/rom_simulation/tool/images/bcs-rcr.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
  <figcaption> <i><b>Set Inlet/Outlet BCs</b> popup window for different boundary condition types: Prescribed velocites, Resistance and RCR.</i></figcaption>
</figure>
<br>


####Prescribed velocites 
The **Prescribed velocites** boundary condition defines a flow waveform for an inlet face. The inlet flow rates are provided by a text file
with time and flow value colums. 

#####<u>Usage</u>
Analytic Shape - Defines the shape of the velocity profile: parabolid, plug or wormersley.
<br>
Point Number - Defines ?
<br>
Fourier Modes - Defines ?
<br>
Flow rate (from file) - Selecting the **...** brings a file browser used to selected a flow file. 
<br>
Period - 
<br>
Flip normal - 
<br>
<br>


####Resistance 
The **Resistance** boundary condition defines the downstream resistance for an outlet face. 

#####<u>Usage</u>
Resistance - The resistance parameter that characterizes the downstream vasculature.
<br>
Distal Pressure - Defines ?
<br>
<br>


####RCR 
The **RCR** boundary condition defines the downstream resistance for an outlet face. 

#####<u>Usage</u>
Rp C Rd - The resistance parameter that characterizes the downstream vasculature.
<br>
Distal Pressure - Defines ?

