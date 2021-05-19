# ROM Simulation Tool #

The SimVascular **ROM Simulation Tool** is used to interactively create an input file defining the geometry, boundary conditions,
material properties and solver parameters needed to execute a reduced-order model (ROM) solver simulation. 
A **ROM Simulation Tool** instance is created by 
right-clicking on the **ROMSimulations** node under the **SV Data Manager**. Selecting the **Create ROM Simulation job** 
menu item displays a popup window.

<br>
<figure>
  <img class="svImg svImgSm" src="documentation/rom_simulation/tool/images/create-job.png">
  <figcaption class="svCaption"> The <b>Create ROM Simulation Job</b> popup menu. </figcaption>
</figure>

Use the **Select Model** list to select the 3D geometric surface model used to create centerlines. The list contains the names of 
all models created by any SimVascular **Modeling Tool** instance. Type in a job name used to identify the **Simulations1d Tool** instance 
and to name the files and directories stored under the SimVascular project's **Simulations1d** directory. Selecting **OK** creates 
an **ROM Simulation Tool** instance node under the **SV Data Manager**. Selecting this instance displays the 
**ROM Simulation Tool** panel.

<br>
<figure>
  <p style="clear: both;">
  <img class="svImg svImgSm" src="documentation/rom_simulation/tool/images/panel.png">
  <figcaption class="svCaption"> The ROM Simulation Tool panel. </figcaption>
</figure>
<br>

The panel contains seven sub-panels used to create or input a specific category of data needed to execute a reduced-order model solver simulation.
<ul style="list-style-type:none;">
  <li> Mesh </li>
  <li> Basic Parameters </li>
  <li> Inlet and Outlet BCs </li>
  <li> Wall Properties </li>
  <li> Solver Parameters </li>
  <li> Create Files and Run Simulation </li>
  <li> Convert Results </li>
</ul>

A selecting a sub-panel name brings up the sub-panel's widgets. The following sections describe how each of the sub-panels are used.


