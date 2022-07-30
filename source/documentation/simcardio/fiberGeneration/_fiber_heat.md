## Heat Simulations
### Single Ventricle
We use the same general approach described by Bayer, et al<a href="#fiber-ref-1">[1]</a>. for single and biventricular models. The script used to generate the fibers is the same in either case.

For the single ventricle model, four simulations are performed:

<ol type="A">
  <li>Epicardium - Hot; Endocardium - Cold</li>
  <li>Epicardium - Hot; Endocardium - Hot</li>
  <li>Epicardium - Hot; Endocardium - Cold</li>
  <li>Base - Hot; Apex - Cold</li>
</ol>

Note that in the single ventricle case, conditions A and C are identical. This will become more clear in the biventricular model. Briefly, this is the case so that the same script can be generalized for biventricular and single ventricle models. Example input files corresponding to each of these heat flow simulations can be found in: [./idealized_lv/P2/heat_sim/\*](https://github.com/StanfordCBCL/Cardiac_Modeling_Tools/tree/master/cardiac-multiphysics-pipeline/01-fibers/idealized_lv/P2/heat_sim) and [./idealized_lv/Q1/heat_sim/\*](https://github.com/StanfordCBCL/Cardiac_Modeling_Tools/tree/master/cardiac-multiphysics-pipeline/01-fibers/idealized_lv/Q1/heat_sim)

<figure>
  <img class="svImg svImgSm" src="documentation/simcardio/fiberGeneration/images/fig2.png" style="width:100%;height:auto;max-width: 50vw;">
  <figcaption class="svCaption" >Figure 2. Heat Simulations for Single Ventricular Model</figcaption>
</figure>

**Figures 2A-D** show the result of simulations A-D, **Figure 2E** shows the apex more clearly for simulation D.

### Biventricular Model
For the biventricular model, four simulations as above are performed:

<ol type="A">
  <li>Epicardium - Hot; LV - Cold; RV - Cold</li>
  <li>Epicardium - Hot; LV - Hot; RV - Cold</li>
  <li>Epicardium - Hot; LV - Cold; RV - Hot</li>
  <li>Base - Hot; Apex - Cold</li>
</ol>

For the biventricular case, we can see that conditions A and C are no longer identical. However, were the right ventricle to not exist, the boundary conditions would be the same as what were used for the single ventricle model. Example input files corresponding to each of these heat flow simulations can be found in: [./biventricular/P1/heat_sim/\*](https://github.com/StanfordCBCL/Cardiac_Modeling_Tools/tree/master/cardiac-multiphysics-pipeline/01-fibers/biventricular/P1/heat_sim)

<figure>
  <img class="svImg svImgSm" src="documentation/simcardio/fiberGeneration/images/fig3.png" style="width:100%;height:auto;max-width: 50vw;">
  <figcaption class="svCaption" >Figure 3. Heat Simulations for Biventricular Model</figcaption>
</figure>

**Figures 3A-D** show the result of simulations A-D, **Figure 3E** shows the apex more clearly for simulation D.