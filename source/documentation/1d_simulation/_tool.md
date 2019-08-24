# 1D Simulation Tool #

The SimVascular **1D Simulation Tool** is used to interactively create an input file defining the geometry, boundary conditions,
material properties and solver parameters needed to execute a 1D solver simulation. A **1D Simulation Tool** instance is created by 
right-clicking on the **Simulations1d** node under the **SV Data Manager**. Selecting the **Create 1D Simulation job** menu item displays
a popup window.

<br>
<figure>
  <img class="svImg svImgSm" src="documentation/1d_simulation/imgs/create-job.png">
  <figcaption class="svCaption"> The Create 1D Simulation job popup menu. </figcaption>
</figure>

Use the **Select Model** list to select the 3D geometric surface model used to create centerlines. The list contains the names of 
all models created by any SimVascular **Modeling Tool** instance. Type in a job name used to identify the **Simulations1d Tool** instance 
and to name the files and directories stored under the SimVascular project's **Simulations1d** directory. Selecting **OK** creates 
an **Simulations1d Tool** instance node under the **SV Data Manager**. Selecting this instance displays the **Simulations1d Tool**
panel.

<br>
<figure>
  <img class="svImg svImgSm" src="documentation/1d_simulation/imgs/panel.png">
  <figcaption class="svCaption"> The 1D Simulation Tool panel. </figcaption>
</figure>
<br>

The panel contains seven sub-panels used to create or input a specific category of data needed to execute a 1D solver simulation.
The following sections describe how each of the panels are used.


