##Inflow boundary condition

Now that we have a mesh, we are ready to start setting up the simulation boundary conditions. First, we will specify the inflow boundary condition. The inflow the most coronary simulations will be applied at the aortic inlet, thus we want to specify a flow waveform that models the flow out of the aortic valve. We have provided a .flow file which has the following waveform:

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/inflow_waveform.jpg">
  <figcaption class="svCaption" >Figure 8: Aortic inflow waveform</figcaption>
</figure>

Note that the flow is negative because we are specifying flow into the model. The normal vector at the aortic inlet is pointing outwards, thus negative flow will be going into the model.

To specify this inflow waveform in SimVascular, first go to the “Inlet and Outlet Bcs” tab in the Simulations module. Select the cap that corresponds to the aortic inlet of your model (this is cap\_aorta in the example). Double click the “BC Type” and select “Prescribed Velocities” from the drop down menu. Then, double click the name of your inlet (cap\_aorta) to open up the configuration menu for the inlet BC. From here, there should be an option to select “Flow rate (from File)”. Click this and select the file “scaled\_pulse_flow.flow” that we have provided in [proj-folder]/flow-files. 

<figure>
  <img class="svImg svImgLg" src="clinical/coronary/imgs/setting_inlet_bc.png">
  <figcaption class="svCaption" >Figure 8: Aortic inflow waveform</figcaption>
</figure>

The flow file we provide assumes a heart period of 1 second and a cardiac output of 90.7 mL/s. If you are performing a simulation for a different patient with a different heart rate and cardiac output then you can adjust this inflow file to match your data.
