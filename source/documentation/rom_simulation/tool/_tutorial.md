
<h2> Tutorial </h2>

This section demonstrates how to use the **1D Simulation Tool** to interactively create the geometry, 
boundary conditions and solver parameters needed to execute a **sv1DSolver** simulation. The geometry of 
the one-dimensional networks used for a 1D simulation is based on the model of the aorta and branching
left and right iliac vessels created in the Demo Project discussed in the SimVascular <a href="docsQuickGuide.html#simulation"> QuickGuide </a> documentation. 

A flow rate inlet boundary condition is used for the aorta inlet. RCR boundary conditions are used for left and 
left and right iliac vessels. 

An Olufsen material model is used for the vessel wall properties.


<br>
<h3> Open the Demo Project </h3>

Opening the Demo Project displays the image slices and model geometry. Change the display layout to big 3D 
and hide the image to get a better view of the model.

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/open-demo-project.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <img src="documentation/1d_simulation/tool/images/tutorial-1/open-demo-project-model.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
  <figcaption> <i> (Left) The model of the aorta and branching left and right iliac vessels created in the Demo Project. (Right) Hiding the image and changing layout to big 3D. </i></figcaption>
</figure>
<br>


<h3> Create an instance of the 1D Simulation Tool </h3>

Create an instance of the **1D Simulation Tool** by right clicking on the **SV Data Manager** **Simulations1d** node
and selecting **Create 1D Simulation job** from the popup menu.

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/create-instance.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

A box is then displayed that is used to select a model name and to enter the name of the 
1D simulation job to create. The **Select Model** is set to the default model name **demo**, 
the only model defined. Enter **demo** in the **Job Name** text box to create a 1D simulation 
job named **demo**. Click **OK**.

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/create-instance-job.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
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
  <img src="documentation/1d_simulation/tool/images/tutorial-1/create-instance-panel.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

<!-- ------------------------------------ -->
<!--     Create centerlines geometry      -->
<!-- ------------------------------------ -->

<h3> Create centerlines geometry </h3>

Select a model inlet face for the start of the centerlines by clicking on the **Select Inlet Face** button. 
This brings up a check box listing all of the caps (inlet/outlet faces) defined for the **demo** model.
Select the <b>cap_aorta</b> entry box under the **Use** column of the check box. 

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/create-cl-face.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

The inlet face selected is displyed in the **Inlet Face** text box. Click on the **Calculate Centerlines** button to start the 
centerlines computation for the **demo** surface 3D geometric model. 
When the computation finishes the centerlines geometry is displyed using green lines.

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/create-cl-lines.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

<!-- -------------------------------------------- -->
<!-- Setting inlet and outlet boundary conditions -->
<!-- -------------------------------------------- -->

<h3> Set inlet and outlet boundary conditions </h3>

Select the **Inlet and Outlet BCs** sub-panel name to bring up the **Inlet and Outlet BCs** panel used to set the boundary condition type 
and parameter values for each inlet and outlet face defined for the model.  

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/bcs-panel.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
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
  <img src="documentation/1d_simulation/tool/images/tutorial-1/bcs-aorta.png" style="float: left; width: 20%; margin-right: 1%; margin-bottom: 0.5em;">
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
  <img src="documentation/1d_simulation/tool/images/tutorial-1/bcs-right-iliac.png" style="float: left; width: 20%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

<br>
<h4><b> Set <i>cap\_aorta\_2</i> RCR boundary condition </b></h4>
Double click with the left mouse button on <b>cap\_aorta\_2</b> under the **Name** column.
This brings up a **Set Inlet/Outlet BCs** popup window. To set the values for the RCR boundary condition
<div style="background-color: #F0F0F0; padding: 10px">
1) From the <b>BC Type</b> list select **RCR** <br>
2) Enter <i>100 0.0004 1100</i> into the <b>$R\_p C R\_d$</b> text box <br>
3) Select **OK**
</div>
<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/bcs-left-iliac.png" style="float: left; width: 20%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

The boundary condition and parameter values for each inlet and outlet faces are now defined and are shown in the
**Inlet and Outlet BCs** panel table. Boundary conditions may also be directly entered into the table by double clicking 
with the left mouse button on the **BC Type** and **Values** columns.

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/bcs-values-set.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>


