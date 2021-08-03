<h2 id="tutorial_create_simulation">Create Simulation</h2>

Computaional fluid dynamics (CFD) simulations permit detailed analyses of blood flow and pressure in patient-specific 
models of the human vasculature. CFD solvers used for such simulations must accommodate the sophisticated boundary 
conditions, physiologic models and physics specific to cardiovascular modeling.

The <i>Simulations Tool</i> has functionality to assign boundary conditions, material properties, and set parameters for the 
SimVascular <i>svSolver</i> CFD solver. <i>svSolver</i> can be run through the GUI for testing a simulation setup. However, 
for simulating physiological relvant time scales the simulation files are generated on a desktop and copied to a high performance 
computing (HPC) cluster and run there. 

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
The computational cost of the numerical solution of the governing fluid equations used in CFD is quite large. 
Running CFD simulations on a laptop is practical for only a few 100s of time steps. 
</div>

<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
The <i>svSolver</i> CFD solver does not use any predefined units. All values used for pyhical parameters (e.g. fluid densiity)
and boundary condions must be consistant with the spatial dimensions of the finite element mesh.
</div>

<br>
The following sections demonstrate how to setup a CFD simulation for <i>svSolver</i> using the <b>aorta-iliacs</b> finite 
element mesh. 

<h3 id="tutorial_create_simulation_1"> Create an instance of a <i>Simulations Tool</i> for the <b>aorta-iliacs</b> model.  </h3>

Create an instance of a <i>Simulations Tool</i> named <b>aorta-iliacs</b> used to create a model for the main aorta and iliac vessels. 

<table class="table table-bordered" style="width:100%">
  <caption> Create a <i>Simulations Tool</i> instance named <b>aorta-iliacs</b> </caption>
  <tr>
    <th> GUI </th>
    <th> Descriptiton </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-1.png" width="512" height="360"> </td>
    <td> Select the <i>Simulations</i> <i>Tool</i> in the <i>Data Manager</i> with the right mouse button. 
         <br><br>
         Select the <b>Create Simulation job</b> menu option.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-2.png" width="512" height="360"> <br><br>
    </td>
    <td> A <b>Create Simulation Job</b> <i>DiaglogBox</i> appears. 
         <br><br>
         The <b>Select Model:</b> <i>ComboBox</i> is used to select a model. Leave it on <b>aorta-iliacs</b>.
         <br><br>
         Enter <b>aorta-iliacs</b> in the <b>Job Name:</b> <i>TextBox</i>.
         <br><br>
         Press the <b>Create Simulation Job</b> <i>DiaglogBox</i> <b>OK</b> <i>Button</i>. 
    </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/tutorial/images/create-simulation-3.png" width="512" height="360"> </td>
    <td> A <i>Data Node</i> named <b>aorta-iliacs</b> (an instance of a <i>Simulations Tool</i>) is created under the
         <i>Data Manager</i> <i>Simulations Tool</i> type.
         <br><br>
         Close the <i>SV Modeling Panel</i> by selected the <b>X</b> in its <i>Tab</i>. 
         <br><br>
         Double-click on the <i>Data Manager</i> <b>Simulations / aorta-iliacs</b> <i>Data Node</i> with the left mouse
         button to bring up the <i>SV Simulation Panel</i>. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-4.png" width="512" height="360"> </td>
    <td> <i>SV Simulation Panel</i> is a <i>ToolBox</i> containing multiple pages of GUI widgets identified by a section of 
         rectangles with text at the <i>Toolbox</i> bottom. Selecting a rectangle shows another page of GUI widgets.
         <br><br>
         The <i>ToolBox</i> <b>Basic Parameters</b> page is used to set fluid phyisical parameters and initial conditions (ICs). Use the
         default parameters values. 
         <br><br>
         Select the <i>ToolBox</i> <b>Inlet and Outlet BCs</b> page. 
    </td>
  </tr>
</table>

<br>
<h3 id="tutorial_create_simulation_2"> Set inlet and outlet boundary conditions.  </h3>
This section demonstrates how to set the simulation inlet and outlet boundary conditions. The inlet boundary condition is a steady
velocity profile given in the <b>steady.flow</b> file 

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
0.0 -100<br>
1.0 -100
</div>

which is interpreted as: 100 cc/s over the time interval [0.0, 1.0] seconds

