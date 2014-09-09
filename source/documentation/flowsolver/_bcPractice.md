### Boundary Condition Specification: the Practical Side of the Problem

Once we know the “physical conditions” for the model, it is time to prescribe them in the computer model using SimVascular. As we previously anticipated, this is done by entering the adequate commands in the *.supre file. This is really the input file of the SimVascular/PreSolver program.
As we also mentioned before, this can be done using SimVascular’s GUI or by editing the *.supre file with your favorite text editor (VI, pico, emacs, notepad...). We will show here the way to do using the GUI.

The first thing, however, is to take care of the boundary conditions prescribed at the inlet face of the model $\Gamma_g$ . This will generate a file called bct.dat . We’ll explain next how to generate this file.

#### Generating a bct.dat file

In the SimVascular GUI window, go to the Boundary Conditions-> Analytic B.C. tab. You will have to enter the following values in the various boxes/buttons of the GUI (see figure below):

- Under the “Shape of Profile” menu, select the “parabolic” radio button.
- In the “Solid Model” box, make sure the right name of the model shows up (in this case, cylinder-steady.xmt_txt , and load it again clicking on the “load” button.
- In the “Mesh Face File (.vtk)” box, click on the “Browse” button and select the file
inflow_mesh_face.vtk .
- In the “Flow Rate File” box, click on the “Browse” button and select the desired *.flow
file in the “flow-files” folder. In this case, the file is inflow.flow .
- Under the “Parameters” menu, enter the following values:

+ “period”: 0.3 sec. For a steady flow problem like ours, the concept of “period” is somewhat vague. In this case, 0.3 means the amount of physical time that we are going to run our simulation for.
+ “viscosity”: 0.04 poise (gr/cm/s). 

**WARNING**: Be very careful with the units! This is one the points where it is easy to make a mistake with the dimensions. For consistency, besides entering the right numerical value, try to also modify the units listed next to it (see figure below).


+ “density”: 1.06 gr/cm 3 . Same as before, be very careful with these  units!
+ “face name”. Here, you must enter inflow . Remember this is name of the
inflow face of our parasolid model.

- Under the “ Output Parameters” menu, enter the following values:

+ “num of periods”: always enter 1 here. If you want to run your simulation
for multiple cardiac cycles, it is possible to ask SimVascular/Solver to loop over the information given by the bct.dat file for just one cycle (sing
the solver.inp file). By doing this, you will minimize the size of this file
that can potentially be very large. 
+ “num pts in period”: 2. This is the number of “temporal” data points that you want to have in your bct.dat. This is not necessarily the number of time points in the *.flow file. In this case, they match (2 in both cases), but this is because this is a very simple example using steady flow and two
time points is all we need to characterize a constant flow. In general, your
*.flow file will have in the order of 20 data points over the cardiac cycle
(that’s about how many points you will be able to reconstruct using PC-
MRI, for example), and your bct.dat will have on the order of 100-200
points. Whatever is enough to have a smooth representation of the inflow
wave mapping to velocity vectors at the inlet face.
+ “num fourier modes”:

WARNING: Be careful with this!. In this Boundary Conditions->Analytic B.C. tab, SimVascular is doing a Fourier Series approximation of the data that you provide in the *.flow file. Since in this case, our data is constant flow, we only need one Fourier mode to capture this appropriately. For pulsatile flow problems, we will need more Fourier Modes to accurately represent the *.flow data (usually, 10 Fourier modes is enough for a pulsatile problem) After you are done entering all these parameters, click on the “PHASTA” button of the “Create Files” menu to generate the bct.dat file. 

Now we have our bct.dat file. The format of this file is as follows:

~~~
np nl
x1 y1 z1 nl
vx1  vy1  vz1  t1
 .    .    .    .
 .    .    .    .
 .    .    .    .
vxnl vynl vznl tnl
 .    .    .    .
 .    .    .    .
 .    .    .    .
xnp  ynp  znp   nl

vx1 vy1 vz1 t1
 .   .   .   .
 .   .   .   .
 .   .   .   .
~~~

The file defines the spatial and temporal definition of the inflow boundary condition. The spatial definition gives np point-wise input blocks of the values for velocity. In this case, np = 72, this is the total number of nodes on the face “ inflow”. The temporal definition is given by nl input lines of the values at a certain position for nl time points, t 1 to t nl. In this case, nl = 2 points (this is the value we entered in the “num pts in period” box. 

Each block of data has, for each of the np =72 spatial points, the following info:

- The coordinates of the point: x1 x2 x3 and the number of time points nl
- The list of velocity vectors vx vy vz at time point t.

### Processing the *.supre file

To process the *.supre file, entering the appropriate commands to define the boundary conditions of this problem, we go to the Simulations->Create 3-D Solver Files tab. In the “Create SUPRE script file” menu (see figure  below), make sure that the right *.supre file is loaded in the box (in this case, it should be cylinder-steady.supre . Click on the “Load SUpre scriptfile” button. The following screen will appear:

The contents of the *.supre script file are:

~~~
number_of_variables 5
number_of_nodes 21172
number_of_elements 97032
number_of_mesh_edges 124958
number_of_mesh_faces 200819
nodes cylinder-steady.coordinates.gz
elements cylinder-steady.connectivity.gz
boundary_faces all_exterior_faces.ebc.gz
adjacency cylinder-steady.xadj.gz
prescribed_velocities prescribed_velocities.nbc.gz
noslip wall.nbc.gz
zero_pressure zero_pressure.ebc.gz
set_surface_id all_exterior_faces.ebc.gz 1
write_geombc geombc.dat.1
write_restart restart.0.1
~~~

As we said before, each line of this *.supre file represents a command that will be executed by SimVascular/PreSolver. This file needs to be edited to incorporate the right parameters/conditions for this problem. This is the way we are going to do it for this problem. The first nine lines are correct and do not need to be modified. These lines describe all the  necessary geometrical parameters of our problem. We will provide a detailed list of all the commands later, but for now let us say that the line with the “number of variables 5” command means that we will be solving a problem with 5 unknowns per node (pressure, vx, vy, vz and a scalar T). In  practice, for most cases we really do not solve for the scalar parameter T.

Here are the lines that we need to modified/add to the script.

~~~
prescribed_velocities prescribed_velocities.nbc.gz
~~~

should be changed to

~~~
prescribed_velocities mesh-surfaces/inflow.nbc.gz
~~~

Note that we are just pointing to the right file (inflow.nbc.gz) in the mesh-surfaces folder where we want some velocity vectors to be prescribed.  These velocity vectors are given by the bct.dat file. We must use this command “prescribed_velocities” in each surface where we prescribe some flow wave via a Dirichlet condition on the velocity vectors of that face. 

This is why we use the *.nbc.gz file of the file (nodal points), instead of the *.ebc.gz file (element connectivities).

~~~
noslip wall.nbc.gz
~~~
should be changed to

~~~
noslip mesh-surfaces/wall.nbc.gz
~~~

Like before, we are only pointing to the right path of the surface file where we want to prescribe the nonslip (rigid wall) condition. This is also a Dirichlet condition that makes all the velocity vectors of the nodes of the surface “wall” to be zero. 

~~~
zero_pressure zero_pressure.ebc.gz
~~~

should be changed to

~~~
zero_pressure mesh-surfaces/outlet.ebc.gz
~~~

Again, we are providing the right path to the desired face. This condition deserves a couple of special comments:


1. By using this condition, we are making the face “outlet” into a “weakly-pressure” face. This is mathematically expressed by the expressions we saw before:

p = p 0 + R Q
1 t
p ( t ) = p 0 + ∫ Z ( t − τ ) Q ( τ ) d τ
T t − T

This expression sets p 0 = 0 for the face “outlet”. The total pressure set on that face will be the result of the flow-pressure operator considered (i.e., resistance, impedance, RCR, etc).


2. This command is now operating on the *.ebc.gz file (element connectivity). This is the result of using a weakly applied pressure  condition, instead of Dirichlet condition.

The command

~~~
set_surface_id all_exterior_faces.ebc.gz 1
~~~

is correct and needs no modifications (note that this is already pointing to the right file in the right folder –the current folder). 

**HINT**: This line tags all the exterior faces of the model with an identifier (a Suface ID) , in this case, the number one. We will use it later on to calculate the wall shear stress on all the exterior faces of the model. We will learn more about Surface ID’s next.We must introduce a new command if we want to activate the resistance boundary condition we
want to use at the outlet face. We had previously determined we want to prescribe a resistance of R = 84917 dynes·s/cm 5 . 

In order to do this, we need to assign a Surface ID that will help us later
on identify the face and assign the right resistance. This is a trivial case, because we only have one single outflow face, and therefore one single resistance. But imagine one case where we had many more (eighteen, for example, see figure below). In this case, it is very important to  meticulously label all the outlet faces with a meaningful name, and to make a sketch that helps you remember the list of Surface IDs that you considered
in your model. Each surface ID will have a corresponding Resistance value (or impedance function, or set of RCR parameters). 

Going back to our *.supre file, we need to add a line specifying the  surface ID for the outlet face. An obvious choice is the number 2.

~~~
set_surface_id mesh-surfaces/outlet.ebc.gz 2
~~~

Note again that this condition is acting on the *.ebc.gz file of the face.
The last two lines of the *.supre file do not need to be modified. These lines are the culmination of all the work you have been doing in SimVascular to this point! 

~~~
write_geombc geombc.dat.1
write_restart restart.0.1
~~~

They generate two files (geombc.dat.1) and (restart.0.1) that are taken  directly by SimVascular/Solver to run the flow analysis. These are binary files.

- geombc.dat.1 contains the combination of geometry and boundary conditions specified in the problem.
- restart.0.1 contains the set of initial conditions for our problem. We haven’t said anything about initial conditions till now. If you do not do something different, SimVascular will specify an almost-zero velocity initial condition for all the nodes of the mesh and a zero pressure “initial condition”. Here, the number “0” refers to “time step zero”, as it corresponds to the first file of the simulation.

After all these considerations, the list of parameters in the *.supre file should look like this:

~~~
number_of_variables 5
number_of_nodes 21172
number_of_elements 97032
number_of_mesh_edges 124958
number_of_mesh_faces 200819
nodes cylinder-steady.coordinates.gz
elements cylinder-steady.connectivity.gz
boundary_faces all_exterior_faces.ebc.gz
adjacency cylinder-steady.xadj.gz
prescribed_velocities mesh-surfaces/inflow.nbc.gz
noslip mesh-surfaces/wall.nbc.gz
zero_pressure mesh-surfaces/outlet.ebc.gz
set_surface_id all_exterior_faces.ebc.gz 1
set_surface_id mesh-surfaces/outlet.ebc.gz 2
write_geombc geombc.dat.1
write_restart restart.0.1
~~~

Now, click on the “Save SUpre scriptfile” button (this will save the updated version of the *.supre file containing your changes), and then click on “Run SUpre”. This is what actually runs SimVascular/PreSolver. A window will pop up, and you will see the list of commands of your *.supre file being executed. After a few seconds (or minutes, depending on the size of the problem), the files geombc.dat.1 and restart.0.1 will be generated.

You can do the same if, instead of using SimVascular’s GUI, you edit the *.supre file like shown before, and then, from the command line, type:

~~~
%presolver steady-cylinder.supre
~~~

**HINT**: In both files, the number “.1” refers to the “partition number” of the file. Remember SimVascular/Solver has the ability of running a problem “in parallel” (i.e., using multiple processors or computing cores), using MPI (message-passing interface). When we run a job using multiple processors, the first thing that happens is the “splitting” of these two files into as many processors we are going to use in our analysis, so the calculations can be performed faster. For example, if we use 4 processors in our analysis, these files will be split as follows:

~~~
geombc.dat.1 => geombc.dat.1 , geombc.dat.2 , geombc.dat.3 , ...

restart.0.1 => restart.0.1 , restart.0.2 , restart.0.3 , ...
~~~

Roughly speaking, each of the four files is 1⁄4 of the size of the original un-split file. For a generic time step “n”, the solution will be given by the following files:

~~~
restart.n.1 , restart.n.2 , restart.n.3 , restart.n.4 , ...
~~~

We are almost done. There is only one thing left in the SimVascular/PreSolver part: to generate the numstart.dat dat. To do this, click on the “Create File” button under “Create PHASTA Analysis Files” (top to the GUI). 

This file is really simple: it contains the scalar “0”. This number is used by the solver to identify the restart file that should be used as initial condition. In this case, since this file is restart.0.1, the file numstart.dat should contain a “0”. If for whatever reason, the initial file of our simulation was restart.300.1, the numstart.dat file should have a “300” entry. The value stored in this file gets updated as the simulation advances
in time (we will see this later one).

List of *.supre commands

~~~
Entry
Format
ascii_format
verbose
number_of_nodes
number_of_elements
number_of_mesh_edges
number_of mesh_faces nnodes
nelm
nedges
nfaces
number_of_scalars nscalars
solve_for_temperature
number_of_variables
phasta_node_order
nodes
elements
boundary_faces
adjacency
set_surface_id
noslip
prescribed_velocities
zero_pressure
pressure
nvars
Description
Indicator if the output files are in ASCII format.
Default:false (output files are in binary format)
Indicator to print progress.
Default: off (no progress information)
Number of nodes in the model
Number of elements in the model
Number of mesh edges in the model
Number of mesh faces in the model
Number of scalar (advection-diffusion)
equations solved. Default: 0, maximum: 4
Solve a heat transport equation. Default: off
Number of variables in the model.
Default: 0, usually 5: ( v x ,v y ,v z , p,T )
Indicator if the element connectivity is ordered
according to MeshSim or SCOREC convention.
Default: off (MeshSim ordering)
<filename>
Name of file with nodal coordinates
<filename>
Name of file with element connectivity
Name of the file with the element face data of
<filename>
elements of the boundary
<filename> Name of the file with the element adjacency info
Name of the file with the element face data
and the surface ID of the face. Mostly used
to tag exterior surfaces for Boundary
<filename> id
Condition attributes, and also to compute
tractions at the boundary
Name of the file with the nodes where the
<filename>
noslip condition will be applied. Tags
code=56 to the nodes defined in <filename>
Name of the file with the nodes with a
<filename>
Dirichlet boundary condition coming from
a bct.dat file. Set code=56 to the nodes
Name of the file with element face connectivity
data with a prescribed pressure boundary
<filename>
condition equal to zero. Tags code=2 to
the element faces
Name of the file with element face connectivity
data with a prescribed pressure boundary
<filename> p
condition equal to p. Tags code=2 and pressure
p to the element faces
39Entry Format
write_restart <filename>
write_geombc <filename>
read_restart_solution <filename>
read_restart_displacements <filename>
read_restart_accelerations <filename>
read_displacements <filename>
Description
Name of the SimVascular/Solver restart file.
Hard-coded file name: restart.0.1
Name of the SimVascular/Solver geombc file.
Hard-coded file name: geombc.dat.1
Command that reads a previously computed
restart solution (velocity and pressure fields).
This is used in deformable wall simulations
Command that reads a previously computed
restart solution (displacement field). This is
used in deformable wall simulations
Command that reads a previously computed
restart Solution (acceleration field).
This command reads the displacements that
define the initial stress of the vessel wall
structure from an external ASCII file. This is used
In conjunction with “read_restart_solution” and
Requires a “write_restart” command
read_temperature <filename>
read_scalars <filename>
initial_pressure p 0
initial_velocity vx0, vy0, vz0
initial_temperature T 0
deformable_wall <filename>
fix_free_edge_nodes <filename>
deformable_create_mesh <filename>
deformable_write_vtk_mesh <filename>
File with the temperature field at all nodes.
Format: nodeID theta
File with the scalar fields at all nodes.
Format: nodeID, s1, s2, ..., snumberofscalars
Value of the initial pres. in the model. Def. p 0 = 0
Value of the initial velocity in the model.
Default: v0 = 0.001, 0.001, 0.001
Value of the initial temperature in the model.
Default: T 0 = 0.0
Name of the file with element face
connectivity data of elements at the vessel
wall. This is used to run deformable wall
problems. Tags code=16 to the element
faces defined in <filename>
Name of the surface representing the vessel
wall. This condition fixes the edges of
this face with a zero-displacement condition
This command generate a new Finite Element
Mesh with the nodes and elements on the
Face given by <facename>, with the purpose
of solving the solid mechanics finite element
problem of the pressurization of
that surface with the fluid’s internal pressure
Write the mesh of the deformable wall
boundary to VTK legacy-format file <filename>
40Entry Format
deformable_write_feap <filename>
deformable_direct_solve
deformable_solve
deformabe_Evw Ewall
deformable_nuvw ν wall
deformable_thickness twall
deformable_kcons kwall
deformable_pressure P
append_displacements <filename>
Description
Write mesh and boundary conditions for
FEAP for <filename>
Use the direct, sparse solver for the initial
displacements of the CMM-FSI method
(deformable wall model)
Use the iterative solver for the initial
displacements of the CMM-FSI method
(deformable wall model)
Young’s modulus of the vessel wall,
assumed uniform
Poisson’s ratio of the vessel wall,
assumed uniform
Thickness of the vessel wall,
assumed uniform
Shear correction factor for the vessel wall, assumed
uniform
Pressure used to load the vessel wall structure. This
pressure should be representative of pressure of the
internal fluid. The result of this pressurization is a
“loaded” vessel wall in equilibrium with the internal
blood
This commands appends the displacement field
calculated by deformable_solve/
deformable_direct_solve commands
to the file <filename>. The file <filename> contains
the converged steady rigid wall . This command does
not need a posterior “write_restart” command
~~~

#### Final recap of the files generated by SimVascular/PreSolver

At this point, we are almost ready to run the flow solver. Along the SimVascular/PreSolver process, we have generated the following files that are direct inputs to the solver:

- **geombc.dat.1** : this file contains the combination of geometry and boundary conditions specified in the problem.
- **restart.0.1** : this file contains the set of initial conditions for our problem. 
- **numstart.dat**: this file contains the scalar “0”. This number is used by the solver to identify the restart file that should be used as initial condition.
- **bct.dat** : this file contains the history of velocity vectors at the inflow face of the model according to a prescribed flow wave coming from a *.flow file. 

We are only missing one file in order to be able to run our analysis. This file is another input file for the solver that controls the actual flow of the numerical simulation, specifying parameters such as time step size, number of time steps, number of nonlinear iterations, boundary condition control, etc. This file is in general solver.inp (input file for the solver), and we will characterize it in detail in the following section.

These five files are the bare minimum we need to run an analysis. However, if we want to perform more complicated simulations, involving more complex boundary conditions, we will need more input files. This will be the focus of one of our “Advanced Simulation Topics” lectures, but here’s the list of additional files you will need for the different simulations:

#### Impedance Boundary Condition simulations :

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide impedance functions in the time domain for each impedance outlet, as well as a history of flow rates for each outlet. Remember the way the pressure is computed when this Impedance Boundary Condition is used:

1 t
p ( t ) = p 0 + ∫ Z ( t − τ ) Q ( τ ) d τ
T t − T
Imped. Flow Histor.


We will have therefore two additional ascii files: impt.dat (containing the impedance functions for each of the outlets), and Qhistor.dat (containing the flow rate history)

#### RCR Boundary Condition simulations :

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide the RCR parameters in a ascii file that will set the relationship between flow and pressure on each outflow face. This is done by defining a file named rcrt.dat containing such parameters. We are now done with the SimVascular/PreSolver part. Let’s move on to SimVascular/Solver, define the solver.inp file and run the analysis.


