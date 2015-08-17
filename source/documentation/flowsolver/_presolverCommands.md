### svPre Commands

This section lists the available **svPre** commands, the associated parameters and what they do. 

#### Read Mesh info

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>mesh_and_adjncy_vtu</td>
  <td>(file name)</td>
  <td>Read node coordinates,element connectivities and adjacencies from the give vtu file</td>
</tr>
</table>

#### Assign IDs to Surfaces

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>set_surface_id_vtp</td>
  <td>(file name) (integer)</td>
  <td>Set a ID for the element faces provided by the given vtp file. Mostly used to tag exterior surfaces for Boundary Condition attributes, and also to compute tractions at the boundary</td>
</tr>
</table>

#### Set Boundary Conditions for Walls, Inlets, Outlets

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>noslip_vtp</td>
  <td>(file name)</td>
  <td>Noslip condition will be applied on the nodes provided by the given vtp file</td>
</tr>
<tr>
  <td>prescribed_velocities_vtp</td>
  <td>(file name)</td>
  <td>Same as "noslip_vtp"</td>
</tr>
<tr>
  <td>zero_pressure_vtp</td>
  <td>(file name)</td>
  <td>Zero pressure boundary condition will be appied on the element faces provided by the given vtp file</td>
</tr>
<tr>
  <td>pressure_vtp</td>
  <td>(file name) (double)</td>
  <td>Prescribed pressure boundary condition will be appied on the element faces provided by the given vtp file</td>
</tr>
</table>

#### Creat BCT file for Inlet

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>fluid_density</td>
  <td>(double)</td>
  <td>Set the fluid density to the given value</td>
</tr>
<tr>
  <td>fluid_viscosity</td>
  <td>(double)</td>
  <td>Set the fluid viscosity to the given value</td>
</tr>
<tr>
  <td>bct_analytical_shape</td>
  <td>(parabolic, plug, womersley)</td>
  <td>Indicate the velocity profile for the inlet</td>
</tr>
<tr>
  <td>bct_period</td>
  <td>(double)</td>
  <td>Set the period to the given value</td>
</tr>
<tr>
  <td>bct_point_number</td>
  <td>(integer)</td>
  <td>Set the number of points in one period</td>
</tr>
<tr>
  <td>bct_fourier_mode_number</td>
  <td>(integer)</td>
  <td>Set the mode number for Fourier smoothing of inlet flow</td>
</tr>
<tr>
  <td>bct_flip</td>
  <td></td>
  <td>Flip the flow direction at the inlet</td>
</tr>
<tr>
  <td>bct_create</td>
  <td>(vtp file name) (flow file name) </td>
  <td>Calculate the velocity for the specified inlet with the given flow file</td>
</tr>
<tr>
  <td>bct_merge_on</td>
  <td></td>
  <td>Merge all bct files to one single file if there are multiple inlets. Use before write_bct_dat and write_bct_vtp</td>
</tr>
<tr>
  <td>bct_write_dat</td>
  <td></td>
  <td>Write calculated BCT data to bct.dat</td>
</tr>
<tr>
  <td>bct_write_vtp</td>
  <td></td>
  <td>Write calculated BCT data to bct.vtp</td>
</tr>
</table>

#### Initial Conditions

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>initial_pressure</td>
  <td>(double)</td>
  <td>Set the initial pressure as the given value in the model if not read from other files. The default is $p_0$ = $0$</td>
</tr>
<tr>
  <td>initial_velocity</td>
  <td>(double) (double) (double)</td>
  <td>Set the initial velocity as the given values in the model if not read from other files. The default is $v_0 = 0.001,\,0.001,\,0.001$</td>
</tr>
</table>

#### Write simulation files

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>write_restart</td>
  <td>(file name)</td>
  <td>Write the specified file (restart.0.1 if a file name not provided) for svSolver. It contains initial conditions:pressure, velocity (and displacement, time derivative of solution if applicable). </td>
