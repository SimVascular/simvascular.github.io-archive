## svPre Commands

This sections lists the available **svPre** commands, the associated parameters and what they do. 

### General commands

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>ascii_format</td>
  <td>(none)</td>
  <td>Indicator to make the output files in ASCII format. The default is false (output files are in binary format)</td>
</tr>
<tr>
  <td>verbose</td>
  <td>(none)</td>
  <td>Indicator to print progress. The default is off (no progress information)</td>
</tr>
</table>

### Entity totals

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>number_of_nodes</td>
  <td>(integer)</td>
  <td>Set the number of nodes in the model</td>
</tr>
<tr>
  <td>number_of_elements</td>
  <td>(integer)</td>
  <td>Set the number of elements in the model</td>
</tr>
<tr>
  <td>number_of_mesh_edges</td>
  <td>(integer)</td>
  <td>Set the number of mesh edges in the model</td>
</tr>
<tr>
  <td>number_of_mesh_faces</td>
  <td>(integer)</td>
  <td>Set the number of mesh faces in the model</td>
</tr>
<tr>
  <td>number_of_variables</td>
  <td>(integer)</td>
  <td>Set the number of variables in the model. Default: 5 ($v_x$ ,$v_y$ ,$v_z$ , $p$, $T$)</td>
</tr>
</table>

### Basic commands reading compressed text files

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>nodes</td>
  <td>(file name)</td>
  <td>Read nodal coordinates from the given file</td>
</tr>
<tr>
  <td>elements</td>
  <td>(file name)</td>
  <td>Read element connectivity from the given file</td>
</tr>
<tr>
  <td>boundary_faces</td>
  <td>(file name)</td>
  <td>Read face data of boundary elements from the given file</td>
</tr>
<tr>
  <td>adjacency</td>
  <td>(file name)</td>
  <td>Read element adjacency info from the given file</td>
</tr>
<tr>
  <td>noslip</td>
  <td>(file name)</td>
  <td>Noslip condition will be applied on the nodes provided by the given file</td>
</tr>
<tr>
  <td>prescribed_velocities</td>
  <td>(file name)</td>
  <td>Same as "noslip"</td>
</tr>
<tr>
  <td>zero_pressure</td>
  <td>(file name)</td>
  <td>Zero pressure boundary condition will be appied on the element faces provided by the given file</td>
</tr>
<tr>
  <td>pressure</td>
  <td>(file name) (double)</td>
  <td>Prescribed pressure boundary condition will be appied on the element faces provided by the given file</td>
</tr>
<tr>
  <td>set_surface_id</td>
  <td>(file name) (integer)</td>
  <td>Set a ID for the element faces provided by the given file. Mostly used to tag exterior surfaces for Boundary Condition attributes, and also to compute tractions at the boundary</td>
</tr>
</table>

### Basic commands reading vtk file formats

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>mesh_vtu</td>
  <td>(file name)</td>
  <td>Read node coordinates and element connectivities from the given vtu file</td>
</tr>
<tr>
  <td>mesh_and_adjncy_vtu</td>
  <td>(file name)</td>
  <td>Read node coordinates,element connectivities and adjacencies from the give vtu file</td>
</tr>
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
<tr>
  <td>set_surface_id_vtp</td>
  <td>(file name) (integer)</td>
  <td>Set a ID for the element faces provided by the given vtp file. Mostly used to tag exterior surfaces for Boundary Condition attributes, and also to compute tractions at the boundary</td>
</tr>
</table>

### Read variable values from non-vtk files

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
  <td>read_displacements</td>
  <td>(file name)</td>
  <td>Read the displacements from an external ASCII file. This is used in conjunction with “read_restart_solution” and requires a “write_restart” command</td>
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

### Read variable values from vtk files

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

### Intial Conditions

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

### Write simulation files

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
  <td>restart.0.1</td>
  <td>Write the file restart.0.1 for svSolver. It contains initial conditions:pressure, velocity (and displacement, time derivative of solution if applicable). </td>
</tr>
<tr>
  <td>write_geombc</td>
  <td>geombc.dat.1</td>
  <td>Write the file geombc.dat.1 for svSolver. It contains the info of geometry and boundary conditions. </td>
</tr>
</table>

### Deformable walls with constant thickness and elastic modulus

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>deformable_wall</td>
  <td>(file name)</td>
  <td>Set the face specified by the given text file as deformable wall.</td>
</tr>
<tr>
  <td>deformable_wall_vtp</td>
  <td>(file name)</td>
  <td>Set the face specified by the given vtp file as deformable wall</td>
</tr>
<tr>
  <td>deformable_create_mesh</td>
  <td>(file name)</td>
  <td>Generate a new finite element mesh with the nodes and elements on the face specified by the given text file (filename), with the purpose of solving the solid mechanics finite element problem of the pressurization of that surface with the fluid’s internal pressure</td>
</tr>
<tr>
  <td>deformable_create_mesh_vtp</td>
  <td>(file name)</td>
  <td>Generate a new finite element mesh with the nodes and elements on the face specified by the given vtp file (filename), with the purpose of solving the solid mechanics finite element problem of the pressurization of that surface with the fluid’s internal pressure</td>
</tr>
<tr>
  <td>deformable_Evw</td>
  <td>(double)</td>
  <td>Set the elastic modulus  of the vessel wall to the given value, assumed uniform</td>
</tr>
<tr>
  <td>deformable_nuvw</td>
  <td>(double)</td>
  <td>Set the Poisson’s ratio  of the vessel wall to the given value, assumed uniform.</td>
