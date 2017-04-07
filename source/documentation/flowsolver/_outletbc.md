## Outlet Boundary Condition Specification

We are making the face **outlet** into a **weakly-pressure** face. This is mathematically expressed by the expressions we saw before:

$$
p = p\_0 + R\,Q
$$

$$
p(t)=p\_0 + \frac{1}{T}\,\int\_{t-T}^{t} Z(t−\tau) \, Q(\tau) \, d\tau
$$

This expression sets $p\_0 = 0$ for the face **outlet**. The total pressure set on that face will be the result of the flow-pressure operator considered (i.e., resistance, impedance, RCR, Coronary etc.).

Let's start setting outlet boundary condition.

	Double click the row for the face "outlet"
	A dialog pops up and also the face is highlighted in the 3D-view window.
	In the dialog:
		BC Type: Resistance
		Resistance: 1333 (resistance value)
		Distal Pressure: (0 by default)
		Click "OK"

	
<figure>
  <img class="svImg svImgSm" src="documentation/flowsolver/imgs/outletbcdialog.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**Help Hints:** </font> Please make use you specify face types when you create the corresponding model;otherwise, the cap faces won't appear.

### Advanced Options for splitting BC

In many clinical cases, we would like to split a total resistance or capacitance among a group of outlets, instead of explicitly assigning resistance or capacitance for each individual outlet.

To use this feature, first set up the group of outlets with initial zero resistance or capacitance.

For resistance BC:

	Select a group of outlets, right click
	Click "Set BC"
	BC Type: Resistance
	Resistance: 0
	Click "OK"

For RCR BC:

	Select a group of outlets, right click
	Click "Set BC"
	BC Type: RCR
	Rp, C, Rd: 0 0 0
	Click "OK"
		
For Coronary BC:

	Select a group of outlets, right click
	Click "Set BC"
	BC Type: Coronary BC
	Rp, Ca, Ra-micro,Cim, RV: 0 0 0 0 0
	Pim (from file): Click the button "..." to select file for Pim
	Pim Period: filled automatically using the data from the file. You can change the period, SimVascular will automatically scale the time from the file
	Pim Scaling: use this value to scale presure values from the file
	Click "OK"
	

After you set up the group, let's split the total resistance or capacitance.

To split total resistance:

	Select the group of outlets, right click
	Click "Split Resistance"
	Total Resistance: total resistance for the group of outlets
	Murray's Law Coefficient: (2~3), 2 in general, 2.6 for coronary arteries, 2.3 for pulmonary arteries
	Ratio of resistance for each outlet:
	Rp:Rd (for RCR BC):
	Ra:Ra-micro:Rv (for Coronary BC):
	Click "OK"
		
To split total capacitance:

	Select the group of outlets, right click
	Click "Split Capacitance"
	Total Capacitance: total capacitance for the group of outlets
	Ratio of capacitance for each outlet:
	Ca:Cim (for Coronary BC):
	Click "OK"

