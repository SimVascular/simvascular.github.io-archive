### Solver.inp File Guide

This section discusses the options available in the **solver.inp** file. 

#### Default Inp File

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Default Inp File</td>
  <td>File name with relative or absolute path</td>
  <td>Most parameters are already assigned default values for cardiovascular simulation as shown in the following tables. Only a very small number of parameters must be set up in solver.inp. If the user needs different default values for a few parameters, the new values can also be assigned for them in solver.inp. But if the user needs different default values for many parameters, a default input file can be created and the new default values are put in this file. </td>
</tr>
</table>

#### Solution Control

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Equation of State</td>
  <td>(Incompressible)</td>
  <td>Incompressible, Compressible</td>
  <td>This entry tells the solver to solve the <b>INCOMPRESSIBLE</b> or <b>COMPRESSIBLE</b> Navier-Stokes equations.</td>
</tr>
<tr>
  <td>Viscous Control</td>
  <td>(Viscous)</td>
  <td>Viscous</td>
  <td>This entry activates the viscous terms in the Navier-Stokes equations. A value different from the default will neglect the contribution of the viscosity and solver the inviscid Navier-Stokes equations.</td>
</tr>
<tr>
  <td>Number of Timesteps</td>
  <td>NO DEFAULT</td>
  <td>(double)</td>
  <td>Total number of timesteps in the simulation</td>
</tr>
</table>

#### Material Properties

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Viscosity</td>
  <td>NO DEFAULT</td>
  <td>(double)</td>
  <td>Fluid viscosity</td>
</tr>
<tr>
  <td>Density</td>
  <td>NO DEFAULT</td>
  <td>(double)</td>
  <td>Fluid density</td>
</tr>
</table>

#### Body Forces

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Body Force Option</td>
  <td>(None)</td>
  <td>(Vector,User e3source.f)</td>
  <td>The vector option applies a constant body force. A user-defined body force can also be specified through the e3source.f Fortran subroutine</td>
</tr>
<tr>
  <td>Body Force</td>
  <td>(0.0 0.0 0.0)</td>
  <td>(double double double)</td>
  <td>The vector valued constant body force</td>
</tr>
</table>

#### Output Control

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Number of timesteps between restarts</td>
  <td>NO DEFAULT</td>
  <td>(integer)</td>
  <td>Number of time steps between a new restart.<step>.<proc> is saved. This values decides how often the complete status of the model is saved to disk.</td>
</tr>
<tr>
  <td>Print ybar</td>
  <td>(True)</td>
  <td>False,True</td>
  <td>Print discretization error estimates in restart files. These errors can be used by the <b>svAdapt</b> application to refine the computational mesh increasing the accuracy of the resulting pressure/velocity distribution.</td>
</tr>
<tr>
  <td>Number of Surfaces which Output Pressure and Flow</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>Total number of surfaces where average pressure and total flow rate need to be integrated. The results will be written in the simulation folder to the files PressHist.dat and FlowHist.dat</td>
</tr>
<tr>
  <td>List of Output Surfaces</td>
  <td>NO DEFAULT</td>
  <td>(space separated integer list)</td>
  <td>List of ID for surfaces where average pressure and total flow rate need to be integrated</td>
</tr>
</table>

#### Linear Solver Options

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Solver Type</td>
  <td>(svLS)</td>
  <td>svLS</td>
  <td>sv linear solver selected by default</td>
</tr>
<tr>
  <td>Maximum Number of Iterations for svLS NS Solver</td>
  <td>(1)</td>
  <td>(integer)</td>
  <td>Maximum number of iterations for the full Navier-Stokes solver</td>
</tr>
<tr>
  <td>Maximum Number of Iterations for svLS Momentum Loop</td>
  <td>(2)</td>
  <td>(integer)</td>
  <td>Maximum number of iterations for the Momentum equation solver</td>
</tr>
<tr>
  <td>Maximum Number of Iterations for svLS Continuity Loop</td>
  <td>(400)</td>
  <td>(integer)</td>
  <td>Maximum number of iterations for the continuity equation solver</td>
</tr>
<tr>
  <td>Number of Solves per Left-hand-side Formation</td>
  <td>(1)</td>
  <td>(integer)</td>
  <td>It tells the solver how often the left-hand-side of the system of equations should be updated in the non-linear iteration loop. 1 is a good value, we recommend you to use it.</td>
