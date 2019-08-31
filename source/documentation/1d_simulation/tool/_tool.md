# 1D Simulation Tool #

The SimVascular **1D Simulation Tool** is used to interactively create an input file defining the geometry, boundary conditions,
material properties and solver parameters needed to execute a 1D solver simulation. A **1D Simulation Tool** instance is created by 
right-clicking on the **Simulations1d** node under the **SV Data Manager**. Selecting the **Create 1D Simulation job** menu item displays
a popup window.

<br>
<figure>
  <img class="svImg svImgSm" src="documentation/1d_simulation/tool/images/create-job.png">
  <figcaption class="svCaption"> The <b>Create 1D Simulation Job</b> popup menu. </figcaption>
</figure>

Use the **Select Model** list to select the 3D geometric surface model used to create centerlines. The list contains the names of 
all models created by any SimVascular **Modeling Tool** instance. Type in a job name used to identify the **Simulations1d Tool** instance 
and to name the files and directories stored under the SimVascular project's **Simulations1d** directory. Selecting **OK** creates 
an **Simulations1d Tool** instance node under the **SV Data Manager**. Selecting this instance displays the **Simulations1d Tool**
panel.

<br>
<figure>
<img src="documentation/1d_simulation/tool/images/panel.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
  <figcaption class="svCaption"> The 1D Simulation Tool panel. </figcaption>
</figure>
<br>

The panel contains seven sub-panels used to create or input a specific category of data needed to execute a 1D solver simulation.
<ul style="list-style-type:none;">
  <li> 1D Mesh </li>
  <li> Basic Parameters </li>
  <li> Inlet and Outlet BCs </li>
  <li> Wall Properties </li>
  <li> Solver Parameters </li>
  <li> Create Files and Run Simulation </li>
  <li> Convert Results </li>
</ul>

A selecting a sub-panel name brings up the sub-panel's widgets. The following sections describe how each of the sub-panels are used.


