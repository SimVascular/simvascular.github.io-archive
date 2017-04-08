##Simulation Results

For the example we have provided, we have already run the simulation. You can check the results in all of the “all_results” files. A few key results will be shown here.

A good first check whenever running simulations in SimVascular is to check if the pressure distribution makes sense. This can be done by viewing the “all_results.vtp” in Paraview. You should get something like this:

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/average_pressure.png">
  <figcaption class="svCaption" >Figure 14: Average pressure from coronary simulation</figcaption>
</figure>

The mean pressures at the inlet of the model is ~93 mmHg, which is consistent with the 93 mmHg that we specified in calculating the total resistance. The pressure also decreases as you travel along the branches. This shows that our resistance values were tuned well. Had your inflow been going in the wrong direction, you would see negative pressures in the model. Whenever you see very negative pressures, it is a good idea to check the direction of your inflow velocity from the bct.vtp file.

We can also plot the streamlines from the model at peak systole to get a sense for the velocity magnitudes and directions. This must be done with the “all_results.vtu” file, since this file has volumetric velocity data from the simulation.

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/velocity_magnitude.png">
  <figcaption class="svCaption" >Figure 15: Velocity streamlines at peak systole</figcaption>
</figure>

We can also verify that our RCR capacitance was chosen well, we can plot the pressure waveform at the inlet as a function of time:

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/aortic_inlet_pressure.png">
  <figcaption class="svCaption" >Figure 16: Aortic inlet pressure</figcaption>
</figure>

This shows that our inlet pressure goes between ~120 mmHg and ~80 mmHg, showing that our outlet compliance was chosen well. Had the RCR compliance been too high, then then peak to peak amplitude would be too small (i.e. the systolic pressure would be ~110 mmHg and the diastolic pressure would be ~90 mmHg). The opposite would be true if the aortic compliance were too small. You can use these guidelines to tune your RCR compliance to match your patient’s data.

Finally, we can plot the coronary waveforms to confirm that they exhibit the out-of-phase behavior that we expect.

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/left_coronary_outflow.png">
  <figcaption class="svCaption" >Figure 17: Left coronary waveform</figcaption>
</figure>

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/right_coronary_outflow.png">
  <figcaption class="svCaption" >Figure 18: Right coronary waveform</figcaption>
</figure>

As the above figures show, the coronary waveforms produce the behavior we expect. The left coronary waveform is characterized by very little flow in systole and a large flow peak in diastole. The right coronary waveform is characterized by roughly equal flow peaks in systole and diastole. If you are not seeing this behavior in your coronary flow waveforms, changing the scaling factors on your intramyocardial pressure in the “make_cort_file.py” script will allow you to fix them. Increasing the scaling factor will reduce the height of the first peak, and vice-versa.
