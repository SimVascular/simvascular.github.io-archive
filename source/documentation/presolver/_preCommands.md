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
  <td>(true, false)</td>
  <td>Indicator if the output files are in ASCII format. The default is false (output files are in binary format)</td>
</tr>
<tr>
  <td>verbose</td>
  <td>(none)</td>
  <td>ndicator to print progress. The default is off (no progress information)</td>
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
  <td>Number of nodes in the model</td>
</tr>
<tr>
  <td>number_of_elements</td>
  <td>(integer)</td>
  <td>Number of elements in the model</td>
</tr>
<tr>
  <td>number_of_mesh_edges</td>
  <td>(integer)</td>
  <td>Number of mesh edges in the model</td>
</tr>
<tr>
  <td>number_of_mesh_faces</td>
  <td>(integer)</td>
  <td>Number of mesh faces in the model</td>
</tr>
<tr>
  <td>number_of_variables</td>
  <td>(integer)</td>
  <td>Number of variables in the model. Default: 0, usually 5: ($v_x$ ,$v_y$ ,$v_z$ , $p$, $T$)</td>
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
  <td>Name of file with nodal coordinates</td>
</tr>
<tr>
  <td>elements</td>
  <td>(file name)</td>
  <td>Name of file with element connectivity</td>
</tr>
<tr>
  <td>boundary_faces</td>
  <td>(file name)</td>
  <td>Name of the file with the element face data of elements of the boundary</td>
</tr>
<tr>
  <td>adjacency</td>
  <td>(file name)</td>
  <td>Name of the file with the element adjacency info</td>
</tr>
<tr>
  <td>noslip</td>
  <td>(file name)</td>
  <td>Name of the file with the nodes where the noslip condition will be applied</td>
</tr>
<tr>
  <td>prescribed_velocities</td>
  <td>(file name)</td>
  <td>Name of the file with the nodes with a Dirichlet boundary condition coming from a bct.dat file</td>
</tr>
<tr>
  <td>zero_pressure</td>
  <td>(file name)</td>
  <td>Name of the file with element face connectivity data with a prescribed pressure boundary condition equal to zero</td>
</tr>
<tr>
  <td>pressure</td>
  <td>(file name)(double)</td>
  <td>Name of the file with element face connectivity data with a prescribed pressure boundary condition equal to $p$</td>
</tr>
<tr>
  <td>set_surface_id</td>
  <td>(file name)(integer)</td>
  <td>Name of the file with the element face data and the surface ID of the face. Mostly used to tag exterior surfaces for Boundary Condition attributes, and also to compute tractions at the boundary</td>
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
  <td>Name of the vtu file to be used when reading node coordinates and element connectivities</td>
</tr>
<tr>
  <td>mesh_and_adjncy_vtu</td>
  <td>(file name)</td>
  <td>Name of the vtu file to be used when reading node coordinates, element connectivities and element adjacencies</td>
</tr>
<tr>
  <td>noslip_vtp</td>
  <td>(file name)</td>
  <td>Name of the vtp file with the nodes where the noslip condition will be applied</td>
</tr>
<tr>
  <td>prescribed_velocities_vtp</td>
  <td>(file name)</td>
  <td>Name of the vtp file with element face connectivity data with a prescribed pressure boundary condition equal to zero</td>
</tr>
<tr>
  <td>zero_pressure_vtp</td>
  <td>(file name)</td>
  <td>Name of the vtp file with element face connectivity data with a prescribed pressure boundary condition equal to zero</td>
</tr>
<tr>
  <td>pressure_vtp</td>
  <td>(file name)(double)</td>
  <td>Name of the vtp file with element face connectivity data with a prescribed pressure boundary condition equal to $p$</td>
</tr>
<tr>
  <td>set_surface_id_vtp</td>
  <td>(file name)(integer)</td>
  <td>Name of the vtp file with the element face data and the surface ID of the face. Mostly used to tag exterior surfaces for Boundary Condition attributes, and also to compute tractions at the boundary</td>
</tr>
</table>

### Read from restart files

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
  <td>Command that reads a previously computed restart solution (velocity  and pressure fields). This is used in deformable wall simulations</td>
