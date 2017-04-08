### Boundary Condition Specification: Practical Considerations

Once we have clear the physics behind the boundary conditions for our simple cylindrical model, we can proceed to enter them in **SimVascular**. As we previously anticipated, this is done by entering the adequate commands in the \*.svpre file, the input of the **svPreSolver** program.
As we also mentioned before, this can be done using **SimVascular** GUI or by editing the \*.svpre file with your favorite text editor.

First we need to create a file called **bct.dat** that specifies the boundary conditions at the inlet $\Gamma_g$.

#### How to create a bct.dat file

In the **SimVascular** GUI window, go to the _Inflow BC_ subtab under _Simulations_. You will have to enter the following values in the various boxes/buttons of the GUI (see figure below):

<figure>
  <img class="svImg scImgLg" src="documentation/flowsolver/imgs/BCT_Creation.png">
  <figcaption class="svCaption" >Creating a <b>bct.dat</b> file through the GUI</figcaption>
</figure>

- Under **Analytic Shape of Profile**, select the **parabolic** radio button. This options allows a parabolic velocity profile to be applied at the inlet. Other oprions are **plug**, which applies a constant velocity profile throughout the inlet face and Womerseley, that uses a closed form solution for the velocity profile of pulsatile flow in arteries. 

- In the **Mesh Face File (.vtk)** box, click on the **Browse** button and select the **inlet.vtp** file in the _mesh-complete/mesh-surfaces/_ folder.

- In the **Flow Rate File** box, click on **Browse** and select the desired \*.flow file. In this case, the file is **inflow.flow**.

Under the **Parameters** menu, enter the following values:

- **Period**: $20.0$ sec. For a steady flow problem like ours, the concept of _period_ is somewhat vague. In this case, $20.0$ means the amount of physical time that we are going to run our simulation for.

- **viscosity**: $0.04$ Poise (gr/cm/s).

**WARNING**: Be very careful with the units! This is one the points where it is easy to make a mistake with the dimensions. For consistency, besides entering the right numerical value, try to also modify the units listed next to it (see figure below).

- **density**: $1.06$ gr/cm$^3$. Same as before, be very careful with these units!

Under the **Output Parameters** menu, enter the following values:

- **num of periods**: always enter 1 here. If you want to run your simulation for multiple cardiac cycles, it is possible to ask **svSolver** to loop over the information given by the **bct.dat** file for just one cycle (using the **solver.inp** file). By doing this, you will minimize the size of this file that can  potentially be very large. 

- **num pts in period**: 2. This is the number of _temporal_ data points that you want to have in your bct.dat. This is not necessarily the number of time points in the \*.flow file. In this case, they match (2 in both cases), but this is because this is a very simple example using steady flow and two time points is all we need to characterize a constant flow. In general, your \*.flow file will have in the order of $20$ data points over the cardiac cycle (that’s about how many points you will be able to reconstruct using **PC-MRI**, for example), and your bct.dat will have on the order of $100$-$200$ points. Whatever is enough to have a smooth  representation of the inflow wave mapping to velocity vectors at the inlet face.

- **num fourier modes**: 1. Fourier smoothing allows to smooth your inlet flow curve and to make sure that you have a periodic function in the specified interval. 

**WARNING**: Be careful with this! **SimVascular** is doing a Fourier Series approximation of the data that you provide in the \*.flow file. Since in this case, our data is constant flow, we only need one Fourier mode to capture this appropriately. For pulsatile flow problems, we will need more Fourier Modes to accurately represent the \*.flow data (usually, $10$ Fourier modes is enough for a pulsatile problem). After you are done entering all these parameters, click on the _CREATE 3-D FLOW SOLVER BC FILE_ button to generate the bct.dat file. 

Now we have our **bct.dat** file. The format of this file is as follows:

~~~
np nl
x1 y1 z1 nl nn
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

