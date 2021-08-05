##3D Level Set Segmentation 

###Introduction 

SimVascular provides a 3D level set method <a href="#ref-1">[1]</a> that can be used to generate segmentation surfaces for anatomical structures
difficult to segment using the lofted 2D segmentation approach discussed above. The level set method is a mathematical framework 
used to represent implicit deformable surfaces described by a 3D image volume, the level set function, evolving in time. The geometry 
of the segmentation surface is defined by the zero isolevel of the level set function. The final surface will be located at the 
regions corresponding to the steepest change (gradient magnitude) of image intensity. The surface can be imported into a SimVascular
Modeling tool after preprocessing.

The level set segmentation algorithm requires initializing the level set function. The best results are obtained when the 
initialization produces a surface that is close to the desired segmentation surface. SimVascular uses the colliding fronts 
algorithm <a href="#ref-2">[2]</a> to initialize the level set function. The user first defines groups of start and end 
seed points placed at the extremities of the image region to be segmented. A wavefront is then propagated from each seed with 
speeds proportional to the image intensity. The initial level set deformable surface is defined as the region where fronts collide.
Define a several groups of seed points to initialize a large region of the image requires the specification of an image threshold to 
constrain the propagation of the wavefront.

The temporal evolution of the level set function is described by a partial differential equation containing the following three terms  

<ol>
   <li> Advection term that expands the surface towards the ridges of the image gradient magnitude 

   <li> Propagation term that governs the expansion speed

   <li> Smoothness constraint for the mean curvature of the surface </li>
</ol>

Weights are assigned to regulate the influence of each term on surface evolution. Weights may need to be adjusted for different image modalities
with different properties (e.g. signal to noise ratio).

The level set formulation requires computing an image gradient. Derivatives are computed for the image data by applying using a  
Gaussian smoothing filter with a user defined value for the standard deviation. Applying a smoothing filter decreases the effect of 
image noise on derivative computation but may remove image features below the scale corresponding to the standard deviation used.

The level set equation is solved numerically for a number of iterations (time steps) incrementally updating the level set function and implicitly 
the segmentation surface. Enough iterations need to be performed so that the surface expands close to the boundaries of the anatomical structures 
that are being segmented. The result of the level set computation is the level set function representing a segmentation image. The geometry
of the segmentation surface, a triangle mesh, is then extracted from this image at the zero isolevel. 

After a segmentation surface has been extracted centerlines and SimVascular paths can be then computed for it. The path files can be
imported into SimVascular and used to automatically generate a model using the machine learning capability in the SimVascular Segmentation 
tool. This may be useful when building models of complex vascular anatomy.

The segmentation surface does not have the planar caps needed for SimVascular models. However, the SimVascular Modeling tool can use paths 
to trim the surface at its ends. Caps can then be created for the trimmed model using the Modeling tool <b>Fill Holes w/o ID</b> operation
(see <a href="http://simvascular.github.io/docsModelGuide.html#modelingEditingPolyData">Modeling Guide - Global/Local Operations</a>). 

<!-- ====================================== Level Set Tool ================================= -->

###Level Set Tool 

The SimVascular **3D Level Set Tool** is used to interactively generate 3D segmentations from volumetric imaging data using the
level set method with colliding fronts initialization. The tool uses the image data read in by SimVascular and stored under the
SV Data Manager <i>Images</i> node. 


The **3D Level Set Tool** is opened by selecting the 
<img src="documentation/modeling/imgs/3d-level-set/level-set-icon.png" width="20" height="20"> icon located at the top of the
SimVascular toolbar. This displays the **3D Level Set Tool** panel. 

<br>
<figure>
<img class="svImg svImgSm" src="documentation/modeling/imgs/3d-level-set/seeds-panel.png">
  <figcaption class="svCaption"> The 3D Level Set Tool panel. </figcaption>
</figure>
<br>

The panel contains four sub-panels used to create seed positions and execute a level set computation, and operations on segmentation surfaces. 
<ul style="list-style-type:none;">
  <li> <b> Seeds </b> </li>
  <li> <b> Level Set </b> </li>
  <li> <b> Surface </b> </li>
  <li> <b> Paths </b> </li>
</ul>

A selecting a sub-panel name brings up the sub-panel's widgets. The following sections describe how each of the sub-panels are used.

