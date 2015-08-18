##Boundary Conditions

###Inlet Boundary Conditions

The inflow waveform was adapted from literature and then smoothed. The mean value of the inflow waveform was reasonably in the range of mean cardiac output of 4.6 L/min given for women and the standard 5.0 L/min. The inflow waveform was prescribed to the inlet of the computational fluid dynamics (CFD) models

**Flow Waveform:**

<figure>
  <img class="svImg svImgMd" src="clinical/aortofemoral2/imgs/inflow.jpg"> 
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
  <td>4.90</td>
  <td>Womersley</td>
</tr>
</table>

###Outlet Boundary Conditions

In order to represent the effects of vessels distal to the CFD model, a three-element Windkessel model can be applied at each outlet. This model consists of proximal resistance (Rp), capacitance (C ), and distal resistance (Rd) representing the resistance of the proximal vessels, the capacitance of the proximal vessels, and the resistance of the distal vessels downstream of each outlet, respectively. 

**Windkessel Model:**
<figure>
  <img class="svImg svImgMd" src="clinical/aortofemoral2/imgs/windkessel.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

These parameters are defined using the mean flow to each outlet calculated from PC-MRI. RCR values are shown on the table.

**RCR Values for Each Outlet:**
<table class="table table-bordered">
<tr><th>Face Name </th><th>R<sub>p</sub> </th><th>C </th><th>R<sub>d</sub> </th></tr>
 <tr><td>Brachiocephalic\_Right\_Subclavian </td><td>788.82</td><td>0.0002090</td><td>13297.26</td></tr>
 <tr><td>Right\_Common\_Carotid </td><td>6697.69</td><td>0.0001235</td><td>17222.63</td></tr>
 <tr><td>Left\_Common\_Carotid </td><td>6708.98</td><td>0.0001235</td><td>17251.66</td></tr>
 <tr><td>Left\_Subclavian </td><td>788.87</td><td>0.0002090</td><td>13298.17</td></tr>
 <tr><td>Celiac\_Hepatic </td><td>1114.61</td><td>0.0001456</td><td>18789.07</td></tr>
 <tr><td>Splenic </td><td>1086.33</td><td>0.0001456</td><td>18312.39</td></tr>
 <tr><td>SMA </td><td>829.30</td><td>0.0001970</td><td>13979.66</td></tr>
 <tr><td>Left\_Renal </td><td>4102.96</td><td>0.0001970</td><td>10550.48</td></tr>
 <tr><td>Right\_Renal </td><td>4141.67</td><td>0.0001970</td><td>10650.01</td></tr>
 <tr><td>Left\_Internal </td><td>3108.73</td><td>0.0000529</td><td>52404.23</td></tr>
 <tr><td>Right\_Internal </td><td>3109.10</td><td>0.0000529</td><td>52410.58</td></tr>
 <tr><td>Left\_Profunda </td><td>6620.49</td><td>0.0000247</td><td>111602.55</td></tr>
 <tr><td>Right\_Profunda </td><td>6570.55</td><td>0.0000247</td><td>110760.65</td></tr>
 <tr><td>Left\_Profunda\_2 </td><td>3316.24</td><td>0.0000494</td><td>55902.32</td></tr>
 <tr><td>Right\_Profunda\_2 </td><td>3299.25</td><td>0.0000494</td><td>55615.95</td></tr>
 <tr><td>Aorta\_Smoothed </td><td>3322.05</td><td>0.0000494</td><td>56000.20</td></tr>
 <tr><td>Common\_External\_Femoral </td><td>3312.96</td><td>0.0000494</td><td>55847.04</td></tr>
</table>


