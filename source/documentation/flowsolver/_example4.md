### Example 4

This example shows how to simulate a cylinder with plug steady flow at the inlet, RCR at the outlet and deformable wall with variable wall properties. Similar to Example 3, we use the simulation result of Example 2 as the initial point.

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
set_surface_thickness_vtp mesh-complete/mesh-surfaces/inflow.vtp 0.2
set_surface_thickness_vtp mesh-complete/mesh-surfaces/outlet.vtp 0.1
solve_varwall_thickness
set_surface_E_vtp mesh-complete/walls_combined.vtp 4000000
solve_varwall_E
varwallprop_write_vtp

deformable_nu 0.5
deformable_kcons 0.833333
deformable_pressure 133300
deformable_solve_varwall_displacements
wall_displacements_write_vtp

# Write Geometry and Property data to geombc.dat.1
write_geombc

# Append displacement to restart.0.1
append_displacements

~~~

The difference from Example 3 in the presolver script is to solve variable thickness and Young's modulus, and assign them to the wall, instead of giving uniform thickness and Young's modulus.

<font color="red">
set\_surface\_thickness\_vtp mesh-complete/mesh-surfaces/inflow.vtp 0.2<br>
set\_surface\_thickness\_vtp mesh-complete/mesh-surfaces/outlet.vtp 0.1<br>
solve\_varwall\_thickness<br>
set\_surface\_E\_vtp mesh-complete/walls\_combined.vtp 4000000<br>
solve\_varwall\_E<br>
varwallprop\_write\_vtp<br>
</font> 

After running the script, varwallprop.vtp and displacment.vtp are create in the project folder, which shows the thickness and Young's modulus, and initial displacement, respectively:

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/varwallprop_paraview.png">
  <figcaption class="svCaption" >Variable Wall ThicknessInitila Calculated form svPre </figcaption>
</figure>


<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/disp_varwall_paraview.png">
  <figcaption class="svCaption" >Initila Displacement Calculated form svPre </figcaption>
</figure>

The solver.inp used for this example is as below:

~~~
# ================
# SOLUTION CONTROL
# ================
Number of Timesteps: 1000
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
Variable Wall Thickness and Young Mod: True
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
Step Construction : 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1

# =============
# LINEAR SOLVER
# =============
svLS Type: GMRES
~~~

There are a few differences compared to Example 3 in solver.inp:

<font color="red">
Variable Wall Thickness and Young Mod: True<br>

Step Construction : 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1<br>
</font> 

The solver.inp indicates the wall properties are variable, and uses the derived solution form svPre, instead of assigning uniform thickness and Young's modulus. For variable wall cases, the flowsolver need much more iterations of step sequence to get accurate solution.