<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
If the <b>3D Level Set Tool</b> has been previously used the panel (greyed out) is sometimes displayed when SimVascular starts. 
Close the panel before creating or opening a SimVascular project.
</div>

<br>
The **3D Level Set Tool** creates a **level-set** node under the SV Data Manager <i>Images</i> node. The **level-set** node
itself has four sub-nodes used to store and display geometry created by each of the panels

<ul style="list-style-type:none;">
  <li> <b>seed-points</b> - Seed points, displayed as green or red spheres. </li>
  <li> <b>centerlines</b> - Centerline geometry, displayed as green lines. </li>
  <li> <b>paths</b> - Path points, displayed as yellow spheres. </li>
  <li> <b>surface</b> - Segmentation surface, created only after a level set computation has been performed. </li>
</ul>

<figure>
<img class="svImg svImgSm" src="documentation/modeling/imgs/3d-level-set/data-manager-panel.png">
  <figcaption class="svCaption"> The 3D Level Set Tool data nodes. </figcaption>
</figure>
<br>

Data created by the <b>3D Level Set Tool</b> is stored in files under a project's <i>Images/level-set</i> directory. 
The details of each file is described in the sections below for the panel that creates it.

<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
Unlike other SimVascular plugins the <b>3D Level Set Tool</b> does not currently save the values of the parameters set in the
panels nor does it store seed positions. The capability to restore the tool's state will be added in a future SimVascular release.
</div>

<!-- ====================================== Seeds Panel  ================================= -->

<br>
####Seeds Panel 

The Seeds panel is used to create groups of start and end seed points for initializing the level set function. Seed groups and
image threshold values (set in the Level Set panel) determine which regions of the image are segmented. Each seed group consists
of a single start seed and one or more end seeds.
 
Seeds are interactively positioned at the current location of the 2D cursor in the axial, coronal and sagittal 2D image windows. 
Seeds are added using GUI buttons and the keyboard keys. Additional operations, like setting the active seed group and deleting seeds
are performed using the keyboard keys.

<b> Adding Seeds </b>
<ul>
  <li> A seed group is created when adding a start seed by pressing the <i>S</i> key or the <i>Add Start</i> button (see below)  </li>
  <li> An end seed is added to the active seed group by pressing the <i>E</i> key or the <i>Add End</i> button (see below)  </li>
  <li> Moving the mouse cursor over a seed changes its color to yellow, it can then be made active or deleted </li>
  <li> A seed group is selected as active by moving the mouse cursor over a seed in the group and pressing the <i>A</i> key </li>
  <li> The active seed group is highlighted 
</ul>

<b> Deleting Seeds </b>
<ul>
  <li> An end seed is deleted by moving the mouse cursor over the seed and pressing the <i>D</i> key </li>
  <li> A seed group is deleted by moving the mouse cursor over the start seed and pressing the <i>D</i> key </li>
  <li> All seed groups are deleted by the pressing the <i>Clear</i> button (see below)  </li> 
</ul>

<br>
<figure>
  <img src="documentation/modeling/imgs/3d-level-set/seeds-panel-1a.png" style="float: left; width: 40%; margin-right: 5%; margin-bottom: 0.5em;">
  <img src="documentation/modeling/imgs/3d-level-set/seeds-panel-1b.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
  <figcaption> <i>Adding a start seed displayed as a green sphere (left) and an end seed displayed as a red sphere (right) at the 2D window crosshairs.  </i></figcaption>
</figure>
<br>

<br>
<img src="documentation/modeling/imgs/3d-level-set/seeds-panel.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">

<i>Size</i> - The size of the spheres used to display seeds. The value is a multiple of the image voxel size. 

<i>Add Start</i> - Add a start seed at the location of the 2D crosshairs. A start seed can also be added by pressing the S key.

<i>Add End</i> - Add an end seed at the location of the 2D crosshairs. An end seed can also be added by pressing the E key.

<i>Clear</i> - Clear all seed groups. 

<p style="clear: both;">
 

<!-- ====================================== Level Set Panel  ================================= -->
<br>
####Level Set Panel 

The Level Set panel is used to set parameters for and execute the level set computation. Weights can be set that regulate the influence of 
each term in the level set equation. The higher the weight the more influence it will have on its property during the temporal evolution 
of the level set function.

