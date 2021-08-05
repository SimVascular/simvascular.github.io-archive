<h2 id="tutorial_create_simulation">Create CFD Simulation</h2>

Computational fluid dynamics (CFD) simulations permit detailed analyses of blood flow and pressure in patient-specific 
models of the human vasculature. CFD solvers used for such simulations must accommodate the sophisticated boundary 
conditions, physiologic models and physics specific to cardiovascular modeling.

The <i>Simulations Tool</i> has functionality to assign boundary conditions, material properties, and set parameters for the 
SimVascular <i>svSolver</i> CFD solver. <i>svSolver</i> can be run through the GUI for testing a simulation setup. However, 
for simulating physiological relevant time scales the simulation files are generated on a desktop, copied to a high performance 
computing (HPC) cluster, and run in parallel there. 

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
The computational cost of the numerical solution of the governing fluid equations used in CFD is quite large. 
Running CFD simulations on a typical laptop/desktop (4-8 cores) is practical for only a few hundreds of time steps. 
For a large mesh of a million or more elements it could still take a significant amount of time for a simulation to 
complete.
</div>

<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
The <i>svSolver</i> CFD solver does not use any predefined units. All values used for physical parameters (e.g. fluid density)
and boundary conditions must be consistent with the spatial dimensions of the finite element mesh.
</div>

<br>
The following sections demonstrate how to setup a CFD simulation for <i>svSolver</i> using the <b>aorta-iliacs</b> solid model
and finite element mesh. A detailed discussion about CFD simulations can be found in the SimVascular
<a href="http://simvascular.github.io/docsFlowSolver.html">Simulation Guide</a> documentation.

<h3 id="tutorial_create_simulation_1"> Create an instance of a <i>Simulations Tool</i> for the <b>aorta-iliacs</b> model.  </h3>

Create an instance of a <i>Simulations Tool</i> named <b>aorta-iliacs</b> used to create a CFD simulation of blood flow 
in the main aorta and iliac vessels. 

<table class="table table-bordered" style="width:100%">
  <caption> Create a <i>Simulations Tool</i> instance named <b>aorta-iliacs</b> </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
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
         <br><br>
         <div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
         A solid model is first selected for the simulation because it identifies the <i>Faces</i> used to define boundary
         conditions. A mesh generated from the model is later selected. Note that several different meshes can be generated
         from the same solid model using different meshing parameters (e.g. edge size).
         </div>
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
         The <i>ToolBox</i> <b>Basic Parameters</b> page is used to set fluid physical parameters and initial conditions (ICs). Use the
         default parameters values. 
         <br><br>
         Select the <i>ToolBox</i> <b>Inlet and Outlet BCs</b> page. 
    </td>
  </tr>
</table>

<br>
<h3 id="tutorial_create_simulation_2"> Set inlet and outlet boundary conditions.  </h3>
This section demonstrates how to set the simulation inlet and outlet boundary conditions. The centimeter–gram–second (CGS) system of 
units is used. 

The inlet boundary condition is a steady velocity profile with values given in the <b>steady.flow</b> file. 

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
0.0 -100<br>
1.0 -100
</div>

which is interpreted as a constant inlet volumetric flow rate of 100 cc/s over the time interval [0.0, 1.0] seconds.

The left and right iliac outlets are set to a resistance boundary condition with a value of 16000 dynes·s/cm<sup>5</sup>.

<table class="table table-bordered" style="width:100%">
  <caption> Create inlet and outlet boundary conditions </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

 <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-5.png" width="512" height="360"> </td>
    <td> The <i>ToolBox</i> <b>Inlet and Outlet BCs</b> page is used to set boundary conditions for the mesh inlet and outlet faces.
         <br><br>
         The <b>Name / BC Type / Values</b> <i>Table</i> contains the name of all <i>Model</i> <i>Faces</i> that have a <b>cap</b> 
         </i>Face Type</i> (set in the <i>Models Tool</i>).
         <br><br>
         To set the inlet velocity boundary condition double click with the left mouse button on <b>cap_aorta</b> in the <b>Name</b> column. 
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
        From the <b>BC Type:</b> <i>ComboBox</i> select <b>Resistance</b>.
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
        From the <b>BC Type:</b> <i>ComboBox</i> select <b>Resistance</b>.
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
         <br><br>
         Select the <i>ToolBox</i> <b>Solver Parameters</b> page.
    </td>
  </tr>