</tr>
</table>

**WARNING:** For simulations of deformable vessels these defaults may need to be changed to 10,20,400, respectvely. 

#### Discretization Control

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Time Integration Rule</td>
  <td>(Second Order)</td>
  <td>First Order,Second Order</td>
  <td>This option allows the user to select the parameters in the generalized $\alpha$ time integration method for systems of first order ordinary differential equations in time. Setting a first order scheme is equivalent to adopt a backward (or implicit) Euler scheme. If the user selects a second order scheme then the value of the generalized alpha parameters are determined as $\alpha_m = \frac{1}{2}\frac{3-\rho_{\infty}}{1+\rho_{\infty}}$, $\alpha_f = \frac{1}{1+\rho_{\infty}}$, and $\gamma = \frac{1}{2} + \alpha_m - \alpha_f$</td>
</tr>
<tr>
  <td>Time Integration Rho Infinity</td>
  <td>(0.5)</td>
  <td>(double in [0,1])</td>
  <td>Value of $\rho_{\infty}$ for the generalized $\alpha$ method. It sets the parameter that controls the amount of user-defined numerical dissipation. This parameter takes values in the range (0,1). The value 0 corresponds to maximal numerical dissipation, where the under-resolved frequencies are annihilated within one time step. The value 1 implies no numerical  dissipation: all the frequencies present in the simulation are maintained through the time steps. These can be dangerous if the temporal and spatial discretizations are not adequate.</td>
</tr>
<tr>
  <td>Flow Advection Form</td>
  <td>(Convective)</td>
  <td>Convective,Conservative</td>
  <td>It sets the solver to use the advective or conservative form of the Navier-Stokes equations.</td>
</tr>
<tr>
  <td>Quadrature Rule on Interior</td>
  <td>(2)</td>
  <td>1,2,3,4</td>
  <td>This option sets the integration order for elements that do not contain boundary faces. Orders 1,2,3,4 correspond to 1,4,16,29 integration points, respectively.</td>
</tr>
<tr>
  <td>Quadrature Rule on Boundary</td>
  <td>(3)</td>
  <td>(integer)</td>
  <td>This option sets the integration order for boundary elements. Orders 1,2,3,4 correspond to 1,4,16,29 integration points, respectively.</td>
</tr>
<tr>
  <td>Number of Elements Per Block</td>
  <td>(255)</td>
  <td>(integer)</td>
  <td>To improve the efficiency, the elements belonging to each processor are stored in separate groups. The size of these groups can be set by the user through this option</td>
</tr>
</table>

#### Cardiovascular Modelling Parameters

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Time Varying Boundary Conditions From File</td>
  <td>(True)</td>
  <td>True,False</td>
  <td>If the <b>bct.dat</b> file was created containg prescribed velocity at the inlet (this will be the case for most simulations), this option should be set to <b>True</b>.</td>
</tr>
<tr>
  <td>BCT Time Scale Factor</td>
  <td>(1.0)</td>
  <td>(double)</td>
  <td>Defines an amplification factor for the velocity data contained in the <b>bct.dat</b> file. It allows scaling the time history given in the <b>bct.dat</b> file by the factor specified in this line. For example, if your original bct.dat has a period of $0.8$ seconds, and if you wanted to simulate a problem with the same inflow wave shape, but with a period of $0.4$ seconds, you would have to enter a BCT Time Scale Factor of 0.5 in this line. <b>For most cases</b>, it should be 1.0.</td>
</tr>
<tr>
  <td>Number of Coupled Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>Total number of boundary surfaces with flow-pressure coupling</td>
</tr>
<tr>
  <td>Pressure Coupling</td>
  <td>(Implicit)</td>
  <td>None,Explicit,Implicit,P-Implicit</td>
  <td>This line sets the implicit implementation of the <b>Coupled-Multidomain Method</b> in the code.</td>
</tr>
<tr>
  <td>Number of Resistance Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>Total number of surfaces with assigned resistance boundary condition</td>
</tr>
<tr>
  <td>List of Resistance Surfaces</td>
  <td>NO DEFAULT</td>
  <td>(space separated integer list)</td>
  <td>List of IDs (same ID defined in the model.svpre file) of surfaces with resistance boundary condition applied</td>
