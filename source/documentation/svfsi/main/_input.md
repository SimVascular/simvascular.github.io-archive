##Input file format

**svFSI** uses plain-text input file. This input file will defined the physics solved, mesh, linear solver, bounary conditions and general simulation parameters. 

Structurally, all input files are composed of three parts
1. General simulaiton parameters, such as time step size, format of results, location of results etc.
2. Mesh information, such as volumetric mesh, surface mesh, scaling factor etc
3. Equations. In this part, users will define the physics solved (fluid, strucutre, electrophysiology etc.), boundary conditions, linear solver etc.

Here, we use the input file for a 2D channel flow *(add line)* as an exmaple to demonstrate the structure of the input files.

```
#----------------------------------------------------------------
# General simulation parameters

Continue previous simulation: 0
Number of spatial dimensions: 3
Number of time steps: 1600
Time step size: 0.005
Spectral radius of infinite time step: 0.50
Searched file name to trigger stop: STOP_SIM

Save results to VTK format: 1
Name prefix of saved VTK files: result
Increment in saving VTK files: 10
Start saving after time step: 1

Increment in saving restart files: 200
Convert BIN to VTK format: 0

Verbose: 1
Warning: 0
Debug: 0

#----------------------------------------------------------------
# Mesh data
Add mesh: msh {
   Mesh file path:    mesh-complete/mesh-complete.mesh.vtu
   Add face: lumen_inlet {
      Face file path: mesh-complete/mesh-surfaces/lumen_inlet.vtp
   }
   Add face: lumen_outlet {
      Face file path: mesh-complete/mesh-surfaces/lumen_outlet.vtp
   }
   Add face: lumen_wall {
      Face file path: mesh-complete/mesh-surfaces/lumen_wall.vtp
   }
}

#----------------------------------------------------------------
# Equations
Add equation: fluid {
   Coupled: 1
   Min iterations: 3
   Max iterations: 10
   Tolerance: 1e-3
   Backflow stabilization coefficient: 0.2

   # Material property
   Density: 1.06
   Viscosity: Constant {Value: 0.04}

   # Output quantities
   Output: Spatial {
      Velocity: t
      Pressure: t
      Traction: t
      WSS: t
   }
   
   # Linear solver configuration
   LS type: NS
   {
      Max iterations:      10
      NS-GM max iterations: 3
      NS-CG max iterations: 500
      Tolerance:           1D-3
      NS-GM tolerance:     1D-3
      NS-CG tolerance:     1D-3
      Krylov space dimension: 50
   }

   # Boundary conditions
   Add BC: lumen_inlet {
      Type: Dir
      Time dependence: Unsteady
      Temporal values file path: lumen_inlet.flow
      #Fourier coefficients file path: lumen_inlet.fcs
      Profile: Parabolic
      Impose flux: t
   }

   Add BC: lumen_outlet {
      Type: Neu

      ## Resistance BC
      #Time dependence: Resistance #RCR
      #Value: 1225

      ## RCR BC
      Time dependence: RCR
      RCR values: (121.0, 1.5D-4, 1212.0)
      Distal pressure: 0.0
   }

   Add BC: lumen_wall {
      Type: Dir
      Time dependence: Steady
      Value: 0.0
   }
}
```

A comprehensive input template is provided [here]_(link to input), which contains all the available parameters and their meanings. It might seem very daunting to generate your own input file from scratch, and it is not recommended to do so. We maintain a large collection of examples for all the major functionalities of **svFSI**, which you can use to generate your own input file.

