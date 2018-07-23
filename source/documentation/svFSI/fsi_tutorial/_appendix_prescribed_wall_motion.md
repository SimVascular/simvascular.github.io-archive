##Simulations with prescribed wall motion

In this section, we discuss how to set up a simulation with prescribed wall motion. For example, one may wish to extract the motion of the walls of the ventricle from scans, then reconstruct the flow fields by solving the Navier Stokes equations. This is accomplished by computing a displacement field for the prescribed motion of the mesh. This must be done offline by the user for their specific problem. This is typically done for a small subset of the total times, and displacements between the specified times are prescribed by using a piecewise linear interpolant.

For the wall motion file, the file format is as follows. First, specify the dimension of the problem (three), the number of times at which to specify the displacements, and the number of vertices in the moving wall mesh. Then specify the times at which the displacements occur. Next, for each vertex, specify its index and then the prescribed displacements for each time. Note that in the case of multiple moving faces, these numbers may not start at one for any given face, as indexing is global. If a vertex is on an edge between two faces, it should have the same index and displacement fields, specified redundantly in both files.

        Dimension n_times m_vertices
        t_1
        t_2
        ...
        t_n
        vertex_1_index
        displacement_1_vertex_1
        displacement_2_vertex_1
        ...
        displacement_n_vertex_1
        vertex_2_index 
        displacement_1_vertex_2
        displacement_2_vertex_2
        ...
        displacement_n_vertex_2
        ... 

For example,

        3   21   14907
        0.000000
        3.800E-2
        7.600E-2
        1.140E-1
        1.520E-1
        1.900E-1
        2.280E-1
        2.660E-1
        3.040E-1
        3.419E-1
        3.800E-1
        4.180E-1
        4.560E-1
        4.940E-1
        5.320E-1
        5.699E-1
        6.080E-1
        6.460E-1
        6.839E-1
        7.220E-1
        7.600E-1
        1
        0.000000   0.000000   0.000000   
        2.800E-1   -8.99E-2   -1.00E-2   
        8.799E-1   -2.09E-1   -8.10E-1   
        1.339999   -1.59E-1   -1.43000   
        1.509999   7.000E-2   -1.59000   
        1.310000   3.100E-1   -1.52000   
        1.069999   5.100E-1   -1.41000   
        1.009999   6.000E-1   -1.28000   
        9.699E-1   3.600E-1   -1.10000   
        1.049999   -1.09E-1   -8.80E-1   
        1.169999   -6.69E-1   -7.60E-1   
        1.169999   -1.17999   -7.90E-1   
        1.129999   -1.31999   -9.69E-1   
        1.049999   -1.25999   -1.34000   
        1.000000   -9.39E-1   -1.64000   
        9.899E-1   -4.29E-1   -1.96000   
        1.000000   3.000E-2   -2.15000   
        9.299E-1   3.600E-1   -1.90000   
        6.599E-1   4.200E-1   -1.14000   
        1.999E-1   1.500E-1   -3.50E-1   
        0.000000   0.000000   0.000000   
        2
        0.000000   0.000000   0.000000   
        2.700E-1   -8.99E-2   0.000000   
        8.500E-1   -1.99E-1   -6.80E-1   
        1.280000   -1.59E-1   -1.16999   
        1.430000   5.000E-2   -1.28000   
        1.230000   2.599E-1   -1.19999   
        1.010000   4.499E-1   -1.09000   
        9.500E-1   5.099E-1   -9.69E-1   
        9.100E-1   2.400E-1   -8.19E-1   
        1.000000   -2.59E-1   -6.70E-1   
        1.120000   -8.29E-1   -5.69E-1   
        1.130000   -1.31999   -5.89E-1   
        1.090000   -1.44999   -7.50E-1   
        1.000000   -1.36000   -1.06999   
        9.400E-1   -1.00999   -1.31000   
        9.300E-1   -4.69E-1   -1.56999   
        9.500E-1   0.000000   -1.72999   
        8.900E-1   3.299E-1   -1.53999   
        6.200E-1   3.999E-1   -9.39E-1   
        1.900E-1   1.399E-1   -2.90E-1   
        0.000000   0.000000   0.000000  
        ... 

Note that in this example, we wish the mesh motion to be periodic in time, and thus the final displacement is zero.

To set up the input file, set the equation to be FSI, even though there is not necessarily a structure, to use the ALE meshes rather than static meshes. For the moving wall, add the motion file when specifying the wall boundary condition, and turn on the option “Impose on state variable integral.”

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

It is recommended to include remeshing if the wall motion is such that the domain undergoes large changes. For example, set

        Remesher: Tetgen {
          Max edge size: lumen { val: 3.0 }
          Min dihedral angle: 10.0
          Max radius ratio: 1.1
          Remesh frequency: 100
          Frequency for copying data: 1  
        }

The max edge size should be consistent with the original mesh size.

Under the mesh equation, we similarly add the motion file.

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
