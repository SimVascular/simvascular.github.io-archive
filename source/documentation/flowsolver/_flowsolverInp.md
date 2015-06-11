### solver.inp

The main goal of this section is to define the file we are missing to run the analysis. This is the **solver.inp** file (i.e., input parameters for the solver). Most parameters are already assigned default values for cardiovascular simulation. Only a very small number of parameters must be set up in solver.inp. For this problem, the file we need will look like this:

~~~
# ================
# SOLUTION CONTROL
# ================
Number of Timesteps: 200
Time Step Size: 0.03

# ==============
# OUTPUT CONTROL
# ==============
Number of Timesteps between Restarts: 10
Number of Force Surfaces: 1
Surface ID's for Force Calculation: 1 

# ===================
# MATERIAL PROPERTIES
# ===================
Viscosity: 0.04
Density: 1.06

# ==================================
# CARDIOVASCULAR MODELING PARAMETERS
# ==================================
Number of Coupled Surfaces: 1 
Number of Resistance Surfaces: 1 
List of Resistance Surfaces: 3
Resistance Values : 1333

# =============
# STEP SEQUENCE
# =============
Step Construction: 0 1 0 1

~~~

The file consists of a number of blocks, each block containing a number of lines that are instructions for the solver.

**WARNING**: it is very important that the wording of each line is exactly as presented here. Even a slight change (for instance, a change from uppercase to lowercase) will make the solver not understand the command!

The lines preceded by a **#** sign are comments and are ignored by the solver. Likewise, anything placed after a **#** on a given line is also ignored.

<br>
#### Solution Control Block

In this block, the different commands are:

**Number of Timesteps: 200** and **Time Step Size: 0.03** - These two lines control the amount of physical time that you run your problem for. In this case,

$$
\text{Total physical time} = \text{N. time steps} \times \text{Time Step Size} = T = N \times \Delta t = 200 \times 0.03 = 6.0\,\text{sec}
$$

Note that this doesn't match the **period** options we specified to generate the **bct.dat**. In this case, like we mentioned before, it does not really make sense to talk about a _cardiac cycle_ (this is a steady flow), but if we wanted to run this analysis for _six_ cardiac cycles, we would have to run the problem for $6.0$ seconds of physical time. If we kept our choice of time step size the same ( $\Delta t = 0.03$ sec), we will need a total number of time steps of $N = 200$.

**WARNING**: Note that this $N$ is the total number of time steps you need in your numerical simulation to model a certain physical time, given a prescribed $\Delta t$. This is not to be confused with the previous number of time steps you used to generate the bct.dat!

**WARNING**: Now the question is: how do you come up with a reasonable value for $\Delta t$? There is not a straightforward answer for this. $\Delta t$ is the parameter that controls your **temporal discretization**, which is something that works in a similar fashion to the **spatial discretization** given by your mesh: the finer, the more accurate the results, but also the bigger the size of the problem and the time to solve it! We don’t want to get into a lot of theoretical details now, so we will just provide you with a reasonable **recipe** to evaluate this parameter. The **recipe** to estimate a reasonable $\Delta t$ is based on a dimensionless parameter called the **CFL** number. The CFL number relates the velocities happening in the fluid domain ($v$), a temporal discretization parameter ($\Delta t$), and a mesh discretization parameter (i.e. mesh size) ($h$) as follows:

$$
\text{CFL} = \frac{v\,\Delta t}{h}
$$

We want this **CFL** number to be around $1.0$. This will mean that, for the velocities present in our fluid domain, the temporal and spatial discretizations are _balanced_. In our problem, it can be shown that the average expected velocity is about $v = 16.7$ cm/s; the spatial discretization parameter or finite element size is $h = 0.5$. Therefore, if we shoot for a CFL number close to one, we have:

$$
\Delta t = \frac{h}{v} = \frac{0.5}{16.7} = 0.03
$$

Of course, you can imagine that in a real-world problem things are way more complicated to evaluate: it will be much harder to estimate where your model will have the largest velocities, what the mesh element size will be there, etc. The time step size $\Delta t$ is a parameter that will have a very important impact on the performance of the linear solver of equations. The smaller you make it, the _easier_ you will be for the solver to find a solution, but the longer it will take you to reach a certain point in time.

