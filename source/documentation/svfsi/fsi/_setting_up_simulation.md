## Basic GUI plugin use

The plugin provides a GUI with which to create input files for your svFSI simulation using SimVascular. In this section, we will describe how to set up a fluid-structure interaction simulation of flow in a thick-walled blood vessel. For simplicity in presentation, we assume that the vessel has only one inlet and outlet. Before setting up a fluid-structure interaction job, one should have a mesh for the fluid domain and a mesh for the annulus (artery wall) domain as described above. We have provided you with an example meshes for the fluid domain of a cylinder and the solid domain of the cylinder.

Initiate a job by pressing “New Job.” Click the job in the SV Data Manager, and ensure that it appears in the plugin window. The “Domains” panel allows one to add meshes to the simulation for the different physical domains. Click “Add Mesh-Complete” and select the fluid mesh. You should see three faces appear, one for in the inlet, outlet and fluid-solid interface. Ensure that the button for “fluid” is selected.

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/domains_panel.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >The domains panel.</figcaption>
</figure>

Click “Add Mesh-Complete” and select the solid mesh. You should see four faces appear, one for in the solid inlet and outlet outlet (through which we expect no flow), one for the fluid-solid interface, at which the fluid and solid domains will be coupled, and one for the outer annulus wall, which the the edge of the physical domain of our problem. Ensure that the button for “solid” is selected.

The next panel “Physics,” which allows one to select the appropriate differential equations for your problem. Select “FSI” for a coupled fluid-structure interaction simulation and click the right arrow. This will also add “Mesh Motion,” based on the ALE method, to the domains. In the list of added equations, click “FSI” to set fluid-structure parameters. Suppose for now that we are working in CGS units. Set fluid density to 1.06 g/cm$^{3}$, viscosity to 0.04 g/(cm s), solid density to 1.06 g/cm$^{3}$, Set the elastic modulus to a nominal value of $7e7$ dynes/cm$^{2}$ (See <span>https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4009743/</span>). We expect the artery wall to be nearly incompressible, and set the Poisson ratio to 0.49. Finally, select a “nHK” for a neo-Hookean solid.

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/physics_panel.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >The physics panel.</figcaption>
</figure>

The mesh update equation determines the mesh dynamics in the ALE method. The parameter in the physics tab for this equation is the Poisson’s ratio, which should be set in the interval (0,.5), not too close to the boundary. A good default is .3.

The next tab is “output.” Select a quantity such as “WSS” for wall sheer stress, and click the right arrow to add it to variables that are output. Generally, for each piece of physics, there is a separate list of output variables. In the ALE method, since mesh motion is considered a separate domain and it has its own set of outputs.

The next tab is “boundary conditions.” Select “add,” which brings up a boundary condition menu. From there, select the type of boundary condition and other parameters accordingly. Set the lumen inlet to be a constant value Dirichlet condition of -10 cm$^{3}$/s. Select “impose flux” and a parabolic profile. Set the lumen outlet to be a constant value Neumann condition with value zero, corresponding to zero applied traction at the outlet. Set the annulus inlet and outlet to be zero Dirichlet boundary conditions, corresponding to zero displacement, which will hold them in place through the simulation. Set the annulus outer wall to a zero Neumann condition, which specifies no applied traction on the outer boundary of the physical domain.

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/dirichlet_bc.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >Setting a Dirichlet boundary condition.</figcaption>
</figure>

To couple the fluid and solid at their interface, set a Dirichlet boundary condition on “interface\_solid.” Under options, select “projection” and pick the face “interface\_fluid.” Do not apply a separate boundary condition for “interface\_fluid,” as the coupling will handle the updates. (Note that one must click Dirichlet or Neumann to get the projection box to appear. Such a condition is not added to the input file.)

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/projection_bc.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >Setting a projection boundary condition at the fluid/solid interface.</figcaption>
</figure>

For the mesh equation, set zero Dirichlet conditions on the lumen inlet and outlet. Do not set boundary conditions for the other faces.

The advanced tab options are described here, but changes are not needed for basic simulations. The button “coupled” allows the user to specify a lumped parameter network for model inlets and outlets. This requires compiling a separate executable and is beyond the scope of this tutorial. Tolerance controls when the nonlinear Newton’s iteration terminates. Residual dB reduction terminates also terminates the nonlinear Newton’s iteration, in this case when the residual decreases sufficiently from iteration to iteration. Min iterations and max iterations determines the range of nonlinear iterations allowed. Backflow stabilization sets the value of the coefficient that reduces the so-called “open-boundary instability.” This is required to be in (0,1), but is best left at the default value of .3.

A number of linear solver parameters are available; the default should suffice for now. Finally, there is “Remesher.” If this is off, then the ALE solver will not re-mesh the domains, regardless of mesh distortion. If this value is set to “TetGen,” then the ALE solver will re-mesh automatically when it decides it is necessary. Set the max edge sizes to be the same as your previous mesh spacings for each domain. Use default values for the remaining parameters.

The “Simulation Parameters” panel allows specification of general parameters for the solver. First, set the desired time step and number of steps. The value of the time step depends on your desired resolution in time and the maximum stable time step for your problem, which is determined by the spatial resolution of the mesh, underlying physics and choice of spatial discretization. The option “start from a previous simulation” allows restarting from a previous simulation. This is useful if there was a problem, or one simply wants to run the simulation for longer without re-running the first set of time steps. Under “Save simulation results,” the value start determines the first time step that is output. Increment determines how often output files are saved. Set this to one to output every time step, or to a larger value to only save a subset of the steps.

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/simulation_panel.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >The simulation panel.</figcaption>
</figure>

Finally, on the “Run Simulation” panel, click “Create Input File” to create the necessary files to run your simulation. If you wish to run with more than one processor, increase the slider accordingly. Finally, click “Run” to run your simulation.

svFSI will create a directory called n-procs, where n is the number of MPI tasks for the simulation. This directory will contain .vtu files that with values of all requested fields, as well as a log file called history.dat and averages of various quantities over time.