The file defines the inflow boundary condition both spatially and in time. The spatial definition is obtained through $n\_p$ point-wise velocity input blocks. In this case, $n\_p = 220$, this is the total number of nodes on the **inlet.vtp** face. The temporal definition is given by $n\_l$ input lines of the values at a certain position for $n\_l$ time points, $t\_1$ to $t\_{n\_l}$. In this case, $n\_l = 2$ points (this is the value we entered in the _num pts in period_ box. 

Each block of data has, for each of the $n\_p = 220$ spatial points, the following info:

- The coordinates of the point: $x\_1$ $x\_2$ $x\_3$ and the number of time points $n\_l$.

- The list of velocity vectors $v\_x$ $v\_y$ $v\_z$ at time t.

A vtp file can be written using this option to graphically visualize the velocity distribution at the inlet surface with Paraview, as shown in the picture below.

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/BCT_Cration_VTP.png">
  <figcaption class="svCaption" >Visualizing the inlet velocity profile in Paraview</figcaption>
</figure>

### Processing the \*.svpre file

To process the \*.svpre file, entering the appropriate commands to define the boundary conditions of this problem, we go to the _Simulations->Create 3-D Solver Files_ tab. In the “Create PreSolver script file” menu (see figure  below), make sure that the right \*.supre file is loaded in the box (in this case, it should be cylinder-steady.supre . Click on the “Load PreSolver scriptfile” button. The following screen will appear:

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/SVPre_File.png">
  <figcaption class="svCaption" >Running <b>svPre</b> through the GUI</figcaption>
</figure>

The contents of the \*.supre script file are:

~~~
# MESH DEFINITION

mesh_vtu cylinder.mesh.vtu
adjacency cylinder.xadj.gz

# INLET CONDITIONS

prescribed_velocities_vtp mesh-surfaces/inlet.vtp

# WALL CONDITIONS

noslip_vtp mesh-surfaces/wall.vtp

# OUTLET PRESSURE

zero_pressure_vtp mesh-surfaces/outlet.vtp

# SURFACE NUMBERING

set_surface_id_vtp cylinder.exterior.vtp 1
set_surface_id_vtp mesh-surfaces/inlet.vtp 2
set_surface_id_vtp mesh-surfaces/outlet.vtp 3
set_surface_id_vtp mesh-surfaces/wall.vtp 4

# WRITE SOLVER FILES

write_geombc geombc.dat.1
write_restart restart.0.1
~~~

As we said before, each line of this \*.supre file represents a command that will be executed by **svPre**. This file needs to be edited to incorporate the right parameters/conditions for this problem. Here is a description of each line.

The first two lines are used to define the topology of the finite element mesh. The first command **mesh_vtu** used a vtk unstructured mesh file to define node coordinates and element connectivities. The second command **adjacency** defines an adjacency relationship between elements. 

~~~
mesh_vtu cylinder.mesh.vtu
adjacency cylinder.xadj.gz
~~~

The following line uses the existing **inlet.vtp** file to define a boundary subregion with applied velocities. 

~~~
prescribed_velocities_vtp mesh-surfaces/inlet.vtp
~~~

Note that we are just pointing to the right file (inlet.vtp) in the mesh-surfaces folder where we want some velocity vectors to be prescribed. These velocity vectors are given by the **bct.dat** file. We must use the command **prescribed_velocities_vtp** in each surface where we prescribe some flow wave via a Dirichlet condition on the velocity vectors of that face. 

~~~
noslip_vtp mesh-surfaces/wall.vtp
~~~

Like before, we are only pointing to the right path of the surface file where we want to prescribe the nonslip (rigid wall) condition. This is also a Dirichlet condition that makes all the velocity vectors of the nodes of the surface **wall** to be zero.

~~~
zero_pressure_vtp mesh-surfaces/outlet.vtp
~~~

By using this condition, we are making the face **outlet** into a **weakly-pressure** face. This is mathematically expressed by the expressions we saw before:

$$
p = p\_0 + R\,Q
$$

$$
p(t)=p\_0 + \frac{1}{T}\,\int\_{t-T}^{t} Z(t−\tau) \, Q(\tau) \, d\tau
$$

This expression sets $p\_0 = 0$ for the face **outlet**. The total pressure set on that face will be the result of the flow-pressure operator considered (i.e., resistance, impedance, RCR, Coronary etc.).

The following command is used to assign an ID to all model surfaces.

~~~
set_surface_id_vtp cylinder.exterior.vtp 1
~~~

**HINT**: This line tags all the exterior faces in the model with an identifier (a Suface ID) , in this case, the number one. 
We also need to introduce a new command if we want to activate the resistance boundary condition at the outlet face. We had previously determined that a resistance equal to $R = 8888.0$ dynes$\,$s/cm$^5$ needs to be applied at that outlet. 

In order to do this, we need to assign a Surface ID that will help us later to identify the face and assign the correct resistance value. This is a trivial case, because we only have one single outflow face, and therefore one single resistance. But imagine one case where many more are needed. In this case, it is very important to meticulously label all the outlet faces with a meaningful name, and to make a sketch that helps you remember the list of Surface IDs that you considered in the model. Each surface ID will have a corresponding Resistance value (or impedance function, or set of RCR parameters etc.).

Going back to our \*.svpre file, we need to add a line specifying the surface ID for the outlet face. We also number all other model surfaces in case we need to apply different boundary conditions through the **solver.inp** file.

~~~
set_surface_id_vtp mesh-surfaces/inlet.vtp 2
set_surface_id_vtp mesh-surfaces/outlet.vtp 3
set_surface_id_vtp mesh-surfaces/wall.vtp 4
~~~

The last two lines of the \*.svpre file are the culmination of all the work you have been doing in **SimVascular** to this point!

~~~
write_geombc geombc.dat.1
write_restart restart.0.1
~~~

They generate two binary files (geombc.dat.1) and (restart.0.1) that are used as inputs for **svSolver** and are used to run the flow analysis. 

- **geombc.dat.1** contains the combination of geometry and boundary conditions specified in the problem.

- **restart.0.1** contains the set of initial conditions for our problem. We haven’t said anything about initial conditions till now. If you do not do something different, **SimVascular** will specify an almost-zero velocity initial condition for all the nodes of the mesh and a zero pressure **initial condition**. Here, the number **0** refers to **time step zero**, as it corresponds to the first file of the simulation.

Now, click on **Run PreSolver**. This command will actually launch the **svPre** application. A window will pop up, and you will see the list of commands of your *.supre file being executed. After a few seconds (or minutes, depending on the size of the problem), the files **geombc.dat.1** and **restart.0.1** will be generated.

You can do the same if, instead of using the **SimVascular** GUI, you edit the \*.svpre file like shown above, and then, from the command line, type:

~~~
%presolver steady-cylinder.supre
~~~

**HINT**: In both files, the number “.1” refers to the **partition number** of the file. Remember **svSolver** has the ability of running a problem _in parallel_ (i.e., using multiple processors or computing cores), using MPI (message-passing interface). When we run a job using multiple processors, the first thing that happens is the “splitting” of these two files into as many processors we are going to use in our analysis, so the calculations can be performed faster. For example, if we use $4$ processors in our analysis, these files will be split as follows:

~~~
geombc.dat.1 => geombc.dat.1 , geombc.dat.2 , geombc.dat.3 , ...

restart.0.1 => restart.0.1 , restart.0.2 , restart.0.3 , ...
~~~

Roughly speaking, each of the four files is $1⁄4$ of the size of the original un-split file. For a generic time step **n**, the solution will be given by the following files:

~~~
restart.n.1 , restart.n.2 , restart.n.3 , restart.n.4 , ...
~~~

We are almost done. There is only one thing left in the **svPresolver** part: to generate the numstart.dat dat. To do this, click on the **Create File** button under **Analysis Files**. 

This file is really simple: it contains the scalar **0**. This number is used by the solver to identify the restart file that should be used as initial condition. In this case, since this file is **restart.0.1**, the file **numstart.dat** should contain a **0**. If for whatever reason, the initial file of our simulation was **restart.300.1**, the numstart.dat file should have a **300** entry. The value stored in this file gets updated as the simulation advances in time (we will see this later one).

#### Final recap of the files generated by **svPre**

At this point, we are almost ready to run the flow solver. Using **svPre**, we have generated the following files that are direct inputs to the solver:

- **geombc.dat.1** : this file contains the combination of geometry and boundary conditions specified in the problem.
- **restart.0.1** : this file contains the set of initial conditions for our problem. 
- **numstart.dat**: this file contains the scalar **0**. This number is used by the solver to identify the restart file that should be used as initial condition.
- **bct.dat** : this file contains the history of velocity vectors at the inflow face of the model according to a prescribed flow wave coming from a \*.flow file. 

We are only missing one file in order to be able to run our analysis. This file is another input file for the solver that controls the actual flow of the numerical simulation, specifying parameters such as time step size, number of time steps, number of nonlinear iterations, boundary condition control, etc. This file needs to have the name **solver.inp** (input file for the solver), and we will characterize it in detail in the following section. A detailed description is also presented in [this section](#solverSec7).

These five files are the bare minimum we need to run an analysis. However, if we want to perform more complicated simulations, involving more complex boundary conditions, we will need more input files.

#### Impedance Boundary Condition simulations :

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide impedance functions in the time domain for each impedance outlet, as well as a history of flow rates for each outlet. We will have therefore two additional ascii files: **impt.dat** (containing the impedance functions for each of the outlets), and **Qhistor.dat** (containing the flow rate history).

#### RCR Boundary Condition simulations :

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide the RCR parameters in a ascii file that will set the relationship between flow and pressure on each outflow face. This is done by defining a file named **rcrt.dat** containing such parameters. 

#### Coronary Boundary Condition simulations :

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide the coronary model parameters in a ascii file that will set the relationship between flow and pressure on each outflow face. This is done by defining a file named **cort.dat** containing such parameters. 

#### Closed-loop boundary conditions: 

This will required an executable that implements a lumped parameter network model for the patient circulation. This will be covered in a later version of this tutorial. Stay tuned!

We have completed the section on preprocessing the model. Let’s move on to **svSolver**, define the solver.inp file and run the analysis.
