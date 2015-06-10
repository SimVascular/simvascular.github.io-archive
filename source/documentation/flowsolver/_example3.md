### Example 3

This example shows how to simulate a cylinder with plug steady flow at the inlet, RCR at the outlet and deformable wall with uniform wall properties. The most robust way to simulate a deformable wall case is to first simulate a rigid wall case with the same boundary conditions. For this example, Example 2 is the rigid case we need to run. After the simulation of Example 2 is complete, use svPost to reduce the restart files for the last step to a single file, which would be restart.500.0. Copy this file to the project folder of Example 3 and rename it as restart.0.1.

The script file cylinder.svpre used is as below:

~~~
# Read Mesh info
mesh_and_adjncy_vtu mesh-complete/mesh-complete.mesh.vtu

# Assign IDs to the surfaces
set_surface_id_vtp mesh-complete/mesh-complete.exterior.vtp 1
set_surface_id_vtp mesh-complete/mesh-surfaces/inflow.vtp 2
set_surface_id_vtp mesh-complete/mesh-surfaces/outlet.vtp 3

# Set Inlet BC
prescribed_velocities_vtp mesh-complete/mesh-surfaces/inflow.vtp

# Set BCT for Inlet
fluid_density 1.06
fluid_viscosity 0.04
bct_analytical_shape plug
bct_period 1.0
bct_point_number 2
bct_fourier_mode_number 1
bct_create mesh-complete/mesh-surfaces/inflow.vtp flow-files/steady.flow
bct_write_dat
bct_write_vtp

# Set Outlet BC
zero_pressure_vtp mesh-complete/mesh-surfaces/outlet.vtp

# Set Wall BC
deformable_wall_vtp mesh-complete/walls_combined.vtp
deformable_thickness 0.2
deformable_E 4000000.0
deformable_nu 0.5
deformable_kcons 0.833333
deformable_pressure 133300
deformable_solve_displacements
wall_displacements_write_vtp

# Write Geometry and Property data to geombc.dat.1
write_geombc

# Append displacement to restart.0.1
append_displacements
~~~

The difference from Example 2 in the presolver script is to indicate which surfaces are deformable, set up uniform wall properties, provide an initial pressure (which is estimated form the simulation result of the rigid case Example 2), solve initial displacement, write the initial displacment to a vtp for review the solution, and finaly append it to restar.0.1 we just copied and renamed.

<font color="red">
deformable\_wall\_vtp mesh-complete/walls\_combined.vtp<br>

deformable\_thickness 0.2<br>
deformable\_E 4000000.0<br>
deformable\_nu 0.5<br>
deformable\_kcons 0.833333<br>
deformable\_pressure 133300<br>
deformable\_solve\_displacements<br>
wall\_displacements\_write_vtp<br>

append\_displacements<br>
</font> 

After running the script, displacment.vtp is create in the project folder, which shows the initial displacement:

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/disp_paraview.png">
  <figcaption class="svCaption" >Initila Displacement Calculated form svPre </figcaption>
</figure>

The solver.inp used for this example is as below:

~~~
# ================
# SOLUTION CONTROL
# ================
Number of Timesteps: 500
Time Step Size: 0.001

# ==============
# OUTPUT CONTROL
# ==============
Number of Timesteps between Restarts: 20
Number of Force Surfaces: 1
Surface ID's for Force Calculation: 1 

# ===================
# MATERIAL PROPERTIES
# ===================
Viscosity: 0.04
Density: 1.06

# ==========================
# DEFORMABLE WALL PROPERTIES
# ==========================
Deformable Wall: True 
Thickness of Vessel Wall: 0.2 
Young Mod of Vessel Wall: 4000000.0
Density of Vessel Wall: 1.0 
Poisson Ratio of Vessel Wall: 0.5 
Shear Constant of Vessel Wall: 0.833333 

# ==================================
# CARDIOVASCULAR MODELING PARAMETERS
# ==================================
Number of Coupled Surfaces: 1 
Number of RCR Surfaces: 1
List of RCR Surfaces: 3
RCR Values From File: True

# =============
# STEP SEQUENCE
# =============
Step Construction: 0 1 0 1 0 1 0 1

# =============
# LINEAR SOLVER
# =============
svLS Type: GMRES
~~~

There are a few differences compared to Example 2 in solver.inp:

<font color="red">
Deformable Wall: True <br>
Thickness of Vessel Wall: 0.2 <br>
Young Mod of Vessel Wall: 4000000.0<br>
Density of Vessel Wall: 1.0 <br>
Poisson Ratio of Vessel Wall: 0.5 <br>
Shear Constant of Vessel Wall: 0.833333 <br>
</font> 

The solver.inp indicates the wall is deformable and assign uniform wall properties for flowsolver simulation.

<font color="red">
Step Construction: 0 1 0 1 0 1 0 1<br>
</font> 

For deformable cases, the flowsolver needs more iterations of step sequence to derive accurate solution. 

<font color="red">
svLS Type: GMRES<br>
</font> 

For deformable cases, linear solver has better performance with GMRES.
