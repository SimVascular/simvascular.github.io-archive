##Boundary Conditions

###Inlet Boundary Conditions

A typical aortic waveform was prescribed to the inlet of the model. Since pulmonary blood flow is in series with the systemic blood flow it was assumed the amount of blood flow in the pulmonary circulation was approximately equal to that of the systemic circulation and the waveforms were similar. The inflow waveform used for the simulations was scaled to have a mean volumetric flow rate of 5 L/min and a period of 1 second (60 beats per minute).

**Flow Waveform:**

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/inflow.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Period and Cardiac Output:**
<table class="table table-bordered">
<thead>
<tr>
  <th>Period (s)</th>
  <th>Cardiac Output (L/min)</th>
  <th>Profile Type</th>
</tr>
</thead>
<tr>
  <td>1.0</td>
  <td>5.0</td>
  <td>Womersley</td>
</tr>
</table>

###Outlet Boundary Conditions

In order to represent the effects of vessels distal to the CFD model, a three-element Windkessel model can be applied at the aorta outlet. This model consists of proximal resistance (Rp), capacitance (C ), and distal resistance (Rd) representing the resistance of the proximal vessels, the capacitance of the proximal vessels, and the resistance of the distal vessels downstream.

**Windkessel Model:**
<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/windkessel.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To define the parameters in the Windkessel model the mean flow to the aorta outlet was assumed to be 96% of the cardiac output. 

**RCR Values for the Aorta Outlet:**
<table class="table table-bordered">
<tr><th>Face Name</th><th>R<sub>p</sub></th><th>C</th><th>R<sub>d</sub></th></tr>
 <tr><td>aorta </td><td>105.3798 </td><td>0.001380 </td><td>1650.9508 </td></tr>
 </table>

The coronary arteries were assumed to take 4% of the cardiac output with a split of 60% and 40% for the left and right coronary arteries respectively. Lumped parameter boundary conditions were applied at the coronary outlets using the coupled domain method. Coronary boundary condition parameters were tuned to match target flow splits and pressures. Target Pressures for both models were set based on typical pressures for healthy adults.

**Coronary boundary condition parameter values in cgs**

<table class="table table-bordered">
<tr><th>Face Name </th><th>dQinidT </th><th>dPinidT </th><th>q0 </th><th>q1 </th><th>q2 </th><th>p0 </th><th>p1 </th><th>p2 </th><th>b0 </th><th>b1 </th><th>b2 </th></tr>
 <tr><td>LAD </td><td>0.00</td><td>100.0000000</td><td>992944.00</td><td>1416603.0</td><td>58881.7</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LAD_b1 </td><td>0.00</td><td>100.0000000</td><td>1162546.30</td><td>1658569.3</td><td>68939.1</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LAD_b2 </td><td>0.00</td><td>100.0000000</td><td>1185706.10</td><td>1691610.8</td><td>70312.5</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LAD_b3 </td><td>0.00</td><td>100.0000000</td><td>826069.50</td><td>1178528.1</td><td>48986.0</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LAD_b3_b1 </td><td>0.00</td><td>100.0000000</td><td>1517486.30</td><td>2164951.4</td><td>89987.1</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LAD_b4 </td><td>0.00</td><td>100.0000000</td><td>759878.00</td><td>1084094.8</td><td>45060.9</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LAD_b5 </td><td>0.00</td><td>100.0000000</td><td>738918.30</td><td>1054192.2</td><td>43817.9</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LAD_b6 </td><td>0.00</td><td>100.0000000</td><td>808233.90</td><td>1153082.6</td><td>47928.4</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LCX </td><td>0.00</td><td>100.0000000</td><td>1038845.90</td><td>1482089.7</td><td>61603.7</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LCX_b1 </td><td>0.00</td><td>100.0000000</td><td>1344891.40</td><td>1918715.6</td><td>79752.2</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LCX_b2 </td><td>0.00</td><td>100.0000000</td><td>1288722.30</td><td>1838580.8</td><td>76421.4</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LCX_b3 </td><td>0.00</td><td>100.0000000</td><td>1069381.80</td><td>1525654.4</td><td>63414.5</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LCX_b4 </td><td>0.00</td><td>100.0000000</td><td>986676.60</td><td>1407661.4</td><td>58510.0</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LCX_b4_b1 </td><td>0.00</td><td>100.0000000</td><td>1726743.90</td><td>2463492.9</td><td>102396.1</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LCX_b5 </td><td>0.00</td><td>100.0000000</td><td>1259845.60</td><td>1797383.3</td><td>74709.0</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LCX_b6 </td><td>0.00</td><td>100.0000000</td><td>1219871.10</td><td>1740352.8</td><td>72338.5</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>LCX_b7 </td><td>0.00</td><td>100.0000000</td><td>1137720.30</td><td>1623150.8</td><td>67466.9</td><td>1</td><td>1.8312</td><td>0.1899</td><td>0</td><td>1.67846</td><td>0</td></tr>
 <tr><td>RCA </td><td>0.00</td><td>100.0000000</td><td>610864.40</td><td>446299.9</td><td>30497.5</td><td>1</td><td>1.0406</td><td>0.1580</td><td>0</td><td>0.77164</td><td>0</td></tr>
 <tr><td>RCA_b1 </td><td>0.00</td><td>100.0000000</td><td>721175.40</td><td>526893.5</td><td>36004.7</td><td>1</td><td>1.0406</td><td>0.1580</td><td>0</td><td>0.77164</td><td>0</td></tr>
 <tr><td>RCA_b1_b1 </td><td>0.00</td><td>100.0000000</td><td>1219777.20</td><td>891173.9</td><td>60897.5</td><td>1</td><td>1.0406</td><td>0.1580</td><td>0</td><td>0.77164</td><td>0</td></tr>
 <tr><td>RCA_b2 </td><td>0.00</td><td>100.0000000</td><td>849631.10</td><td>620743.8</td><td>42417.9</td><td>1</td><td>1.0406</td><td>0.1580</td><td>0</td><td>0.77164</td><td>0</td></tr>
 <tr><td>RCA_b3 </td><td>0.00</td><td>100.0000000</td><td>362766.80</td><td>265038.8</td><td>18111.2</td><td>1</td><td>1.0406</td><td>0.1580</td><td>0</td><td>0.77164</td><td>0</td></tr>
 <tr><td>RCA_b3_b1 </td><td>0.00</td><td>100.0000000</td><td>903602.80</td><td>660175.7</td><td>45112.5</td><td>1</td><td>1.0406</td><td>0.1580</td><td>0</td><td>0.77164</td><td>0</td></tr>
 <tr><td>RCA_b4 </td><td>0.00</td><td>100.0000000</td><td>487599.30</td><td>356241.9</td><td>24343.4</td><td>1</td><td>1.0406</td><td>0.1580</td><td>0</td><td>0.77164</td><td>0</td></tr>
</table>

