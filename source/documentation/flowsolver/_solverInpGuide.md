### Solver.inp File Guide

This section discusses the options available in the **solver.inp** file. 

#### Input Control

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
  <td>Default Input File</td>
  <td> </td>
  <td>File name with relative or absolute path</td>
  <td>Most parameters are already assigned default values by hard-coding for cardiovascular simulation as shown in the following tables. Only a very small number of parameters must be set up in solver.inp. If the user needs different default values for a few parameters, the new values can also be assigned for them in solver.inp. But if the user needs different default values for many parameters, a default input file can be created and the new default values are put in this file. Users can use the file <b>default.inp</b> under SimVascular home(installation) folder as a reference to create solver.inp or a custom default input file.</td>
</tr>
</table>

#### BCT Control

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
  <td>BCT File Type</td>
  <td>(DAT) </td>
  <td>DAT,VTP</td>
  <td>This entry tells the solver to read inflwo boundary conditions from <b>bct.dat</b> or <b>bct.vtp</b>.</td>
</tr>
<tr>
  <td>Number of BCT Files</td>
  <td>(1) </td>
  <td>(integer)</td>
  <td>This entry tells the solver how many bct files need to be read. If there is only one, name it as bct.dat (or bct.vtp); if there are multiple, name them as bct1.dat, bct2.dat...(or bct1.vtp, bct2.vtp...)</td>
</tr>
<tr>
  <td>BCT Matching Type</td>
  <td>(Global Node ID) </td>
  <td>Global Node ID,Coordinates</td>
  <td>This entry tells the solver to match bct nodes by global node id or coordinates.</td>
</tr>
<tr>
  <td>BCT Time Scale Factor</td>
  <td>(1.0)</td>
  <td>(double)</td>
  <td>Defines an amplification factor for the velocity data contained in the <b>bct.dat</b> file. It allows scaling the time history given in the <b>bct.dat</b> file by the factor specified in this line. For example, if your original bct.dat has a period of $0.8$ seconds, and if you wanted to simulate a problem with the same inflow wave shape, but with a period of $0.4$ seconds, you would have to enter a BCT Time Scale Factor of 0.5 in this line. <b>For most cases</b>, it should be 1.0.</td>
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
  <td>(integer)</td>
  <td>Total number of timesteps in the simulation</td>
</tr>
<tr>
  <td>Time Step Size</td>
  <td>NO DEFAULT</td>
  <td>(double)</td>
  <td>Time size of each step</td>
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
  <td>Print Average Solution</td>
  <td>(True)</td>
  <td>False,True</td>
  <td>Print time-averaged pressure and velocities in restart files. These values can be used by the <b>svAdapt</b> application to refine the computational mesh increasing the accuracy of the resulting pressure/velocity distribution.</td>
</tr>
<tr>
  <td>Print Error Indicators</td>
  <td>(False)</td>
  <td>False,True</td>
  <td>Print time-accumulated errors of pressure and velocities to their averaged values in restart files. </td>
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
<tr>
  <td>Number of Force Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>This line specifies the number of surfaces where we are going to collect tractions (i.e., wall shear stress) in our model. Tractions are collected as a ‘post-processing’ step after the velocity and pressure fields are obtained.</td>
</tr>
<tr>
  <td>Surface ID's for Force Calculation</td>
  <td>NO DEFAULT</td>
  <td>(space separated integer list)</td>
  <td>List of ID for surfaces tagged for Force Calculation (i.e., shear stress calculation).</td>
</tr>
<tr>
  <td>Force Calculation Method</td>
  <td>(Velocity Based)</td>
  <td>Velocity Based,Residual Based</td>
  <td>Specify a method for surface force calculation (i.e., traction, shear stress).</td>
</tr>
<tr>
  <td>Apply Wall Deformation</td>
  <td>(False)</td>
  <td>True,False</td>
  <td>Decide whether to udpate wall coordinates for deformable wall during wall stress calculation</td>
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
  <td>svLS Type</td>
  <td>(NS)</td>
  <td>CG,GMRES,NS</td>
  <td>Type selected for svLS. For deformable wall cases, GMRES is recommended to improve computing performance.</tr>
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
  <td>1,2,3,4</td>
  <td>This option sets the integration order for boundary elements. Orders 1,2,3,4 correspond to 1,3,6,12 integration points, respectively.</td>
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
  <td>Number of Surfaces which zero out in-plane tractions</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>Number of surfaces with prescribed zero in-plane tractions.</td>
</tr>
<tr>
  <td>List of Surfaces which zero out in-plane tractions</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td>List of surfaces which zero out in-plane tractions. This list should adopt the same numbering strategy defined in the svPre input file</td>
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
  <td>(double)</td>
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

#### Task Control

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
  <td>Solver Task</td>
  <td>(Full Simulation)</td>
  <td>Full Simulation,Only Partition</td>
  <td>Decide whether to do full simulation or just partition restart.01 and geombc.dat.1</td>
</tr>
</table>
<br>
<br>


