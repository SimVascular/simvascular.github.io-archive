<h1>User Guide </h1>

This section describes the concepts needed to define a 1D network model and execute a 1D simulation for it. 


<h3> Nodes, Joints and Segments </h3>

In the 1D formulation the arterial network is decomposed into arterial segments connected to each other at nodes. The 1D network
geometry is defined by the 3D coordinates of its nodes. 

<br>
<figure>
  <img src="documentation/1d_simulation/solver/images/3d-model.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <img src="documentation/1d_simulation/solver/images/1d-network-model.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
  <figcaption> <i>Figure 1. The geometriy of a 3D model (left) is represented by a 1D network (right) of Segments (green) and Nodes (blue). </i></figcaption>
</figure>
<br>

A segment is used to represent a section of a vessel as a tapered cylinder with a reducing cross sections from inlet to outlet. 
A segment can connect to two joints, a joint and an inlet/outlet, or an inlet to an outlet. A joint is used to 
enforce pressure and mass continuity across segment junctions. 

The 1D network model show in Fig. 1 comprises 

<ul>
  <li> 1 inlet </li>
  <li> 10 nodes </li>
  <li> 4 joints </li>
  <li> 9 segments </li>
  <li> 5 outlets </li>
</ul>

These components are labeled in Fig. 2. 

<br>
<figure>
  <img src="documentation/1d_simulation/solver/images/labeled-1d-network-model.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
 <figcaption> <i>Figure 2. A 1D network model comprising 10 nodes, 4 joints and 9 segments. Node IDs are in parentheses</i></figcaption>
</figure>
<br>

Joint1 defines a constraint betreen segments 1, 2 and 4 at node2, joint2 between segments 2, and 7 at node3, etc.
 

<h3> Finite Element Mesh </h3>

Each segment is discretized into a number of finite elements in order to numerically solve the 1D equations of fluid flow in
deformable vessels (Fig. 3). This yields a 1D finite element mesh.

<br>
<figure>
  <img src="documentation/1d_simulation/images/segment-elements.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
 <figcaption> <i> Figure 3. A segment is discretized into a mesh n of finite elements. </i> </figcaption>
</figure>
<br>

The number of elements needed to simulation wave propagation in a segment depends on the material model and boundary conditions used 
in a 1D simulation. 
The number of elements required to achieve reliable results should be determined using a mesh convergence study, where several meshes 
are generated with different number of elements per segment until the simulation results do not substantially change. In general 10-25 
elements per segment is sufficient. If you have very large segements you will likely want to increase this to 50-150 elements per segment. 
You can start at the smaller number of elements per segment and increase if you experience solver errors (see below).

The number element quadrature points determines the accuracy of the numerical integration used to approximates integrals in 
the element formulation. This number generally does not need to be changed and can remain at its default value of 4.


<h3> Time Step </h3>

The size of your time step is influenced by several factors. For a straight, smooth, well-behaved model, a larger time step can be used. 
Additionally, for more stiff vessels (higher elastic modulus), a larger time step can be used. The more compliance is present in your model 
or the presence of a larger number of branches or very small branches will likely necessitate smaller time steps. Starting with a time 
step of 0.01 and decreaing by a factor of 1/2 until your model attains convergence. 

<h3> Solver Errors </h3>

If you receive an error while running a simulation, most commonly this can be solved by decreasing the time step 
(work in factors of 1/2) and increasing the number of elements per segment (work in factors of 2).

A common error, which can occur when there is a large difference in the inlet and outlet areas of a segment, is **outlet areas going negative**.

If this isn't working, then the geometry of the 1D model may need to be altered. This could involve adding additional segments to make the 
change in inlet and outlet area of the segments more gradual. It could also included truncating the model to remove branches or sections of 
branches with very small radii.


<h3> Simlation Results </h3>

The 1D solver writes simulation results for cross-section area, flow, pressure, Reynolds number (Re), and wall shear stress (WSS) for
each segment in your model. Results files are named using the following convention

<pre>
MODEL_SEGMENT_DATA.dat

  where 

    MODEL - Model name
    SEGMENT - Segement name
    DATA - Data name: area, flow, pressure, Re, wss

  Example: 

    demoGroup0_Seg0_wss.dat

</pre>

Each row in the .dat file contains simulation results for each segement finite element for each output simulation time as 
set by the solver input file **SOLVEROPTIONS** statement. There are N+1 rows for a segment divided into into N elements.
The last row contains results for the segment outlet.

