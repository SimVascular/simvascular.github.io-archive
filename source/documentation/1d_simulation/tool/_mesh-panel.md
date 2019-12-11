##1D Mesh Panel

The 1D Mesh panel is primarily used to create centerlines from the surface of a 3D geometric model. A source for the centerline 
computation must first be selected from the inlet/outlet faces (model caps) defined by the **Modeling Tool**. The number of
elements used to discretize a segment may be controled by setting the element size.

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
The centerline computation may take a significant amount of time to finish for a large model with many vessel branches. It is
also sensitive to the quality of the model surface mesh. If the surface mesh is not well-defined (e.g. has holes or overlapping faces)
then the centerline computation may fail. 
</div>
<br>

###Panel Layout
<br>
<figure>
  <img src="documentation/1d_simulation/tool/images/panel.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

###Usage 

**Model** - The name of the model used to create centerlines. The model is selected when creating the simulation job. This text box is for display only, a model name cannot be entered.

**Select Inlet Face** - Select the source for the centerline computation. Clicking on this button causes a multi-element 
check box to appear with entries for each model inlet/outlet face. A (single) face is selected, typically vessel inlet.

  <img class="svImg svImgSm" src="documentation/1d_simulation/tool/images/source-face.png">

**Inlet Face** - The model face name used as a source for the centerline computation. This text box is for display only,
                 a face name cannot be entered.

**Calculate Centerlines** - Start the centerline computation. 

**Element size** - Set the size of elements used to discretize a segment. 


