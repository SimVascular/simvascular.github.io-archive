## Solver Parameters

There are many parameters for flow solver, but only a few is required to set explicitly. Advanced paramters are optional. To check out the meannin of all the parameters, refer to [appendix](docsFlowSolver.html#solverinp).

	Number of Timesteps: 200
	Time Step Size: 0.03
	Number of Timesteps between Restarts: 10
	Step Construction : 2 # standard two iterations, enough for constant  problems.

	
<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/solverparameters.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

### Time Step Parameters Block

**Number of Timesteps: 200** and **Time Step Size: 0.03** - These two lines control the amount of physical time that you run your problem for. In this case,

$$
\text{Total physical time} = \text{N. time steps} \times \text{Time Step Size} = T = N \times \Delta t = 200 \times 0.03 = 6.0\,\text{sec}
$$

Note that this doesn't match the **period** options we specified before. In this case, like we mentioned before, it does not really make sense to talk about a _cardiac cycle_ (this is a steady flow), but if we wanted to run this analysis for _six_ cardiac cycles, we would have to run the problem for $6.0$ seconds of physical time. If we kept our choice of time step size the same ( $\Delta t = 0.03$ sec), we will need a total number of time steps of $N = 200$.

**WARNING**: Note that this $N$ is the total number of time steps you need in your numerical simulation to model a certain physical time, given a prescribed $\Delta t$. 

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
### Output Control Block

**Number of Timesteps between Restarts: 10** - This line tells the solver how often it should save solution files. In this problem, you are really calculating $200$ solutions to the problem at $200$ different time points, but in general you do not want to save a solution file for every single time step. Keep in mind that two consecutive solutions are only $\Delta t = 0.03$ seconds apart! In this line, we are asking the solver to save every other $20$ files. Therefore, the output files of the solver will look like this: restart.0.\*, restart.10.\*, restart.20.\*, restart.30.\*, ...., restart.190.\*, restart.200.\*

<br>
### Step Construction Block

This line controls the non-linear iteration loop within the time step. The syntax of the line represents a two nonlinear iteration process for each time step. Each iteration tells the solver to make a solve and an update of the solution. 

**WARNING**: Deciding on the adequate number of non-linear iterations for a problem is also a non-trivial problem. In principle, we need to iterate until the residual (i.e., the _error_) of our numerical solution is small enough. But doing many non-linear iterations on each time step is very costly. In general, for steady flow problems, 1 or 2 non-linear iterations are enough. For pulsatile problems, at least three non-linear iterations are needed. For deformable wall problems, 4 or more non-linear iterations are required. This parameter, together with the time step size $\Delta t$ and the quality of the spatial discretization given by the finite element mesh, will completely determine the performance of the linear solver of equations. The better chosen these parameters are, the faster and more accurately our simulation will run. We will talk more about this later.

The set of instructions explained here constitute a very small sample of all the possible parameters the **svSolver** can take. A more detailed discussion can be found in [this section](#solverinp).
