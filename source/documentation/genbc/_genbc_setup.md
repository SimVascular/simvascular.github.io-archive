## Setting up GenBC

The Fortan files implementing GenBC are found in the project directory under the **GenBC-program** folder. This folder contains 
three Fortran source files (GenBC.f, Modules.f and USER.f) and a Makefile.

All of the implementation will be done in USER.f. Open this file with a text editor. We will proceed down this code and explain it in blocks. The first block that the user can change is the “unit conversion” block:

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/unit_conversion_block.png">
  <figcaption class="svCaption" >Unit conversion block of GenBC.</figcaption>
</figure>

In this block, you can specify conversion factors between pressure and flow in the GenBC code, and pressure and flow in the SimVascular flowsolver. In general, SimVascular models and flowsolvers use the CGS unit system (centimeter-gram-second). The units for pressure and flow in this system are dyne/cm^2 and cm^3/s, respectively. In the GenBC framework, it is often convenient to work with “clinical” units of pressure (i.e. mmHg). The conversion factor between mmHg and dyne/cm^2 is 1334 (dyne/cm^2) / mmHg, hence the value of 1.334D3 for the pConv variable. The clinical unit for flow is mL/s, which is equivalent to cm^3/s, so we leave the qConv variable at 1.0. If you want to develop your LPN model using CGS units for the parameter values, then you can change both Conv variables to 1.0. Note that the system you will choose to work with will affect the values of the parameters in your LPN network, and the values for the initial conditions in your LPN network as will be described below.

The pCorr and qCorr variables are seldom used and can be left as .FALSE.
The next block is the inputs block:

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/inputs_block.png">
  <figcaption class="svCaption" >Inputs block of GenBC.</figcaption>
</figure>

In this block, you must specify the number of Dirichlet and Neumann surfaces that match you specified earlier in your solver.inp. Next, you need to specify the number of unknowns. This is the total number of state variables that you will solve for in your boundary condition model. In this case, we have just a simple model with 2 unknowns for our 2 caps, so we set this number to 2. But more sophisticated models will often involve solving for more unknowns than there are caps. This is common for heart model LPNs, where the volumes, pressures, and flows need to be computed as state variables for each chamber of the heart. But these “internal variables” do not necessarily get applied as boundary conditions to the 3D model.

The next parameter is the number of sub time steps used in time-integrating the system of ordinary differential equations to the next time step. Because the boundary condition model is often significantly cheaper than computational fluid dynamics, we can afford to iterate the boundary condition model at a much smaller time step size. This parameter specifies how many timesteps will be used to integrate the boundary condition model IN BETWEEN time steps of the 3D model. 100 is a good number here and you will likely never have to change this.

Nxprint specifies the number of extra information you would like to output. This will be further explained later, but for now we can leave this as 3.

The next block is the initial conditions block:

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/IC_block.png">
  <figcaption class="svCaption" >Initial conditions block of GenBC.</figcaption>
</figure>

Because the boundary condition model is comprised of a system of ordinary differential equations, we need to specify the initial values for all the state variables. In this example, we have defined the first state variable to be the inflow to the model, and give it an initial condition of -10 mL/s (the negative is to denote inflow, rather than outflow of the model). The second state variable is the pressure on the RCR capacitor, which we initialize to 90 mmHg.

The next block is the surface mapping block.

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/srftox_block.png">
  <figcaption class="svCaption" >Surface mapping block of GenBC.</figcaption>
</figure>

In this block, we specify the mapping between state variables in the boundary condition model and surface IDs in the SimVascular simulation. Recall that in our solver.inp we had to specify a list of the surface IDs for the Dirichlet and Neumann surfaces. These two vectors (srfToXdPtr and srfToXPtr) are the corresponding lists in the boundary condition model. The elements of these vectors are the state variable indices that will be applied as boundary conditions on the model.

Take the first vector as an example. This vector is called “srfToXdPtr” and specifies the mapping between state variables and the Dirichlet surfaces of the SimVascular model. Recall from the section on the initial conditions that we defined the first state variable (i.e. index 1) to correspond to the flow at the cylinder inlet. Hence, the vector “srfToXdPtr” has a 1 to indicate this.

The second vector “srfToXPtr” specifies the mapping between state variables and the Neumann surfaces in our SimVascular model. Since we are using the second state variable for the RCR capacitance pressure, we put a 2 in this list.

Additional entries can be added to these vectors for more complex models separated by commas:

	srfToXdPts = (/1,4,5,6/)

