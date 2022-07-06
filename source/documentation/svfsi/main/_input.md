##Input file format

**svFSI** uses plain-text input file. This input file will define the physics solved, mesh, linear solver, boundary conditions and general simulation parameters. An overview of the syntax could be found <a href=https://sites.google.com/site/memt63/tools/MUPFES/mupfes-scripting>here</a>. The input file for svFSI is a scripting code that sets values to specific parameters. A colon ":" is used as a separator between the keyword or key phrase and its value. If the parameters being set are single-valued constants, you may use a **single line structure** as,

```
<keyword or key phrase>: 1.3
```

First part, which is the part before ":", is the keyword or key phrase to the parameter, and the second part, which is the part after ":", is the value. This kind of single line structures can occur in any order in the script.

There are five types of values that can be supplied as the parameter in the single line structure:

   - logical (true/false)
   - integer values
   - real/float values
   - strings or characters
   - file paths
   - vector of real or integer values

For logical false, any of `False`, `0`, `F`, `f`, `false` can be used. Likewise, for logical true, any of `True`, `1`, `T`, `t`, `true` can be used. Real numbers can be formatted as {10.0, 10.0D0, 1.e1, 1.D1}. Any line that begins with `#` is treated as a comment. You may add comments, have space before keywords or after ":".

If the values to be set are a part of a bigger entity, you need to use the **block structure**, which uses braces ("{", "}") to mark the scope of that entity. E.g.:

```
 Domain: 1 {
    Density:             0.1      # [epsilon - inf)
    Poisson ratio:       0.35     # [0.0 - (0.5-epsilon)]
 }
```

In this example, "Domain" is a keyword (i.e., the entity to be specified) and "1" refers to the first "Domain". Within this entity, "Density" is set to "0.1" and "Poisson ratio" is set to
"0.35". Note that the order of lines doesn't matter within each block enclosed by "{" and "}". If a keyword doesn't have a default value, it has to be specified by the user. For the optional arguments, default value is shown.

A comprehensive input template is provided [here](https://github.com/SimVascular/svFSI-Tests/blob/master/svFSI_master.inp), which contains all the available parameters and their meanings. The **SimVascular** GUI currently supports limited input configurations. To access more advanced functions of **svFSI**, users are recommended to create their own input file by modifying existing <a href="https://github.com/SimVascular/svFSI-Tests">templates</a>.

Structurally, all input files are composed of three parts: 
<ol>
    <li> <a href="#general_para"> General simulation parameters</a>, such as time step size, format of results, location of results etc.</li>
    <li> <a href="#mesh_info"> Mesh information</a>, such as volumetric mesh, surface mesh, scaling factor etc.</li>
    <li> <a href="#equation_info"> Equation information</a>, such as physics solved (fluid, structure, electrophysiology etc.), boundary conditions, linear solver etc.</li>
</ol>

<a id="general_para"> <h4> General simulation parameters </h4></a> 

General simulation parameters describe the basic parameters about the problem including spatial dimension, time step control, file output, option to restart, etc. They are usually defined using the single line structure. For example:

```
Number of spatial dimensions: 3
Number of time steps: 1600
Time step size: 0.005
Save results to VTK format: 1
Increment in saving VTK files: 10
Increment in saving restart files: 200
...
```

<a id="mesh_info"> <h4> Mesh information </h4></a> 

Mesh data is provided in the second part. It mainly includes the paths to volumetric meshes and boundary meshes. There may also be additional information such as domains, fiber orientation, initial values, prestress, etc. Multiples meshes can be loaded for the same or different equations within svFSI. svFSI supports reading multiple mesh formats as mentioned [here](http://simvascular.github.io/docssvFSI.html#mesh). Regardless of the mesh format, the mesh information is provided using the block structure.  Nested keywords "Add mesh" and "Add face" could be used to provide paths to the mesh and face files. The users should also provide a string-based name for each mesh and face immediately after the colon. This name will be useful when when setting boundary conditions later. For example:

```
Add mesh: mesh_name {
   # Volumetric mesh
   Mesh file path:    ./mesh/mesh-complete.mesh.vtu

   # Surface meshes
   Add face: face_name_1 {
      Face file path: ./mesh/mesh-surfaces/face_1.vtp
   }
   Add face: face_name_ 2 {
      Face file path: ./mesh/mesh-surfaces/face_2.vtp
   }
   Add face: face_name_3 {
      Face file path: ./mesh/mesh-surfaces/face_3.vtp
   }
}
```

<a id="equation_info"> <h4> Equation information </h4></a> 

Information on equations being solved is provided here. It includes the type of equation, coupling, boundary conditions, settings for the linear and nonlinear solver, and output control. The type of equation can be heat equation, linear elasticity, nonlinear elastodynamics, incompressible viscous fluid, fluid-structure interaction etc. Also, physics-specific material properties can be supplied. **svFSI* also provides a rich selection of linear solvers (BIPN, GMRES, BICGSTAB, CG) and preconditioners (Trilinos-Diagonal, Trilinos-BlockJacobi, Trilinos-ILU, Trilinos-ILUT, Trilinos-IC, Trilinos-ICT, Trilinos-ML). In terms of boundary conditions, we provide choices such as Dirichlet, Neumann, Robin etc. These boundary conditions can be steady, unsteady, coupled to lumped parameter network or RCR-type. Boundary conditions are supplied in a nested block structure with keyword "Add BC". Also, the string immediately after the colon should match the face name defined in mesh section. For example:

```
Add equation: fluid {
   Coupled: 1
   Min iterations: 3
   Max iterations: 10
   Tolerance: 1e-3

   # Material property
   Density: 1.06
   Viscosity: Constant {Value: 0.04}

   # Linear solver configuration
   LS type: GMRES
   {
      Preconditioner: Trilinos-ILUT
      Max iterations: 100
      Tolerance:      1D-6
      Krylov space dimension: 50
   }

   # Boundary conditions
   Add BC: face_name_1 {
      Type: Dir
      Time dependence: Steady
      Value: 0.0
   }
}
```