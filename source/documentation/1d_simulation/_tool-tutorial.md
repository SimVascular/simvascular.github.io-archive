
<h2> Tutorial </h2>

This section demonstrates how to use the **1D Simulation Tool** to interactively create the geometry, 
boundary conditions and solver parameters needed to execute a **sv1DSolver** simulation. The geometry of 
the one-dimensional networks used for a 1D simulation is based on the model of the aorta and branching
left and right iliac vessels created in the Demo Project discussed in the SimVascular <a href="docsQuickGuide.html#simulation"> QuickGuide </a> documentation. 

<h3> Open the Demo Project </h3>

Opening the Demo Project displays the image slices and model geometry. Change the display layout to big 3D 
and hide the image to get a better view of the model.

<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/open-demo-project.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/open-demo-project-model.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
  <figcaption> <i> (Left) The model of the aorta and branching left and right iliac vessels created in the Demo Project. (Right) Hiding the image and changing layout to big 3D. </i></figcaption>
</figure>
<br>


<h3> Create an instance of the 1D Simulation Tool </h3>

Create an instance of the **1D Simulation Tool** by right clicking on the **SV Data Manager** **Simulations1d** node
and selecting **Create 1D Simulation job** from the popup menu.

<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/create-instance.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

A box is then displayed that is used to select a model name and to enter the name of the 
1D simulation job to create. The **Select Model** is set to the default model name **demo**, 
the only model defined. Enter **demo** in the **Job Name** text box to create a 1D simulation 
job named **demo**. Click **OK**.

<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/create-instance-job.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

A node named **demo** is created under **SV Data Manager** **Simulations1d**. Left clicking on this node
brings up the **1D Simulation Tool** GUI panel on the right side of the SimVascular window. The model name is 
displayed in the **Model** text box. The model surface representation is changed to wireframe to better show 
centerlines geometry when it is created.

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid green; border-left: 6px solid green">
Note that the <b>Calculate Centerlines</b> button is grayed out and disabled. This is because a source face 
has not yet been selected. The button is enabled after a source face is selected. Some of the widgets in other 
panels are similarly disabled until the data they depend on becomes available.
</div>


<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/create-instance-panel.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>


<h3> Create centerlines geometry </h3>

Select a model inlet face for the start of the centerlines by clicking on the **Select Inlet Face** button. 
This brings up a check box listing all of the caps (inlet/outlet faces) defined for the **demo** model.
Select the <b>cap_aorta</b> entry box under the **Use** column of the check box. 

<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/create-cl-face.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

The inlet face selected is displyed in the **Inlet Face** text box. Click on the **Calculate Centerlines** button to start the 
centerlines computation for the **demo** surface 3D geometric model. 
When the computation finishes the centerlines geometry is displyed using green lines.

<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/create-cl-lines.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>


<h3> Setting inlet and outlet boundary conditions </h3>

Select the **Inlet and Outlet BCs** tab to bring up the **Inlet and Outlet BCs panel**  used to set the boundary condition type 
and parameter values for each inlet and outlet face defined for the model.  

<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/bcs-panel.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

The panel contains a table listing the inlet (cap\_aorta) and two outlet (cap\_right\_iliac and cap\_aorta\_2) faces 
defined for the model.

<br>
<h4><b> Set <i>cap\_aorta</i> inlet flow boundary condition </b></h4>
Double click with the left mouse button on <b>cap\_aorta</b> under the **Name** column. 
This brings up a **Set Inlet/Outlet BCs** popup window. To set an inlet flow boundary condition 
<div style="background-color: #F0F0F0; padding: 10px">
1) From the <b>BC Type</b> list select **Prescribed Velocities** <br>
2) Left click on the **Flow rate (from file)** **...** button to bring up a file browser    <br>
3) Select the inflow.flow file from the project's **flow-files** directory <br>
4) Select **OK**<br>
</div>
<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/bcs-aorta.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>


<br>
<h4><b> Set <i>cap\_right\_iliac</i> RCR boundary condition </b></h4>
Double click with the left mouse button on <b>cap_right_iliac</b> under the **Name** column. 
This brings up a **Set Inlet/Outlet BCs** popup window. To set an RCR boundary condition 
<div style="background-color: #F0F0F0; padding: 10px">
1) From the <b>BC Type</b> list select **RCR** <br>
2) Enter <i>90 0.0008 1200</i> into the <b>$R\_p C R\_d$</b> text box <br>
3) Select **OK**
</div>
<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/bcs-right-iliac.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

<br>
<h4><b> Set <i>cap\_aorta\_2</i> RCR boundary condition </b></h4>
Double click with the left mouse button on <b>cap_aorta_2</b> under the **Name** column.
This brings up a **Set Inlet/Outlet BCs** popup window. To set an RCR boundary condition
<div style="background-color: #F0F0F0; padding: 10px">
1) From the <b>BC Type</b> list select **RCR** <br>
2) Enter <i>100 0.0004 1100</i> into the <b>$R\_p C R\_d$</b> text box <br>
3) Select **OK**
</div>
<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/bcs-left-iliac.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>




<br>
<figure>
  <img src="documentation/1d_simulation/imgs/tool-tutorial-1/bcs-values-set.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>


