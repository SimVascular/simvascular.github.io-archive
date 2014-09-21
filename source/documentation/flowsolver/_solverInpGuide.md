### Solver.inp File Guide

This section discusses the options available in the **solver.inp** file. 

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
<tr>
  <td>Body Force Pressure Gradient</td>
  <td>(0.0 0.0 0.0)</td>
  <td>(double double double)</td>
  <td></td>
</tr>
<tr>
  <td>Rotating Frame of Reference</td>
  <td>(False)</td>
  <td>False,True</td>
  <td>Specifies whether the object is subject to a constant rotational speed about a rotation axis</td>
</tr>
<tr>
  <td>Rotating frame of reference rotation rate</td>
  <td>(0.0 0.0 0.0)</td>
  <td>(double double double)</td>
  <td>Specified the vector components of the rotational speed. Note that the rotational origin is always the point at (0.0,0.0,0.0)</td>
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
  <td>(500)</td>
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
  <td>Selected linear solver</td>
</tr>
<tr>
  <td>Maximum Number of Iterations for svLS NS Solver</td>
  <td>(1)</td>
  <td>(integer)</td>
  <td></td>
</tr>
<tr>
  <td>Maximum Number of Iterations for svLS Momentum Loop</td>
  <td>(2)</td>
  <td>(integer)</td>
  <td></td>
</tr>
<tr>
  <td>Maximum Number of Iterations for svLS Continuity Loop</td>
  <td>(400)</td>
  <td>(integer)</td>
  <td>DES - CAREFUL FOR DEFORMABLE WALL SIM - USE 10,20,400</td>
</tr>
</table>

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
  <td>Value of $\rho_{\infty}$ for the generalized $\alpha$ method</td>
</tr>
<tr>
  <td>Predictor at Start of Step</td>
  <td>(Same Velocity)</td>
  <td></td>
  <td></td>
</tr>
<tr>
  <td>Flow Advection Form</td>
  <td>(Convective)</td>
  <td>Convective,Conservative</td>
  <td></td>
</tr>
<tr>
  <td>Tau Matrix</td>
  <td>(Diagonal-Shakib)</td>
  <td>Diagonal-Shakib,Diagonal-Franca,Diagonal-Jansen(dev),Diagonal-Compressible</td>
  <td></td>
</tr>
<tr>
  <td>Tau Time Constant</td>
  <td>(1.0)</td>
  <td>(double)</td>
  <td></td>
</tr>
<tr>
  <td>Tau C Scale Factor</td>
  <td>(1.0)</td>
  <td>(double)</td>
  <td></td>
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
  <td></td>
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
  <td>(False)</td>
  <td>False,True</td>
  <td>If the <b>bct.dat</b> file was created containg prescribed velocity at the inlet, this option should be set to True.</td>
</tr>
<tr>
  <td>BCT Time Scale Factor</td>
  <td>(1.0)</td>
  <td>(double)</td>
  <td>Defines an amplification factor for the velocity data contained in the <b>bct.dat</b> file</td>
</tr>
<tr>
  <td>Number of Coupled Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td>Total number of boundary surfaces with flow-pressure coupling</td>
</tr>
<tr>
  <td>Pressure Coupling</td>
  <td>(None)</td>
  <td>None,Explicit,Implicit,P-Implicit</td>
  <td></td>
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
  <td></td>
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
  <td></td>
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

#### Format of COR boundary condition file

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
  <td></td>
</tr>
<tr>
  <td>Number of Surfaces which zero out in-plane tractions</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td></td>
</tr>
<tr>
  <td>List of Surfaces which zero out in-plane tractions</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td></td>
</tr>
<tr>
  <td>Lagrange Multipliers</td>
  <td>(False)</td>
  <td>False,True</td>
  <td></td>
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
  <td></td>
</tr>
<tr>
  <td>Constrained Surface Information From File</td>
  <td>(False)</td>
  <td>False,True</td>
  <td></td>
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
  <td></td>
</tr>
<tr>
  <td>Number of Timesteps for GenBC Initialization</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td></td>
</tr>
<tr>
  <td>Number of Dirichlet Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td></td>
</tr>
<tr>
  <td>List of Dirichlet Surfaces</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td></td>
</tr>
<tr>
  <td>Number of Neumann Surfaces</td>
  <td>(0)</td>
  <td>(integer)</td>
  <td></td>
</tr>
<tr>
  <td>List of Neumann Surfaces</td>
  <td>NO DEFAULT</td>
  <td>(space-separated integer list)</td>
  <td></td>
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
  <td></td>
</tr>
<tr>
  <td>Residual Criteria</td>
  <td>(0.01)</td>
  <td>(double)</td>
  <td></td>
</tr>
<tr>
  <td>Minimum Required Iterations</td>
  <td>(3)</td>
  <td>(integer)</td>
  <td></td>
</tr>
<tr>
  <td>Step Construction</td>
  <td>(0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1)</td>
  <td>(Sequence of )</td>
  <td></td>
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
  <td></td>
</tr>
<tr>
  <td>Number of Wall Properties per Node</td>
  <td>(10)</td>
  <td>10,21</td>
  <td>nProps=10: Isotropic, nProps=21: Orthotropic</td>
</tr>
<tr>
  <td>Density of Vessel Wall</td>
  <td>NO DEFAULT</td>
  <td>(double)</td>
  <td></td>
</tr>
<tr>
  <td>Thickness of Vessel Wall</td>
  <td>NO DEFAULT</td>
  <td>(double)</td>
  <td></td>
</tr>
<tr>
  <td>Young Mod of Vessel Wall</td>
  <td>NO DEFAULT</td>
  <td>(double)</td>
  <td></td>
</tr>
<tr>
  <td>Poisson Ratio of Vessel Wall</td>
  <td>(0.5)</td>
  <td>(double in [0.0,0.5])</td>
  <td></td>
</tr>
<tr>
  <td>Shear Constant of Vessel Wall</td>
  <td>NO DEFAULT</td>
  <td>(double in [0.0,0.5])</td>
  <td></td>
</tr>
<tr>
  <td>Wall Mass Matrix for LHS</td>
  <td>(True)</td>
  <td>False,True</td>
  <td></td>
</tr>
<tr>
  <td>Wall Stiffness Matrix for LHS</td>
  <td>(True)</td>
  <td>False,True</td>
  <td></td>
</tr>
<tr>
  <td>Variable Wall Thickness and Young Mod</td>
  <td>(True)</td>
  <td>False,True</td>
  <td></td>
</tr>
</table>
  


