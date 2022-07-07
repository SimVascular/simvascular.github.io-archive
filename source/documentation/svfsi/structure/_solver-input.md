## Input File ##

**svFSI** requires a plain-text input file to specify simulation parameters. An overview of the syntax could be found <a href=https://sites.google.com/site/memt63/tools/MUPFES/mupfes-scripting>here</a>. The **SimVascular** GUI currently supports limited input configurations. To access more advanced functions of **svFSI**, users are recommended to create their own input file by modifying existing <a href="https://github.com/SimVascular/svFSI-Tests">templates</a>. Below is a template of the input file for modeling passive inflation of a left ventricle,

```
# File svFSI.inp
#----------------------------------------------------------------
# General simulation parameters

Continue previous simulation: f
Number of spatial dimensions: 3
Number of time steps: 100
Time step size: 0.01
Spectral radius of infinite time step: 0.50
Searched file name to trigger stop: STOP_SIM

Save results to VTK format: 1
Name prefix of saved VTK files: result
Increment in saving VTK files: 1
Start saving after time step: 1

Increment in saving restart files: 100
Convert BIN to VTK format: 0

Verbose: 1
Warning: 1
Debug: 0

#----------------------------------------------------------------
# Mesh data including volume (vtu) and surface (vtp) meshes,
# domains and fiber distributions

Add mesh: msh {
   Mesh file path:    <path to mesh-complete folder>/mesh-complete.mesh.vtu
   Add face: endo {
      Face file path: <path to mesh-complete folder>/mesh-surfaces/endo.vtp
   }
   Add face: epi {
      Face file path: <path to mesh-complete folder>/mesh-surfaces/epi.vtp
   }
   Add face: base {
      Face file path: <path to mesh-complete folder>/mesh-surfaces/base.vtp
   }
   Fiber direction: (1.0, 0.0, 0.0)
   Fiber direction: (0.0, 1.0, 0.0)
}

#----------------------------------------------------------------
# Equations solved
# Here we use mixed formulation, ustruct, with stabilization
# displacement-based formulation can be invoked through struct
Add equation: ustruct {
   # Define min and max number of iterations, and convergence
   # tolerance for the nonlinear solver (Newton method)
   Coupled: 1
   Min iterations: 4
   Max iterations: 10
   Tolerance: 1e-6
   Use Taylor-Hood type basis: f

   # Define constitutive model and its parameters
   Constitutive model: Guccione {
      C:   1.0e4
      bf:  1.0
      bt:  1.0
      bfs: 1.0
   }

   # Define a small density value for quasi-steady (static)
   # simulation
   Density: 1e-3

   # Define Poisson ratio
   Poisson ratio: 0.5

#==================================================================================
#  This block is for struct; remove if ustruct is used
   # Define elasticity modulus for the volumetric part of the
   # strain energy function
   Elasticity modulus: 1.0
   # Penalty method to enforce incompressibility
   Dilational penalty model: ST91
   # Use a penalty parameter, if different from bulk modulus
   Penalty parameter: 1.0E6
#==================================================================================

#==================================================================================
#  This block is for ustruct; remove if struct is used
   # Define elasticity modulus to calculate tauM/tauC
   Elasticity modulus: 2.0e5
   # Stabilization paramters
   Momentum stabilization coefficient: 1e-3
   Continuity stabilization coefficient: 1e-3
#==================================================================================

   # Define variables for output
   Output: Spatial {
      Displacement: t
      Velocity: t
      Jacobian: t
   }

   # Linear solver parameter
   # Jacobi preconditioner (FSILS) is the default.
   # For ustruct, trilinos-ilu preconditioner is recommended.
   LS type: GMRES
   {
      Preconditioner:      FSILS
      Tolerance:           1D-6
      Max iterations:      1000
      Krylov space dimension: 50
   }

   # Apply zero displacement BC at the base
   Add BC: base {
      Type: Dir
      Value: 0.0
      Impose on state variable integral: t
   }

   # Add pressure load at the endo surface
   # Here we define a ramp function to linearly
   # increase pressure load from zero to the
   # desired value to increase solver stability.
   # Follower pressure load is set as the direction
   # of the applied load follows deformation.
   Add BC: endo {
      Type: Neu
      Time dependence: Unsteady
      Temporal values file path: <path to load.dat file>
      Ramp function: t
      Follower pressure load: t
   }
}
```

The applied load on the endocardial surface is provided in a file, load.dat, defining the ramp function. In this file, the first line specifies that there are two data points and the value will change linearly. The second and third line specify the time and the value at that time. Note that for a ramp function, the code expects data at two time points only. Should the simulation go beyond the last time stamp (t=1.0 in the current example), a constant value equal to the last extrema (1.0e4) will be applied.

```
2    1
0.0  0.0
1.0  1.0e4
# content of load.dat
```

