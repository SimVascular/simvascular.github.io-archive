### Example 2

This example shows how to simulate a cylinder with plug steady flow at the inlet and RCR at the outlet. The script file cylinder.svpre used is as below:

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
noslip_vtp mesh-complete/walls_combined.vtp

# Write geometry and property data to geombc.dat.1
write_geombc

# Write initial values of velocity, pressure, etc to restart.0.1
write_restart
~~~

The only difference from Example 1 in the presolver script is using plug flow:

<font color="red">bct\_analytical\_shape plug</font> 

When the inlet of a vessel is close to the heart, the velocity profile at the inlet has a plug shape, instead of a parabolic shape. The solver.inp used for this example is as below:

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
Step Construction: 0 1 0 1
~~~

There are a few differences compared to Example 1 in solver.inp:

<font color="red">
Number of RCR Surfaces: 1<br>
List of RCR Surfaces: 3<br>
RCR Values From File: True
</font> 

The outlet boundary condition is RCR type, which needs a file rcrt.dat to define for flowsolver. The file format is described in [here](#solverSec74).

_rcrt.dat_

~~~
2
2
121
0.000015
1212
0.0 0.0
1.0 0.0
~~~

In the rcrt.dat:<br>
Line 1: the maximum number (2) of time points for all the outlets<br>
Line 2: the number (2) of time points for the first outlet (this example only has one outlet)<br>
Line 3: the proximal resistance (121) for the first outlet<br>
Line 4: the capacitance (0.000015) for the first outlet<br>
Line 5: the distal resistance (1212) for the first outlet<br>
Line 6: the distal pressure (0.0) at time (0.0) for the first outlet<br>
Line 7: the distal pressure (0.0) at time (1.0) for the first outlet<br>

<font color="red">
Number of Timesteps: 500<br>
Time Step Size: 0.001
</font> 

In this example, a smaller time step size is used, because the effect of the time constant in RCR type BC needs to be considered. For more accurate numerical computation, the time step size should be much smaller than the time constant (=R*C=(121+1212)*0.000015=0.02). With the small step size, the number of time steps is also increased.
