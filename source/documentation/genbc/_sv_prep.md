## Preparing SimVascular solver files to interact with GenBC

We will assume at this point that you will have already built the geometry of your model and meshed it using the model construction pipeline in SimVascular. This tutorial will start right at the “Simulations” module. Create a new Simulation job by right-clicking the “Simulations” item in the Data Manager, then click “Create New Simulation Job”. Select the appropriate Model from the drop down menu and give it a name.

Navigate through the various tabs to set your simulation parameters. We will skip over the majority of these settings in this tutorial to keep it focused on GenBC, but you can find detailed explanations about the Simulations module in the main documentation. 

We now focus our attention to the “Inlet and Outlet Bcs” tab. In this tab, you should see a list of all the caps of your model. The main task we want to accomplish here is to tag our caps as either a Dirichlet (i.e. flow) or Neumann (i.e. pressure). For caps where we want to specify flow, double-click the empty box in the “BC Type” column and select “Prescribed Velocities” from the drop-down menu. Now, double-click the name of the Dirichlet outlet to open up a new window with additional parameters.

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/velocities_window.png">
  <figcaption class="svCaption" >Prescribed inflow settings window.</figcaption>
</figure>

Here, we need to specify an analytic shape of the velocity profile (usually parabolic or plug), and a “template” .flow file (can just be a steady flow file. We have provided one as part of this tutorial). Even though the GenBC framework will compute the flows that will ultimately be applied on your model, SimVascular still needs to have some information about the desired velocity profile in the form of a bct.dat file. During execution, SimVascular will normalize the velocity profile on your Dirichlet inlets to have a flow of 1.0, then multiply the velocity profile by the flow that is computed in GenBC. Dirichlet flow caps are normally associated with caps directly connected to an inductor, or at caps where the user wants to directly specify a flow waveform that is either measured or adapted from literature. For the cylinder example, we want to specify the “inlet” face as a Dirichlet boundary condition. Set the BC Type to Prescribed Velocities, and set the Analytic Shape to parabolic. For the Flow rate entry, select the “template_flow.flow” file that we have also provided.

For outlets where we want to specify a Neumann/pressure boundary condition, select “Resistance” for the BC Type and assign it a value of 0. These settings are merely a placeholder and will be updated shortly. Neumann-type boundary conditions are typically used for caps that interface directly with either a capacitor or a resistor. For our cylinder case, specify the “outlet” face as a Resistance boundary condition and set its Value to zero. When you are done, the Inlet and Outlet Bcs tab should look like this:

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/inlet_and_outlet_bcs.png">
  <figcaption class="svCaption" >Inlet and outlet conditions.</figcaption>
</figure>

After setting the wall properties and solver parameters, we need to create the data files for the simulation. Go to the “Create Files and Run Simulation” tab, select the appropriate mesh fro the drop down menu, and click “Create Data Files for Simulation”. If this step completes successfully, then navigate to your project directory using the file explorer on your machine. Inside the Simulations folder, you should see a folder corresponding to the simulation job you just created. Inside that folder should be various files and folders:

	1. mesh-complete – Contains mesh information and discretization in VTK format files
	2. bct.dat and bct.vtp – Contains velocity profile information on your Dirichet caps
	3. .svpre file – Pre-solver script which instructs SimVascular how to prepare the simulation files
			 from your mesh. Contains the ID numbers for mesh surfaces (used later)
	4. geombc.dat.1 – Simulation file that contains geometry information
	5. inlet.flow - .flow file which has the template flow information at your inlet face(s)
	6. numstart.dat – Dummy file which tells the solver on which timestep to start on
	7. restart.0.1 – Contains initial conditions for pressure and velocity in your simulations
	8. solver.inp – Solver settings file

We will need to make some slight modifications to the solver.inp file to facilitate the use of GenBC. Open solver.inp with your favorite text editor, and scroll down to the section right below “Step Construction”. You should see a list of three commands that all have to do with Resistance boundary conditions:

	Number of Resistance Surfaces: 1
	List of Resistance Surfaces: 3
	Resistance Values: 0

Recall that we specified Resistances surfaces as placeholders for our Neumann surfaces. We can thus delete these from the solver.inp.

We next need to add commands to the solver.inp to instruct SimVascular to look for GenBC and to properly look for all the surfaces. First, add the following commands to your solver.inp right under the Step Construction:

	Find the GenBC Inside the Running Directory: True
	Number of Timesteps for GenBC Initialization: 0

These commands will tell SimVascular to look for a GenBC file to specify boundary conditions. Next, we need to include a block of commands to specify the Dirichlet surfaces:

	Number of Dirichlet Surfaces: 1
	List of Dirichlet Surfaces: 2

The first command, “Number of Dirichlet Surfaces”, specifies the total number of caps in your model where we want to supply a Dirichlet boundary condition from GenBC. The next command, “List of Dirichlet Surfaces”, is a list of all the surface IDs where a Dirichlet surface will be applied. The surface ID numbers are automatically generated by SimVascular when creating the simulation files. In this cylinder case, the inlet is tagged with an ID number of 2, so we put 2 in the list. 

You can check the ID numbers for your surfaces by opening the .svpre file mentioned earlier in a text editor. Inside the .svpre file you should see commands named “set_surface_id_vtp”, followed by a path to a mesh surface, followed by a number. Our cylinder example produced the following ID numbers in the .svpre file:

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/surface_ids.png">
  <figcaption class="svCaption" >Surface IDs in .svpre file.</figcaption>
</figure>

Here, you can see that the exterior of our mesh is tagged with ID 1, the inlet is tagged with ID 2, and the outlet is tagged with ID 3. This confirms our selection of “2” in the List of Dirichlet Surfaces.

If you have more than one surface that needs to be included in the List of Dirichlet Surfaces, separate their ID numbers with a space like so:

	List of Dirichlet Surfaces: 2 4 5 6

We now have to add a similar block for our Neumann surfaces:

	Number of Neumann Surfaces: 1    
	List of Neumann Surfaces: 3 

Since our outlet has ID 3, we use that number in the List of Neumann Surfaces. Like before, if you have multiple Neumann surfaces you can specify their IDs numbers in the list separated by spaces.

Finally, we need to make one more small adjustment. You should see a command called “Number of Coupled Surfaces” in the solver.inp. Change this number to the total number of Dirichlet AND Neumann surfaces in your model. This is to indicate that these surfaces are coupled in the sense that the flow and pressure have the potential to be coupled in the GenBC formulation. For this example, the number of coupled surfaces is 2 because we have 1 Dirichlet surface and 1 Neumann surface.

That is it for the edits to the solver.inp. After making these changes, you should have the following lines of code in your solver.inp:

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/solver_lines.png">
  <figcaption class="svCaption" >Configured solver.inp for GenBC simulation of an RCR cylinder.</figcaption>
</figure>
