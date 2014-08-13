## Overview

### Process flow of a SVFLOWSOLVER Simulation 

The following figure contains a schematic representation of a flow chart of the processes involved in running a SimVascular/Solver simulation. We start off with the files coming from the solid modeling part of the analysis: these files characterize the different entities of the finite element mesh.

We then run SimVascular/Presolver using the *.supre file. The *.supre file contains the set of instructions that define the boundary conditions, initial conditions, and geometrical configuration of our problem. The output of SimVascular/Presolver is a set of files that are ready to be taken by SimVascular/Solver to run a blood flow analysis.

Once the analysis is finished, we have a number of files that characterize the finite element solution over the cardiac cycles. These files are taken by SimVascular/Postsolver to generate visualization files (*.vis or *.vtu files) that are used to analyze the results and extract the desired hemodynamic results. 

In the following sections of this tutorial we will describe all the parts of this flow chart in detail. 

### Units in a SVFLOWSOLVER Analysis

SVFlowsolver, just like many other Finite Element Programs, does not enforce a consistent set of physical units in the analysis, but it is up to the analyst to make sure that this dimensional consistency is respected in the analysis.

To have a consistent set of units, users are advised to either work in CGS, MGS, or SI units; see the following table. 

| Quantity  | CGS Unit | MGS Unit | SI Unit |
|:---------:|:--------:|:--------:|:-------:|
| Length    | cm       | mm       | m       |
| Mass      | gr       | gr       | Kg      |
| Time      | s        | s        | s       |

### Useful constants in a SVFLOWSOLVER Analysis

The following table gathers several important physical constants of blood given in different unit
systems.


Property
CGS Unit
MGS Unit
SI Unit
Dynamic viscosity 0.04 poise
0.004
0.004
[gr· cm -1 · s -1 ] [gr· mm -1 · s -1 ] [Pa· s -1 ]
μ [M· L -1 · T -1 ]
Blood density
1.06
0.00106
1060
[gr· cm -3 ]
[gr· mm -3 ]
[Kg· m -3 ]
ρ [M· L -3 ]

## Pre-processing: SIMVASCULAR/PRESOLVER

SIMVASCULAR/PRESOLVER is the preprocessor for SVFlowsolver. The program input are the files describing the discretization: nodal coordinates, element connectivity, nodal boundary and element boundary connectivity, and element adjacency information. Running SIMVASCULAR/PRESOLVER using the right parameters on a *.supre file generates the input files  for SVFlowsolver.

The SIMVASCULAR/PRESOLVER program is called either from the command line in cygwin or using SIMVASCULAR ’s GUI. The input files for SIMVASCULAR/PRESOLVER are the set of files that are generated after a mesh is created in the final steps of the geometric modeling part of the analysis. We will review this process briefly in the following example of steady flow through a cylinder. 

### Initial files coming from the Solid Modeling Part

We assume that we have a solid model (*.xmt_txt) file, and information about the inflow wave
that we will prescribe at the inlet(s) face(s) of the model. In this example, the input parasolid file is cylinder-steady.xmt_txt Furthermore, we have a solver.inp file whose meaning will be explained later. 

The files for this example can be found in the directory %SIMVASCULAR_HOME%/cylinder-steady

HELPFUL HINT: It is highly recommended to start this ‘simulation part’ of the analysis with a
clean set of files. Also, try to name your *.xmt_file with the same name as the containing folder
(in this case, both the folder and the *.xmt_txt file are named cylinder-steady). It will make the
process of loading files simpler.
It is also advisable that you place the flow files in a folder called “flow-files”. Your problem may have more that one inflow wave file.

In this case, we only have a single flow file (called inflow.flow), see figure bellow
The format of this file is as follows:
# Time (sec)
0
-1.570
0.3 -1.570
Flow (cc/sec)
The first line is a comment line that you don’t need to include, but it helps to remember what
units you used in the analysis.
Then, two columns of numbers follow. The first column contains time values, and the second
column flow values.
14WARNING: please note that flow coming INTO the model (forward flow) will have a negative
sign, (like in the example considered here), whereas flow coming OUT OF the model (backflow)
will be positive.
A good way to remember that is that in the case of forward flow, the vector that gives you the
direction of the flow and the normal to the face of the model point in opposite directions, and
therefore their dot product will be negative
On the other hand, in a situation of back flow, the numerical value in the *.flow file with be
positive
In this problem, since we are studying a steady case, out physical time goes from 0.0 to 0.2
seconds, and the flow is constant with a value of 1.570 cc/sec. We are therefore considering a
very simple problem of steady flow through a cylinder.
HELPFUL HINT: it is very important that you are absolute sure about the physical dimensions
of your model: every unit (length, time, flow, density, etc.) in your analysis must be
dimensionally consistent. A quick way to check the dimensions of your model is to type in the
SimVascular Command Console window:
%
solid_readNative
<nameofthefile.xmt_txt>
–obj
<nameoftheobject>
-file
This generates an object called “nameoftheobject”
% nameoftheobject GetPolyData –result <nameofthepolydata>
This generates a Polydata called “nameofthepolydata” that we can query for dimensions.
% geom._bbox –obj nameofthepolydata
This command will give you the dimensions of a boundary box that tightly encloses our model
(x_min, x_max, y_min, y_max, z_min, z_max)
15In this case, our cylinder is bounded by a box of 0.4x0.4 in the xy plane, and it has a length of 9
in the z direction of space. These dimensions are given in cm. In short, we have a cylinder of
radius r=0.2 cm and length L=9 cm.
W e can start the process now. First, launch SimVascular in the folder where you have the
* .xmt_txt file and the flow-files folder. In the ->File->Load Files menu, make sure that for all the
possible instances of a parasolid model, you load the file *.xmt_txt (from this point on, we only
have one “version” of the solid model). See figure below:
16HELPFUL HINT: After loading all these *.xmt_txt instances, go to ->File->Save Options and
click on the “Save Options” button to save a *.patient file containing the names of all the files
you will be generating for this problem. This patient file is automatically loaded the next time
you launch SimVascular in this folder. It’s a convenient way of accessing your files in a faster
way in the future.
17HELPFUL HINT: At this point, you must make sure as well that your model has appropriate
names for all the faces. For example, the inflow should be named “inflow”, the outflow(s) should
have meaningful names to you (for example, in an model with multiple outflows, a good choice
of names could be the name of the different vessels), and the vessel wall faces should be named
“wall” (if you only have one face) or “wall_*” where * represents the name of the artery under
consideration (for example, wall_renal).
To check this quickly, go to the Solids->View Model tab, click on the “File Input/Output” button
and select “Read Model”, select the *.xmt_txt file in the window.
18Once you do this, a new window called “SimVascular 3-D Graphics Window” will pop up,
displaying the model.
Also, in the SimVascular GUI, you will have a list of Face Ids. If you click on them, you will be
able to see what name the face associated with that id has. Alternative, you can also right-mouse-
click in the SimVascular 3-D Graphics Window, place the mouse pointer on top of a face of the
model, click the key “p” (for “pick”), and see what face name it has in the SimVascular GUI.
Let’s go now to the meshing menu to generate the mesh and the rest of the input files that will be
used by S IM V ASCULAR /P RE S OLVER
In the Meshing->Mesh Options tab, enter a value of 0.05 (cm) in the “Global Max Edge Size”
box. This will give us approximately 8 finite elements across the diameter of the vessel (recall
that the diameter of this cylinder is D = 2r = 0.4 cm)
19Click on the “Run Mesher (Internal)” button to generate the finite element mesh. This process
will take a few seconds.
This will generate an isotropic mesh with 97,032 elements and 21,172 nodes.
2021Now, click on the “Write Output Files” button to generate all the files that
S IM V ASCULAR /P RE S OLVER will need.
These files are:
- all_exterior_faces.ebc.gz
This file contains the element connectivity of all the exterior faces (i.e., faces on the
boundary) of the model. The format of this file is as follows:
element_number face_ID node1 node2 node3
Notes:
1. The face_ID label is currently ignored.
2. This format is common to all the *.ebc files. Once again, the *.ebc files contain the
element connectivities of the boundary elements. These elements are triangles (the
boundary on a tetrahedron is a triangle), and therefore have three nodes per element.
- cylinder-steady.connectivity.gz
This file contains the element connectivity of all volumetric mesh (i.e., the tetrahedra filling
the volume of the model). The format of this file is as follows:
element_label node1 node2 node3 node4
22- cylinder-steady.coordinates.gz
This file contains the coordinates of all the nodes of the mesh. The format of this file is as
follows:
node_label x_coord y_coord z_coord
- cylinder-steady.sms
This file is the mesh database, in the MeshSim format
- cylinder-steady.supre
This is the input file of S IM V ASCULAR /P RE S OLVER . The format of this file will be the main
point of the following section, but for now you should keep in the mind that this is the file
that contains the instructions for the Boundary Condition specifications of our problem.
- cylinder-steady.xadj.gz
This file contains the element adjacency
How can we be more specific here?
- inflow_mesh_face.vtk
This file is a vtk representation of the face of the model named “inflow”. We will use it later
on to prescribe the analytic velocity profile according to the inflow.flow data.
There is also a “mesh-surfaces” folder that contains, for each face of the model, the following
files (see figure below):
-
-
-
An boundary element connectivity *.ebc.gz file
A nodal boundary *.nbc.gz file. These files contain the list of nodes that belong to that
face.
A *.vtk face that could be use for visualization purporses.
23Boundary Condition Specification: the Physical Side of the Problem
The first question we need to address when specifying boundary conditions for a problem is to
think about what kind of things are going on at the boundaries of our model from a physical
standpoint. To do this, we need to know some physiologic information about our problem, for
instance:
- Flow rate info coming from MRI or ultrasound measurements.
- Pressure values in the model obtained with a catheter transducer or a pressure cuff.
- Vessel wall elastic properties (if we are modeling the vessel walls as deformable).
24From a conceptual standpoint, no matter how geometrically complex a vascular model (we’ll
refer to this as “ Ω ”) is, its boundaries can be classified into three groups (see figure above):
- An inflow boundary Γ g . This is the set of face(s) of the model where we will prescribe a
-
-
flow wave that we obtain from a clinical measurement.
A vessel wall boundary Γ s . This boundary represents the interface between the fluid
domain and the vessel wall. In the physical world, this boundary is lined by a layer of
endothelial cells. The treatment of this boundary can be pretty complex. In general, to
this date, most of the blood flow simulations consider the so-called rigid wall
assumption whereby, as a first approximation, the motion of the vessel wall due to the
interaction with the internal pulsatile flow is neglected. Under these circumstances, a zero
velocity condition is applied on these surfaces. In this tutorial, we will adopt this
simplification, but we will also how to run a deformable wall analysis.
An outflow boundary Γ h . On this boundary, we will typically prescribe a constant
pressure (by constant we mean CONSTANT OVER THE FACE, spatially, not
necessarily temporally) in a “weak manner”. We don’t want to get into too much detail
about this here, but here are a couple of notes about this type of boundary:
o A “weakly applied” pressure means that we are not prescribing nodal values of
pressure at the nodes of the outlet face in a Dirichlet way. If we did this, we
would be using the *.nbc.gz file (file containing the list of nodes on that face) of
that face to apply this condition. Instead, we applied this pressure by enforcing
that the integral of the pressure field on that face must be a certain value. In doing
this, we make use of the *.ebc.gz file (the file containing the element connectivity
of that face)
o These boundaries have an absolutely critical impact on the numerical simulation
results. The Taylor lab has developed a number of boundary conditions
techniques that allow prescribing a weak pressure in a way that takes into account
the effects of the downstream vasculature on the vascular model (see figure
below). These boundary conditions include:
 Resistance Boundary condition. Here, the condition prescribed on the face