<!-- -------------------------------------------- -->
<!--           Setting wall properties            -->
<!-- -------------------------------------------- -->

<h3> Set wall properties </h3>

Select the **Wall Properties** sub-panel name to bring up the **Wall Properties** panel used to set the material 
properties for vessel walls.

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/wall-props-panel.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

To set the material model to Olufsen 
<div style="background-color: #F0F0F0; padding: 10px">
1) From the <b>Material Model </b> list select **OLUFSEN** <br>
2) Enter <i> 2.0e7 </i> into the <b>$K\_1 $</b> text box <br>
3) Enter <i> 8.65e5  </i> into the <b>$K\_3 $</b> text box <br>
4) Enter <i> 113324.0 </i> into the <b>Pressure</b> text box <br>
</div>
<br>

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/wall-props-params.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

<!-- -------------------------------------------- -->
<!--           Solver parameters                  -->
<!-- -------------------------------------------- -->

<h3> Set solver parameters </h3>

Select the **Solver Parameters** sub-panel name to bring up the **Solver Parameters** panel used to set the
parameters needed to execute the 1D Solver.

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/solver-params-panel.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

To set the solver parameters 
<div style="background-color: #F0F0F0; padding: 10px">
1) Double click with the left mouse button on the **Number of Timesteps** **Values** column and enter <i>10000</i>. <br>
2) Double click with the left mouse button on the **Time Steps Size** **Values** column and enter <i>0.001</i>. <br>
3) Double click with the left mouse button on the **Number of Timesteps between Saving Data** **Values** column and enter <i>1</i>. <br>
</div>
<br>

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/solver-params-values.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

<!-- -------------------------------------------- -->
<!--        Create files and Run simulation       -->
<!-- -------------------------------------------- -->

<h3> Create the 1D Solver input file and run a simulation </h3>

Select the **Create Files and Run Simulation** sub-panel name to bring up the **Create Files and Run Simulation** panel used to 
used to create a 1D solver input file and run the 1D solver.

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/create-files-panel.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

To generate the 1D Solver input file click on the **Create Files for Simulation** button. A popup window is displayed
showing the number of segments, nodes and finite elements created for the 1D simulation. 

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/create-files-popup.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

Click **OK**.

To run a 1D Solver simulation on the **Run Simulation** button. A popup window is displayed when the simulation finishes. 

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/create-files-run-sim.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

Selecting the **Show Details** button dispays the 1D Solver log file

<div style="background-color: #F0F0F0">
<pre>
<p style="font-size:10px" >
---------------------------------
 oneDSolver 
 1D Finite Element Hemodynamics  
---------------------------------

Reading file: /SVProject/Simulations1d/demo/solver.in ... 

Printing Model Echo ... 

Creating and Running Model ...
Creating Nodes ... 
Creating Joints ... 
Creating Materials ... 
call cvOneMaterialsOlufsen p1_=113324.014500 K3_=0.000000 
Setting material K's 0 -22.5267 1e+07 ...
Setting reference Pressure 0
call SetMaterialType K3_ 10000000.000000 
new cvOneMaterialOlufsen called check pRef 0.000000 
Creating Data Tables ... 
Creating Segments ... 
Solving Model ... 
Inlet Condition Type: FLOW

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Number of Joints: 1
Number of Segments: 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