When the level set computation has completed the segmentation surface is displayed in the graphics window.
The segmentation surface geometry is stored in a file named <i>surface.vtp</i> in the project's <i>Images/level-set</i> directory.

<br>
<img src="documentation/modeling/imgs/3d-level-set/level-set-panel.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">

<i>Upper threshold</i> - The image upper threshold value.

<i>Lower threshold</i> - The image lower threshold value.

<i>Gradient magnitude SD</i> - The standard deviation value used for the Gaussian smoothing filter, measured in the units of image spacing. 

<i>Propagation weight</i> - The weight used to regulate the speed of surface expansion.

<i>Advection weight</i> - The weight used to regulate the attraction of the surface towards the ridges of the image gradient magnitude.

<i>Curvature weight</i> - The weight used to regulate the surface mean curvature smoothness constraint.

<i>Number of iterations</i> - The number of iterations to incrementally update (evolve in time) the level set function. 

<i>Isosurface level</i> - The isolevel used to extract the segmentation surface from the level set function. 

<i>Execute</i> - Start the level set computation. 

<p style="clear: both;">


<!-- ====================================== Surface Panel  ================================= -->
<br>
####Surface Panel 

The Surface Panel is used to extract centerlines from a segmentation surface using VMTK <a href="#ref-3">[3]</a>.
Seed groups as the source and target points for the extract centerlines computation. 
End seeds in the interior of the segmentation surface may cause problems with the extract centerlines computation.
Use the Seeds Panel to delete any interior end seeds and rerun the extract centerlines computation.

When the extract centerlines computation has completed the centerlines are displayed as green lines in the graphics window. 
The centerline geometry is stored in a file named <i>centerlines.vtp</i> in the project's <i>Images/level-set</i> directory.

<img src="documentation/modeling/imgs/3d-level-set/surface-panel.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">

<i>Compute Centerlines</i> - Start the extract centerlines computation for the current segmentation surface. 

<p style="clear: both;">


<!-- ====================================== Paths Panel  ================================= -->
<br>
####Paths Panel 

The Paths Panel is used to extract SimVascular paths from centerlines geometry. Paths are created for the different branches 
identified in the centerlines geometry. The number of path points created for each centerline depends on

<ol>
  <li> A multiplicative factor used to create evenly spaced points </li>
  <li> Tangent change tolerance along the centerline; more points are created for a curved centerline </li>
</ol>

When the extract paths computation has completed the paths are displayed as yellow spheres in the graphics window.
The path extracted is stored in a file named <i>path_N.pth</i>, where N = 1 to the number of paths, in the project's 
<i>Images/level-set</i> directory. Existing path files are removed before writing the new path files.

<br>
<img src="documentation/modeling/imgs/3d-level-set/paths-panel.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
<i>Distance multiplier</i> - The multiplicative factor used to sample centerline points for path control points. 
<i>Tangent change</i> - The maximum angle, in degrees, between centerlines tangents used to add a path control point.  
<i>Extract</i> - Extract paths from centerlines. 
<p style="clear: both;">

The centerlines geometry file contains a <i>CenterlineIds</i> data array used identify branches. This array is used to
extract paths, creating a path for each ID in the the array.


<!-- ====================================== Example 1 ================================= -->
<br>
###Example: Creating a Segmentation Surface 

This section demonstrates how to create a segmentation surface using the <b>3D Level Set Tool</b>. 

<b>Step 1 - Create a SimVascular project</b> <br>
Create a SimVascular project and read in the demo-image.vti image data file from the SimVascular <b>Demo Project</b>.
<figure>
<img class="svImg svImgXl" src="documentation/modeling/imgs/3d-level-set/example-1/fig-1.png">
</figure>

<br>
<b>Step 2 - Open the 3D Level Set Tool</b> <br>
Select the
<img src="documentation/modeling/imgs/3d-level-set/level-set-icon.png" width="20" height="20"> icon located at the top of the
SimVascular toolbar to open the **3D Level Set Tool** panel. Select the <i>Seeds</i> sub-panel.
<figure>
<img class="svImg svImgXl" src="documentation/modeling/imgs/3d-level-set/example-1/fig-2.png">
</figure>

