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
		BC Values: 1333 (resistance value)
		Distal Pressure: (0 by default)
		Click "OK"

	
<figure>
  <img class="svImg svImgSm" src="documentation/flowsolver/imgs/outletbcdialog.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