</tr>
<tr>
  <td>deformable_thickness</td>
  <td>(double)</td>
  <td>Set the thickness of the vessel wall to the given value, assumed uniform.</td>
</tr>
<tr>
  <td>deformable_pressure</td>
  <td>(double)</td>
  <td>Pressure used to load the vessel wall structure. This pressure should be representative of pressure of the internal fluid. The result of this pressurization is a “loaded” vessel wall in equilibrium with the internal
blood</td>
</tr>
<tr>
  <td>deformable_kcons</td>
  <td>(double)</td>
  <td>Set the Shear correction factor of the vessel wall to the given value, assumed uniform.</td>
</tr>
<tr>
  <td>fix_free_edge_nodes</td>
  <td>(file name)</td>
  <td>Fix the free edges of the face specified by the given text file with a zero-displacement condition</td>
</tr>
<tr>
  <td>fix_free_edge_nodes_vtp</td>
  <td>(file name)</td>
  <td>Fix the free edges of the face specified by the given vtp file with a zero-displacement condition</td>
</tr>
<tr>
  <td>deformable_write_vtk_mesh</td>
  <td>(file name)</td>
  <td>Write the mesh of the deformable wall boundary to the specified VTK legacy-format file</td>
</tr>
<tr>
  <td>deformable_write_feap</td>
  <td>(file name)</td>
  <td>Write mesh and boundary conditions for FEAP</td>
</tr>
<tr>
  <td>deformable_direct_solve</td>
  <td>(none)</td>
  <td>Use the direct, sparse solver for the initial displacements of the CMM-FSI method (deformable wall model)</td>
</tr>
<tr>
  <td>deformable_solve</td>
  <td>(none)</td>
  <td>Use the iterative solver for the initial displacements of the CMM-FSI method (deformable wall model)</td>
</tr>
</table>

### Deformable walls with variable thickness and elastic modulus

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>varthickness_write_vtk_mesh</td>
  <td>(file name)</td>
  <td>Write the mesh with variable thickness and elastic modulus to the specified VTK legacy-format file</td>
</tr>
<tr>
  <td>deformable_solve_var_prop</td>
  <td>(none)</td>
  <td>Use the iterative solver for the initial displacements of the CMM-FSI method (deformable wall model) with variable wall properties</td>
</tr>
<tr>
  <td>set_surface_thickness</td>
  <td>(file name) (double)</td>
  <td>Set the thickness of the face specified by the given text file (file name) to a prescribed value. This can be used to assign the thickness to various outlet surfaces and then interpolate the wall thickness from these values using the Laplace_Thickness command.</td>
</tr>
<tr>
  <td>set_surface_thickness_vtp</td>
  <td>(file name) (double)</td>
  <td>Set the thickness of the face specified by the given vtp file (file name) to a prescribed value. This can be used to assign the thickness to various outlet surfaces and then interpolate the wall thickness from these values using the Laplace_Thickness command.</td>
</tr>
<tr>
  <td>set_surface_Evw</td>
  <td>(file name) (double)</td>
  <td>Set the elastic modulus of the face specified by the given text file (file name) to a prescribed value. This can be used to assign the elastic modulus to various outlet surfaces and then interpolate the wall elastic modulus from these values using the Laplace_Evw command.</td>
</tr>
<tr>
  <td>set_surface_Evw_vtp</td>
  <td>(file name) (double)</td>
  <td>Set the elastic modulus of the face specified by the given vtp file(file name) to a prescribed value. This can be used to assign the elastic modulus to various outlet surfaces and then interpolate the wall elastic modulus from these values using the Laplace_Evw command.</td>
</tr>
<tr>
  <td>Laplace_Thickness</td>
  <td>(none)</td>
  <td>Solve the Laplace problem and determines a variable thinkness distribution in the wall.</td>
</tr>
<tr>
  <td>Laplace_Evw</td>
  <td>(none)</td>
  <td>Solve the Laplace problem and determines a variable elastic modulus distribution in the wall.</td>
</tr>
<tr>
  <td>set_surface_initial_Evw</td>
  <td>(file name) (double)</td>
  <td>Set the initial elastic modulus of the face specified by the given text file(file name) to a prescribed value for posterior transient Laplace solving (command Transient_Laplace_Evw).</td>
</tr>
<tr>
  <td>set_surface_initial_Evw_vtp</td>
  <td>(file name) (double)</td>
  <td>Set the initial elastic modulus of the face specified by the given vtp file (file name) to a prescribed value for posterior transient Laplace solving (command Transient_Laplace_Evw).</td>
</tr>
<tr>
  <td>Transient_Laplace_Evw</td>
  <td>(none)</td>
  <td>Solve the Transient Laplace problem and determines a variable elastic modulus distribution in the wall.</td>
</tr>
</table>

### Append data to simulation files

<table class="table table-bordered">
<thead>
<tr>
  <th>svPre Command</th>
  <th>Argument Format</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>append_displacements</td>
  <td>(file name)</td>
  <td>Append the displacement field calculated by deformable_solve or deformable_direct_solve commands to the specified file (file name), such as restart.0.1. <b>The file (filename) contains the converged steady rigid wall. This command does not need a posterior “write_restart” command.</b></td>
</tr>
<tr>
  <td>append_varwallprop</td>
  <td>(file name)</td>
  <td>Append the variable wall thickness and elastic modulus to the specified file (file name), such as geombc.dat.1.</td>
</tr>
</table>

<br>
<br>
























