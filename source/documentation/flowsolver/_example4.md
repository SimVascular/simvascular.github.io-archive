### Example 4

This example shows how to simulate a cylinder with plug steady flow at the inlet, RCR at the outlet and deformable wall with variable wall properties. Similar to Example 3, we use the simulation result of Example 2 as the initial point.

Let create a new job by copying/pasting the job of Example 3.

	Right click the data node "steady_rcr_deformable" in Data Manager
	Click "Copy"
	Right click the data ndoe "Simulations" in Data Manager
	Click "Paste"
	A new data node "steady_rcr_deformable" is created.
	Rename it as "steady_rcr_variable"

Let modify wall properties.
	
	Go to "Wall Properties"
	Type: Deformable(Variable)
	Poisson Ratio: 0.5
	Shear Constant: 0.833333
	Density: 1.0
	Pressure: 133300 (initial pressure, estimated form the simulation result of the rigid case Example 2)
	wall: E. Modulus: 4000000
	inflow: Thickness: 0.2
	outlet: Thickness: 0.1

<figure>
  <img class="svImg scImgMd" src="documentation/flowsolver/imgs/wallvariable.png">
  <figcaption class="svCaption" > </figcaption>
</figure>

	Go to "Solver Parameters"
	Step Construction: 10

For variable wall cases, the flowsolver needs much more iterations of step sequence to get accurate solution.

To create data files:

	Go to "Create Files and Run Job"
	Choose Mesh: cylinder
	Click the button "Create Data Files for Simulation"

Different from Example 3, the step also solves variable thickness or Young’s modulus, and assign them to the wall, instead of giving uniform thickness or Young’s modulus. varwallprop.vtp and displacment.vtp are created, which show the thickness and Young's modulus, and initial displacement, respectively:

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/varwallprop_paraview.png">
  <figcaption class="svCaption" >Variable Wall Thickness in varwallprop.vtp </figcaption>
</figure>


<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/disp_varwall_paraview.png">
  <figcaption class="svCaption" >Initila Displacement in displacement.vtp </figcaption>
</figure>

Similarly to Example 3, run the job and convert the results.