<br>
#### Material Properties Block

This block contains the values for density and dynamic viscosity of blood: nothing really new here. Be careful though and make sure that you use the same units you have been using through the simulation process!

<br>
#### Output Control Block

In this block, the meaning of the command is:

**Number of Timesteps between Restarts: 10** - This line tells the solver how often it should save solution files. In this problem, you are really calculating $200$ solutions to the problem at $200$ different time points, but in general you do not want to save a solution file for every single time step. Keep in mind that two consecutive solutions are only $\Delta t = 0.03$ seconds apart! In this line, we are asking the solver to save every other $20$ files. Therefore, the output files of the solver will look like this: restart.0.\*, restart.10.\*, restart.20.\*, restart.30.\*, ...., restart.190.\*, restart.200.\*

**Number of Force Surfaces: 1** - This is the number of surfaces of the model where we are calculating the wall stress.

**Surface ID's for Force Calculation: 1** - This line  is list of surface ID’s considered for walls stress calculation. In our case, we only defined one surface ID (the number 1, assigned to the cylinder in svPre).

<br>
#### Cardiovascular Modeling Parameters Block

This is the block that controls the Boundary Conditions and the other features such as deformable wall parameters. The meaning of each command is:


1. **Number of Coupled Surfaces: 1** - This is the number of surfaces of the model where we are specifying a relation that couples Flow and Pressure. In order words, this number is the total number of **Resistance, Impedance, RCR and coronary surfaces** we have in our problem. In this case, since we only have one outlet with a resistance boundary condition, we enter a 1 in this line.

  	**WARNING**: this line refers to coupled surfaces. A constant pressure outlet with no coupling between flow and pressure **does not** qualify as a coupled surface! 

2. **Number of Resistance Surfaces: 1** - This line sets the number of resistance surfaces in the model. In our case, we have one resistance surface.

3. **List of Resistance Surfaces: 3** - This line the list of surface ID’s considered in the model for Boundary Condition specification. In our case, we only defined one surface ID (the number 3), at the outlet face of the model. It is very important that this number matches what you used in your \*.svpre file. Otherwise, things will not work!

4. **Resistance Values : 1333.0** - This line the list of resistancese considered in the outlets of the model. In our case, this resistance is 1333.0. 

**WARNING**: Be very careful with the units! It is also very important that ordering of the resistance values in this line and the surface ID’s you provided in the previous line is consistent. This is a very common place to make a mistake. It is also very important that whatever you enter in these last two lines is consistent with want you entered in the \*.svpre file. 

Let us illustrate this with a more complex problem with 4 outlets (see figure below)

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/FourOutlets.png">
  <figcaption class="svCaption" >Schematic representation of a model with four outlets</figcaption>
</figure>

The *.svpre file should read something like this:

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
Number of Resistance Surfaces: 4
List of Resistance Surfaces: 2 3 4 5
Resistance Values : 20000 10000 15000 21000
.
.
.
~~~

<br>
#### Step sequence Block

This line controls the non-linear iteration loop within the time step. The syntax of the line represents a two nonlinear iteration process for each time step. The **0** tells the solver to make a solve, the **1** to make an update of the solution. Since this sequence 0 1 is repeated, the two iterations are defined. 

**WARNING**: Deciding on the adequate number of non-linear iterations for a problem is also a non-trivial problem. In principle, we need to iterate until the residual (i.e., the _error_) of our numerical solution is small enough. But doing many non-linear iterations on each time step is very costly. In general, for steady flow problems, 1 or 2 non-linear iterations are enough. For pulsatile problems, at least three non-linear iterations are needed. For deformable wall problems, 4 or more non-linear iterations are required. This parameter, together with the time step size $\Delta t$ and the quality of the spatial discretization given by the finite element mesh, will completely determine the performance of the linear solver of equations. The better chosen these parameters are, the faster and more accurately our simulation will run. We will talk more about this later.

The set of instructions explained here constitute a very small sample of all the possible instructions the **svSolver** can take via a solver.inp file. A more detailed discussion can be found in [this section](#solverSec72).