</tr>
<tr>
  <td>write_geombc</td>
  <td>(file name)</td>
  <td>Write the specified file (geombc.dat.1 if a file name not provided) for svSolver. It contains the info of geometry, boundary conditions and material properties. </td>
</tr>
<tr>
  <td>write_numstart</td>
  <td>(integer)</td>
  <td>Write numstart.dat with the specified time step number (0 if a number not provided) for svSolver. </td>
</tr>
</table>

#### Read variable values from non-vtk files

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>read_restart_solution</td>
  <td>(restart file name)</td>
  <td>Read a previously computed restart solution (velocity  and pressure fields). This could be used in deformable wall simulations</td>
</tr>
<tr>
  <td>read_restart_displacements</td>
  <td>(restart file name)</td>
  <td>Read a previously computed restart solution (displacement field). This is used in deformable wall simulations</td>
</tr>
<tr>
  <td>read_restart_accelerations</td>
  <td>(restart file name)</td>
  <td>Read a previously computed restart solution (acceleration field)</td>
</tr>
<tr>
  <td>read_restart_varwallprop</td>
  <td>(restart file name)</td>
  <td>Read a previously computed restart solution (variable wall properties)</td>
</tr>
<tr>
  <td>read_geombc_varwallprop</td>
  <td>(geombc file name)</td>
  <td>Read a previously computed geombc file (variable wall properties)</td>
</tr>
</table>

#### Read variable values from vtk files

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>read_all_variables_vtu</td>
  <td>(file name)</td>
  <td>Read the values for all variables: pressure, velocity (and displacement, time derivative of solution, wall property for variable wall, if available) from the given vtu file.</td>
</tr>
<tr>
  <td>read_pressure_velocity_vtu</td>
  <td>(file name)</td>
  <td>Read the values for pressure and velocity from the given vtu file.</td>
</tr>
<tr>
  <td>read_pressure_vtu</td>
  <td>(file name) (variable name in vtu)</td>
  <td>Read the values for pressure from the given vtu file using an optional variable name.</td>
</tr>
<tr>
  <td>read_velocity_vtu</td>
  <td>(file name) (variable name in vtu)</td>
  <td>Read the values for velocity from the given vtu file using an optional variable name.</td>
</tr>
<tr>
  <td>read_displacements_vtu</td>
  <td>(file name) (variable name in vtu)</td>
  <td>Read the values for displacements from the given vtu file using an optional variable name.</td>
</tr>
<tr>
  <td>read_accelerations_vtu</td>
  <td>(file name) (variable name in vtu)</td>
  <td>Read the values for time derivative of solution from the given vtu file using an optional variable name.</td>
</tr>
<tr>
  <td>read_varwallprop_vtu</td>
  <td>(file name) (variable name in vtu)</td>
  <td>Read the values for variable wall properties from the given vtu file using an optional variable name.</td>
</tr>
</table>

#### Deformable walls with uniform thickness and elastic modulus

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>deformable_wall_vtp_simple</td>
  <td>(file name)</td>
  <td>Set the face specified by the given vtp file as deformable wall</td>
</tr>
<tr>
  <td>fix_free_edge_nodes_vtp</td>
  <td>(file name)</td>
  <td>Fix the free edges of the face specified by the given vtp file with a zero-displacement condition</td>
</tr>
<tr>
  <td>deformable_create_mesh_vtp</td>
  <td>(file name)</td>
  <td>Generate a new finite element mesh with the nodes and elements on the face specified by the given vtp file (filename), with the purpose of solving the solid mechanics finite element problem of the pressurization of that surface with the fluid’s internal pressure</td>
</tr>
<tr>
  <td>deformable_wall_vtp</td>
  <td>(file name)</td>
  <td>For convenience, the command is the combination of the above three commands: deformable_wall_vtp_simple, fix_free_edge_nodes_vtp and deformable_create_mesh_vtp.
</tr>
<tr>
  <td>deformable_thickness</td>
  <td>(double)</td>
  <td>Set the thickness of the vessel wall to the given value, assumed uniform.</td>
