### Running Script

To define the initial and boundary conditions of this problem, svPre need a script file (\*.svpre) file. We go to the _Simulations->Create 3-D Solver Files_ tab. In the “Create PreSolver script file” menu (see figure  below), make sure that the right \*.svpre file is loaded in the box (in this case, it should be cylinder.svpre . Click on the “**Load PreSolver scriptfile**” button. The following screen will appear:

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/svpre_gui.png">
  <figcaption class="svCaption" >Running <b>svPre</b> through the GUI</figcaption>
</figure>

The contents of the cylinder.svpre script file are:

~~~
# Read Mesh info
mesh_and_adjncy_vtu mesh-complete/mesh-complete.mesh.vtu

# Assign IDs to the surfaces
set_surface_id_vtp mesh-complete/mesh-complete.exterior.vtp 1
set_surface_id_vtp mesh-complete/mesh-surfaces/inflow.vtp 2
set_surface_id_vtp mesh-complete/mesh-surfaces/outlet.vtp 3

# Set Inlet BC
prescribed_velocities_vtp mesh-complete/mesh-surfaces/inflow.vtp

# Set BCT for Inlet
fluid_density 1.06
fluid_viscosity 0.04
bct_analytical_shape parabolic
bct_period 1.0
bct_point_number 2
bct_fourier_mode_number 1
bct_create mesh-complete/mesh-surfaces/inflow.vtp flow-files/steady.flow
bct_write_dat
bct_write_vtp

# Set Outlet BC
zero_pressure_vtp mesh-complete/mesh-surfaces/outlet.vtp

# Set Wall BC
noslip_vtp mesh-complete/walls_combined.vtp

# Write geometry and property data to geombc.dat.1
write_geombc

# Write initial values of velocity, pressure, etc to restart.0.1
write_restart
~~~

As we said before, each line of this \*.svpre file represents a command that will be executed by **svPre**. This file needs to be edited to incorporate the right parameters/conditions for this problem. A complete list of svpre commands available is [this section](#solverSec71).Here is a description of each line.

The first line is used to define the topology of the finite element mesh. The first command **mesh\_and\_adjncy_vtu** used a vtk unstructured mesh file to define node coordinates, element connectivities and an adjacency relationship between elements. 

~~~
mesh_and_adjncy_vtu mesh-complete/mesh-complete.mesh.vtu

~~~

The following command is used to assign an ID to all model surfaces.

~~~
set_surface_id_vtp cylinder.exterior.vtp 1
~~~

**HINT**: This line tags all the exterior faces in the model with an identifier (a Suface ID) , in this case, the number one. The assignment can tell flowsolver later which faces needed for wall stress calculation. We also need to introduce a new command if we want to activate the resistance boundary condition at the outlet face. We had previously determined that a resistance equal to $R = 1333.0$ dynes$\,$s/cm$^5$ needs to be applied at that outlet. 

In order to do this, we need to assign a Surface ID that will help us later to identify the face and assign the correct resistance value. This is a trivial case, because we only have one single outflow face, and therefore one single resistance. But imagine one case where many more are needed. In this case, it is very important to meticulously label all the outlet faces with a meaningful name, and to make a sketch that helps you remember the list of Surface IDs that you considered in the model. Each surface ID will have a corresponding Resistance value (or impedance function, or set of RCR parameters etc.).

Going back to our \*.svpre file, we need to add a line specifying the surface ID for the outlet face. We also number all other model surfaces in case we need to apply different boundary conditions through the **solver.inp** file.

~~~
set_surface_id_vtp mesh-complete/mesh-surfaces/inflow.vtp 2
set_surface_id_vtp mesh-complete/mesh-surfaces/outlet.vtp 3
~~~
**HINT**: Since a face can only have one ID, now ID 1 just represents cylnder wall because the inlet and outlet are assigned with ID 2 and 3.

The following line uses the existing **inflow.vtp** file to define a boundary subregion with applied velocities. 

~~~
prescribed_velocities_vtp mesh-complete/mesh-surfaces/inflow.vtp
~~~

Note that we are just pointing to the right file (inflow.vtp) in the mesh-surfaces folder where we want some velocity vectors to be prescribed. These velocity vectors are given by the **bct.dat** file, already created from GUI as shown above. We must use the command prescribed_velocities_vtp in each surface where we prescribe some flow wave via a Dirichlet condition on the velocity vectors of that face. Instead, we can also create bct.dat (and bct.vtp) here using script commands as below. Similar to the GUI example above, these commands need to provide info about fluid density, fluid viscosiyt, velocity profile shape, period length, number of points in one period, number of fourier modes, inlet face, and flow file.

~~~
fluid_density 1.06
fluid_viscosity 0.04
bct_analytical_shape parabolic
bct_period 1.0
bct_point_number 2
bct_fourier_mode_number 1
bct_create mesh-complete/mesh-surfaces/inflow.vtp flow-files/steady.flow
bct_write_dat
bct_write_vtp
~~~

Like before, we are only pointing to the right path of the surface file where we want to prescribe the nonslip (rigid wall) condition. This is also a Dirichlet condition that makes all the velocity vectors of the nodes of the surface **wall** to be zero.

~~~
zero_pressure_vtp mesh-complete/mesh-surfaces/outlet.vtp
~~~

By using this condition, we are making the face **outlet** into a **weakly-pressure** face. This is mathematically expressed by the expressions we saw before:

$$
p = p\_0 + R\,Q
$$

$$
p(t)=p\_0 + \frac{1}{T}\,\int\_{t-T}^{t} Z(t−\tau) \, Q(\tau) \, d\tau
$$

This expression sets $p\_0 = 0$ for the face **outlet**. The total pressure set on that face will be the result of the flow-pressure operator considered (i.e., resistance, impedance, RCR, Coronary etc.).

The following line set no-slip boundary conditions for all walls. Since for this simple cylinder, there is only one wall and We can also use mesh-complete/mesh-surfaces/wall.vtp instead of mesh-complete/walls_combined.vtp.

~~~
noslip_vtp mesh-complete/walls_combined.vtp
~~~

The last two lines are the culmination of all the work you have been doing in **SimVascular** to this point!

~~~
write_geombc

write_restart
~~~

They generate two binary files (geombc.dat.1) and (restart.0.1) that are used as inputs for **svSolver** and are used to run the flow analysis. 

- **geombc.dat.1** contains the combination of geometry, material properties and boundary conditions specified in the problem.

- **restart.0.1** contains the set of initial conditions for our problem. We haven’t said anything about initial conditions till now. If you do not do something different, **SimVascular** will specify an almost-zero velocity initial condition for all the nodes of the mesh and a zero pressure **initial condition**. Here, the number **0** refers to **time step zero**, as it corresponds to the first file of the simulation.

Now, click on **Run PreSolver**. This command will actually launch the **svPre** application. A window will pop up, and you will see the list of commands of your *.svpre file being executed. After a few seconds (or minutes, depending on the size of the problem), the files **geombc.dat.1** and **restart.0.1** will be generated.

You can do the same if, instead of using the **SimVascular** GUI, you edit the \*.svpre file like shown above, and then, from the command line, type:

~~~
%svpre cylinder.svpre
~~~

**HINT**: In both files, the number “.1” refers to the **partition number** of the file. Remember **svSolver** has the ability of running a problem _in parallel_ (i.e., using multiple processors or computing cores), using MPI (message-passing interface). When we run a job using multiple processors, the first thing that happens is the “splitting” of these two files into as many processors we are going to use in our analysis, so the calculations can be performed faster. For example, if we use $4$ processors later in svSolver, these files will be split as follows:

~~~
geombc.dat.1 => geombc.dat.1 , geombc.dat.2 , geombc.dat.3 , geombc.dat.4

restart.0.1 => restart.0.1 , restart.0.2 , restart.0.3 , restart.0.4
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