</table>

<br>
<h3 id="tutorial_create_simulation_3"> Set solver parameters.  </h3>
This section demonstrates how to set the simulation solver parameters. 

The number of simulation time steps and time step size determines the simulation physical time. A simulation for 500 time steps 
using a time step size of 0.001 simulates a physical time = (500 time steps) x (0.001 time step size) = 0.5 seconds.

The value of the time step size is an important factor contributing to the stability, convergence, and reliability of a simulation.
The value of the time step size depends on the size of the finite element mesh and type and values used for boundary conditions.

A detailed discussion about solver parameters can be found in the SimVascular
<a href="http://simvascular.github.io/docsFlowSolver.html#solverparameters">Simulation Guide / Solver Parameters</a> documentation.


<table class="table table-bordered" style="width:100%">
  <caption> Set solver parameters </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

 <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-12.png" width="512" height="360"> </td>
    <td> The <i>ToolBox</i> <b>Solver Parameters</b> page is used to set the parameters controlling <i>svSolver</i>
         solution and output. Parameter values are entered by clicking with the left mouse button on the appropriate
         <i>TextBox</i>. 
         <br><br>
         The set the parameters as follows <br><br>
         <ul style="list-style-type:none;">
           <li> <b>Number of Timesteps</b> - The number of time steps to run the simulation. 
                Enter <b>500</b> </li> <br>
           <li> <b>Time Step Size</b> - The incremental change in time for which the governing equations are being solved. 
                Enter <b>0.001</b> </li> <br>
           <li> <b>Number of Timesteps between Restarts</b> - The frequency with which to save simulation results. For example,
                save results every 100 time steps.
                Enter <b>100</b> </li> <br>
         </ul>
         <br>
         Select the <i>ToolBox</i> <b>Create Files and Run Simulation</b> page.
    </td>
  </tr>
</table>

<br>
<h3 id="tutorial_create_simulation_4"> Run the simulation.  </h3>
This section demonstrates how run the simulation.

The <i>svSolver</i> program can be run as a single process using one processor (core) or in parallel using two or more processors.
<i>svSolver</i> uses the <i>Open MPI</i> implementation of the Message Passing Interface (MPI) to run in parallel. The <i>Open MPI</i>
libraries must be installed in order to run <i>svSolver</i> in parallel. In this demonstration the <i>svSolver</i> program is run 
on a single processor.

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
The SimVascular <i>svSolver</i> program is included in the Windows SimVascular application installer. For MacOS and Ubuntu 
platforms it must be installed using a separate <i>svSolver</i> installer downloaded from 
<a href="https://simtk.org/frs/?group_id=188"> SimTK </a>
</div>

