### Running a flow simulation

At this point we have generated all the files we need for this problem. I recommend now to copy them to a different folder before launching the analysis. You can make a folder called, for instance, Simulation-files, and copy the five files there.

At this point you are ready to launch the analysis. For that, you simple have to type:

~~~
%solver 1 solver.inp
~~~

This will launch a one-processor job in your computer. I have launched a two-processor job in my computer, since it happens to have two cpu’s, and therefore the job will run twice as fast (approximately). However, what you will see on the screen will look very similar to this:

The messages you see in the red box describe the process in which the solver splits the input files (we mentioned this before) in as many pieces as processors we use in the analysis. In this case, 2 processors. Therefore, we have

~~~
geombc.dat.1 => geombc.dat.1 , geombc.dat.2
restart.0.1 => restart.0.1 , restart.0.2
~~~

At the same time, the solver copies all these files to a newly created folder called **2-procs_case/**, and this is where all the output files of the analysis will be written to. In general, if you launch a “n” processor job, all the files will be copied to a **n-procs_case/** folder.

The bottom part of the red box contains general info about the domain size, the number of nodes in the bct.dat file, etc. The important information is what is in the green rectangle. This info is being written to a file called histor.dat and it is what you need to use in order to evaluate how well your numerical simulation is doing. Here’s a brief description of what each of those columns means.

| a | b | c | d | e | f | g | h | 
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:| 
| 1 | 1.30E+001 | 1.16E-002 | (0) | 2.10E+002 | 2.62E+028 | < -10474 1 | 15> | [199-190] |
| 1 | 2.50E+001 | 7.35E-003 | (-1) | 2.93E-001 | 5.15E+000 | < -3237 1| 13> | [117-200] |
| 2 | 2.80E+001 | 5.13E-001 | (-16) | 1.75E-001 | 1.69E-001 | < -1357 1| 5> | [63-1] |
| 2 | 3.00E+001 | 2.05E-002 | (-2) | 8.07E-002 | 2.67E-002 | < -3286 1| 11> | [21-13] |
| 3 | 3.20E+001 | 1.20E-001 | (-10) | 8.75E-002 | 2.44E-002 | < -2342 1| 7> | [36-1] |
| 3 | 3.40E+001 | 5.18E-003 | (-3) | 2.13E-002 | 3.59E-003 | < -3277 1| 10> | [6-6] |
| 4 | 3.60E+001 | 2.14E-002 | (-2) | 5.57E-002 | 6.13E-003 | < -3146 1| 9> | [24-2] |
| 4 | 3.80E+001 | 2.18E-003 | (-7) | 7.33E-003 | 3.15E-004 | < -3233 1| 11> | [9-5] |
| 5 | 4.00E+001 | 1.52E-002 | (-1) | 4.22E-002 | 3.45E-004 | < -3141 1| 10> | [27-3] |
| 5 | 4.20E+001 | 1.11E-003 | (-10) | 3.57E-003 | 1.24E-004 | < -3237 1| 12> | [7-5] |
| 6 | 4.40E+001 | 1.24E-002 | (0) | 3.31E-002 | 3.16E-004 | < -3024 1| 10> | [16-2] |
| 6 | 4.60E+001 | 1.01E-003 | (-10) | 3.98E-003 | 3.30E-005 | < -3220 1| 11> | [6-5] |
| 7 | 4.80E+001 | 1.05E-002 | (0) | 2.70E-002 | 1.87E-004 | < -3019 1| 10> | [8-2] |
| 7 | 5.00E+001 | 8.74E-004 | (-11) | 3.50E-003 | 4.35E-005 | < -2993 1| 11> | [5-5] |
| 8 | 5.20E+001 | 9.09E-003 | (-1) | 2.25E-002 | 1.16E-004 | < -2993 1| 10> | [8-2] |
| 8 | 5.30E+001 | 7.42E-004 | (-11) | 2.92E-003 | 5.63E-005 | < -2871 1| 12> | [5-5] |
| 9 | 5.50E+001 | 7.95E-003 | (-1) | 1.89E-002 | 8.19E-005 | < -2876 1| 10> | [7-2] |
| 9 | 5.70E+001 | 6.58E-004 | (-12) | 2.47E-003 | 7.07E-005 | < -2850 1| 12> | [7-5] |
| 10 | 5.90E+001 | 6.99E-003 | (-2) | 1.65E-002 | 8.52E-005 | < -2871 1| 10> | [11-3] |
| 10 | 6.10E+001 | 4.26E-004 | (-14) | 1.39E-003 | 3.55E-005 | < -6284 2| 11> | [7-5] |
| 11 | 6.30E+001 | 6.17E-003 | (-2) | 1.42E-002 | 5.24E-005 | < -2845 1| 10> | [6-3] |
| 11 | 6.50E+001 | 3.86E-004 | (-14) | 1.28E-003 | 3.41E-005 | < -6284 2| 11> | [8-5] |
| 12 | 6.70E+001 | 5.45E-003 | (-3) | 1.23E-002 | 4.06E-005 | < -2728 1| 10> | [7-3] |
| 12 | 6.90E+001 | 3.48E-004 | (-15) | 1.18E-003 | 3.95E-005 | < -6284 2| 11> | [9-6] |

- **"a: Time step number"** - We see that each time step number appears twice: this is because we are considering two non-linear iterations. This column will go from “1” to the total number of time steps in our problem (in this case, 75). 

- **"b: CPU time in seconds"** - This is counted since you launched the analysis 

- **"c: Measure of the nonlinear residual"** - This gives you and idea of how accurate your solution is. Note that for each time step, the second entry is smaller than the first entry. This is a good sign that shows that the nonlinear iteration loop of the solver is doing a good job in improving the solution. You should always aim to a nonlinear residual at the end of the time step of at most 1·10-3.

- **"d: Logarithm of the residual change"** - This provides you a very good way of quickly evaluating how well the solution is doing. If this number is very small and negative, then it is a good sign. An entry with the value “-10” means that you have reduced the residual by an order of magnitude from the beginning of the analysis, a “-20”, by 2 orders of magnitude, and so on. 

- **"e: Entropy norm of the residual for the velocity field (max Δ u/ u)"**

- **"f: entropy norm of the residual for the pressure field (max Δ p/ p)"**

- **"g: < a – b | c>"**
+ a: block where the maximum residual happens (each block has 255 elements)
+ b: node in the block with the maximum error 
+ c: logarithmic measure of the ratio between the maximum residusl and the average residual: want this number to be as small as possible: it will be an
indicator of the spatial uniformity of the residual 

[a-b] a: number of Krylov vectors used in the pre-conditioner solver (Conjugate-Gradients for the pressure)
b: number of Krylov vectors used in the GMRES solver (for the full pressure-velocity system)

Once the analysis is done, you will see the collection of restart files corresponding to the different points in the time you decided to save. The folder will look like this:

Ignore the flux.* files for now. The important files here are the histor.dat that contains the info about your simulation explained in the previous paragraph, and of course the different restarts. If you plot the residual at the end of the time step versus the time step (or the physical time, since you know the time step size), you should get a plot like this:


This plot shows that the residual stabilizes around time 0.1 seconds (time step 25) and does not change much after that. This behavior is consistent with the steady flow that we are pushing through the cylinder: the problem is starting off from an arbitrary initial condition, and it eventually finds the right solution that satisfies our boundary conditions. Since our boundary conditions are steady, so is the overall solution to our problem. We are now ready to look at the restart files containing the solution. You will read these files in SimVascular/PostSolver to generate the visualization files (*.vis and *.vtu). We explain that process in the following section.


