###Solver Input Files

We continue to create other required input files for simulation.

	Tab: Simulations  → Create 3-D Solver Files
	Click “Create File” to output numstart.dat in the project folder.

Manually write presolver script file *demo.cvpre* in the text area:

	mesh_and_adjncy_vtu mesh-complete/mesh-complete.mesh.vtu
	noslip_vtp mesh-complete/walls_combined.vtp
	prescribed_velocities_vtp mesh-complete/mesh-surfaces/inflow_aorta.vtp
	zero_pressure_vtp mesh-complete/mesh-surfaces/outflow_aorta.vtp
	zero_pressure_vtp mesh-complete/mesh-surfaces/outflow_right_iliac.vtp
	set_surface_id_vtp mesh-complete/mesh-complete.exterior.vtp 1
	set_surface_id_vtp mesh-complete/mesh-surfaces/outflow_aorta.vtp 2
	set_surface_id_vtp mesh-complete/mesh-surfaces/outflow_right_iliac.vtp 3
	write_geombc geombc.dat.1
	write_restart restart.0.1

<br>

	Click “Save PreSolver scriptfile”. 
	Click “Run PreSolver” 

<figure>
  <img class="svImg svImgLg"  src="documentation/userguide/imgs/simulation/presolver.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Two more solver files ***geombc.dat.1*** and ***restart.0.1*** are created in the project folder.

Open a text editor and manually write the solver input file ***solver.inp*** in the project folder. Most parameters are already assigned default values for cardiovascular simulation. For a simple case, users just need to add about one dozen of lines for the parameters that must be set up in ***solver.inp***.

***solver.inp***

	Number of Timesteps: 500   
	Time Step Size: 0.0004  # should be small enough 
	Number of Timesteps between Restarts: 50   #output every 50 timesteps
	
	Viscosity: 0.04 
	Density: 1.06
	
	Number of Coupled Surfaces: 2 # Both outlets have coupling between flow rate and pressure 
	Number of Resistance Surfaces: 2   # Both outlets have resistance
	List of Resistance Surfaces: 2 3  #  ID list of the two outlets, defined in dem .cvpre
	Resistance Values : 16000 16000  # Resistance values for the two outlets

	Time Integration Rho Infinity: 0.0 # maximal numerical dissipation 
	Number of Force Surfaces: 1 
	Surface ID's for Force Calculation: 1  # ID is defined in .cvpre
	
	Step Construction : 0 1 0 1 # standard two iterations, enough for constant  problems.
	#For pulsatile problems, at least three iterations. For deformable wall problems,  at least 4 iterations.

<font color="red">**HELPFUL HINT:** </font> Step Construction together with Time Step Size and the quality of the spatial discretization given by the finite element mesh, will completely determine the performance of the linear solver of equations. The better chosen these parameters are, the faster and more accurately our simulation will run.
