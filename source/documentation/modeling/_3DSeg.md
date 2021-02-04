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

   <li> Smoothenss constraint for the mean curvature of the surface </li>
</ol>

Weights are assigned to regulate the influence of each term on surface evolution. Weights may need to be adjusted for different image modalities
with differnt properties (e.g. signal to noise ratio).

The level set formulation requires computing an image gradient. Derivatives are computed for the image data by applying using a  
Gaussian smoothing filter with a user defined value for the standard deviation. Applying a smoothing filter dereases the effect of 
image noise on derivative computation but may remove image features below the scale corresponding to the standard deviation used.

The level set equation is solved numericaly for a number of iterations (time steps) incrementally updating the level set function and implicitly 
the segmentation surface. Enough iterations need to be performed so that the surface expands close to the boundaries of the anatomical structures 
that are being segmented. The result of the level set computation is the level set function reprenting a segmentation image. The geometry
of the segmentation surface, a triangle mesh, is then extracted from this image at the zero isolevel. 

After a segmentation surface has been extracted centerlines and SimVascular paths can be then computed for it. The path files can be
imported into SimVascular and used to automatically generate a model using the machine learning capability in the SimVascular Segmentation 
tool. This may be useful when building models of complex vascular anatomy.

The segmentation surface does not have the planar caps needed for SimVascular models. However, the SimVascular Modeling tool can use paths 
to trim the surface at its ends. Caps can then be created for the trimmed model using the Modeling tool <b>Fill Holes w/o ID</b> operation
(see <a href="http://simvascular.github.io/docsModelGuide.html#modelingEditingPolyData">Modeling Guide - Global/Local Operations</a>). 


###Level Set Tool 

The SimVascular **3D Level Set Tool** is used to interactively generate 3D segmentations from volumetric imaging data using the
level set method with colliding fronts initialization. The tool uses the image data read in by SimVascular and stored under the
SV Data Manager <b>Images</b> node. Data created by the tool is stored in files under a project's Images/level-set
directory. The demo-image.vti image data file from the SimVascular <b> Demo Project </b> is used in the following sections.

The **3D Level Set Tool** is opened by selecting the 
<img src="documentation/modeling/imgs/3d-level-set/level-set-icon.png" width="20" height="20"> icon located at the top of the
SimVascular toolbar. The tool panel opens to the right of the screen the same as other SimVascular tools.The tool has 
<b>Seeds</b>, <b>Level Set</b>, <b>Surface</b> and <b>Paths</b> sub-panels. 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/3d-level-set/init.png">
  <figcaption class="svCaption"> Opening the <b> 3D Level Set Tool</b> brings up its panel and creates a <b>level-set</b> 
    node under the SV Data Managert Images node.
  </figcaption>
</figure>


   <li> Open the <b>3D Level Set Tool</b>
   <li> Create one or more groups of start and end seeds for initializing the level set function (<b>Seeds</b> panel)
   <li> Set the level set parameters and execute the level set solution (<b>Level Set</b> panel)
   <li> Extract centerlines from the segmentation surface (<b>Surface</b> panel)
   <li> Convert centerlines to paths (<b>Paths</b> panel)
</ol>



After interactively creating seeds used 


Seeds used to initialize the level set are interactively placed using 


interactively position starting and ending seed points by manipulating axial, coronal, and sagittal
       planes in a 3D view

ation

placing seeds to identify the regions for segmentation



### References

<a id="ref-1"> [1] Osher, S.J. and Fedkiw, R.P., **Level Set Methods and Dynamic Implicit Surfaces**, Springer-Verlag (2002) </a>

<a id="ref-2"> [2]  Antiga, L., Piccinelli, M., Botti, L. et al., **An image-based modeling framework for patient-specific computational hemodynamics**, Med Biol Eng Comput 46, 1097 (2008) </a>