<br>
<b>Step 3 - Create a start seed at the top of the aorta</b> <br>
Move the crosshairs in the 2D Sagittal window to the top of the aorta, then move the crosshairs in the 2D Axial window to
the center of the aorta. Press the <i>S</i> key to create a start seed; it is displayed as a green sphere.
<figure>
<img class="svImg svImgXl" src="documentation/modeling/imgs/3d-level-set/example-1/fig-3.png">
</figure>

<br>
<b>Step 4 - Create end seeds for the left and right iliacs</b> <br>
Move the crosshairs in the 2D Sagittal window down until the iliac arteries can be seen in the 2D Axial window. Move the crosshairs 
in the 2D Axial window to the center of the left iliac and press the <i>E</i> key to create an end seed.  
Move the crosshairs in the 2D Axial window to the center of the right iliac and press the <i>E</i> key to create another end seed.
The end seeds are displayed as a red spheres.
<figure>
<img class="svImg svImgXl" src="documentation/modeling/imgs/3d-level-set/example-1/fig-4.png">
</figure>

<br>
<b>Step 5 - Set level set parameters and start the level set computation </b> <br>
Select the <i>Level Set</i> sub-panel. Set the <i>Upper threshold</i> value to 240.0 and the <i>Lower threshold</i> value to 60.0.
Press the <i>Execute</i> button to start the level set computation. The segmentation surface is displayed as a 
grey triangular mesh.
<figure>
<img class="svImg svImgXl" src="documentation/modeling/imgs/3d-level-set/example-1/fig-5.png">
</figure>

<br>
<b>Step 6 - Extract centerlines from the segmentation surface </b> <br>
Select the <i>Surface</i> sub-panel. Press the <i>Compute Centerlines</i> button to start the extract centerlines computation. 
Switch to the <i>Big 3D</i> view and set the opacity of the segmentation surface to 0.5 and its color to orange. The centerlines
are displayed as green lines.
<figure>
<img class="svImg svImgXl" src="documentation/modeling/imgs/3d-level-set/example-1/fig-6.png">
</figure>

<br>
<b>Step 7 - Extract SimVascular paths from centerlines geometry </b> <br>
Select the <i>Paths</i> sub-panel. Press the <i>Extract</i> button to extract paths from the centerlines geometry. Change the
segmentation surface color to white and zoom in a bit to see the path points displayed as yellow spheres.
<figure>
<img class="svImg svImgXl" src="documentation/modeling/imgs/3d-level-set/example-1/fig-7.png">
</figure>

<br>
<b>Step 8 - Save data</b> <br>
Save the project. There will now be four files under the <i>Images/level-set</i> directory
<ul>
  <li> surface.vtp - The segmentation surface </li>
  <li> centerlines.vtp - The centerlines geometry </li>
  <li> path_1.pth, path_2.pth - The path files extracted from the centerlines geometry. </li>
<div>
  <ul>
    <li> path_1.pth - The path from the start of the aorta to the end of the right iliac</li>
    <li> path_2.pth - The path from the iliac branch to the end of the left iliac</li>
  </ul>
</div>
</ul>

Two path files are created because the centerlines geometry <i>CenterlineIds</i> data array, used identify 
branches and paths, contains two IDs. 

<figure>
  <img src="documentation/modeling/imgs/3d-level-set/example-1/fig-8.png" style="float: left; width: 30%; margin-right: 5%; margin-bottom: 0.5em;">
  <p style="clear: both;">
  <figcaption> <i> Centerlines geometry color mapped with CenterlineIds showing two IDs, 0 and 1. </i></figcaption>
</figure>
<br>



<!-- ====================================== References ================================= -->

<br>
### References
<a id="ref-1"> [1] Osher, S.J. and Fedkiw, R.P., **Level Set Methods and Dynamic Implicit Surfaces**, Springer-Verlag (2002) </a>

<a id="ref-2"> [2]  Antiga, L., Piccinelli, M., Botti, L. et al., **An image-based modeling framework for patient-specific computational hemodynamics**, Med Biol Eng Comput 46, 1097 (2008) </a>

<a id="ref-3"> [3]  <a href="http://www.vmtk.org/tutorials/Centerlines.html">VMTK Centerlines Tutorial</a>



