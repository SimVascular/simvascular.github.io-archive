##Aortic outflow boundary condition

For the aortic outlet, we will specify a Windkessel RCR boundary condition. There are three elements that make up the Windkessel model: a proximal resistance modeling the viscous resistance of the arterial vasculature just downstream the of the model, a capacitor which models the vessel compliance of all the downstream vasculature, and the distal resistance which models the resistance of the capillaries and venous circulation.

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/windkessel.jpg">
  <figcaption class="svCaption" >Figure 10: RCR Windkessel model</figcaption>
</figure>

Typically, these parameters are tuned so that the pressures in the resulting simulation match patient-specific physiologic conditions. If patient-specific data is available, then these parameters can be tuned so that the simulation outputs match certain clinical targets. This tuning is, in general, not an easy task. Here we provide some general guidelines for selecting a good starting guess for these parameters, but likely you will have to adjust these parameters iteratively until your simulation adequately matches your patient data.

The first step is to calculate a total resistance for your system. This can be done by dividing the mean pressure of your patient with the cardiac output. 

$$
R\_{tot} = \frac{P\_{mean}}{Q}
$$

Make sure the pressure, $P\_{mean}$, is in cgs units (dyne/cm^2) and the cardiac output, $Q$, is in (mL/s). For a normal healthy patient, a mean pressure of around 125000 dyne/cm^2 and a cardiac output of around 80 mL/s is appropriate. We now need to split this resistance between Rd and Rp. A good rule of thumb is to have the Rd/Rp ratio be roughly 10. This is due to the fact that most vascular resistance is packed into the downstream vasculature, where the small capillaries are. So taking our total resistance from earlier, multiply it by 0.91 to get Rd and 0.09 to get Rp.

The capacitance has the primary effect of modulating the amplitude of the pressure waveform. Higher values of capacitance will lead to smaller pressure amplitudes. Capacitors model vessel compliance, or the ability for blood vessels to expand and contract in response to blood flow. To get an estimate of what value of capacitance you need to tune your model, it is best to to look at the Windkessel model as a classic RC circuit and look at the behavior of the circuit during diastole. During diastole, the capacitor gets very little inflow from the model, so it starts to discharge. It will discharge at an exponential rate with a time constant equal to RC, and thus the pressure on the capacitor will decay at this exponential rate. With knowledge of R from the previous step, and knowledge of the difference between systolic and diastolic pressure, and considering the heart rate of the patient, one can estimate a value of C that will give the appropriate time constant for the pressure decay. A good starting guess for a typical patient is around 0.001 cm^5/dyne. You can try this value on a simulation, check the pressure amplitude, and adjust according to what you find. A typical healthy patient has a blood pressure of 120/80, meaning they have a systolic pressure of 120 mmHg and a diastolic pressure of 80 mmHg.

To apply an RCR boundary condition in SimVascular, go to the “Inlet and Outlet Bcs” tab in the Simulations module. Go to the cap which corresponds to your aortic outlet (cap\_aorta_2 in this case) and double click the second box to select a BC Type. From the dropdown menu, select RCR. Now, double click the name of the face to open a dialogue window asking you to specify the parameter values for the Windkessel model. Input your values for Rp, C, and Rd in that order, with each entry separated by commas. Input 0 for the “Distal Pressure”. This setting allows you to set an offset pressure at the outlet of the RCR (instead of ground). But in most cases it is safe to select 0 for this.

<figure>
  <img class="svImg svImgSm" src="clinical/coronary/imgs/rcr_bc.png">
  <figcaption class="svCaption" >Figure 11: Setting RCR outlet boundary conditions</figcaption>
</figure>

In the case for when you have multiple aortic outlets, we can split the resistances and capacitances according to the rules for a parallel circuit and the area of the corresponding outlet. Typically, we assume that outlets with larger cross sectional area will have less resistance the smaller outlets. With knowledge of the total vascular resistance computed earlier, one can compute the resistance for a given outlet i by the following expression:

$$
R\_{i} = \frac{\sum\_{j}A\_{j}}{A\_{i}}R\_{tot}
$$

Where $\sum\_{j}A\_{j}$ is the sum of all the areas of the aortic outlets and $A\_{i}$ is the area of the specific outlet you want to find the resistance for. To find the capacitance for a particular outlet, multiply this number by the inverse of the area scaling $\frac{A\_{i}}{\sum\_{j}A\_{j}}$. If you use the rules of parallel resistors and parallel capacitors, you will find that the above factors result in the total resistance and capacitance being unchanged.