</tr>
<tr>
  <td>read_restart_displacements</td>
  <td>(restart file name)</td>
  <td>Command that reads a previously computed restart solution (displacement field). This is used in deformable wall simulations</td>
</tr>
<tr>
  <td>read_restart_accelerations</td>
  <td>(restart file name)</td>
  <td>Command that reads a previously computed restart Solution (acceleration field)</td>
</tr>
<tr>
  <td>read_displacements</td>
  <td>(restart file name)</td>
  <td>This command reads the displacements that define the initial stress of the vessel wall structure from an external ASCII file. This is used in conjunction with “read_restart_solution” and requires a “write_restart” command</td>
</tr>
<tr>
  <td>read_restart_varwallprop</td>
  <td>(restart file name)</td>
  <td>Command that reads a previously computed restart Solution (variable wall properties)</td>
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
  <td>(file name)</td>
  <td>Name of the svSolver restart file. Hard-coded file name: restart.0.1 </td>
</tr>
<tr>
  <td>write_geombc</td>
  <td>(file name)</td>
  <td>Name of the SimVascular/Solver geombc file.
Hard-coded file name: geombc.dat.1</td>
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
  <td>Value of the initial pressure in the model. The default is $p_0$ = $0$</td>
</tr>
<tr>
  <td>initial_velocity</td>
  <td>(double),(double),(double)</td>
  <td>Value of the initial velocity in the model. The default is $v_0 = 0.001,\,0.001,\,0.001$</td>
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
  <td>Name of the file with element face connectivity data of elements at the vessel wall. This is used to run deformable wall problems.</td>
</tr>
<tr>
  <td>deformable_create_mesh</td>
  <td>(file name)</td>
  <td>This command generate a new Finite Element Mesh with the nodes and elements on the Face given by (filename), with the purpose of solving the solid mechanics Finite Element problem of the pressurization of that surface with the fluid’s internal pressure</td>
</tr>
<tr>
  <td>deformable_Evw</td>
  <td>(double)</td>
  <td>Young’s modulus of the vessel wall, assumed uniform</td>
</tr>
<tr>
  <td>deformable_nuvw</td>
  <td>(double)</td>
  <td>Poisson’s ratio of the vessel wall, assumed uniform</td>
</tr>
<tr>
  <td>deformable_thickness</td>
  <td>(double)</td>
  <td>Thickness of the vessel wall, assumed uniform</td>
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
  <td>Shear correction factor for the vessel wall, assumed uniform</td>
</tr>
<tr>
  <td>fix_free_edge_nodes</td>
  <td>(file name)</td>
  <td>Name of the surface representing the vessel wall. This condition fixes the edges of this face with a zero-displacement condition</td>
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
  <td>(file name)(double)</td>
  <td>Set the thickness of the face specified by (file name) to a prescribed value. This can be used to assign the thickness to various outlet surfaces and then interpolate the wall thickness from these values using the Laplace_Thickness command.</td>
</tr>
<tr>
  <td>set_surface_Evw</td>
  <td>(file name)(double)</td>
  <td>Set the elastic modulus of the face specified by (file name) to a prescribed value. This can be used to assign the elastic modulus to various outlet surfaces and then interpolate the wall elastic modulus from these values using the Laplace_Evw command.</td>
</tr>
<tr>
  <td>Laplace_Thickness</td>
  <td>(none)</td>
  <td>Solve the Laplace problem and determines a variable thinkness distribution in the wall</td>
</tr>
<tr>
  <td>Laplace_Evw</td>
  <td>(none)</td>
  <td>Solve the Laplace problem and determines a variable elastic modulus distribution in the wall</td>
</tr>
<tr>
  <td>set_surface_initialBCs</td>
  <td></td>
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
  <td>This commands appends the displacement field calculated by deformable_solve/
deformable_direct_solve commands to the specified file (file name). <b> The file (filename) contains the converged steady rigid wall . This command does
not need a posterior “write_restart” command</b></td>
</tr>
<tr>
  <td>append_varwallprop</td>
  <td>(file name)</td>
  <td>This commands appends the displacement field calculated by deformable_solve/
deformable_direct_solve commands to the specified file (file name).</td>
</tr>
</table>

<br>
<br>
