call cvOneMaterialsOlufsen p1_=113324.014500 K3_=33.690970 
In GetNewInstance cvOneDMaterialOlufsen is called  matID=0 
call cvOneDMaterialOlufsen that this K3_=10000000.000000 p1_=0.000000 
In GetNewInstance cvOneDMaterialOlufsen* materials is called 
subdomain cpp setupMaterial matID=0  
call cvOneMaterialsOlufsen p1_=113324.014500 K3_=0.000000 
In GetNewInstance cvOneDMaterialOlufsen is called  matID=0 
call cvOneDMaterialOlufsen that this K3_=10000000.000000 p1_=0.000000 
In GetNewInstance cvOneDMaterialOlufsen* materials is called 
subdomain cpp setupMaterial matID=0  
RCR boundary condition
call cvOneMaterialsOlufsen p1_=113324.014500 K3_=0.000000 
In GetNewInstance cvOneDMaterialOlufsen is called  matID=0 
call cvOneDMaterialOlufsen that this K3_=10000000.000000 p1_=0.000000 
In GetNewInstance cvOneDMaterialOlufsen* materials is called 
subdomain cpp setupMaterial matID=0  
RCR boundary condition
Subdomain No. 3
Joint No. 1
Outlet No. 2
Number of equations 1303
Using Conservative Form ...
maxStep/stepSize: 10000
Total Solution is: 10000 x 1303
**** Time cycle 1
    iter: 0 normf: 134.606 norms: 0.00421471 time: 0.001614
    iter: 1 normf: 43.8713 norms: 0.0246538 time: 0.001102
    iter: 2 normf: 1.14964 norms: 1.17156e-05 time: 0.001108
    iter: 3 normf: 0.0299168 norms: 5.84007e-08 time: 0.001096
    iter: 4 normf: 0.000699028 norms: 1.16806e-09 time: 0.001097
    iter: 5 normf: 2.68722e-05 norms: 3.94369e-11 time: 0.001097
  Time = 0.001, Mass = 0.0169997, Tot iters = 6
    iter: 0 normf: 81.4714 norms: 0.0257353 time: 0.001099
    iter: 1 normf: 7.04379 norms: 4.91323e-05 time: 0.001204
    iter: 2 normf: 0.288877 norms: 3.82307e-07 time: 0.001262
    iter: 3 normf: 0.0109262 norms: 2.31787e-08 time: 0.001136
...
Time = 9.998, Mass = 0.0889071, Tot iters = 4
    iter: 0 normf: 0.732147 norms: 0.000141274 time: 0.001097
    iter: 1 normf: 0.394251 norms: 0.000232438 time: 0.001099
    iter: 2 normf: 0.0100552 norms: 5.84729e-09 time: 0.001096
    iter: 3 normf: 0.000314998 norms: 4.17093e-11 time: 0.001097
  Time = 9.999, Mass = 0.0899291, Tot iters = 4
    iter: 0 normf: 0.734032 norms: 0.000143682 time: 0.001099
    iter: 1 normf: 0.384852 norms: 0.000227006 time: 0.001096
    iter: 2 normf: 0.00978278 norms: 5.759e-09 time: 0.001096
    iter: 3 normf: 0.000306487 norms: 4.06793e-11 time: 0.001098
  Time = 10, Mass = 0.0908278, Tot iters = 4
demoGroup0_Seg0_flow.dat
demoGroup0_Seg0_area.dat
demoGroup0_Seg0_pressure.dat
demoGroup0_Seg0_Re.dat
demoGroup0_Seg0_wss.dat
demoGroup2_Seg1_flow.dat
demoGroup2_Seg1_area.dat
demoGroup2_Seg1_pressure.dat
demoGroup2_Seg1_Re.dat
demoGroup2_Seg1_wss.dat
demoGroup3_Seg2_flow.dat
demoGroup3_Seg2_area.dat
demoGroup3_Seg2_pressure.dat
demoGroup3_Seg2_Re.dat
demoGroup3_Seg2_wss.dat
Completed!

</p>
</pre>
</div>


 
<!-- -------------------------------------------- -->
<!--              Convert results                 -->
<!-- -------------------------------------------- -->

<h3> Convert and simulation results </h3>

Select the **Convert Results** sub-panel name to bring up the **Convert Results** panel used to
used to convert 1D solver simulation results to CSV format files.

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/convert-results-panel.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

Set the **Results Directory** by selecting **...** to bring up a file browser. Navigate to the **/PROJECT/Simulations1d/demo/** 
directory and press **Open**. Set the time range **Start** value 0.0 and the **Stop** value to 0.8. 
From the **Data** scrolling text box select **flow** and **pressure** data. Select the **Convert** button to convert the results.

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/convert-results.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

The CSV files for flow and pressure results are stored in the **/PROJECT/Simulations1d/demo/demo-converted-results** directory. 
The CSV files can be graphed using several applications (gnuplot, MATLAB, ParaView, etc.). Here we have plotted flow results 
using ParaView. 

<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/tutorial-1/paraview.png" style="float: left; width: 80%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>





