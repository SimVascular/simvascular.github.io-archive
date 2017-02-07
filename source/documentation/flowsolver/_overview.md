## Overview

### Process Flow of SimVascular Simulation 

The following figure contains a schematic representation of the processes involved in running a simulation using SimVascular.

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/simulation_flowchart.png">
  <figcaption class="svCaption" >Workflow for generating hemodynamic results of a cylindrical model starting from a stereolithography of its exterior surface</figcaption>
</figure>

We start off with the files coming from the [meshing](docsMeshing.html) of the analysis: these files contain nodal and connectivity information for the finite element mesh, located in the the folder _mesh-complete/mesh-surfaces/_.


**svPre** is the preprocessor for **svSolver**. The input data files to svPre contain a complete description of the discrete model: nodal coordinates, element connectivity, element adjacency information and connectivity of boundary nodes and elements. The **svPre** program can be called either from the command line (in terminal) or the Simulation tool (in GUI). The input data files for **svPresolver** are created from the meshe. They are organized as shown in the example below.

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/meshfiles.png">
  <figcaption class="svCaption" >Folder structure and file created after clicking on <b>Write Files</b></figcaption>
</figure>

These files are:

in the **mesh-complete/** folder: 

- **mesh-complete.mesh.vtu**, vtu file containing the solid mesh generated with TetGen.
- **mesh-complete.exterior.vtp**, vtp file containig all the exterior elements of the mesh generated with TetGen.
- **walls_combined.vtp**, vtp file containing all surface elements assigned to the wall, possibily combined from various surfaces. 

in the **mesh-complete/mesh-surfaces/** folder:

- **inflow.vtp**, vtp file containing the meshed inlet surface.
- **outlet.vtp**, vtp file containing the meshed outlet surface.
- **wall.vtp**, vtp file containing the meshed wall surface.


SimVascular runs **Presolver(svPre)** using the \*.svpre_ file. The \*.svpre file contains the set of instructions that define the boundary conditions, initial conditions, and geometrical configuration of our problem. The output of **svPre** is a set of files (**bct.dat, geombc.dat.1, restart.0.1, numstart.dat**) that are ready to be processed by **svSolver** to run a blood flow analysis. Running svSolver also need **solver.inp**, which provide further info for flowsolver.

Once the analysis is finished, the solver outputs files that characterize the finite element solution over a defined time period, typically several cardiac cycles. These files are taken by **svPost** to generate visualization files (typically *.vtu and *.vtp files) that are used to post-process and analyze the desired hemodynamic results. 

### Units in Simulation

**svSolver**, just like many other Finite Element Programs, does not enforce a consistent set of physical units in the analysis, but it is up to the analyst to make sure that input data are dimensionally consistent.

To have a consistent set of units, users are advised to either work in CGS, MGS, or SI units; see the following table. 

<table class="table table-bordered">
<thead>
<tr>
  <th>Quantity</th>
  <th>CGS Unit</th>
  <th>MGS Unit</th>
  <th>SI Unit</th>
</tr>
</thead>
<tr>
  <td>Length</td>
  <td>cm</td>
  <td>mm</td>
  <td>m</td>
</tr>
<tr>
  <td>Mass</td>
  <td>gr</td>
  <td>gr</td>
  <td>Kg</td>
</tr>
<tr>
  <td>Time</td>
  <td>s</td>
  <td>s</td>
  <td>s</td>
</tr>
</table>

### Useful constants in Simulation

The following table gathers several important physical constants of blood given in different unit
systems.

<table class="table table-bordered">
<thead>
<tr>
  <th>Property</th>
  <th>CGS Unit</th>
  <th>MGS Unit</th>
  <th>SI Unit</th>
</tr>
</thead>
<tr>
  <td>Dynamic viscosity $\mu$ [M· L -1 · T -1 ]</td>
  <td>0.04 poise [gr· cm -1 · s -1 ]</td>
  <td>0.004 [gr· mm -1 · s -1 ]</td>
  <td>0.004 [Pa· s -1 ]</td>
</tr>
<tr>
  <td>Blood density $\rho$ [M· L -3 ]</td>
  <td>1.06 [gr· cm -3 ]</td>
  <td>0.00106 [gr· mm -3 ] </td>
  <td>1060 [Kg· m -3 ]</td>
</tr>
</table>

