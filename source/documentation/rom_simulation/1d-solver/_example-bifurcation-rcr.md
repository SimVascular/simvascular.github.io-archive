<h1> Example - Bifurcation with RCR boundary conditions </h1>
This example demonstrates a 1D Solver simulation for a model of a aortic bifurcation taken from <a href="#ref-12">[12]</a>. 

The model geometry consists of a symmetric bifurcation with all three branches having a constant diameter. 

The inflow boundary condition is pulsatile. 

RCR boundary conditions are defined for both outlets. 

Simulation parameters are taken from Table III in <a href="#ref-12">[12]</a>. 

The complete 1D Simulation input file is available 
<a href="http://github.com/SimVascular/svOneDSolver/blob/master/tests/cases/bifurcation_RCR.in" > here </a>.
 
<h3> Simulation Results </h3> 
The simulation is run for only 2 cycles; to reach a periodic state, at least 10 cycles are required.
The results are similar to the results shown in Fig. 11 in <a href="#ref-12">[12]</a>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/1d-solver/images/bifurcation_rcr_results.png">
</figure>

