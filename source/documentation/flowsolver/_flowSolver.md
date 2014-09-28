### RUNNING THE ANALYSIS: SVFlowsolver

#### Format of a basic solver.inp file 

The main goal of this section is to define the file we are missing to run the analysis. This is the **solver.inp** file (i.e., input parameters for the solver). For this problem, the file we need will look like this:

~~~
# ===================
# svSolver INPUT FILE
# ===================

# ================
# SOLUTION CONTROL
# ================
Equation of State: Incompressible
Number of Timesteps: 100
Time Step Size: 0.2

# ===================
# MATERIAL PROPERTIES
# ===================
Viscosity: 0.04
Density: 1.06

# ==============
# OUTPUT CONTROL
# ==============
Number of Timesteps between Restarts: 5
Print ybar: True

# ==================================
# CARDIOVASCULAR MODELING PARAMETERS
# ==================================
Time Varying Boundary Conditions From File: True
BCT Time Scale Factor : 1.0
Number of Coupled Surfaces: 1 
Pressure Coupling: Implicit 

Number of Resistance Surfaces: 1 
List of Resistance Surfaces: 3
Resistance Values : 8888.0

# =============
# LINEAR SOLVER
# =============
Number of Solves per Left-hand-side Formation: 1

# ======================
# DISCRETIZATION CONTROL
# ======================
Time Integration Rule: Second Order
Time Integration Rho Infinity: 0.0
Flow Advection Form: Convective

# =============
# STEP SEQUENCE
# =============
Step Construction: 0 1 0 1
~~~

The file consists of a number of blocks, each block containing a number of lines that are instructions for the solver.

**WARNING**: it is very important that the wording of each line is exactly as presented here. Even a slight change (for instance, a change from uppercase to lowercase) will make the solver not understand the command!

~~~
Equation of State: Incompressible RIGHT
Equation of state: Incompressible WRONG
~~~

The lines preceded by a **#** sign are comments and are ignored by the solver. Likewise, anything placed after a **#** on a given line is also ignored.

### Solution Control Block

In this block, the different commands are:

1. **Equation of State: Incompressible** - Here, we are telling the solver that it has to solve the **INCOMPRESSIBLE** Navier-Stokes equations. You should not change this line. If you simply don't include this line the incompressible NS solver will be used as defualt.

2. **Number of Timesteps: 100** and **Time Step Size: 0.2** - These two lines control the amount of physical time that you run your problem for. In this case,

$$
\text{Total physical time} = \text{N. time steps} \times \text{Time Step Size} = T = N \times \Delta t = 100 \times 0.2 = 20.0\,\text{sec}
$$

Note that this matches the **period** options we specified to generate the **bct.dat**. In this case, like we mentioned before, it does not really make sense to talk about a _cardiac cycle_ (this is a steady flow), but if we wanted to run this analysis for _two_ cardiac cycles, we would have to run the problem for $40.0$ seconds of physical time. If we kept our choice of time step size the same ( $\Delta t = 0.2$ sec), we will need a total number of time steps of $N = 200$.

**WARNING**: Note that this $N$ is the total number of time steps you need in your numerical simulation to model a certain physical time, given a prescribed $\Delta t$. This is not to be confused with the previous number of time steps you used to generate the bct.dat!

**WARNING**: Now the question is: how do you come up with a reasonable value for $\Delta t$? There is not a straightforward answer for this. $\Delta t$ is the parameter that controls your **temporal discretization**, which is something that works in a similar fashion to the **spatial discretization** given by your mesh: the finer, the more accurate the results, but also the bigger the size of the problem and the time to solve it! We don’t want to get into a lot of theoretical details now, so we will just provide you with a reasonable **recipe** to evaluate this parameter. The **recipe** to estimate a reasonable $\Delta t$ is based on a dimensionless parameter called the **CFL** number. The CFL number relates the velocities happening in the fluid domain ($v$), a temporal discretization parameter ($\Delta t$), and a mesh discretization parameter (i.e. mesh size) ($h$) as follows:

$$
\text{CFL} = \frac{v\,\Delta t}{h}
$$