</tr>
<tr>
  <td>Resistance Values</td>
  <td>NO DEFAULT</td>
  <td>(space separated double list)</td>
  <td>Resistance values for the previously specified list of faces IDs</td>
</tr>
<tr>
  <td>Number of Impedance Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>Total number of faces with impedance boundary condition</td>
</tr>
<tr>
  <td>List of Impedance Surfaces</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td>List of IDs (same ID defined in the model.svpre file) of surfaces with impedance boundary condition applied</td>
</tr>
<tr>
  <td>Impedance From File</td>
  <td>(False)</td>
  <td>False,True</td>
  <td>Must be set to True to read the impedance information from file</td>
</tr>
<tr>
  <td>Number of RCR Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>Total number of faces with boundary RCR blocks</td>
</tr>
<tr>
  <td>List of RCR Surfaces</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td>List of IDs (same ID defined in the model.svpre file) of surfaces with boundary RCR block applied</td>
</tr>
<tr>
  <td>RCR Values From File</td>
  <td>(False)</td>
  <td>False,True</td>
  <td>Must be set to True to read the impedance information from file</td>
</tr>
<tr>
  <td>Number of COR Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>Total number of faces with coronary boundary conditions</td>
</tr>
<tr>
  <td>List of COR Surfaces</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td>List of IDs (same ID defined in the model.svpre file) of surfaces with applied coronary boundary condition</td>
</tr>
<tr>
  <td>COR Values From File</td>
  <td>(False)</td>
  <td>False,True</td>
  <td>Must be set to True to read the impedance information from file</td>
</tr>
</table>

#### Format of Impedance boundary condition file

Impedance boundary conditions are defined through the **Qhistor.dat** file where the flow rate time history at each face is specifiedd and the **impt.dat** files containing impedance data. These two files must be present in the folder with all others solver files when executing **svSolver**. 

The **Qhistor.dat** file has the following format:

~~~
totTS
Q0,0 Q0,1 ... Q0,n
Q1,0 Q1,1 ... Q1,n
...
...
QtotTS,0 QtotTS,1 ... QtotTS,n
~~~

where **n** denotes the total number of faces with impedance boundary condition applied and **totTS** the total number of time steps. 

The **impt.dat** file has the following format:

~~~
nptsImpmax
numDataImp,1
t0 impVal0
...
t_numDataImp impVal_numDataImp
...
...
numDataImp,n
t0 impVal0
...
t_numDataImp impVal_numDataImp
~~~

where **nptsImpmax** is the maximum number of time steps defined on all the boundary faces with impedance boundary condition. 
There are **n** blocks in the file, each defining impedance data for each face. Every block is defined by two columns, the first denoting time and the second impedance values. 

#### Format of RCR boundary condition file

RCR boundary conditions are defined through the **rcrt.dat** file using the following format:

~~~
nptsRCRmax
...
...
numDataRCR_1
Rp_1
C_1
Rd_1
time_1_1 Pdist_1_1
... 
... 
time_1_numDataRCR Pdist_1_numDataRCR
...
...
numDataRCR_i
Rp_i
C_i
Rd_i
time_i_1 Pdist_i_1
... 
... 
time_i_numDataRCR Pdist_i_numDataRCR
~~~

The first quantity **nptsRCRmax** defines the maximum number of time points for the curves defined at each outlet.
This quantity is followed by one block for each outlet, containing **numDataRCR_i**, i.e., the number of time point for RCR outlet i.
The three values **Rp_i**, **C_i**, **Rd_i** are defined for the proximal resistance, compliance and distal vessel resistance, respectively.
A time series follows, defining the evolution in time of the reference pressure at the distal end of the RCR block.

#### Format of COR boundary condition file

Coronary boundary conditions are defined through the **cort.dat** file using the following format

~~~
nptsCORmax
...
...
numDataCOR_1
q0_1
q1_1
q2_1
p0_1
p1_1
p2_1
b0_1(=0)
b1_1
b2_1(=0)
time_1_1 Plv_1_1 (/Prv_1_1)
... 
... 
time_1_numDataCOR Plv_1_numDataCOR
...
...
...
numDataCOR_i
q0_i
q1_i
q2_i
p0_i
p1_i
p2_i
b0_i(=0)
b1_i
b2_i(=0)
time_i_1 Plv_i_1 (/Prv_i_1)
... 
... 
time_i_numDataCOR Plv_i_numDataCOR
~~~

