## Fiber Generation
The fiber generation script works for tet, tet-10, and hexahedral elements. It can be used for single or biventricular models of the heart. Copy the result_020.vtu files from each of the four folders A, B, C, and D into a new folder entitled '/fibers/'. Be sure to replace the '020' part of each file name with A, B, C, or D, depending on the heat simulation. Copy the fiber generation script 'compute_orientations_gen.py' into the folder. For an example, see [./idealized_lv/Q1/heat_sim/fibers/](https://github.com/StanfordCBCL/Cardiac_Modeling_Tools/tree/master/cardiac-multiphysics-pipeline/01-fibers/idealized_lv/Q1/heat_sim/fibers/)

Next, we open the fiber orientation script in our preferred IDE running ≥python 3.0. In the User Inputs portion of the script, we can change the alpha and beta values associated with the endocardial and epicardial surfaces. These values correspond to the angles described by Bayer, et al<a href="#fiber-ref-1">[1]</a>. **Figure 4** below is adapted from their paper.

<figure>
  <img class="svImg svImgSm" src="documentation/simcardio/fiberGeneration/images/fig4.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >Figure 4. Definition of alpha and beta. Taken from Bayer, et al. <a href="#fiber-ref-1">[1]</a></figcaption>
</figure>

The fiber orientation script will create fiber direction data for each element. For tet elements, we should set elShape = 4, for tet-10, elShape = 10, and for hexahedral elements, elShape = 6. If we are unsure, we can also set elShape to 0 and the script will attempt to infer the element shape from the mesh.

When the script has finished running, it will save two files in the working directory: fibers.vtu and layers.dat. To visualize fibers.vtu in paraview, first load it, then use the [Cell Data to Point Data filter](https://docs.paraview.org/en/latest/UsersGuide/filteringData.html) followed by the [glyph filter](https://docs.paraview.org/en/latest/UsersGuide/filteringData.html#glyph). Example fibers for the above cases of single and biventricular models are shown below in **Figure 5**.

<figure>
  <img class="svImg svImgSm" src="documentation/simcardio/fiberGeneration/images/fig5.png" style="width:100%;height:auto;max-width: 50vw;">
  <figcaption class="svCaption" >Figure 5. Resulting Fiber Orientations</figcaption>
</figure>

**Figure 5A** shows the result of the fiber generation exercise on an idealized LV geometry. **Figure 5B** shows the results on a biventricular model.

### Generating the Second Set of Fibers
svFSI requires two sets of fibers to be defined for simulations considering fiber orientation. To obtain the second set, we will find the cross product of the normal vector and the first set of fibers to obtain a second set, which will be orthogonal to both the normals and the first set.

To first obtain the normal vectors:
<ol>
<li> Load the result of simulation A, in which both endocardia are cold and the epicardium is hot. **Figure 6A** shows the Heat_flux data, which should be defined at each node in the mesh.</li>
<li> Use the [Point Data to Cell Data filter](https://docs.paraview.org/en/latest/UsersGuide/filteringData.html) to average the Heat_flux data over the space of each node. **Figure 6B** shows the Heat_flux data stored in each element. Note how the data are no longer as smooth (black arrow)</li>
<li> Use the calculator filter on the resulting cell data with the expression shown in **Figure 6C**. The result is shown in **Figure 6D**.</li>
<li> Last we need to save the mesh. But, we want to save only the FIB_DIR values from our dataset. Select the calculator object in the pipeline and ctrl-s to save. Name the file 'normals.vtu' (**Figure 6E**)</li>
<li> Choose only FIB_DIR as an array to write (**Figure 6F**) </li>
</ol>

<figure>
  <img class="svImg svImgSm" src="documentation/simcardio/fiberGeneration/images/fig6.png" style="width:100%;height:auto;max-width: 50vw;">
  <figcaption class="svCaption" >Figure 6. Generating Normal Fibers from Heat Simulation</figcaption>
</figure>

Once we have both the set of normal vectors, we can now run the second script. A copy of this script is available at [./idealized_lv/P2/heat_sim/fibers](https://github.com/StanfordCBCL/Cardiac_Modeling_Tools/tree/master/cardiac-multiphysics-pipeline/01-fibers/idealized_lv/P2/heat_sim/fibers/) and takes as inputs:
1. fibers.vtu
2. normals.vtu