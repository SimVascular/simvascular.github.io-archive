<h1> Tutorial - Aorta and Iliac Arteries </h1>
This tutorial demonstrates how to create a 1D Solver input file for a model of an abdominal aorta with branching 
right and left iliac arteries. 

In the following sections the contents of the 1D Solver input file are shown as shaded blocks. Text preceding each block
describe its contents.

<h2> Outlet RCR </h2>
Create a 1D Simulation input file for a constant RCR resistance outlet boundary condition. 

The complete 1D Simulation input file listing is 
<a href="documentation/rom_simulation/1d-solver/files/05_bifurcation_RCR.in"> here </a>.

<h3> 1D Solver input file </h3>
Set the model name to be **Bifurcation\_RCR\_**.

```
 MODEL Bifurcation_RCR_ 
```

<br>
Create four nodes defining the model inlets, outlets and the location of the branching right and left iliac arteries.

```
NODE 0 0.0 0.0 0.0
NODE 1 0.0 0.0 -17.670671
NODE 2 0.0 6.498730 -40.182934
NODE 3 4.595296 4.595296 -40.182934
```
<br>
Create a single joint at the location of the branching right and left iliac arteries. 

```
JOINT AbdomBifurcJ 1 INSEGS OUTSEGS
JOINTINLET INSEGS 1 0
JOINTOUTLET OUTSEGS 2 1 2
```

<br>
Create three segments representing the aorta, right iliac, and left iliac arteries. 

```
SEGMENT Aorta  0 17.670671 50 0 1 5.027254990390394 1.6068894493599328 0.0 MAT1 NONE 0.0 0 0 NOBOUND NONE
SEGMENT iliacR 1 12.997461 50 1 3 1.55              0.3525652531134944 0.0 MAT1 NONE 0.0 0 0 RCR RCR_VALS
SEGMENT iliacL 2 12.997461 50 1 2 1.55              0.3525652531134944 0.0 MAT1 NONE 0.0 0 0 RCR RCR_VALS_2
```

<br>
Create a data table for the aorta inlet flow boundary condition.

<div style="height:120px;overflow:auto;">
<pre>
DATATABLE AORTAFLOW LIST
0 34.8
0.01406 35.75183
0.02813 36.62183
0.04219 36.85225
0.05625 38.93465
0.07031 41.76
0.08438 45.97649
0.09844 50.73564
0.1125 55.24931
0.12656 60.63297
0.14062 66.01663
0.15469 70.51522
0.16845 74.55297
0.18281 76.94763
0.19687 80.61282
0.21094 81.08874
0.225 81.12535
0.23906 80.64943
0.25312 79.30352
0.26719 75.5328
0.28125 70.67673
0.29531 65.27154
0.30938 59.03941
0.32344 52.64361
0.3375 44.90406
0.35156 42.0421
0.36563 38.18094
0.37969 31.45136
0.39375 28.71
0.40781 28.71
0.42188 26.97
0.43594 26.13661
0.45 26.97
0.46406 27.84
0.47813 28.36114
0.49219 29.96116
0.50625 33.99891
0.52031 35.87889
0.53438 37.2248
0.54844 38.86144
0.5625 41.55327
0.57656 42.13255
0.59063 42.63
0.60469 43.08438
0.61875 43.5
0.63281 43.5
0.64687 42.4878
0.66094 41.76
0.675 41.53604
0.68906 40.19012
0.70312 39.15
0.71719 37.58658
0.73125 36.92762
0.74531 35.68292
0.75938 34.3305
0.77344 33.93
0.7875 33.37871
0.80156 33.2172
0.81563 33.93
0.82969 33.69097
0.84375 33.77495
0.85781 33.38087
0.87188 34.726
0.88594 35.2027
0.9 34.8
ENDDATATABLE
</pre>
</div>

<br>
Create a data table for the right iliac outlet flow RCR boundary condition.

```
DATATABLE RCR_VALS LIST
0.0 90
0.0 0.0008
0.0 1200
ENDDATATABLE
```

<br>
Create a data table for the left iliac outlet flow RCR boundary condition.

```
DATATABLE RCR_VALS_2 LIST
0.0 100
0.0 0.0004
0.0 1100
ENDDATATABLE
```

<br>
Create a material named **MAT1** for an OLUFSEN consitutive model with the following parameters
<p style="font-size:11px">
<i>
name = MAT1,
type = OLUFSEN,
density =  1.06,
viscosity = 0.04,
pressure = 113324.0,
exponent = 1.0,
$k\_1$ = 2.0e7,
$k\_2$ = -22.5267,
$k\_3$ = 8.65e5 
</i>
</p>

```
  MATERIAL MAT1 OLUFSEN 1.06 0.04 113324.0 1.0 2.0e7 -22.5267 8.65e5
```

<br>
Set the solver following solver options
<p style="font-size:11px">
<i>
time step = 0.001, 
save results frequency = 15,
number of time steps = 10000, 
number of finite element quadrature points = 2,
inlet boundary conditions data table name = AORTAFLOW, 
inlet boundary condition type = FLOW,
convergence tolerance = 1.0e-6, 
formulation type = 1 (conservative formulation),
stabilization = 1 (use stabilization) 
</i>
</p>

```
SOLVEROPTIONS 0.001 15 10000 2 AORTAFLOW FLOW 1.0e-6 1 1
```

<br>
Set results to be written for each segment in a separate text file for the flow rate, pressure, area and Reynolds number.

```
OUTPUT TEXT
```

<br>
<h3> Results </h3>
The results of the simulation are shown using the following graphs.

<br>
<figure>
  <img src="documentation/rom_simulation/1d-solver/images/Ex01-plottingExample_01.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <img src="documentation/rom_simulation/1d-solver/images/Ex01-plottingExample_03.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>