The first quantity **nptsCORmax** defines the maximum number of time points for the curves defined at each outlet defining the ventricular pressures.
This quantity is followed by one block for each outlet, containing **numDataCOR_i**, i.e., the number of time point for Coronary outlet i.
Nine constants need also to be defined for each coronary outlet, i.e., $q\_0$, $q\_1$, $q\_2$, $p\_0$, $p\_1$, $p\_2$, $b\_0$, $b\_1$, $b\_2$.
The physical meaning of these constants is related to the resistances and capacitances used to simulated each coronary outlet, as shown in the picture below:

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/CorBC.png">
  <figcaption class="svCaption" >Circuit visualization for coronary boundary condition</figcaption>
</figure>

The following expressions are used in [this paper](docsRefs.html#refSec2).

$$
p\_0 = 1,\quad
p\_1 = R\_{a-micro}C\_a + (R\_v + R\_{v-micro})(C\_a + C\_{im}),\quad
p\_2 = C\_{a}\,C\_{im}\,R\_{a-micro}(R\_v + R\_{v-micro}).
$$

$$
q\_0 = R\_{a} + R\_{a-micro} + R\_{v} + R\_{v-micro},\quad
q\_1 = R\_{a}C\_{a}(R\_{a-micro} + R\_{v} + R\_{v-micro}) + C\_{im}(R\_{a} + R\_{a-micro})(R\_{v} + R\_{v-micro}).
$$

$$
q\_2 = C\_{a}C\_{im}R\_{a}R\_{a-micro}(R\_v + R\_{v-micro}),\quad
b\_0 = 0,\quad
b\_1 = C\_{im}(R\_v + R\_{v-micro}),\quad
b\_2 = 0.
$$

#### Backflow Control

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Backflow Stabilization Coefficient</td>
  <td>(0.2)</td>
  <td>(double in [0,1])</td>
  <td>Backflow stabilization coefficient. For the definition of these coefficient, see the [following publications](docsRefs.html#refSec2)</td>
</tr>
<tr>
  <td>Number of Surfaces with zero in-plane tractions</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>Number of surfaces with prescribed zero in-plane tractions.</td>
</tr>
<tr>
  <td>List of Surfaces with zero in-plane tractions</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td>List of surfaces with zero in-plane tractions. This list should adopt the same numbering strategy defined in the svPre input file</td>
</tr>
<tr>
  <td>Lagrange Multipliers</td>
  <td>(False)</td>
  <td>False,True</td>
  <td>Activate/deactivate Lagrange multipliers</td>
</tr>
<tr>
  <td>Number of Constrained Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>Total number of face with applied Lagrange multiplier constraints</td>
</tr>
<tr>
  <td>List of Constrained Surfaces</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td>List of surfaces with applied Lagrange multipliers. This list should adopt the same numbering strategy defined in the svPre input file</td>
</tr>
<tr>
  <td>Constrained Surface Information From File</td>
  <td>(False)</td>
  <td>False,True</td>
  <td>This flag needs to be set to true if a file is available with the information on how to set Lagrange multipliers at selected outlets</td>
</tr>
</table>

#### Closed Loop Boundary Conditions

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Find the GenBC Inside the Running Directory</td>
  <td>(True)</td>
  <td>False,True</td>
  <td>Look for a GenBC executable inside the current simulation folder. This executable implements a 0D lumped circulation model providing the boundary conditions to the 3D Finite Element solver</td>
</tr>
<tr>
  <td>Number of Timesteps for GenBC Initialization</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>This defines the number of steps to be performed before activation the the closed-loop boundary conditions. For timesteps smaller than this value, the GenBC application will provide fixed boundary pressures at each outlet equal to the initial values provided by the user.</td>
</tr>
<tr>
  <td>Number of Dirichlet Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>This is the total number of surfaces where the 3D model exchanges Pressure information with the 0D lumped parameter network model. For details the reader should read [this publication](docsRefs.html#refSec2)</td>
</tr>
<tr>
  <td>List of Dirichlet Surfaces</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td>This is the list of surface IDs where the 3D model exchanges pressure information with the 0D lumped parameter network model</td>
</tr>
<tr>
  <td>Number of Neumann Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>This is the total number of surfaces where the 3D model exchanges flow rate information with the 0D lumped parameter network model. For details the reader should read [this publication](docsRefs.html#refSec2)</td>
</tr>
<tr>
  <td>List of Neumann Surfaces</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td>This is the list of surface IDs where the 3D model exchanges flow rate information with the 0D lumped parameter network model</td>
</tr>
</table>

#### Non-linear Iteration Control

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Residual Control</td>
  <td>(True)</td>
  <td>False,True</td>
  <td>Activates the possibility of adjusting the number of iterations based on the value of the residual norm at the current iteration</td>
</tr>
<tr>
  <td>Residual Criteria</td>
  <td>(0.01)</td>
  <td>(double)</td>
  <td>Lower bound on the residual norm that triggers convergence. In other words, if the residual norm is lower than this value the solver will consider the current time step converged and continue to the next step</td>
</tr>
<tr>
  <td>Minimum Required Iterations</td>
  <td>(3)</td>
  <td>(integer)</td>
  <td>This are the number of iterations that are performed independently on the value of the residual norm in the current time step</td>
</tr>
<tr>
  <td>Step Construction</td>
  <td>(0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1)</td>
  <td>(Sequence of 0 and 1)</td>
  <td>Non linear iteration sequence. It controls the non-linear iteration loop within the time step . The Navier-Stokes equations constitute a no-linear system of partial differential equations. Like any non-linear system, in order to find a solution for a given time step, we must undergo an iteration process to obtain a solution that reduces the residual (i.e., the error) as we iterate more and more. The 0 tells the solver to make a solve, the 1 to make an update of the solution. For example, a ten iterations solution is specified as default as a sequence of solve/update operations</td>
</tr>
</table>

#### Deformable Wall Simulations

<table class="table table-bordered">
<thead>
<tr>
  <th>Command</th>
  <th>Default</th>
  <th>Possible Values</th>
  <th>Description</th>
</tr>
</thead>
<tr>
  <td>Deformable Wall</td>
  <td>(False)</td>
  <td>False,True</td>
  <td>Activates/deactivates the deformability of vessel walls using the coupled-momentum method **LINK**</td>
</tr>
<tr>
  <td>Number of Wall Properties per Node</td>
  <td>(10)</td>
  <td>10,21</td>
  <td>Defines the material model for the vessel wall. Option "10" (default option) means that an isotropic material model needs to be used. Option "21" means that an orthotropic material model needs to be used</td>
</tr>
<tr>
  <td>Density of Vessel Wall</td>
  <td>NO DEFAULT</td>
  <td>(double)</td>
  <td>Mass density of the vessel wall material</td>
</tr>
<tr>
  <td>Thickness of Vessel Wall</td>
  <td>NO DEFAULT</td>
  <td>(double)</td>
  <td>Uniform thinkness of the vessel wall material</td>
</tr>
<tr>
  <td>Young Mod of Vessel Wall</td>
  <td>NO DEFAULT</td>
  <td>(double)</td>
  <td>Uniform elastic modulus for the vessel walls</td>
</tr>
<tr>
  <td>Poisson Ratio of Vessel Wall</td>
  <td>(0.5)</td>
  <td>(double in [0.0,0.5])</td>
  <td>Uniform Poisson ratio for the vessel walls</td>
</tr>
<tr>
  <td>Shear Constant of Vessel Wall</td>
  <td>NO DEFAULT</td>
  <td>(double in [0.0,0.5])</td>
  <td>Uniform Shear constant for the vessel walls</td>
</tr>
<tr>
  <td>Wall Mass Matrix for LHS</td>
  <td>(True)</td>
  <td>False,True</td>
  <td>Assembles the contribution of the wall mass matrix in the global LHS matrix</td>
</tr>
<tr>
  <td>Wall Stiffness Matrix for LHS</td>
  <td>(True)</td>
  <td>False,True</td>
  <td>Assembles the contribution of the wall stiffness matrix in the global LHS matrix</td>
</tr>
<tr>
  <td>Variable Wall Thickness and Young Mod</td>
  <td>(False)</td>
  <td>False,True</td>
  <td>Activates/deactivates the possibility of specifying a variable thickness/elastic modulus for the vessel wall material</td>
</tr>
</table>
<br>
<br>