We want this **CFL** number to be around $1.0$. This will mean that, for the velocities present in our fluid domain, the temporal and spatial discretizations are _balanced_. In our problem, it can be shown that the average expected velocity is about $v = 2.4$ cm/s; the spatial discretization parameter or finite element size is $h = 0.5$. Therefore, if we shoot for a CFL number close to one, we have:

$$
\Delta t = \frac{h}{v} = \frac{0.5}{2.4} = 0.2
$$

Of course, you can imagine that in a real-world problem things are way more complicated to evaluate: it will be much harder to estimate where your model will have the largest velocities, what the mesh element size will be there, etc. The time step size $\Delta t$ is a parameter that will have a very important impact on the performance of the linear solver of equations. The smaller you make it, the _easier_ you will be for the solver to find a solution, but the longer it will take you to reach a certain point in time.

#### Material Properties Block

This block contains the values for density and dynamic viscosity of blood: nothing really new here. Be careful though and make sure that you use the same units you have been using through the simulation process!

#### Output Control Block

In this block, the meaning of each command is:

1. **Number of Timesteps between Restarts: 5** - This line tells the solver how often it should save solution files. In this problem, you are really calculating $100$ solutions to the problem at $100$ different time points, but in general you do not want to save a solution file for every single time step. Keep in mind that two consecutive solutions are only $\Delta t = 0.2$ seconds apart! In this line, we are asking the solver to save every other $5$ files. Therefore, the output files of the solver will look like this: restart.0.\*, restart.5.\*, restart.10.\*, restart.15.\*, ...., restart.70.\*, restart.75.\*

2. **Print ybar: True** - This line tells the solver to keep track of a variable (ybar) that is an estimate of the error of the numerical solution through the simulation. This variable is saved at the **last time step** (restart.75.\*), together with the other solution variables (pressure, velocity, traction, etc...). This variable ybar is used by the adaptivity code to generate a new adapted mesh based on the errors of the current simulation.

### Cardiovascular Modeling Parameters Block

This is the block that controls the Boundary Conditions and the other features such as deformable wall parameters. The meaning of each command is:

1. **Time Varying Boundary Conditions From File: True** - This line warns the solver about the existence of a **bct.dat** file. If you have a bct.dat file (this will be the case for most simulations), this line should be set to **True**

2. **BCT Time Scale Factor : 1.0** - This line allows you to scale the time history given in the **bct.dat** file by the factor specified in this line. For example, if your original bct.dat has a period of $0.8$ seconds, and if you wanted to simulate a problem with the same inflow wave shape, but with a period of $0.4$ seconds, you would have to enter a BCT Time Scale Factor of 0.5 in this line. **For most cases**, however, you should have a value of 1.0 in this line.

3. **Number of Coupled Surfaces: 1** - This is the number of surfaces of the model where we are specifying a relation that couples Flow and Pressure. In order words, this number is the total number of **Resistance, Impedance, RCR and coronary surfaces** we have in our problem. In this case, since we only have one outlet with a resistance boundary condition, we enter a 1 in this line.

**WARNING**: this line refers to coupled surfaces. A constant pressure outlet with no coupling between flow and pressure **does not** qualify as a coupled surface! 

4. **Pressure Coupling: Implicit** - This line sets the implicit implementation of the “Coupled-Multidomain Method” in the code. This is the best choice and you shouldn’t change this line.

5. **Number of Resistance Surfaces: 1** - This line sets the number of resistance surfaces in the model. In our case, we have one resistance surface.

6. **List of Resistance Surfaces: 3** - This line the list of surface ID’s considered in the model for Boundary Condition specification. In our case, we only defined one surface ID (the number 3), at the outlet face of the model. It is very important that this number matches what you used in your \*.svpre file. Otherwise, things will not work!

7. **Resistance Values : 8888.0** - This line the list of resistancese considered in the outlets of the model. In our case, this resistance is 8888.0. 

**WARNING**: Be very careful with the units! It is also very important that ordering of the resistance values in this line and the surface ID’s you provided in the previous line is consistent. This is a very common place to make a mistake. It is also very important that whatever you enter in these last two lines is consistent with want you entered in the \*.svpre file. 