<br>
<table class="table table-bordered" style="width:100%">
  <caption> Run the simulation</caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-13.png" width="512" height="360"> </td>
    <td> The <i>ToolBox</i> <b>Create Files and Run Simulation</b> page is used to run <i>svSolver</i>.
         <br><br>
         Select the <b>aorta-iliacs</b> from the <b>Choose Mesh:</b> <i>ComboBox</i>. 
         <br><br>
         Select the <b>Create Data Files for Simulation</b> <i>Button</i>. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-14.png" width="512" height="360"> </td>
    <td> An <i>InformationPopup</i> appears showing that the simulation files have been created.
         <br><br>
         Press the <i>InformationPopup</i> <b>OK</b> <i>Button</i>. 
         <br><br>
         Press the <b>Run Simulation</b> <i>Button</i>. 
         <br><br>
         The <i>svSolver</i> program is run on a single processor and should take several minutes to complete.
         <br><br>
         <div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
         The <i>svSolver</i> program can be run in parallel by selecting the <b>Use MPI</b> <i>CheckBox</i> and setting the 
         <b>Number of Processors</b> <i>Slider</i> to 2 or larger.
         </div> 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-15.png" width="512" height="360"> </td>
    <td> An <i>InformationPopup</i> appears showing that the simulation has successfully finished.
         <br><br>
         Press the <i>InformationPopup</i> <b>Show Details</b> <i>Button</i>.                             
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-16.png" width="512" height="360"> </td>
    <td> A <i>ScrollingTextBox</i> appears showing the simulation history: time step, CPU time in seconds, 
         measure of the nonlinear residual, etc.
         <br><br>
         Press the <i>InformationPopup</i> <b>Show Details</b> <i>Button</i>.                             
         <br><br>
         Press the <i>InformationPopup</i> <b>OK</b> <i>Button</i>.                             
         <br><br>
         Select the <i>ToolBox</i> <b>Convert Results</b> page.
    </td>
  </tr>
</table>

<br>
<h3 id="tutorial_create_simulation_5"> Convert simulation results.  </h3>
This section demonstrates how to convert the simulation results into VTK format files for visualization. 

<table class="table table-bordered" style="width:100%">
  <caption> Convert simulation results </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-17.png" width="512" height="360"> </td>
    <td> The <i>ToolBox</i> <b>Convert Results</b> page is used to convert <i>svSolver</i> results files into VTK format files.
         <br><br>
         GUI controls:
         <br><br>
         <ul style="list-style-type:none;">
           <li> <img src="documentation/quickguide/tutorial/images/simulation-gui-results-dir.png" width="245" height="32"> - Displays
                the simulation results directory. Use the 
                <img src="documentation/quickguide/tutorial/images/simulation-gui-flow-file.png" width="22" height="20"> icon to bring up
                a <i>FileBrowser</i> to change the directory.</li><br>
            <li> <img src="documentation/quickguide/tutorial/images/simulation-gui-start-stop.png" width="245" height="20"> - <i>TextBoxes</i> 
            to enter the start, stop and increment time step range used to convert simulation results files. Enter <b>0</b>, <b>500</b> 
            and <b>100</b>.</li>
         </ul>
         <br>
         Select the <b>Convert ...</b> <i>Button</i>.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-18.png" width="512" height="360"> </td>
    <td> A <i>FileBrowser</i> appears. 
         <br><br>
         Navigate to the <b>Tutorial/Simulations/aorta-iliacs</b> directory.
         <br><br>
         Select the <i>FileBrowser</i> <b>Open</b> <i>Button</i>. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-simulation-19.png" width="512" height="360"> </td>
    <td> An <i>InformationPopup</i> appears showing that the simulation results files have been converted.
         <br><br>
         Select the <i>InformationPopup</i> <b>OK</b> <i>Button</i>. 
         <br><br>
         Converted simulation results have been written to <b>Tutorial/Simulations/aorta-iliacs/aorta-iliacs-converted-results</b>.
         <pre>
         all_results-averages-from_cm-to-mmHg-L_per_min.txt	all_results_00200.vtu
         all_results-averages.txt				all_results_00300.vtp
         all_results-flows.txt					all_results_00300.vtu
         all_results-pressures.txt				all_results_00400.vtp
         all_results_00000.vtp					all_results_00400.vtu
         all_results_00000.vtu					all_results_00500.vtp
         all_results_00100.vtp					all_results_00500.vtu
         all_results_00100.vtu					average_result.vtp
         all_results_00200.vtp
         </pre>
         The <b>.vtp</b> files are VTK format files contain results for the mesh surface.  
         The <b>.vtu</b> files are VTK format files contain results for the mesh volume.  
         The <b>.text</b> files are text files containing velocity and pressure results averaged over inlet and outlet <i>Faces</i>.
         <br><br>
         The VTK format files can be visualized using <a href="https://www.paraview.org/">ParaView</a>.
    </td>
  </tr>
</table>
