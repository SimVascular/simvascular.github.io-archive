## Overview

### Process flow of a SVFLOWSOLVER Simulation 

The following figure contains a schematic representation of a flow chart of the processes involved in running a SimVascular/Solver simulation. We start off with the files coming from the solid modeling part of the analysis: these files characterize the different entities of the finite element mesh.

We then run SimVascular/Presolver using the *.supre file. The *.supre file contains the set of instructions that define the boundary conditions, initial conditions, and geometrical configuration of our problem. The output of SimVascular/Presolver is a set of files that are ready to be taken by SimVascular/Solver to run a blood flow analysis.

Once the analysis is finished, we have a number of files that characterize the finite element solution over the cardiac cycles. These files are taken by SimVascular/Postsolver to generate visualization files (*.vis or *.vtu files) that are used to analyze the results and extract the desired hemodynamic results. 

<img src="documentation/flowsolver/imgs/Fig_01.png" width="800">

In the following sections of this tutorial we will describe all the parts of this flow chart in detail. 

### Units in a SVFLOWSOLVER Analysis

SVFlowsolver, just like many other Finite Element Programs, does not enforce a consistent set of physical units in the analysis, but it is up to the analyst to make sure that this dimensional consistency is respected in the analysis.

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

### Useful constants in a SVFLOWSOLVER Analysis

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
  <td>Dynamic viscosity μ [M· L -1 · T -1 ]</td>
  <td>0.04 poise [gr· cm -1 · s -1 ]</td>
  <td>0.004 [gr· mm -1 · s -1 ]</td>
  <td>0.004 [Pa· s -1 ]</td>
</tr>
<tr>
  <td>Blood density ρ [M· L -3 ]</td>
  <td>1.06 [gr· cm -3 ]</td>
  <td>0.00106 [gr· mm -3 ] </td>
  <td>1060 [Kg· m -3 ]</td>
</tr>
</table>