A good safety check at this point is the make sure the vectors in this block have the exact same length as the corresponding lists of surface IDs in solver.inp. SrfToXdPtr should have the same length as “List of Dirichlet Surfaces” in solver.inp, and srfToXPtr should have the same length as “List of Neumann Surfaces”. Each element in the USER.f lists should have a matching pair in the solver.inp lists. To recap for this example, state variable 1 gets applied to surface ID 2 as a Dirichlet boundary condition, and state variable 2 gets applied to surface ID 3 as a Neumann boundary condition.

The final block in USER.f is the equations block:

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/equations_block.png">
  <figcaption class="svCaption" >Equations block of GenBC.</figcaption>
</figure>

In this block, we specify parameter values, write out the governing differential equations, and specify any extra outputs we would like to be printed out. We first define the parameters of our RCR outlet circuit. We need to specify three parameters: proximal resistance Rp, capacitance C, and distal resistance Rd. As is typical of Windkessel models, the distal resistance is significantly higher. Here, we use a simple 10:1 ratio, which is fairly standard. Typically, the values of these parameters are specified or tuned such that the simulation results match either population average data or patient-specific data. Here, we just use nominal values for this example. Note the Fortran method for specifying variables. First the type and name of the variables must be declared:

	REAL(8) Rp, C, Rd

Then, the values can be set on subsequent lines. Also note how all non-comment lines of code start in column 7, as is required by the Fortran programming language.

Next, we specify the governing differential equations for our LPN model. These are saved in the output vector “f”. Note that “f” has length equal to the number of unknowns. Since we have 2 unknowns in this cylinder model, we need to specify a differential equation for both. For our inflow (i.e. state variable 1) recall that we set an initial condition of 10 mL/s. Just for the sake of this example, let’s apply a simple sinusoidal oscillation such that we get a little unsteadiness in our result. We apply a time derivative of cos(15t) to the inflow. Note that if a steady inflow is desired, simply set the time derivative to 0. This will cause the boundary condition model to maintain the initial condition.

For the RCR circuit, we apply the differential equation governing the pressure evolution on the capacitor. Assuming an inflow of Q into the capacitor, P is the current pressure on the capacitor, and applying Kirchoff’s laws of current and voltage conservation, the time derivative of the pressure is:

<figure>
  <img class="svImg svImgSm" src="documentation/genbc/imgs/dpdt.jpg">
  <figcaption class="svCaption" >RCR equation for pressure.</figcaption>
</figure>

This is reflected in the code in the expression for f(2). Finally, we need to add an offset for the proximal resistance. The offset serves a purpose of adding to or subtracting from a state variable before it gets applied as a boundary condition for the fluid dynamics simulation. In this case, the pressure that is applied on the simulation needs to be offset by the action of the proximal resistance. This offset pressure is simply the flow into the capacitor multiplied by the proximal resistance.

A quick explanation about the P and Q variables. Note how these are inputs to the FINDF subroutine we have been modifying. These are pressures and flows that are computed by the fluid dynamics simulation and passed to the boundary condition model as inputs. For Dirichlet boundary conditions, SimVascular computes an area-averaged pressure across that face and passes it to P vector. For Neumann boundary conditions, SimVascular computes the flow out of that outlet and passes it to Q vector. For most coupled boundary conditions, these P and Q values are needed as inputs. Take our RCR outlet condition for example. It needed the flow out of the outlet face (i.e. Q(1)) in order to specify the differential equation for the pressure. This is what is meant by “coupled” boundary conditions, where the pressure and flow at the caps of our model are intimately linked through the boundary condition model. We did not make use of the P vector in this case since we are using a special case of a completely prescribed inflow. But this will be used for more general Dirichlet boundary conditions.

Another quick explanation on the “x” variable. This vector contains the current values for the state variables. In this case, x(1) contains the current value of flow at the inflow, and x(2) contains the current value of pressure on the RCR capacitor. The current values of the state variables are often used in numerical solutions of systems of ordinary differential equations, so this x variable is how you access them. In this example, we only utilized the current pressure on the capacitor in specifying f(2), but more complex models will make more use of the “x” variable.

We recommend writing out the governing equations using a pencil and paper before implementing them in the Fortran code. This will keep you organized and ensure that the equations are being derived and implemented in the code correctly.

Finally, we can specify additional outputs that we would like to see in the Xprint vector. The variables specified here will appear in the outputs. This part is completely optional, but it can be useful to print out additional variables when debugging. Recall in the input block that we specified 3 Xprints, which will allocate 3 slots in the Xprint vector. You can raise this number if you would like to print out more. For this case, we have printed out three variables: the current time (t), the flow at the Neumann outlet (Q(1)), and the value of the proximal resistance offset.