</tr>
<tr>
  <td>deformable_E</td>
  <td>(double)</td>
  <td>Set the elastic modulus  of the vessel wall to the given value, assumed uniform</td>
</tr>
<tr>
  <td>deformable_nu</td>
  <td>(double)</td>
  <td>Set the Poisson’s ratio  of the vessel wall to the given value, assumed uniform.</td>
</tr>
<tr>
  <td>deformable_kcons</td>
  <td>(double)</td>
  <td>Set the Shear correction factor of the vessel wall to the given value, assumed uniform.</td>
</tr>
<tr>
  <td>deformable_pressure</td>
  <td>(double)</td>
  <td>Pressure used to load the vessel wall structure. This pressure should be representative of pressure of the internal fluid. The result of this pressurization is a “loaded” vessel wall in equilibrium with the internal
blood</td>
</tr>
<tr>
  <td>deformable_direct_solve_displacements</td>
  <td>(none)</td>
  <td>Use the direct, sparse solver for the initial displacements of the CMM-FSI method (deformable wall model)</td>
</tr>
<tr>
  <td>deformable_solve_displacements</td>
  <td>(none)</td>
  <td>Use the iterative solver for the initial displacements of the CMM-FSI method (deformable wall model)</td>
</tr>
<tr>
  <td>wall_displacements_write_vtp</td>
  <td>(file name)</td>
  <td>Write the displacment to the specified vtp file (displacement.vtp if a file name not provided) for review.</td>
</tr>
<tr>
  <td>append_displacements</td>
  <td>(file name)</td>
  <td>Append the displacement field to the specified existing file (restart.0.1 if a file name not provided). <b> This command does not need a posterior “write_restart” command.</b></td>
</tr>
</table>

#### Deformable walls with variable thickness and elastic modulus

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>set_surface_thickness_vtp</td>
  <td>(file name) (double)</td>
  <td>Set the thickness of the face specified by the given vtp file (file name) to a prescribed value. This can be used to assign the thickness to various outlet surfaces and then interpolate the wall thickness from these values using the Laplace_Thickness command.</td>
</tr>
<tr>
  <td>solve_varwall_thickness</td>
  <td>(none)</td>
  <td>Solve the Laplace problem and determines a variable thinkness distribution in the wall.</td>
</tr>
<tr>
  <td>set_surface_E_vtp</td>
  <td>(file name) (double)</td>
  <td>Set the elastic modulus of the face specified by the given vtp file(file name) to a prescribed value. This can be used to assign the elastic modulus to various outlet surfaces and then interpolate the wall elastic modulus from these values using the Laplace_Evw command.</td>
</tr>
<tr>
  <td>solve_varwall_E</td>
  <td>(none)</td>
  <td>Solve the Laplace problem and determines a variable elastic modulus distribution in the wall.</td>
</tr>
<tr>
  <td>set_surface_initial_E_vtp</td>
  <td>(file name) (double)</td>
  <td>Set the initial elastic modulus of the face specified by the given vtp file (file name) to a prescribed value for posterior transient Laplace solving (command Transient_Laplace_Evw).</td>
</tr>
<tr>
  <td>solve_transient_varwall_E</td>
  <td>(none)</td>
  <td>Solve the Transient Laplace problem and determines a variable elastic modulus distribution in the wall.</td>
</tr>
<tr>
  <td>varwallprop_write_vtp</td>
  <td>(file name)</td>
  <td>Write the variable thickness and elastic modulus to the specified vtp file</td>
</tr>
<tr>
  <td>deformable_solve_varwall_displacements</td>
  <td>(none)</td>
  <td>Use the iterative solver for the initial displacements of the CMM-FSI method (deformable wall model) with variable wall properties</td>
</tr>
<tr>
  <td>append_varwallprop</td>
  <td>(file name)</td>
  <td>Append the variable wall thickness and elastic modulus to the specified file (geombc.dat.1 if a file name not provided)</td>
</table>

























