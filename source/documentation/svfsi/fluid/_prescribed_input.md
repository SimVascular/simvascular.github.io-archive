### Input file

To set up the input file, set the equation to be FSI to allow the mesh to move under the ALE framework, even though there is not necessarily a structure. For the moving wall, add the motion file when specifying the wall boundary condition, and turn on the option “Impose on state variable integral”.

```
    Add BC: moving_wall {
        Type: Dirichlet 
        Time dependence: General
        Temporal and spatial values file path: wall_motion.dat
        Profile: Flat
        Zero out perimeter: 1
        Impose flux: 0
        #---------------- Add this line to the moving boundary face -----------
        Impose on state variable integral: 1
    }
```

It is recommended to include remeshing if the wall motion is such that the domain undergoes large changes. For example, set

```
    Remesher: Tetgen {
        Max edge size: lumen { val: 3.0 }
        Min dihedral angle: 10.0
        Max radius ratio: 1.1
        Remesh frequency: 100
        Frequency for copying data: 1  
    }
```

The max edge size should be consistent with the original mesh size.

Under the mesh equation, we similarly add the motion file.

```
    Add equation: mesh {
        Coupled: 1
        Min iterations: 1
        Max iterations: 8
        Tolerance: 1e-3
        Residual dB reduction: -20
        Poisson ratio: 0
        Output: Spatial {
            Displacement: t
        }
        
        #---------- Add the BC for the moving_wall to the mesh equation as well ------
        Add BC: moving_wall {
            Type: Dirichlet 
            Time dependence: General
            Temporal and spatial values file path: wall_motion.dat
            Profile: Flat
            Zero out perimeter: 1
            Impose flux: 0
            #---------------- Add this line to the moving boundary face -----------
            Impose on state variable integral: 1
    }
```

Follow this [instruction](http://simvascular.github.io/docssvFSI.html#app_restart_after_remesh) if you need to restart your simulation after stoppage.