The left and right iliac outlets are set to a resistance boundary condition with a value of 16000.

<table class="table table-bordered" style="width:100%">
  <caption> Create inlet and outlet boundary conditions </caption>
  <tr>
    <th> GUI </th>
    <th> Descriptiton </th>
  </tr>

 <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-5.png" width="512" height="360"> </td>
    <td> The <i>ToolBox</i> <b>Inlet and Outlet BCs</b> page is used to set boundary conditions for the mesh inlet and outlet faces.
         <br><br>
         The <b>Name / BC Type / Values</b> <i>Table</i> contains the name of all <i>Model</i> <i>Faces</i> that have a <b>cap</b> 
         </i>Face Type</i> (set in the <i>Models Tool</i>).
         <br><br>
         To set the inlet velocy boundary condition double click with the left mouse button on <b>cap_aorta</b> in the <b>Name</b> column. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-6.png" width="512" height="360"> </td>
    <td> A <b>Set Inlet/Outlet BCs</b> <i>DialogBox</i> appears.
         <br><br>
         Select the <b>Flow rate (from File) </b> <img src="documentation/quickguide/tutorial/images/simulation-gui-flow-file.png" width="22" height="20"> icon to bring up a <i>FileBrowser</i>.
         <br><br>
         Select the <b>steady.flow</b> file from the <b>Tutorial/flow-files</b> directory. 
         <br><br>
         Press the <b><b>Set Inlet/Outlet BCs</b> <i>DiaglogBox</i> <b>OK</b> <i>Button</i>. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-7.png" width="512" height="360"> </td>
    <td> The <b>cap_aorta</b> boundary condition <b>BC Type</b> is now set to <b>Proscribed Velocities</b>. 
         <br><br>
         To set the outlet boundary condition for the left iliac double click with the left mouse button on <b>cap_left-iliac</b> in 
         the <b>Name</b> column. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-8.png" width="512" height="360"> </td>
    <td> A <b>Set Inlet/Outlet BCs</b> <i>DialogBox</i> appears.
        <br><br>
        From the <b>BC Tyep:</b> <i>ComboBox</i> select <b>Resistance</b>.
        <br><br>
        Enter <b>16000</b> into the <b>Resistance:</b> <i>TextBox</i>
        <br><br>
        Press the <b>Set Inlet/Outlet BCs</b> <i>DiaglogBox</i> <b>OK</b> <i>Button</i>. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-9.png" width="512" height="360"> </td>
    <td> The <b>cap_left-iliac</b> boundary condition <b>BC Type</b> is now set to <b>Resistance</b>.
         <br><br>
         To set the outlet boundary condition for the right iliac double click with the left mouse button on <b>cap_aorta_2</b> in
         the <b>Name</b> column.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-10.png" width="512" height="360"> </td>
    <td> A <b>Set Inlet/Outlet BCs</b> <i>DialogBox</i> appears.
        <br><br>
        From the <b>BC Tyep:</b> <i>ComboBox</i> select <b>Resistance</b>.
        <br><br>
        Enter <b>16000</b> into the <b>Resistance:</b> <i>TextBox</i>
        <br><br>
        Press the <b>Set Inlet/Outlet BCs</b> <i>DiaglogBox</i> <b>OK</b> <i>Button</i>.   
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-11.png" width="512" height="360"> </td>
    <td> The <b>cap_aorta_2</b> boundary condition <b>BC Type</b> is now set to <b>Resistance</b>.
         <br><br>
         Press the <img src="documentation/quickguide/gui/images/gui-save-icon.png" width="40" height="35">
         icon in the  <i>ToolBar</i> to save the <i>Project</i>.
    </td>
  </tr>
</table>

<br>
<h3 id="tutorial_create_simulation_3"> Set solver parameters.  </h3>
This section demonstrates how to set the simulation solver parameters. 

<table class="table table-bordered" style="width:100%">
  <caption> Set solver parameters </caption>
  <tr>
    <th> GUI </th>
    <th> Descriptiton </th>
  </tr>

 <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-5.png" width="512" height="360"> </td>
    <td> The <i>ToolBox</i> <b>Solver Parametes</b> page is used to set the parameters controling <i>svSolver</i>
         solution and output. 
         <br><br>
    </td>
  </tr>

</table>


<br>
<br>
<br>
<br>
<br>
<br>