is a relationship between flow and pressure of the form:
p = p 0 + RQ
where R is the resistance parameter that characterizes the downstream
vasculature, p is the weakly prescribed pressure, Q is the flow rate passing
through the face and p 0 is a “flag” that sets the boundary as a “weakly-
prescribed pressure boundary”. This flag has a “zero” numerical value, so
the total value of the pressure on that face is simply given by RQ.

Impedance Boundary condition. Here, the condition prescribed on the face
is a relationship of the form:
1 t
p ( t ) = p 0 + ∫ Z ( t − τ ) Q ( τ ) d τ
T t − T
where Z is the Inverse Fourier Transform of an impedance function that
characterizes the downstream vasculature, p is the weakly prescribed
pressure, Q is the flow rate passing through the face, and T is the cardiac
cycle.
2526The mathematical definition of an impedance function is:
P ( ω )
Z ( ω ) =
, ω =0,1,2,...
Q ( ω )
That is, a relationship between pressure and flow modes for different
frequencies. The figure above shows the typical shape of these
impedances as a function of the frequency in the human iliac artery under
rest and exercise conditions. Getting a good characterization of these
impedance functions is once again critical to accurately represent the way
blood flows in our computational domain.

RCR lumped parameters condition. In this boundary condition type, we
use a “reduced-order” of the downstream vasculature, considering an
electric circuit analog. In this theory, the behavior of the vasculature is
represented by three parameters: a proximal resistance R p , a capacitance C,
and a distal resistance R d .
Boundary conditions considered in this problem
Before we move on, let us recap the type of “physical problem” we are solving: the geometry
used in this problem consists of an idealized blood vessel, represented by a cylindrical segment
with a radius r of 0.2 cm and length L of 9 cm (see figure below).
We prescribe an idealized constant inlet volumetric flow rate Q of 1.570 cc/sec to a parabolic
profile at the inlet face of the model ( Γ g ). The dynamic viscosity μ and density ρ of the blood
are 0.04 poise and 1.06 gr/cm 3 , respectively. The lateral surface of the vessel ( Γ s ) is considered
to be rigid (therefore, we will apply a zero-velocity condition there). As for the outlet boundary
( Γ h ), a spatially-constant pressure boundary condition is weakly enforced via a Resistance R. In
27this problem, we will consider a resistance of R = 84917 dynes·s/cm 5 . This resistance will give a
(weakly-applied) pressure at the outlet face of
p = p 0 + RQ = 0 + 84917 ⋅ 1 . 57 = 133319.69 ≈ 100 mmHg
(recall that 1mmHg = 1333.2 dyn/cm 2 ).
For steady flow in a long tube with a circular cross section, the flow will develop a flow profile
known as the Poiseuille flow profile assuming the flow remains laminar. The flow will remain
laminar in a circular tube assuming that the non-dimensional parameter given by the Reynolds
number Re is Re < 2100.
The definition of the Reynolds number is given by:
Re =
ρ DV
μ
where V is a representative velocity of the flow, D is a characteristic dimension of the vessel
where the flow is happening (in this case, the diameter), and μ and ρ are the dynamic
viscosity and density, respectively.
For this problem, the Reynolds number is 125, so it is well within the laminar flow regime.
For a fully developed flow, the axisymmetric profile is parabolic and is given by:
⎛ ⎛ a ⎞ 2 ⎞
v z ( a ) = v z max ⎜ 1 − ⎜ ⎟ ⎟
⎜ ⎝ r ⎠ ⎟
⎝
⎠
max
where v z is the maximum velocity at the center of the vessel, a is the radial coordinate from
center of the vessel 0 ≤ a ≤ r . The expression for maximum velocity is given by
v z max = 2
Q
π r 2
where Q is the volumetric flow rate. The wall shear stress τ , is given by
2 μ v z max
τ =
r
For this example, the maximum velocity is v z max = 25 cm/s and the wall shear stress is τ = 10
dynes/cm 2 .
28Boundary Condition Specification: the Practical Side of the Problem
Once we know the “physical conditions” for the model, it is time to prescribe them in the
computer model using SimVascular. As we previously anticipated, this is done by entering the
adequate commands in the *.supre file. This is really the input file of the SimVascular/PreSolver
program.
As we also mentioned before, this can be done using SimVascular’s GUI or by editing the
*.supre file with your favorite text editor (VI, pico, emacs, notepad...). We will show here the
way to do using the GUI.
The first thing, however, is to take care of the boundary conditions prescribed at the inlet face of
the model Γ g . This will generate a file called bct.dat . We’ll explain next how to generate this
file.
Generating a bct.dat file
In the SimVascular GUI window, go to the Boundary Conditions-> Analytic B.C. tab. You will
have to enter the following values in the various boxes/buttons of the GUI (see figure below):
- Under the “Shape of Profile” menu, select the “parabolic” radio button.
- In the “Solid Model” box, make sure the right name of the model shows up (in this case,
cylinder-steady.xmt_txt , and load it again clicking on the “load” button.
- In the “Mesh Face File (.vtk)” box, click on the “Browse” button and select the file
inflow_mesh_face.vtk .
- In the “Flow Rate File” box, click on the “Browse” button and select the desired *.flow
file in the “flow-files” folder. In this case, the file is inflow.flow .
- Under the “Parameters” menu, enter the following values:
 “period”: 0.3 sec. For a steady flow problem like ours, the concept of
“period” is somewhat vague. In this case, 0.3 means the amount of
physical time that we are going to run our simulation for.
 “viscosity”: 0.04 poise (gr/cm/s). WARNING: Be very careful with the
units! This is one the points where it is easy to make a mistake with the
dimensions. For consistency, besides entering the right numerical value,
try to also modify the units listed next to it (see figure below).
 “density”: 1.06 gr/cm 3 . Same as before, be very careful with these units!
 “face name”. Here, you must enter inflow . Remember this is name of the
inflow face of our parasolid model.
- Under the “ Output Parameters” menu, enter the following values:
 “num of periods”: always enter 1 here. If you want to run your simulation
for multiple cardiac cycles, it is possible to ask SimVascular/Solver to
loop over the information given by the bct.dat file for just one cycle (using
the solver.inp file). By doing this, you will minimize the size of this file
that can potentially be very large.
 “num pts in period”: 2. This is the number of “temporal” data points that
you want to have in your bct.dat. This is not necessarily the number of
time points in the *.flow file. In this case, they match (2 in both cases), but
this is because this is a very simple example using steady flow and two
29time points is all we need to characterize a constant flow. In general, your
*.flow file will have in the order of 20 data points over the cardiac cycle
(that’s about how many points you will be able to reconstruct using PC-
MRI, for example), and your bct.dat will have on the order of 100-200
points. Whatever is enough to have a smooth representation of the inflow
wave mapping to velocity vectors at the inlet face.
30
“num fourier modes”: 1. WARNING: Be careful with this!. In this
Boundary Conditions->Analytic B.C. tab, SimVascular is doing a Fourier
Series approximation of the data that you provide in the *.flow file. Since
in this case, our data is constant flow, we only need one Fourier mode to
capture this appropriately. For pulsatile flow problems, we will need more
Fourier Modes to accurately represent the *.flow data (usually, 10 Fourier
modes is enough for a pulsatile problem)
After you are done entering all these parameters, click on the “PHASTA” button of the “Create
Files” menu to generate the bct.dat file.
Now we have our bct.dat file. The format of this file is as follows:
np nl
x1 y1 z1 nl
vx1 vy1
vz1
.
.
.
.
.
.
.
.
.
vxnl vynl vznl
.
.
.
xnp ynp znp nl
vx1 vy1
vz1
.
.
.
.
.
.
.
.
.
t1
.
.
.
tnl
t1
.
.
.
The file defines the spatial and temporal definition of the inflow boundary condition. The spatial
definition gives np point-wise input blocks of the values for velocity. In this case, np = 72, this is
the total number of nodes on the face “ inflow” .
The temporal definition is given by nl input lines of the values at a certain position for nl time
points, t 1 to t nl . In this case, nl = 2 points (this is the value we entered in the “num pts in period”
box.
Each block of data has, for each of the np =72 spatial points, the following info:
- The coordinates of the point: x1 x2 x3 and the number of time points nl
- The list of velocity vectors vx vy vz at time point t.
31Processing the *.supre file
To process the *.supre file, entering the appropriate commands to define the boundary conditions
of this problem, we go to the Simulations->Create 3-D Solver Files tab. In the “Create SUPRE
script file” menu (see figure below), make sure that the right *.supre file is loaded in the box (in
this case, it should be cylinder-steady.supre . Click on the “Load SUpre scriptfile” button. The
following screen will appear:
32The contents of the *.supre script file are:
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
As we said before, each line of this *.supre file represents a command that will be executed by
SimVascular/PreSolver.
This file needs to be edited to incorporate the right parameters/conditions for this problem. This
is the way we are going to do it for this problem. The first nine lines are correct and do not need
to be modified. These lines describe all the necessary geometrical parameters of our problem.
We will provide a detailed list of all the commands later, but for now let us say that the line with
the “number of variables 5” command means that we will be solving a problem with 5 unknowns
per node (pressure, vx, vy, vz and a scalar T). In practice, for most cases we really do not solve
for the scalar parameter T.
Here are the lines that we need to modified/add to the script.
prescribed_velocities prescribed_velocities.nbc.gz
should be changed to
prescribed_velocities mesh-surfaces/inflow.nbc.gz
Note that we are just pointing to the right file (inflow.nbc.gz) in the mesh-surfaces folder where
we want some velocity vectors to be prescribed. These velocity vectors are given by the bct.dat
file. We must use this command “prescribed_velocities” in each surface where we prescribe
some flow wave via a Dirichlet condition on the velocity vectors of that face. This is why we
use the *.nbc.gz file of the file (nodal points), instead of the *.ebc.gz file (element
connectivities).
noslip wall.nbc.gz
should be changed to
33noslip mesh-surfaces/wall.nbc.gz
Like before, we are only pointing to the right path of the surface file where we want to prescribe
the nonslip (rigid wall) condition. This is also a Dirichlet condition that makes all the velocity
vectors of the nodes of the surface “wall” to be zero.
zero_pressure zero_pressure.ebc.gz
should be changed to
zero_pressure mesh-surfaces/outlet.ebc.gz
Again, we are providing the right path to the desired face. This condition deserves a couple of
special comments:
1. By using this condition, we are making the face “outlet” into a “weakly-pressure” face.
This is mathematically expressed by the expressions we saw before:
p = p 0 + R Q
1 t
p ( t ) = p 0 + ∫ Z ( t − τ ) Q ( τ ) d τ
T t − T
This expression sets p 0 = 0 for the face “outlet”. The total pressure set on that face will
be the result of the flow-pressure operator considered (i.e., resistance, impedance, RCR,
etc).
2. WARNING note that this command is now operating on the *.ebc.gz file (element
connectivity). This is the result of using a weakly applied pressure condition, instead of
Dirichlet condition.
The command
set_surface_id all_exterior_faces.ebc.gz 1
is correct and needs no modifications (note that this is already pointing to the right file in the
right folder –the current folder). HELPFUL HINT: This line tags all the exterior faces of the
model with an identifier (a Suface ID) , in this case, the number one. We will use it later on to
calculate the wall shear stress on all the exterior faces of the model. We will learn more about
Surface ID’s next.
We must introduce a new command if we want to activate the resistance boundary condition we
want to use at the outlet face. We had previously determined we want to prescribe a resistance of
R = 84917 dynes·s/cm 5 . In order to do this, we need to assign a Surface ID that will help us later
on identify the face and assign the right resistance. This is a trivial case, because we only have
one single outflow face, and therefore one single resistance. But imagine one case where we had
many more (eighteen, for example, see figure below)
34In this case, it is very important to meticulously label all the outlet faces with a meaningful
name, and to make a sketch that helps you remember the list of Surface IDs that you considered
in your model. Each surface ID will have a corresponding Resistance value (or impedance
function, or set of RCR parameters).
35Going back to our *.supre file, we need to add a line specifying the surface ID for the outlet
face. An obvious choice is the number 2.
set_surface_id mesh-surfaces/outlet.ebc.gz 2
Note again that this condition is acting on the *.ebc.gz file of the face.
The last two lines of the *.supre file do not need to be modified. These lines are the culmination
of all the work you have been doing in SimVascular to this poin!
write_geombc geombc.dat.1
write_restart restart.0.1
They generate two files (geombc.dat.1) and (restart.0.1) that are taken directly by
SimVascular/Solver to run the flow analysis. These are binary files.
The geombc.dat.1 contains the combination of geometry and boundary conditions specified in
the problem.
The restart.0.1 contains the set of initial conditions for our problem. We haven’t said anything
about initial conditions till now. If you do not do something different, SimVascular will specify
an almost-zero velocity initial condition for all the nodes of the mesh and a zero pressure “initial
condition”. Here, the number “0” refers to “time step zero”, as it corresponds to the first file of
the simulation.
After all these considerations, the list of parameters in the *.supre file should look like this:
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
36Now, click on the “Save SUpre scriptfile” button (this will save the updated version of the
*.supre file containing your changes), and then click on “Run SUpre”
37This is what actually runs SimVascular/PreSolver. A window will pop up, and you will see the
list of commands of your *.supre file being executed. After a few seconds (or minutes,
depending on the size of the problem), the files geombc.dat.1 and restart.0.1 will be generated.
You can do the same if, instead of using SimVascular’s GUI, you edit the *.supre file like shown
before, and then, from the command line, type:
%presolver steady-cylinder.supre
HELPFUL HINT: In both files, the number “.1” refers to the “partition number” of the file.
Remember SimVascular/Solver has the ability of running a problem “in parallel” (i.e., using
multiple processors or computing cores), using MPI (message-passing interface). When we run a
job using multiple processors, the first thing that happens is the “splitting” of these two files into
as many processors we are going to use in our analysis, so the calculations can be performed
faster. For example, if we use 4 processors in our analysis, these files will be split as follows:
geombc.dat.1 =>
restart.0.1
=>
geombc.dat.1 , geombc.dat.2 , geombc.dat.3
restart.0.1 ,
restart.0.2 ,
restart.0.3 ,
,
geombc.dat.4
restart.0.4
Roughly speaking, each of the four files is 1⁄4 of the size of the original un-split file.
For a generic time step “n”, the solution will be given by the following files:
restart.n.1 ,
restart.n.2
,
restart.n.3
,
restart.n.4
We are almost done. There is only one thing left in the SimVascular/PreSolver part: to generate
the numstart.dat dat. To do this, click on the “Create File” button under “Create PHASTA
Analysis Files” (top to the GUI). This file is really simple: it contains the scalar “0”. This
number is used by the solver to identify the restart file that should be used as initial condition. In
this case, since this file is restart.0.1, the file numstart.dat should contain a “0”.
If for whatever reason, the initial file of our simulation was restart.300.1, the numstart.dat file
should have a “300” entry. The value stored in this file gets updated as the simulation advances
in time (we will see this later one).
38List of *.supre commands
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
Final recap of the files generated by SimVascular/PreSolver
At this point, we are almost ready to run the flow solver. Along the SimVascular/PreSolver
process, we have generated the following files that are direct inputs to the solver:
-
-
-
-
geombc.dat.1 : this file contains the combination of geometry and boundary conditions
specified in the problem.
restart.0.1 : this file contains the set of initial conditions for our problem.
numstart.da t: this file contains the scalar “0”. This number is used by the solver to
identify the restart file that should be used as initial condition.
bct.dat : this file contains the history of velocity vectors at the inflow face of the model
according to a prescribed flow wave coming from a *.flow file.
41We are only missing one file in order to be able to run our analysis. This file is another input file
for the solver that controls the actual flow of the numerical simulation, specifying parameters
such as time step size, number of time steps, number of nonlinear iterations, boundary condition
control, etc. This file is in general solver.inp (input file for the solver), and we will characterize
it in detail in the following section.
These five files are the bare minimum we need to run an analysis. However, if we want to
perform more complicated simulations, involving more complex boundary conditions, we will
need more input files. This will be the focus of one of our “Advanced Simulation Topics”
lectures, but here’s the list of additional files you will need for the different simulations:
- Impedance Boundary Condition simulations :
In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat,
solver.inp), we will need to provide impedance functions in the time domain for each
impedance outlet, as well as a history of flow rates for each outlet. Remember the way the
pressure is computed when this Impedance Boundary Condition is used:
1 t
p ( t ) = p 0 + ∫ Z ( t − τ ) Q ( τ ) d τ
T t − T
⇓
⇓
Imped. Flow
Histor.
We will have therefore two additional ascii files: impt.dat (containing the impedance
functions for each of the outlets), and Qhistor.dat (containing the flow rate history)
- RCR Boundary Condition simulations :
In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat,
solver.inp), we will need to provide the RCR parameters in a ascii file that will set the
relationship between flow and pressure on each outflow face. This is done by defining a file
named rcrt.dat containing such parameters.
We are now done with the SimVascular/PreSolver part. Let’s move on to SimVascular/Solver,
define the solver.inp file and run the analysis.
42RUNNING THE ANALYSIS: S IM V ASCULAR /S OLVER
Format of a basic solver.inp file
The main goal of this section is to define the file we are missing to run the analysis. This is the
solver.inp file (i.e., input parameters for the solver). For this problem, the file we need will look
like this:
# PHASTA Version 1.5 Input File
#
# Basic format is
#
#
Key Phrase : Acceptable Value (integer, double, logical, or phrase
#
list of integers, list of doubles )
# In case it is not clear by now, # allows you to comment either from the
# beginning of the line or to the right as shown below.
#
#SOLUTION CONTROL <--- These are for
required)
#{
Equation of State: Incompressible
Number of Timesteps:75
Time Step Size: 0.004
#}
your
organizational
clarity
(not
#MATERIAL PROPERTIES
#{
Viscosity: 0.04
Density: 1.06
#}
#OUTPUT CONTROL
#{
Number of Timesteps between Restarts:5
Print ybar: True
#}
#CARDIOVASCULAR MODELING PARAMETERS
#{
Time Varying Boundary Conditions From File: True # F itvn=0 T itvn=1
BCT Time Scale Factor : 1.0
Number of Coupled Surfaces: 1 # icardio
Pressure Coupling: Implicit # Explicit, Implicit, P-Implicit
# none ipvsq=0, expl ipvsq=1,
# impl ipvsq=2, P-Imp ipvsq=3
Number of Resistance Surfaces: 1 # numResistSrfs
List of Resistance Surfaces: 2
# nsrflistResist(j), j=1,MAXSURF
Resistance Values : 84917.0
# ValueListResist(j),j=1,numResistSrfs
#}
#LINEAR SOLVER
#{
Number of Solves per Left-hand-side Formation: 1
#}
43
#nupdat/LHSupd(1)#DISCRETIZATION CONTROL
#{
Time Integration Rule: Second Order
Time Integration Rho Infinity: 0.0
Flow Advection Form: Convective
Number of Force Surfaces: 1
Surface ID's for Force Calculation: 1
#}
#STEP SEQUENCE
#{
Step Construction
#}
: 0 1 0 1
# Second Order sets rinf next
# rinf(1) Only used for 2nd order
# iconvflow=2
# this is the standard two iteration
The file consists of a number of blocks, each block containing a number of lines that are really
instructions for the solver.
WARNING: it is very important that the wording of each line is exactly as presented here. Even
a slight change (for instance, a change from Uppercase to Lowercase) will make the solver not
understand the command!
Equation of State: Incompressible RIGHT
Equation of state: Incompressible WRONG
The lines preceded by a “#” sign are comments and are ignored by the solver. Likewise, anything
placed after a “#” on a given line is also ignored.
Solution Control Block
In this block, the different commands are:
1. Equation of State: Incompressible
Here, we are telling the solver that it has to solve the INCOMPRESSIBLE Navier-Stokes
equations. The original Phasta code has the ability of solving compressible flow problems as
well. You should not change this line.
2. Number of Timesteps: 75
Time Step Size: 0.004
These two lines control the amount of physical time that you run your problem for. In this
case,
Total physical time = N. time steps × Time Step Size =
×
Δ t
T
=
N
=
×
= 0.3 sec
T
=
75
0.004
Note that this matches the “period” we used to generate the bct.dat.
44In this case, like we mentioned before, it does not really make sense to talk about a “cardiac
cycle” (this is a steady flow), but if we wanted to run this analysis for “two cardiac cycles”,
we would have to run the problem for 0.6 seconds of physical time. If we kept our choice of
Time Step Size the same ( Δ t = 0 . 004 seconds), we will need a total number of time steps of
N = 150.
WARNING: Note that this N is the total number of time steps you need in your numerical
simulation to, given a certain Δ t , model a certain physical time. This is not to be confused
with the previous number of time steps you used to generate the bct.dat!
WARNING: Now the big question is: how do you come up with a reasonable value for Δ t ?
There is not a straightforward answer for this. Δ t is the parameter that controls your
“ Temporal Discretization ”, which is something that works in a similar fashion to the
“ Spatial Discretization ” given by your mesh: the finer, the more accurate the results, but
also the bigger the size of the problem and the time to solve it!
We don’t want to get into a lot of theoretical details now, so we will just provide you with a
reasonable “recipe” to evaluate this parameter. If you want to learn more about the time
discretization algorithms used by the Solver, please refer to Theses referenced in the
Introduction of this document.
The “recipe” to estimate a reasonable Δ t is based on a dimensionless parameter called the
CFL number. The CFL number relates the velocities happening in the fluid domain ( v ), a
temporal discretization parameter ( Δ t ), and a mesh discretization parameter (i.e. mesh size)
( h) is the following way:
v Δ t
CFL =
h
We want this CFL number to be around 1. This will mean that, for the velocities present in
our fluid domain, the temporal and spatial discretizations are “balanced”.
In our problem, it can be shown that the average expected velocity is v = 12.5 cm/s; the
spatial discretization parameter or finite element size is h = 0.05. Therefore, if we shoot for a
CFL number close one, we have:
h 0 . 05
Δ t = =
= 0 . 004
v 12 . 5
Of course, you can imagine that in a real-world problem things are way more complicated to
evaluate: it will be much harder to estimate where your model will have the largest velocities,
what the mesh element size will be there, etc.
The Time Step Size Δ t is a parameter that will have a very important impact on the
performance of the linear solver of equations. The smaller you make it, the “easier” you
will make it for the solver to find a solution, but the longer it will take you to reach a
certain point in the “simulation time” space.
45Material Properties Block
This block contains the values for density and dynamic viscosity of blood: nothing really new
here. Be careful though and make sure that you use the same units you have been using through
the simulation process!
Output Control Block
In this block, the meaning of each command is:
1. Number of Timesteps between Restarts:5
This line tells the solver how often it should save solution files. In this problem, you are
really calculating 75 solutions to the problem at 75 different time points, but in general you
do not want to save a solution file for every single time step. Keep in mind that two
consecutive solutions are only Δ t = 0.004 seconds apart! In this line, we are asking the
solver to save every other 5 files . Therefore, the output files of the solver will look like this:
restart.0.*, restart.5.*, restart.10.*, restart.15.*, ...., restart.70.*, restart.75.*
2. Print ybar: True
This line tells the solver to keep track of a variable (ybar) that is an estimate of the error of
the numerical solution through the simulation. This variable is saved at the last time step
(restart.75.*), together with the other solution variables (pressure, velocity, traction, etc...)
This variable ybar is used by the adaptivity code to generate a new adapted mesh based on
the errors of the current simulation.
Cardiovascular Modeling Parameters Block
This is the block that controls the Boundary Conditions and the other features such as
Deformable Wall parameters. The meaning of each command is:
1. Time Varying Boundary Conditions From File: True
This line warns the solver about the existence of a bct.dat file. If you have a bct.dat file (this
will be the case for most simulations), this line should be set to “True”
2. BCT Time Scale Factor : 1.0
This line allows you to scale the time history given in the bct.dat file by the factor specified
in this line. For example, if your original bct.dat has a period of 0.8 seconds, and if you
wanted to simulate a problem with the same inflow wave shape, but with a period of 0.4
seconds, you would have to enter a BCT Time Scale Factor of “0.5” in this line. For most
cases, however, you should have a value of “1.0” in this line.
3. Number of Coupled Surfaces: 1
This is the number of surfaces of the model where we are specifying a relation that couples
Flow and Pressure. In order words, this number is the total number of Resistance, Impedance
and RCR surfaces we have in our problem. In this case, since we only have one outlet with a
46resistance boundary condition, we enter a “1” in this line.WARNING: this line refers to
coupled surfaces. A constant pressure outlet with no coupling between flow and pressure
does not qualify as a “couple surface”!
4. Pressure Coupling: Implicit
This line sets the implicit implementation of the “Coupled-Multidomain Method” in the code
(see Irene’s Thesis). This is the best choice and you shouldn’t change this line.
5. Number of Resistance Surfaces: 1 # numResistSrfs
This line sets the number of Resistance surfaces in the model. In our case, we have one
resistance surface. This number is stored in the solver’s internal variable numResistSrfs.
6. List of Resistance Surfaces: 2 # nsrflistResist(j), j=1,MAXSURF
This line the list of surface ID’s considered in the model for Boundary Condition
specification. This list gets stored in the vector nsrflistResis(j). In our case, we only defined
one surface ID (the number 2), at the outlet face of the model. It is very important that this
number matches what you used in your *.supre file. Otherwise, things will not work!
7. Resistance Values : 84917.0 # ValueListResist(j),j=1,numResistSrfs
This line the list of resistancese considered in the outlets of the model. This list gets stored
in the vector ValueListResist (j). In our case, this resistance is 84917.0.
WARNING: Be very careful with the units! It is also very important the ordering of the
resistance values in this line and the surface ID’s you provided in the previous line is
consistent. This is a very common place to make a mistake. It is also very important
that whatever you enter in these last two lines is consistent with want you entered in the
*.supre file
Let us illustrate this with a more complex problem with 4 outlets (see figure below)
47The *.supre file should read something like this:
.
.
.
zero_pressure
zero_pressure
zero_pressure
zero_pressure
set_surface_id
set_surface_id
set_surface_id
set_surface_id
set_surface_id
.
.
.
mesh-surfaces/outlet1.ebc.gz
mesh-surfaces/outlet2.ebc.gz
mesh-surfaces/outlet3.ebc.gz
mesh-surfaces/outlet4.ebc.gz
all_exterior_faces.ebc.gz 1
mesh-surfaces/outlet1.ebc.gz
mesh-surfaces/outlet2.ebc.gz
mesh-surfaces/outlet3.ebc.gz
mesh-surfaces/outlet4.ebc.gz
2
3
4
5
And the solver.inp file:
.
.
.
Time Varying Boundary Conditions From File: True # F itvn=0 T itvn=1
BCT Time Scale Factor : 1.0
Number of Coupled Surfaces: 4 # icardio
Pressure Coupling: Implicit # Explicit, Implicit, P-Implicit
# none ipvsq=0, expl ipvsq=1,
# impl ipvsq=2, P-Imp ipvsq=3
Number of Resistance Surfaces: 4 # numResistSrfs
List of Resistance Surfaces: 2 3 4 5
# nsrflistResist(j), j=1,MAXSURF
Resistance Values : 20000 10000 15000 21000
.
.
.
Linear Solver Block
This line tells the solver how often the left-hand-side of the system of equations should be
updated in the non-linear iteration loop. 1 is a good value, we recommend you to use it.
Discretization Control Block
The meaning of the lines in this block is:
1. Time Integration Rule: Second Order # Second Order sets rinf next
This line chooses the second-order, implicit alpha-method time integrator implemented in the
solver. This is the best choice and you should not change this line.
482. Time Integration Rho Infinity: 0.0 # rinf(1) Only used for 2nd order
This line sets the parameter that controls the amount of user-defined numerical dissipation.
This parameter takes values in the range (0,1). The value 0 corresponds to maximal
numerical dissipation, where the under-resolved frequencies are annihilated within one time
step. The value 1 implies no numerical dissipation: all the frequencies present in the
simulation are maintained through the time steps. These can be dangerous if the temporal and
spatial discretizations are not adequate. For more information about this parameter, check the
theses cited at the beginning of this tutorial.
3. Flow Advection Form: Convective
# iconvflow=2
This line sets the solver to use the advective form of the Navier-Stokes equations. The
alternative is to use the “Conservative” form.
4. Number of Force Surfaces: 1
This line specifies the number of surfaces where we are going to collect tractions (i.e., wall
shear stress) in our model. Tractions are collected as a ‘post-processing’ step after the
velocity and pressure fields are obtained. This line relates to the line you specified before in
the *.supre file
set_surface_id all_exterior_faces.ebc.gz 1
here, you have set one surface, the surface defined by the file “all_exterior_faces.ebc.gz”
tagged with the surface ID “1”, and this is the surface where tractions will be calculated on.
5. Surface ID's for Force Calculation: 1
This line refers to the surface ID specified in the surfaced tagged for Force Calculation (i.e.,
shear stress calculation).
Step sequence Block
This line controls the non-linear iteration loop within the time step . The Navier-Stokes
equations constitute a no-linear system of partial differential equations. Like any non-linear
system, in order to find a solution for a given time step, we must undergo an iteration process to
obtain a solution that reduces the residual (i.e., the error) as we iterate more and more.
The syntax of this line represents a two nonlinear iteration process for each time step.
Step Construction : 0 1 0 1 # this is the standard two iteration
The “0” tells the solver to make a solve, the “1” to make an update of the solution. Since this
sequence 0 1 is repeated, the two iterations are defined. A three non-linear iteration strategy
would be defined by writing:
Step Construction : 0 1 0 1 0 1 # this is the standard three iteration
49WARNING: Deciding on the adequate number of non-linear iterations for a problem is also a
non-trivial problem. In principle, we need to iterate until the residual (i.e., the error) of our
numerical solution is small enough. But doing many non-linear iterations on each time step is
very costly. In general, for steady flow problems, 1 or 2 non-linear iterations are enough. For
pulsatile problems, at least three non-linear iterations are needed. For deformable wall problems,
4 or more non-linear iterations are required.
This parameter, together with the time step size Δ t and the quality of the spatial discretization
given by the finite element mesh, will completely determine the performance of the linear solver
of equations. The better chosen these parameters are, the faster and more accurately our
simulation will run. We will talk more about this later.
The set of instructions explained here constitute a very small sample of all the possible
instructions the SimVascular/Solver can take via a solver.inp file.
In the next section, we provide a list of all the commands that we could specify in this file. This
set of all possible commands actually constitutes a different file called input.config . We can
look at this input.config as a super-set of solver.inp that defines most of the standard parameters
of the simulation, but then you need to complete this definition by entering your problem-
specific parameters in the solver.inp file.
Format of the input.config file
# PHASTA Version 1.6 Input File
# Here you will
# find the default values for everything that is allowed to have a
# default. Some things are not allowed to default and must be entered
# in this file. In most cases, the acceptable inputs also appear in
# the input.config file. To add acceptable inputs you should only have
# to modify:
# input_asci.cc :which matches the string and translates it to the
#
parameter change. If it is a new parameter, you must
#
modify:
#
#
common.h (to carry new parameter through code)
#
common_c.h (to carry the parameter from C to Fortran)
#
##
SOLUTION CONTROL
{
Equation of State: NODEFAULT
# Equation of State: Compressible
# sets ipress=0 matflag(1,n)
# Equation of State: Incompressible # sets ipress=-1 matflag(1,n)
Viscous Control: Viscous
#replaces navier (0 no, 1 yes)
Turbulence Model: No-Model
# No-Model, RANS-SA,
# RANS, RANS-KE, LES, DES
50Number of Timesteps: NODEFAULT #replaces nsteps(1) (ntseq wired =1)
Time Step Size: NODEFAULT
# Delt(1)
Solve Flow : True
# solveflow
Solve Heat : False
# solveheat
Solve Scalars : 0
# nsclrS
Solve Level Set : 0
# iLSet
# total number of scalars must be <=4
# impl=10*logical(solflow)+nsclr*100 +
#
1*logical(solveheat)
}
MATERIAL PROPERTIES
{
Shear Law: Constant Viscosity # ishear=0 => matflag(2,n)
Bulk Viscosity Law: Constant Bulk Viscosity # ibulk=0 => matflag(3,n)
Conductivity Law: Constant Conductivity # icond=0 => matflag(4,n)
Viscosity: NODEFAULT
# fills datmat (2 values REQUIRED if iLset=1)
Density: 1.0
# ditto
Thermal Conductivity: 0.2 # ditto
Prandtl Number: 0.72 # Compressible code sets diffusivity with this
Scalar Diffusivity: 0.2 # fills scdiff(1:nsclrS)
Body Force Option: None # ibody=0 => matflag(5,n)
# Body Force Option: Vector # ibody=1 => matflag(5,n)
# Body Force Option: Boussinesq # ibody=2 => matflag(5,n)
# Body Force Option: User e3source.f # ibody=3 => matflag(5,n)
# Body Force Option: Cooling Analytic # ibody=4 => matflag(5,n)
# Body Force Option: Cooling Initial Condition # ibody=5 => matflag(5,n)
Body Force: 0.0 0.0 0.0 # (datmat(i,5,n),i=1,nsd)
Body Force Pressure Gradient: 0.0 0.0 0.0 # (datmat(i,7,n),i=1,nsd)
Zero Mean Pressure : False # True causes pressure avg set to zero
# ONLY appropriate if no pressure BCs.
Rotating Frame of Reference: False
Rotating Frame of Reference Rotation Rate: 0. 0. 0.
Surface Tension Option: No
#isurf=0
# Surface Tension Option: Yes
#isurf=1
Maximum Value of Sponge Parameter: 1.0
Inflow Cooling Sponge Ends at z: 12.0
Outflow Cooling Sponge Begins at z: 24.0
Radial Cooling Sponge Begins at r: 7.5
Sponge Growth Coefficient Outflow : .1
Sponge Growth Coefficient Inflow : .5
Sponge for Continuity Equation : False
Sponge for x Momentum Equation : False
Sponge for y Momentum Equation : False
Sponge for z Momentum Equation : False
Sponge for Energy Equation : False
51}
OUTPUT CONTROL
{
Number of Timesteps between Restarts: 500 #replaces nout/ntout
Verbosity Level: 3
#replaces necho
Print Statistics: False
#False=> ioform=1, True=> ioform=2
Print Wall Fluxes: True
#No current action but it will come later
Print Residual at End of Step: False # T lstres=1 F lstres=0
Print Error Indicators: False
# F ierrcalc = 0, T ierrcalc = 1
Print FieldView: False
# outpar.iofieldv
Print ybar: False
# F ioybar = 0, T ioybar = 1
Print Velocity Hessian: False
# F ihessian = 0, T ihessian = 1
Number of Error Smoothing Iterations: 3 # ierrsmooth
Surface ID for Integrated Mass: 1 # isrfIM
Number of Force Surfaces: 0
# nsrfCM
Surface ID's for Force Calculation: NODEFAULT # nreadlist(j),j=1,nsrfCM
# this must be processed as in input.f or passed to input.f for processing
# not read if nsrfCM=0
Data Block Format : binary #iotype, options 'binary','ascii'
}
LINEAR SOLVER
{
# Solver Type: ACUSIM
# iprjFlag=0 ipresPrjFlag=0
Solver Type: ACUSIM with P Projection
# iprjFlag=0 ipresPrjFlag=1
# Solver Type: ACUSIM with Velocity Projection # iprjFlag=1 ipresPrjFlag=0
# Solver Type: ACUSIM with Full Projection # iprjFlag=1 ipresPrjFlag=1
# The above 4 are for incompressible flow.
#
#
#
The next two are for compresible flow.
Solver Type: GMRES EBE
Solver Type: GMRES Matrix Free
Number of GMRES Sweeps per Solve: 1 # replaces nGMRES
Number of Krylov Vectors per GMRES Sweep: 50
# replaces Kspace
Number of Solves per Left-hand-side Formation: 1 #nupdat/LHSupd(1)
Tolerance on Momentum Equations: 0.1
# epstol(1)
Number of Solves of Temperature per Left-hand-side Formation: 1
Temperature Solver Tolerance: 0.001
Number of Solves of Scalar 1 per Left-hand-side Formation: 1
Number of Solves of Scalar 2 per Left-hand-side Formation: 1
Number of Solves of Scalar 3 per Left-hand-side Formation: 1
Number of Solves of Scalar 4 per Left-hand-side Formation: 1
Scalar 1 Solver Tolerance: 0.001
Scalar 2 Solver Tolerance: 0.001
52Scalar 3 Solver Tolerance: 0.001
Scalar 4 Solver Tolerance: 0.001
Tolerance on ACUSIM Pressure Projection: 0.1
# prestol
Minimum Number of Iterations per Nonlinear Iteration: 1 # minIters
Maximum Number of Iterations per Nonlinear Iteration: 200 # maxIters
Velocity Delta Ratio :0. #utol deltol(1,1) Stop factor for steady solve
Pressure Delta Ratio :0. #ptol deltol(1,2) Stop factor for steady solve
Number of Velocity Projection Vectors: 10 #nPrjs
Number of Pressure Projection Vectors: 10 #nPresPrjs
ACUSIM Verbosity Level
: 0 #iverbose
}
DISCRETIZATION CONTROL
{
Basis Function Order: 1
# ipord
Time Integration Rule: First Order # 1st Order sets rinf(1) -1
# Time Integration Rule: Second Order # Second Order sets rinf next
# Time Integration Rho Infinity: 0.5 # rinf(1) Only used for 2nd order
Predictor at Start of Step : Same Velocity # ipred=1 (more options later)
Weak Form: SUPG # alternate is Galerkin only for compressible
Flow Advection Form: Convective
# iconvflow=2
# Flow Advection Form: Conservative
# iconvflow=1
Scalar Advection Form: Convective
# iconvsclr=2
# Scalar Advection Form: Conservative # iconvsclr=1
# Use Conservative Scalar Convection Velocity: True
Use Conservative Scalar Convection Velocity: False
Tau Matrix: Diagonal-Shakib
#itau=0
# Tau Matrix: Diagonal-Franca
#itau=1
# Tau Matrix: Diagonal-Jansen(dev)
#itau=2
# Tau Matrix: Diagonal-Compressible
#itau=3
# Tau Matrix: Matrix-Mallet
#itau=10
Tau Time Constant: 1.
#dtsfct
Tau C Scale Factor: 1.0
# taucfct best value depends
# on Tau Matrix chosen
Discontinuity Capturing: Off
# Sets IDC to 0 for now
# Discontinuity Capturing: "DC-mallet" #Sets IDC to 1
Scalar Discontinuity Capturing: 0 0
#Sets idcsclr to [0 0], no DC
#on any scalar
# idcsclr(1)--> Type of DC (see flow), idcsclr(2)---> on which scalar DC acting
# Scalar Discontinuity Capturing: 1 1
#Sets DC=1 on first scalar
# Scalar Discontinuity Capturing: 1 2
#Sets DC=1 on second scalar
Include Viscous Correction in Stabilization: True # if p=1 idiff=1
# if p=2 idiff=2
Lumped Mass Fraction on Left-hand-side: 0.
# flmpl
Lumped Mass Fraction on Right-hand-side: 0.
# flmpr
Dump CFL: False
#iCFLworst=0
53Quadrature Rule on Interior: 2
#int(1)
Quadrature Rule on Boundary: 2
#intb(1)
Number of Elements Per Block: 255
#ibksiz
Entropy Form of Pressure Constraint on Weight Space: 0 # 1 turns it on
}
SOLUTION SCALING PARAMETERS
{
Density: 1. #ro This is used in sponge
Velocity: 1. #vel This affects tau currently
Pressure: 1. #pres This is used in sponge
Temperature: 1. #temper This scales diagonal energy tau (see e3tau.f)
Entropy: 1. #entrop
}
TURBULENCE MODELING PARAMETERS
{ #
lines below are only read if ||| is true
Turn Off Source Terms for Scalars: False
Decay Multiplier for Scalars : 1.0 (this number multiplies scalars each step)
Number of Homogenous Directions : 0
Dynamic Model Type : Standard # adds zero to iles
LES
#
Dynamic Model Type : Bardina # adds 10 to iles
LES
#
Dynamic Model Type : Projection # adds 20 to iles
LES
Filter Integration Rule: 1 #ifrule adds ifrule-1 to iles LES
Double Filter : False #Filter applied twice to create wide filter?
Model Statistics: False #Collect statistics on model?
Model/SUPG Dissipation : False # Get diss. due to model and SUPG stresses?
DES Edge Length: NODEFAULT # shorter edges are pure les while twice longer edges
are pure RANS, finally in between is a blend
#
# The following are models under development (at various stages of validation)
#
Dynamic Sub-Model Type: None
#
Dynamic Sub-Model Type: DFWR # dmc with dynamic filter width ratio
#
Dynamic Sub-Model Type: SUPG # dmc w/ SUPG interation
#
Dynamic Sub-Model Type: ConsistentProj # Consistent projection filter dmc
Projection Filter Type: Linear
# Projection onto lins. as the filter
#
Projection Filter Type: Quadratic # Projection onto quads as the filter.
Lumping Factor for Filter : 0.5
# Lumping factor for projection filter
Turbulence Wall Model Type: None #itwmod=0
RANSorLES
#
Turbulence Wall Model Type: Slip Velocity #itwmod=1
RANSorLES
#
Turbulence Wall Model Type: Effective Viscosity #itwmod=2 RANSorLES
Velocity Averaging Steps : 500. # wtavei= 1/this
RANSorLES
Dynamic Model Averaging Steps : 500. # dtavei= 1/this LES
# negative values to the two previous entries make their value ISTEP in code
# Anil...leave as any negative value
54Filter Width Ratio
: 3. # fwr1
LES
Target Viscosity For Step NSTEP: 0 # uses linear ramp between start
# with a zero here the code disables
# that feature and holds value
Limit u1 : 0. 0. 0. # switch min max change switch from zero to activate
Limit u2 : 0 0 0
Limit u3 : 0 0 0
Limit Pressure : 0 0 0
Limit Temperature : 0 0 0
Limit Scalar 1 : 0 0 0
Limit Scalar 2 : 0 0 0
Limit Scalar 3 : 0 0 0
Limit Scalar 4 : 0 0 0
Number of Father Nodes: 0 # value of SONFATH
}
SPEBC MODELING PARAMETERS
{
SPEBC Model Active:-1 # irscale=-1 means not active, see genscale.f
# Next lines required only if above not non-negative
Interpolate Pressure: 0
# intpres
Distance between Planes: NODEFAULT
# plandist
Theta Angle of Arc: 0.0 # thetag = 0.0 for cartisian case
Distance for Velocity Averaging: NODEFAULT # ds
#
Tolerance for cylindrical case to account for discratisation of
#
the curved surface
SPEBC Cylindrical Tolerance: 0.01
# tolerence
Radius of recycle plane: 0.5 #radcyl only needed in cylindrical case
Inlet Boundary Layer Thickness: NODEFAULT # rbltin
# Velocity Averaging Steps needed for SPEBC
Vertical Velocity Scale Factor: NODEFAULT # rvscal
}
CARDIOVASCULAR MODELING PARAMETERS
{
Time Varying Boundary Conditions From File: False # F itvn=0 T itvn=1
BCT Time Scale Factor : 1.0
Number of Coupled Surfaces: 0 # icardio
Pressure Coupling: None # Explicit, Implicit, P-Implicit
# none ipvsq=0, expl ipvsq=1,
# impl ipvsq=2, P-Imp ipvsq=3
Number of Resistance Surfaces: 0 # numResistSrfs
List of Resistance Surfaces: NODEFAULT # nsrflistResist(j), j=0,MAXSURF
Resistance Values : NODEFAULT # ValueListResist(j),j=1,icardio
Number of Impedance Surfaces: 0 # numImpSrfs
List of Impedance Surfaces: NODEFAULT # nsrflistImp(j), j=0,MAXSURF
55#
#
#
Impedance From File: False #False impfile=0, True impfile=1
Number of RCR Surfaces: 0 # numRCRSrfs
List of RCR Surfaces: NODEFAULT # nsrflistRCR(j), j=0,MAXSURF
RCR Values From File: False #False ircrfile=0, True ircrfile=1
Deformable Wall: False #False ideformwall=0, True ideformwall=1
Density of Vessel Wall: NODEFAULT # rhovw
Thickness of Vessel Wall: NODEFAULT # thicknessvw
Young Mod of Vessel Wall: NODEFAULT # evw
Poisson Ratio of Vessel Wall: 0.5 # rnuvw
Shear Constant of Vessel Wall: NODEFAULT # rshearconstantvw
Wall Mass Matrix for LHS: True # iwallmassfactor=1
Wall Mass Matrix for LHS: False # iwallmassfactor=0
Wall Stiffness Matrix for LHS: True # iwallstiffactor=1
Wall Stiffness Matrix for LHS: False # iwallstiffactor=0
Viscous Flux Flag: True # iviscflux=1
Viscous Flux Flag: False # iviscflux=0
}
LEVEL SET MODELING PARAMETERS
{
#(Only read if Solve Level Set is true=> iLS.ne.0)
Number of Elements Across Interface: 3 #epsilon_ls
Number of Elements Across Interface for Redistancing: 3 #epsilon_lsd
Apply Volume Constraint: False #ivconstraint=0
#
Apply Volume Constraint: True #ivconstraint=1
Pseudo Time step for Redistancing: 0.001 #dtset
Explicit Solve for Redistance Field: 0 #iExpLSSclr2 (0-implicit, 1-explicit)
Explicit Solve for Scalar 1 Field: 0 #iExpLSSclr1 (0-implicit, 1-explicit)
}
DISABLED FEATURES
{
iALE : 0
icoord: 0
irs : 2
iexec : 1
ntseq : 1
imap : 0
#
ivart : 2 # the old practice of using ivart to
#
# set advective form is depricated
CFLfl : 1 #CFLfl(1)
CFLsl : 10 #CFLsl(1)
iepstm: 10
}
56STEP SEQUENCE
{
Step Construction : 0 1
}
Running a flow simulation
At this point we have generated all the files we need for this problem. I recommend now to copy
them to a different folder before launching the analysis. You can make a folder called, for
instance, Simulation-files, and copy the five files there:
At this point you are ready to launch the analysis. For that, you simple have to type:
%solver 1 solver.inp
This will launch a one-processor job in your computer.
57I have launched a two-processor job in my computer, since it happens to have two cpu’s, and
therefore the job will run twice as fast (approximately). However, what you will see on the
screen will look very similar to this:
The messages you see in the red box describe the process in which the solver splits the input files
(we mentioned this before) in as many pieces as processors we use in the analysis. In this case, 2
processors. Therefore, we have
geombc.dat.1 =>
restart.0.1
=>
geombc.dat.1 , geombc.dat.2
restart.0.1 ,
restart.0.2
At the same time, the solver copies all these files to a newly created folder called 2-procs_case/,
and this is where all the output files of the analysis will be written to. In general, if you launch a
“n” processor job, all the files will be copied to a n-procs_case/ folder.
58The bottom part of the red box contains general info about the domain size, the number of nodes
in the bct.dat file, etc.
The important information is what is in the green rectangle. This info is being written to a file
called histor.dat and it is what you need to use in order to evaluate how well your numerical
simulation is doing. Here’s a brief description of what each of those columns means.
a
1
1
2
2
3
3
4
4
5
5
6
6
7
7
8
8
9
9
10
10
11
11
12
12
b
1.30E+01
2.50E+01
2.80E+01
3.00E+01
3.20E+01
3.40E+01
3.60E+01
3.80E+01
4.00E+01
4.20E+01
4.40E+01
4.60E+01
4.80E+01
5.00E+01
5.20E+01
5.30E+01
5.50E+01
5.70E+01
5.90E+01
6.10E+01
6.30E+01
6.50E+01
6.70E+01
6.90E+01
c
1.16E-02
7.35E-03
5.13E-01
2.05E-02
1.20E-01
5.18E-03
2.14E-02
2.18E-03
1.52E-02
1.11E-03
1.24E-02
1.01E-03
1.05E-02
8.74E-04
9.09E-03
7.42E-04
7.95E-03
6.58E-04
6.99E-03
4.26E-04
6.17E-03
3.86E-04
5.45E-03
3.48E-04
d
( 0)
( -1)
( 16)
( 2)
( 10)
( -3)
( 2)
( -7)
( 1)
( -10)
( 0)
( -10)
( 0)
( -11)
( -1)
( -11)
( -1)
( -12)
( -2)
( -14)
( -2)
( -14)
( -3)
( -15)
e
2.10E+02
2.93E-01
1.75E-01
8.07E-02
8.75E-02
2.13E-02
5.57E-02
7.33E-03
4.22E-02
3.57E-03
3.31E-02
3.98E-03
2.70E-02
3.50E-03
2.25E-02
2.92E-03
1.89E-02
2.47E-03
1.65E-02
1.39E-03
1.42E-02
1.28E-03
1.23E-02
1.18E-03
f
2.62E+28
5.15E+00
1.69E-01
2.67E-02
2.44E-02
3.59E-03
6.13E-03
3.15E-04
3.45E-04
1.24E-04
3.16E-04
3.30E-05
1.87E-04
4.35E-05
1.16E-04
5.63E-05
8.19E-05
7.07E-05
8.52E-05
3.55E-05
5.24E-05
3.41E-05
4.06E-05
3.95E-05
<
<
<
<
<
<
<
<
<
<
<
<
<
<
<
<
<
<
<
<
<
<
<
<
g
-10474 1|
-3237 1|
-1357 1|
-3286 1|
-2342 1|
-3277 1|
-3146 1|
-3233 1|
-3141 1|
-3237 1|
-3024 1|
-3220 1|
-3019 1|
-2993 1|
-2993 1|
-2871 1|
-2876 1|
-2850 1|
-2871 1|
-6284 2|
-2845 1|
-6284 2|
-2728 1|
-6284 2|
15>
13>
5>
11>
7>
10>
9>
11>
10>
12>
10>
11>
10>
11>
10>
12>
10>
12>
10>
11>
10>
11>
10>
11>
[
[
[
[
[
[
[
[
[
[
[
[
[
[
[
[
[
[
[
[
[
[
[
[
h
199 -
117 -
63 -
21 -
36 -
6-
24 -
9-
27 -
7-
16 -
6-
8-
5-
8-
5-
7-
7-
11 -
7-
6-
8-
7-
9-
190]
200]
1]
13]
1]
6]
2]
5]
3]
5]
2]
5]
2]
5]
2]
5]
2]
5]
3]
5]
3]
5]
3]
6]
a: Time step number . We see that each time step number appears twice: this is because we are
considering two non-linear iterations. This column will go from “1” to the total number of time
steps in our problem (in this case, 75).
b: CPU time in seconds . This is counted since you launched the analysis
c: Measure of the nonlinear residual . This gives you and idea of how accurate your solution is.
Note that for each time step, the second entry is smaller than the first entry. This is a good sign
that shows that the nonlinear iteration loop of the solver is doing a good job in improving the
solution. You should always aim to a nonlinear residual at the end of the time step of at most
1·10 -3 .
59d: Logarithm of the residual change: this provides you a very good way of quickly evaluating
how well the solution is doing. If this number is very small and negative, then it is a good sign.
An entry with the value “-10” means that you have reduced the residual by an order of
magnitude from the beginning of the analysis, a “-20”, by 2 orders of magnitude, and so on.
e: entropy norm of the residual for the velocity field (max Δ u/ u)
f: entropy norm of the residual for the pressure field (max Δ p/ p)
g: < a – b | c> a: block where the maximum residual happens (each block has 255
elements)
b: node in the block with the maximum error
c: logarithmic measure of the ratio between the maximum residusl and the
average residual: want this number to be as small as possible: it will be an
indicator of the spatial uniformity of the residual
[a-b] a: number of Krylov vectors used in the pre-conditioner solver
(Conjugate-Gradients for the pressure)
b: number of Krylov vectors used in the GMRES solver (for the full
pressure-velocity system)
Once the analysis is done, you will see the collection of restart files corresponding to the
different points in the time you decided to save. The folder will look like this:
60Ignore the flux.* files for now. The important files here are the histor.dat that contains the info
about your simulation explained in the previous paragraph, and of course the different restarts.
If you plot the residual at the end of the time step versus the time step (or the physical time, since
you know the time step size), you should get a plot like this:
residual steady cylinder
2.20E-02
1.10E-02
0.00E+00
0.00
0.05
0.10
0.15
0.20
0.25
0.30
time (s)
This plot shows that the residual stabilizes around time 0.1 seconds (time step 25) and does not
change much after that. This behavior is consistent with the steady flow that we are pushing
through the cylinder: the problem is starting off from an arbitrary initial condition, and it
eventually finds the right solution that satisfies our boundary conditions. Since our boundary
conditions are steady, so is the overall solution to our problem.
We are now ready to look at the restart files containing the solution. You will read these files in
SimVascular/PostSolver to generate the visualization files (*.vis and *.vtu).We explain that
process in the following section.
61POSTPROCESSING: S IM V ASCULAR /P OST S OLVER
Generating the *.vis and *.vtu files in SimVascular
In order to generate the visualization files (*.vis) and (*.vtu) files, you need to launch again
Simvascular in the folder containing the restart files you want to post-process.
Go to the “Simulations->Solver to Vis Files” tab, and enter the following parameters:
In the “Start” box, enter the initial restart file number (0)
In the “Stop” box, enter the final restart file number (75)
In the “in prefix” box, enter the desired name for the vis-files. You should use something
meaningful. For this example, we can use steady-cylinder
In the “out prefix” box, enter the desired name for the vtu-files. You should use something
meaningful. For this example, we can use steady-cylinder
Click on the “traction” box, since for this problem we calculated the wall shear stress.
Ignore the entries in the menu “Additional Displacement Fields” (we did not run a deformable
wall analysis).
Click on the button “both” of the “Convert files” menu to generate both the *.vis and the *.vtu
files.
62This generates the desired set of *.vis and *.vtu files.
63The *.vis files can be read directly back into SimVascular and you can generate jpegs and
movies of your analysis. But in general, we prefer to use the software ParaView with the
paraview files to do the visualization work. It is a very complete scientific visualization tool, that
you can download for free from
http://www.paraview.org/New/index.html
In this tutorial, we are using the version 2.6.
In the following section, we will show you the basis of how to use Paraview with a set of results
corresponding to a patient-specific model under exercise conditions.
64Visualizing the results in ParaView
To visualize the time dependent results we use ParaView. The following steps can be
used to visualize the results:
1. Launch ParaView by clicking on the ParaView desktop icon
window will appear
. The main
2. Select “File > Open Data”. The “Open ParaView File” window should appear.
Double-click on the folder X:\testuser\CFD-files\visualization, and then on the
folder AAA-Patient20-Exercise.
Select the first file of the data series
patient20exercisevtu-3020.vtu.
653. Click on the green button Accept.
4. The solid model will show up on the screen:
665. Click on the “Timesteps” button.
6. When the “Select Files for Time Series” window appears, then click Add All to
add the rest of the solution files corresponding to other times of the cardiac cycle.
Then click Close. Click on the green button Accept. You should now have 25
solution files (Time steps (0) to (25))
7. Your simulation contains information about three different fields: pressure,
velocity and traction (wall shear stress).
8. At this point, you can interact with the model by rotating it using the rotation
or translation
buttons. Move/rotate the model until you find a good view.
67Visualizing the Pressure results
9. The default color map of the model is showing the pressure results in dynes/cm2.
Let’s transform the pressure scale to mmHg (1 mmHg = 1333.2 dyn/cm2). To do
.
this, use the calculator tool
10. In the calculator menu, choose pressure in the “scalars” drop-down menu
6811. Divide “pressure” by the conversion factor 1333.2
12. Enter a meaningful name in the “Results Array Name” box (for example,
Pressure in mmHg)
13. Click on the green button Accept.
6914. A new entity with the name of Calc0 appears in the “Selection Window” area.
Note that the original set of files patient20exercisevtu-3020.vtu is now hidden.
15. Now, let’s show the scale and colormap of this new pressure field. For that, click
on the Display tab
and then on the Edit Color Map button
7016. Set the min and max values for the pressure colormap to 85 and 140 mmHg.
17. Click on the visibility box of the Scalar Color Bar menu
18. A pressure color map will appear next to the model.
7119. Go to View > Keyframe animation
20. Enter the appropriate number of fames: 25
7221. In the tracks menu, in the Source button, select the name of the series
patient20exercisevtu-3020.vtu
22. Under the Property button, select Filename
23. Click on the Add KeyFrame button
24. Now you can play all the frames of the solution. To do that, click on the loop
button
7325. And then click on play. It will take a while for the computer to store the
information of all the frames in memory. Once this is done, the animation will play
faster.
Visualizing the Velocity results
26. Click on View > Source
7427. Hide the Calc0 data and make the patient20exercisevtu-3220.vtu data visible
again
28.
29. Now, click on patient20exercisevtu-3220.vtu to activate this data (highlighted)
30. In the Color by button, select Point velocity
31. Most of the model looks blue because the velocity of the wall is zero due to the
rigid wall assumption used in this model. In order to visualize not just the surface
velocity (that hides the velocities in the lumen due), we need to use a Volume
Render visualization technique. To do this, we must calculate the scalar quantity
representing the magnitude of the velocity.
32. Click on the calculator tool
button
33. In the calculator box, type mag(velocity)
7534. In the “Results Array Name” box, type Velocity Magnitude (cm/s)
35. Click on the green button Accept.
36. A new entity with the name of Calc1 appears in the “Selection Window” area.
Note that the other entities Calc0 and the original set of files
patient20exercisevtu-3020.vtu are now hidden.
37. Now, let’s show the scale and colormap of the Velocity field in Calc1. For that,
click on the Display tab
and then on the Edit Color Map button
7638. Set the range of the velocity from 0 to 75 cm/s
39. Click on the visibility box of the Scalar Color Bar menu
40. A velocity magnitude color map will appear next to the model.
7741. Click on the Back button
42. In the Display Style box, change the Representation from Surface to Volume
Render
43. Notice the differences in the visualization style. Now you can actually see the
velocity magnitude in the entire volume and not just the surface
7844. We need to play with the opacity and the scale of the color map of the volume
render to improve the quality of the visualization. Click on the Edit Volume
Appearance button.
We need to define the limits of the Opacity Mapping and Scalar Color Mapping.
45. In the Scalar Color Mapping, click on the line to define the upper limit of the
mapping You have defined a new point (2) in the color scale mapping.
46. Double-click on this point to assign the red color to the highest value of the
velocity scale. Click on the OK button.
7947. Now, set the saturation value of this point to 75 (cm/s)
48. You can now modify the opacity map function is you want.. In the opacity map,
the higher velocities (red) are more opaque than the lower velocities.
49. Set the lower limit of the opacity mapping so that is different from zero (make it
around 0.2)
50. Go to View > Keyframe animation
8051. Since the amount of data required to visualize the volume render of this model
through a complete cardiac cycle is too large for the computer memory, you need
to unclick the Cache Geometry and Record All properties buttons
52. Now we can record a movie of the by clicking on the animation icon
53. Choose the avi option in the Save as type drop-down menu
8154. Enter a file name for the movie. For example, VolumeRender. Click on the Save
button
55. Click OK in the next window that shows the different video compression options.
56. This process will take a couple of minutes. The movie has been saved to
C:\Program Files\ParaView 2.6\bin
57. You can navigate there and double-click on the file to view the movie.
58. Note how complex the velocity field is in the aneurysm region. In this patient, we
are studying the potential possible effects of moderate exercise. The elevated
wall shear stress (which is hypothesized to be an athero-protective factor) can
also be visualized using the traction vector field of the dataset.
82GOAL of this section: to examine complex flow patterns in a pathologic
situation. In this example, simulated exercise conditions are used to
understand the way wall shear stress patterns change under these
83R EFERENCES
8485