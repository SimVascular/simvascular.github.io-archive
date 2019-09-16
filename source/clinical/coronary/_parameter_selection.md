##Selection of parameter values

Selection of these coronary parameters is more challenging than the selection of the RCR boundary conditions for the aortic outlet. Again, we provide some general guidelines on good starting guesses for these parameters and ways to simplify the tuning process. A set of parameters will be given with this example, and the interested reader is referred to [this paper](http://link.springer.com/article/10.1007/s10439-012-0579-3#page-1) for more insight on the selection of these parameters.

The total resistance of the coronary outlets can be determined from the total vasculature resistance computed above. We assume that 4% of the cardiac output will go to the coronaries. In other words, the total coronary resistance is 24x that of the systemic vascular resistance that we computed above. Once we have a total coronary resistance, we split this resistance among the different outlets using a similar technique to the one used above, with one important difference. Instead of simply using the areas of the coronary outlets to split the resistances, we make use of a generalization of Murray’s Law and split the resistances according to the ratio of radius raised to the 2.6 power. In short, the resistance of a specific coronary outlet i is given by the following expression:

$$
R\_{cor,i} = \frac{\sum\_{j} \sqrt{A\_j}^{2.6}}{\sqrt{A\_j}^{2.6}} R\_{cor,tot}
$$

Once the resistances for each outlet are found, it can be split into $R\_{a}$, $R\_{a,micro}$, and $R\_{v}$ using the following ratios:

$$
R\_{a,i} = 0.32 * R\_{cor,i} ; R\_{a,micro} = 0.52 * R\_{cor,i} ; R\_{v} = 0.16 * R\_{cor,i}
$$

Here we assume,

$$
R\_{cor,tot}=24 R\_{tot}=24 \frac{P\_{mean}}{Q}=24 \frac{93.33*1333.0}{80} \approx 37323
$$

Before we split the total resistance to all the coronary outlets. We need to first set up BC type for the coronary outlets.

One piece of information needed to run a coronary simulation is the specification of the intramyocardial pressure. As mentioned before, we have provided a file “plv.dat” which has the left ventricle pressure from a previous heart model simulation. This can be used as the intramyocardial pressure for the coronary simulations. Usually, better results are obtained when scaling this plv for the left and right coronary arteries. Simply multiplying all the pressures by 1.5 for the left coronary outlets and 0.5 for the right coronary outlets usually produces waveforms that are consistent with clinical observation.

Applying these boundary conditions in SimVascular requires two steps. The first step is to specify which outlets in your model will be coronary outlets. This can be done in the “Inlet and Outlet BCs” tab in the Simulations module. To specify an outlet as coronary, double click the box in the “BC Type” column and select “Coronary” from the dropdown menu. Do this for all your coronary outlets.

For the left coronary arteries
	
	Select all the left coronary outlets
	Right click and select "Set BC" in the popup menu
	BC Type: Coronary
	Ra,Ca,Ra-micro,Cim,Rv: 0 0 0 0 0
	Distal Pressure: 0
	Pim (from file): Click the button "..." and choose the file plv.dat in [proj-folder]/flow-files
	Pim Period: filled automatically based on the data in plv.dat; if you use a different period, SimVascular will scale the time from plv.dat
	Pim Scaling: 1.5, scale the pressure values in plv.dat

<figure>
  <img class="svImg svImgSm" src="clinical/coronary/imgs/setbcleft.png">
  <figcaption class="svCaption" >Figure : Coronary left outlets BC</figcaption>
</figure>

For the right coronary arteries
	
	Select all the right coronary outlets
	Right click and select "Set BC" in the popup menu
	BC Type: Coronary
	Ra,Ca,Ra-micro,Cim,Rv: 0 0 0 0 0
	Distal Pressure: 0
	Pim (from file): Click the button "..." and choose the file plv.dat in [proj-folder]/flow-files
	Pim Period: filled automatically based on the data in plv.dat; if you use a different period, SimVascular will scale the time from plv.dat
	Pim Scaling: 0.5, scale the pressure values in plv.dat

<figure>
  <img class="svImg svImgSm" src="clinical/coronary/imgs/setbcright.png">
  <figcaption class="svCaption" >Figure: Coronary right outlets BC</figcaption>
</figure>

Now let split the total resistance among all the coronary outlets.

	Select all the coronary outlets
	Right click and select "Split Resistance" in the popup menu
	Total Resistance: 37323
	Murray's Law Coefficient: 2.6 (for coronary arteries)
	Ratio (Ra:Ra-micro:Rv): 0.32:0.52:0.16	

<figure>
  <img class="svImg svImgSm" src="clinical/coronary/imgs/splitbc_r.png">
  <figcaption class="svCaption" >Figure: Split Resistance on all coronary outlet</figcaption>
</figure>


The capacitances can be quite tricky to tune, and often will have to be adjusted iteratively through trial and error. Since the flow waveforms for the left and right coronary arteries are quite different as shown above, we typically assign separate coronary capacitances for the left and right coronary arteries. Once a total coronary compliance is specified, it can be split among the different branches using the area of the respective outlets according to:

$$
C\_{cor,i} = \frac{A\_{i}}{\sum\_{j} A\_{j}} C\_{cor,tot}
$$

Note that in this case, the summation of the areas in the denominator is ONLY among the branches in the left or right coronary arteries, depending on which branch outlet i belongs to. Similarly, the total coronary compliance $C\_{cor,tot}$ will also only be for the left or right coronary arteries.

A good starting guess for the total left coronary compliance is $3.6 * 10^{-5} cm^{5}/dyne$, and a good starting guess for the right coronary total compliance is $2.5 * 10^{-5} cm^{5}/dyne$. Once you have the capacitance for each outlet using the expression above, you can get Ca by multiplying it by 0.11. Cim can be obtained by multiplying the coronary compliance by 0.89.

Now let split capacitance for the two groups of coronary outlets respectively.

For the left coronary arteries

	Select all the left coronary outlets
	Right click and select "Split Capacitance" in the popup menu
	Total Capacitance: 3.6e-5
	Ratio (Ca:Cim): 0.11:0.89

<figure>
  <img class="svImg svImgSm" src="clinical/coronary/imgs/splitbcleft_c.png">
  <figcaption class="svCaption" >Figure: Split Capacitance on all the left coronary outlet</figcaption>
</figure>

For the right coronary arteries

	Select all the right coronary outlets
	Right click and select "Split Capacitance" in the popup menu
	Total Capacitance: 2.5e-5
	Ratio (Ca:Cim): 0.11:0.89

<figure>
  <img class="svImg svImgSm" src="clinical/coronary/imgs/splitbcright_c.png">
  <figcaption class="svCaption" >Figure: Split Capacitance on all the right coronary outlet</figcaption>
</figure>


Once the resistances and capacitances are determined for the coronary outlets, they are then used to compute a set of 9 constants: $q\_{0}, q\_{1}, q\_{2}, p\_{0}, p\_{1}, p\_{2}, b\_{0}, b\_{1}, b\_{2}$. These constants are used directly into the governing equations to determine the coronary boundary conditions. The expression for these constants are given by:

$$ q\_{0} = R\_{a} + R\_{a,micro} + R\_{v} $$
$$ q\_{1} = R\_{a}C\_{a} (R\_{a,micro} + R\_{v}) + R\_{v}C\_{im}(R\_{a} + R\_{a,micro}) $$
$$ q\_{2} = C\_{a}C\_{im}R\_{a}R\_{a,micro}R\_{v} $$
$$ p\_{0} = 1.0 $$
$$ p\_{1} = R\_{a,micro}C\_{a} + R\_{v}(C\_{a} + C\_{im}) $$
$$ p\_{2} = C\_{a}C\_{im}R\_{a,micro}R\_{v} $$
$$ b\_{0} = 0.0 $$
$$ b\_{1} = C\_{im}R\_{v} $$
$$ b\_{2} = 0.0 $$

These 9 constants need to be computed at every outlet.


