## Creating a Job for Simulation ###

Let's try Example 1. The files for Example 1 can be found from the link on the left "Cylinder Example". Download and open the project. Now we assume you alread have the model and mesh for it.
 
**To create a simulation job (empty):**

	Right click the data node "Simulations" in the SV project in Data Manager
	Click "Create Simulation Job" in the popup menu
	Select Model: cylinder
	Job Name: steady
	Click "OK"

<figure>
  <img class="svImg svImgSm"  src="documentation/flowsolver/imgs/createemptyjob.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<figure>
  <img class="svImg svImgSm"  src="documentation/flowsolver/imgs/createjobdialog.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now a new data node “steady” for the job is created under the data node "Simulations" in Data Manager. Double click the data node “steady" and the tool "SV Simulation” automatically shows up. The new job is empty and has not create input and data files yet. 