Let us illustrate this with a more complex problem with 4 outlets (see figure below)

<figure>
  <img class="svSolverImg" src="documentation/flowsolver/imgs/FourOutlets.png" width="50%">
  <figcaption class="svSolverCaption" >Schematic representation of a model with four outlets</figcaption>
</figure>

The *.supre file should read something like this:

~~~
.
.
.
zero_pressure_vtp mesh-surfaces/outlet1.vtp
zero_pressure_vtp mesh-surfaces/outlet2.vtp
zero_pressure_vtp mesh-surfaces/outlet3.vtp
zero_pressure_vtp mesh-surfaces/outlet4.vtp
#
set_surface_id_vtp exterior_faces.vtp 1
set_surface_id_vtp mesh-surfaces/outlet1.vtp 2
set_surface_id_vtp mesh-surfaces/outlet2.vtp 3
set_surface_id_vtp mesh-surfaces/outlet3.vtp 4
set_surface_id_vtp mesh-surfaces/outlet4.vtp 5
.
.
.
~~~

And the solver.inp file:

~~~
.
.
.
Time Varying Boundary Conditions From File: True
BCT Time Scale Factor : 1.0
Number of Coupled Surfaces: 4
Pressure Coupling: Implicit
Number of Resistance Surfaces: 4
List of Resistance Surfaces: 2 3 4 5
Resistance Values : 20000 10000 15000 21000
.
.
.
~~~

#### Linear Solver Block

This line tells the solver how often the left-hand-side of the system of equations should be updated in the non-linear iteration loop. 1 is a good value, we recommend you to use it. Note the default linear solver is set to **svLS**.

#### Discretization Control Block

The meaning of the lines in this block is: 

1. **Time Integration Rule: Second Order** - This line chooses the second-order, implicit $\alpha$-method time integrator implemented in the solver. This is the best choice and you should not change this line. 

2. **Time Integration Rho Infinity: 0.0** - This line sets the parameter that controls the amount of user-defined numerical dissipation. This parameter takes values in the range (0,1). The value 0 corresponds to maximal numerical dissipation, where the under-resolved frequencies are annihilated within one time step. The value 1 implies no numerical  dissipation: all the frequencies present in the simulation are maintained through the time steps. These can be dangerous if the temporal and spatial discretizations are not adequate.

3. **Flow Advection Form: Convective** - This line sets the solver to use the advective form of the Navier-Stokes equations. The alternative is to use the “Conservative” form.

#### Step sequence Block

This line controls the non-linear iteration loop within the time step . The Navier-Stokes equations constitute a no-linear system of partial differential equations. Like any non-linear system, in order to find a solution for a given time step, we must undergo an iteration process to obtain a solution that reduces the residual (i.e., the error) as we iterate more and more. The syntax of this line represents a two nonlinear iteration process for each time step. 

~~~
Step Construction : 0 1 0 1 # this is the standard two iteration
~~~

The **0** tells the solver to make a solve, the **1** to make an update of the solution. Since this sequence 0 1 is repeated, the two iterations are defined. A three non-linear iteration strategy would be defined by writing:

~~~
Step Construction : 0 1 0 1 0 1 # this is the standard three iteration
~~~

**WARNING**: Deciding on the adequate number of non-linear iterations for a problem is also a non-trivial problem. In principle, we need to iterate until the residual (i.e., the _error_) of our numerical solution is small enough. But doing many non-linear iterations on each time step is very costly. In general, for steady flow problems, 1 or 2 non-linear iterations are enough. For pulsatile problems, at least three non-linear iterations are needed. For deformable wall problems, 4 or more non-linear iterations are required. This parameter, together with the time step size $\Delta t$ and the quality of the spatial discretization given by the finite element mesh, will completely determine the performance of the linear solver of equations. The better chosen these parameters are, the faster and more accurately our simulation will run. We will talk more about this later.

The set of instructions explained here constitute a very small sample of all the possible instructions the **svSolver** can take via a solver.inp file. A more detailed discussion can be found in [this section](#solverSec7)



