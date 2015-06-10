### Running Simulation

At this point we have generated all the files we need for this problem. Start simulation from the GUI.

~~~
Tab: Simulation -> Run Solver -> localhost
Select the project dir for Run Dir
Select Log Dir
Starting Step Number: 0
Click the button "whoami" to set username
Choose the number of processors - localhost num procs:4
Click "Run Simulation"
Wait a few seconds, Click the last "Start Trail" button to track the simulation progress
~~~

<figure>
  <img class="svImg scImgLg" src="documentation/flowsolver/imgs/svsolver_gui.png">
  <figcaption class="svCaption" >Running simulation through the GUI</figcaption>
</figure>

You cana also run simulation by a command lines.

~~~
%mpiexec -np 4 svsolver
~~~

This will launch a four-processor job in your computer.  Therefore, the input file are split as follows: 

~~~
geombc.dat.1 => geombc.dat.1, geombc.dat.2, geombc.dat.3, geombc.dat.4
restart.0.1 => restart.0.1, restart.0.2, restart.0.3, restart.0.4
~~~

At the same time, the solver copies all these files to a newly created folder called **4-procs_case/** under the project folder, and this is where all the output files of the analysis will be written to. In general, if you launch a **n** processor job, all the files will be copied to a **n-procs_case/** folder.

You can check the simulation progress in tab Console. It contains containing details that allows to evaluate how well your numerical simulation is doing. Here’s a brief description of what each of those columns means.

<table class='table borderless' id="solverTable">
<thead>
<tr>
  <th>a</th>
  <th>b</th>
  <th>c</th>
  <th>d</th>
  <th>e</th>  
  <th>f</th>  
  <th>g</th>  
  <th>h</th>  
</tr>
</thead>
<tr>
<td> 1 </td>
<td> 1.30E+001 </td>
<td> 1.16E-002 </td>
<td> (0) </td>
<td> 2.10E+002 </td>
<td> 2.62E+028 </td>
<td> &lt; -10474 1 | 15 &gt; </td>
<td> [199-190] </td>
</tr>

<tr>
<td> 1 </td>
<td> 2.50E+001 </td>
<td> 7.35E-003 </td>
<td> (-1) </td>
<td> 2.93E-001 </td>
<td> 5.15E+000 </td>
<td> &lt; -3237 1 | 13&gt; </td>
<td> [117-200] </td>
</tr>

<tr>
<td> 2 </td>
<td> 2.80E+001 </td>
<td> 5.13E-001 </td>
<td> (-16) </td>
<td> 1.75E-001 </td>
<td> 1.69E-001 </td>
<td> &lt; -1357 1 | 5&gt; </td>
<td> [63-1] </td>
</tr>

<tr>
<td> 2 </td>
<td> 3.00E+001 </td>
<td> 2.05E-002 </td>
<td> (-2) </td>
<td> 8.07E-002 </td>
<td> 2.67E-002 </td>
<td> &lt; -3286 1 | 11&gt; </td>
<td> [21-13] </td>
</tr>

<tr>
<td> 3 </td>
<td> 3.20E+001 </td>
<td> 1.20E-001 </td>
<td> (-10) </td>
<td> 8.75E-002 </td>
<td> 2.44E-002 </td>
<td> &lt; -2342 1 | 7&gt; </td>
<td> [36-1] </td>
</tr>

<tr>
<td> 3 </td>
<td> 3.40E+001 </td>
<td> 5.18E-003 </td>
<td> (-3) </td>
<td> 2.13E-002 </td>
<td> 3.59E-003 </td>
<td> &lt; -3277 1 | 10&gt; </td>
<td> [6-6] </td>
</tr>

<tr>
<td> 4 </td>
<td> 3.60E+001 </td>
<td> 2.14E-002 </td>
<td> (-2) </td>
<td> 5.57E-002 </td>
<td> 6.13E-003 </td>
<td> &lt; -3146 1 | 9&gt; </td>
<td> [24-2] </td>
</tr>

<tr>
<td> 4 </td>
<td> 3.80E+001 </td>
<td> 2.18E-003 </td>
<td> (-7) </td>
<td> 7.33E-003 </td>
<td> 3.15E-004 </td>
<td> &lt; -3233 1 | 11&gt; </td>
<td> [9-5] </td>
</tr>

<tr>
<td> 5 </td>
<td> 4.00E+001 </td>
<td> 1.52E-002 </td>
<td> (-1) </td>
<td> 4.22E-002 </td>
<td> 3.45E-004 </td>
<td> &lt; -3141 1 | 10&gt; </td>
<td> [27-3] </td>
</tr>

<tr>
<td> 5 </td>
<td> 4.20E+001 </td>
<td> 1.11E-003 </td>
<td> (-10) </td>
<td> 3.57E-003 </td>
<td> 1.24E-004 </td>
<td> &lt; -3237 1 | 12&gt; </td>
<td> [7-5] </td>
</tr>

<tr>
<td> 6 </td>
<td> 4.40E+001 </td>
<td> 1.24E-002 </td>
<td> (0) </td>
<td> 3.31E-002 </td>
<td> 3.16E-004 </td>
<td> &lt; -3024 1 | 10&gt; </td>
<td> [16-2] </td>
</tr>

<tr>
<td> 6 </td>
<td> 4.60E+001 </td>
<td> 1.01E-003 </td>
<td> (-10) </td>
<td> 3.98E-003 </td>
<td> 3.30E-005 </td>
<td> &lt; -3220 1 | 11&gt; </td>
<td> [6-5] </td>
</tr>

<tr>
<td> 7 </td>
<td> 4.80E+001 </td>
<td> 1.05E-002 </td>
<td> (0) </td>
<td> 2.70E-002 </td>
<td> 1.87E-004 </td>
<td> &lt; -3019 1 | 10&gt; </td>
<td> [8-2] </td>
</tr>

<tr>
<td> 7 </td>
<td> 5.00E+001 </td>
<td> 8.74E-004 </td>
<td> (-11) </td>
<td> 3.50E-003 </td>
<td> 4.35E-005 </td>
<td> &lt; -2993 1 | 11&gt; </td>
<td> [5-5] </td>
</tr>

<tr>
<td> 8 </td>
<td> 5.20E+001 </td>
<td> 9.09E-003 </td>
<td> (-1) </td>
<td> 2.25E-002 </td>
<td> 1.16E-004 </td>
<td> &lt; -2993 1 | 10&gt; </td>
<td> [8-2] </td>
</tr>

<tr>
<td> 8 </td>
<td> 5.30E+001 </td>
<td> 7.42E-004 </td>
<td> (-11) </td>
<td> 2.92E-003 </td>
<td> 5.63E-005 </td>
<td> &lt; -2871 1 | 12&gt; </td>
<td> [5-5] </td>
</tr>

<tr>
<td> 9 </td>
<td> 5.50E+001 </td>
<td> 7.95E-003 </td>
<td> (-1) </td>
<td> 1.89E-002 </td>
<td> 8.19E-005 </td>
<td> &lt; -2876 1 | 10&gt; </td>
<td> [7-2] </td>
</tr>

<tr>
<td> 9 </td>
<td> 5.70E+001 </td>
<td> 6.58E-004 </td>
<td> (-12) </td>
<td> 2.47E-003 </td>
<td> 7.07E-005 </td>
<td> &lt; -2850 1 | 12&gt; </td>
<td> [7-5] </td>
</tr>

<tr>
<td> 10 </td>
<td> 5.90E+001 </td>
<td> 6.99E-003 </td>
<td> (-2) </td>
<td> 1.65E-002 </td>
<td> 8.52E-005 </td>
<td> &lt; -2871 1 | 10&gt; </td>
<td> [11-3] </td>
</tr>

<tr>
<td> 10 </td>
<td> 6.10E+001 </td>
<td> 4.26E-004 </td>
<td> (-14) </td>
<td> 1.39E-003 </td>
<td> 3.55E-005 </td>
<td> &lt; -6284 2 | 11&gt; </td>
<td> [7-5] </td>
</tr>

<tr>
<td> 11 </td>
<td> 6.30E+001 </td>
<td> 6.17E-003 </td>
<td> (-2) </td>
<td> 1.42E-002 </td>
<td> 5.24E-005 </td>
<td> &lt; -2845 1 | 10&gt; </td>
<td> [6-3] </td>
</tr>

<tr>
<td> 11 </td>
<td> 6.50E+001 </td>
<td> 3.86E-004 </td>
<td> (-14) </td>
<td> 1.28E-003 </td>
<td> 3.41E-005 </td>
<td> &lt; -6284 2 | 11&gt; </td>
<td> [8-5] </td>
</tr>

<tr>
<td> 12 </td>
<td> 6.70E+001 </td>
<td> 5.45E-003 </td>
<td> (-3) </td>
<td> 1.23E-002 </td>
<td> 4.06E-005 </td>
<td> &lt; -2728 1 | 10&gt; </td>
<td> [7-3] </td>
</tr>

<tr>
<td> 12 </td>
<td> 6.90E+001 </td>
<td> 3.48E-004 </td>
<td> (-15) </td>
<td> 1.18E-003 </td>
<td> 3.95E-005 </td>
<td> &lt; -6284 2 | 11&gt; </td>
<td> [9-6] </td>
</tr>
</table>

- **a: Time step number** - We see that each time step number appears twice: this is because we are considering two non-linear iterations. This column will go from 1 to the total number of time steps in our problem (in this case, 100). 

- **b: CPU time in seconds** - This is counted since you launched the analysis.

- **c: Measure of the nonlinear residual** - This gives you and idea of how accurate your solution is. Note that for each time step, the second entry is smaller than the first entry. This is a good sign that shows that the nonlinear iteration loop of the solver is doing a good job in improving the solution. You should always aim to a nonlinear residual at the end of the time step of at most $1\times10^{-3}$.

- **d: Logarithm of the residual change** - This provides you a very good way of quickly evaluating how well the solution is doing. If this number is very small and negative, then it is a good sign. An entry with the value "-10" means that you have reduced the residual by an order of magnitude from the beginning of the analysis, a -20, by **2 orders of magnitude**, and so on. 

- **e: Entropy norm of the residual for the velocity field (max $\Delta u/ u$)**

- **f: entropy norm of the residual for the pressure field (max $\Delta p/ p$)**

- **g: &gt; a – b | c&gt;**
+ a: block where the maximum residual happens (each block has 255 elements by default).
+ b: node in the block with the maximum error.
+ c: logarithmic measure of the ratio between the maximum residusl and the average residual: want this number to be as small as possible: it will be an
indicator of the spatial uniformity of the residual.

- **h: [a-b]** 
- a: number of Krylov vectors used in the pre-conditioner solver. 
- b: number of Krylov vectors used in the GMRES solver.

**NOTE** - these numbers are zero when using the default **svLS**.

Once the analysis is done, you will see the collection of restart files corresponding to the different points in the time you decided to save. 

Sometimes you want to restart the finished simulation. 

~~~
Select  .../cylinder/4-procs_case for Run Dir
Starting Step Number: 200 (the last time steop from previous simulation)
Choose the same number of processors as the previous
Click "Run Simulation"
~~~

<figure>
  <img class="svImg scImgLg" src="documentation/flowsolver/imgs/restart_gui.png">
  <figcaption class="svCaption" >Restart simulation through the GUI</figcaption>
</figure>

Not the solver starts another 200-step simulation from time step 200.

As the simulation is completed, we are now ready to look at the restart files containing the solution. You will read these files in **svPost** to generate the visualization files. We explain that process in the following section.


