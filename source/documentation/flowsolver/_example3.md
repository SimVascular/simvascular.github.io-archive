### Example 3

This example shows how to simulate a cylinder with plug steady flow at the inlet, RCR at the outlet and deformable wall with uniform wall properties. The most robust way to simulate a deformable wall case is to first simulate a rigid wall case with the same boundary conditions. For this example, Example 2 is the rigid case we need to run. After the simulation of Example 2 is complete and exported, the restart files for the last step is reduced to a single file, which would be restart.500.0. 

Let create a new job by copying/pasting the job of Example 2.

	Right click the data node "steady_rcr" in Data Manager
	Click "Copy"
	Right click the data ndoe "Simulations" in Data Manager
	Click "Paste"
	A new data node "steady_rcr_copy" is created.
	Rename it as "steady_rcr_deformable"

Let modify some IC, BCs and parameters.
	
	Go to "Basic Parameters"
	Double click "IC File" and a dialog pops up
	Select the file "restart.500.0" exported from Example 2

	Go to "Wall Properties"
	Type: Deformable(Constant)
	Thickness: 0.2
	Elastic Modulus: 4000000
	Poisson Ratio: 0.5
	Shear Constant: 0.833333
	Density: 1.0
	Pressure: 133300 (initial pressure, estimated form the simulation result of the rigid case Example 2)

<figure>
  <img class="svImg scImgMd" src="documentation/flowsolver/imgs/walldeformable.png">
  <figcaption class="svCaption" > </figcaption>
</figure>

	Go to "Solver Parameters"
	Step Construction: 4

For deformable cases, the flowsolver needs more iterations of step sequence to derive accurate solution.

To create data files:

	Go to "Create Files and Run Job"
	Choose Mesh: cylinder
	Click the button "Create Data Files for Simulation"

Different from Example 2, the step also solves initial displacement, write the initial displacment to a vtp file "displacement.vtp" to review the solution, and finaly append it to restar.0.1 we just copied from restart.500.0 of Example 2.

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/disp_paraview.png">
  <figcaption class="svCaption" >Initila Displacement from displacement.vtp </figcaption>
</figure>

Similarly to Example 2, run the job and convert the results.
