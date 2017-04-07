## Adaptive Meshing

Adaptive meshing is used to create an adaptive mesh based on a simulation result. 

<figure>
  <img class="svImg svImgMd" src="documentation/meshing/img/tetgen/tetgenadapt.png">
  <figcaption class="svCaption" ></figcaption>
</figure>


Use simulation result from one single time step:

	Go to Adapt
	Options: Use One Step
	Result File(vtu): all_results.vtu, from a previous simulation. It is created as you convert previous simulation results when "As Single File" is on. 
	Step Number: Give a specifi time step number of the previous simulation
	Error Reduction Factor: (0~1)Value multiplied by the average interpolation error in order to get a target uniform local error distribution. This should be a value between zero and one. A smaller factor will attempt to achieve a mesh with smaller error.
	Global Min Edge Size: Specify a minimum target edge size. No edge size will be smaller than this size, even if the adaptor identifies that solution needs a edge length smaller than this.
	Global Max Edge Size: Specify a maximum target edge size. No edge size will be larger than this size, even if the adaptor identifies that the solution does not require an edge length this small.
	Click "Create Adapted Mesh"
	Provide a name for the adapted mesh


Use simulation results from multiple time steps:

	Go to Adapt
	Options: Use Multiple Steps
	Result File(vtu): all_results.vtu
	Start Step Number: 
	End Step Number:
	Step Increment:
	Click "Create Adapted Mesh"
	Provide a name for the adapted mesh

In the end, a new adapted mesh is created under the "Meshes" in Data Manager. Also the new adapted solution is create in [proj-path]/Meshes with a name "adapted-restart.[step number].1". You can use the adapted mesh and the adapted solution as IC file to create a new job to run simulation.

