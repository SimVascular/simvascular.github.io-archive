##Coronary outflow boundary conditions

For the coronary outlets, we make use of a modified lumped parameter model to model the out of phase nature of coronary flow and pressure waveforms. More details about this model can be found in [this paper](http://link.springer.com/article/10.1007/s10439-010-0083-6#page-1).

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/CorBC.png">
  <figcaption class="svCaption" >Figure 12: Coronary outlet LPN</figcaption>
</figure>

The most important feature of this model is the addition of the pressure source Pim. This is the intramyocardial pressure. Recall that one of the most important features of the coronary circulation is that is is out of phase with the systemic circulation. Flow is restricted during systole in the coronary circulation because of increased resistance due to ventricular contraction. We model this in SimVascular through the addition of an intramyocardial pressure source, which acts to impede flow during systole and relax during diastole. It is common to use either the left or right ventricle pressures as the intramyocardial pressure. We have provided a sample “plv.dat” file in the example project that has the pressure of the left ventricle as a function of time that came from a more complex simulation.
