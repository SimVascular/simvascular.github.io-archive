##Boundary Conditions

###Inlet Boundary Conditions

A supraceliac aorta blood flow waveform derived from PC-MRI data was prescribed to the inlet of the computational fluid dynamics (CFD) model. Note that the cardiac output is not the same as the supraceliac flow, or the flow prescribed at the inlet. The flow to the supraceliac aorta from PC-MRI was 4.04 L/min.

**Flow Waveform:**

<figure>
  <img class="svImg svImgMd" src="clinical/aortofemoral1/imgs/inflow.jpg"> 
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
  <td>0.75</td>
  <td>6.12</td>
  <td>Womersley</td>
</tr>
</table>

###Outlet Boundary Conditions

In order to represent the effects of vessels distal to the CFD model, a three-element Windkessel model can be applied at each outlet . This model consists of proximal resistance (Rp), capacitance (C ), and distal resistance (Rd) representing the resistance of the proximal vessels, the capacitance of the proximal vessels, and the resistance of the distal vessels downstream of each outlet, respectively. 

**Windkessel Model:**
<figure>
  <img class="svImg svImgMd" src="clinical/aortofemoral1/imgs/windkessel.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

These parameters are defined using the mean flow to each outlet calculated from PC-MRI. RCR values are shown on the table.

**RCR Values for Each Outlet:**
<table class="table table-bordered">
<tr><th>Face Name</th><th>R<sub>p</sub></th><th>C</th><th>R<sub>d</sub></th></tr>
 <tr><td>splenic\_br1 </td><td>2096.02</td><td>0.0000260</td><td>45005.00</td></tr>
 <tr><td>splenic\_br2 </td><td>2095.96</td><td>0.0000260</td><td>44904.30</td></tr>
 <tr><td>hepatic\_br1 </td><td>1511.53</td><td>0.0000360</td><td>32383.60</td></tr>
 <tr><td>hepatic\_br2 </td><td>2095.59</td><td>0.0000260</td><td>45243.00</td></tr>
 <tr><td>SMA </td><td>867.84</td><td>0.0000627</td><td>18429.90</td></tr>
 <tr><td>SMA\_br1 </td><td>1617.35</td><td>0.0000337</td><td>35259.30</td></tr>
 <tr><td>R\_sup\_renal </td><td>609.70</td><td>0.0000893</td><td>12991.00</td></tr>
 <tr><td>R\_inf\_renal </td><td>2222.74</td><td>0.0000245</td><td>47359.60</td></tr>
 <tr><td>L\_sup\_renal </td><td>1330.80</td><td>0.0000408</td><td>27260.40</td></tr>
 <tr><td>L\_inf\_renal </td><td>829.38</td><td>0.0000656</td><td>17593.90</td></tr>
 <tr><td>IMA </td><td>1583.13</td><td>0.0000344</td><td>34215.40</td></tr>
 <tr><td>R\_ext\_iliac </td><td>718.27</td><td>0.0000760</td><td>15945.20</td></tr>
 <tr><td>R\_int\_iliac </td><td>3169.51</td><td>0.0000172</td><td>70363.10</td></tr>
 <tr><td>R\_int\_iliac\_br1 </td><td>7094.64</td><td>0.0000077</td><td>157504.00</td></tr>
 <tr><td>R\_int\_iliac\_br2 </td><td>7130.80</td><td>0.0000076</td><td>158139.00</td></tr>
 <tr><td>L\_ext\_iliac </td><td>718.27</td><td>0.0000760</td><td>15945.20</td></tr>
 <tr><td>L\_int\_iliac </td><td>3903.05</td><td>0.0000140</td><td>86649.70</td></tr>
 <tr><td>L\_int\_iliac\_br1 </td><td>4424.33</td><td>0.0000123</td><td>98323.60</td></tr>
 <tr><td>L\_int\_iliac\_br2 </td><td>8737.84</td><td>0.0000062</td><td>193983.00</td></tr>
</table>


