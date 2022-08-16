<h1> Example - Tube with resistance boundary condition </h1>
This example demonstrates a 1D Solver simulation for a model of a rigid tube with resistance boundary conditions.
The tube has a length <i>L=10</i> and constant cross-sectionional area <i> A=1.0</i>.

The inlet boundary condition is defined as constant flow <i>Q=100</i>.

The outlet boundary condition is defined with a resistance <i>R<sub>2</sub>=100</i>. 

The tube material is defind as a quasi-rigid wall (i.e. the wall stiffness approaches infinity).

The complete 1D Simulation input file is available 
<a href="http://github.com/SimVascular/svOneDSolver/blob/master/tests/cases/tube_r.in" > here </a>.

<h3> Analytical Results </h3> 
Using $\mu=0.04$ for viscosity the tube resistance can be analytically calculated as $R_1 = \frac{8\mu l \pi}{A^2} \approx 10.05309649 $.

Inlet and outlet pressues can thus be calculated as

$P\_{in} = Q \cdot (R\_1 + R\_2) \approx 11005.309649$

$P\_{out} = Q \cdot R\_2 = 10000.0$
 
<h3> Simulation Results </h3> 
The simulation is run for 1000 time steps to achieve a steady state.

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/1d-solver/images/tube_r_results.png">
  <figcaption class="svCaption"> Plot showing a linear pressure drop (blue) and and a contant flow (red) along the tube.
  </figcaption>
</figure>




