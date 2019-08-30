#Introduction 

The SimVascular **1D Simulation Tool** is used to interactively create the geometry, boundary conditions and solver 
parameters needed to execute a **sv1DSolver** simulation. The **sv1DSolver** solves for blood pressure and flow 
in deformable one-dimensional hemodynamic networks. These equations offer a relatively efficient means to reproduce 
realistic wave propagation phenomemon in vascular networks. One-dimensional networks can be coupled to both 0D lumped 
parameter models and to more complex 3D flow simulations as boundary conditions.

###Centerlines Geometry
The geometry of the one-dimensional networks used for a 1D simulation is based on the centerlines computed from the surface 
of a 3D geometric model.  The 3D geometric model is created from image data using the typical 
SimVascular <a href="docsModelGuide.html"> modeling workflow </a>.

Centerlines represent a 1D characterization of blood vessel geometry. The centerlines are computed for a 3D surface using 
the <a href="http://www.vmtk.org/tutorials/Centerlines.html"> Vascular Modeling Toolkit </a>. The computation solves a wave propagation
problem using a source point representing the start of the centerlines and target points representing the ends of the centerlines.
The source and target points are selected from the model caps defined in the SimVascular **Modeling Tool**.

<br>
<figure>
  <img src="documentation/1d_simulation/images/model-geom.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <img src="documentation/1d_simulation/images/centerlines.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
  <figcaption> <i>The centerlines (right) computed from a 3D geometric model of the aorta and femoral arteries (left). </i></figcaption>
</figure>
<br>

###Network Geometry and 1D Simulation Mesh
The centerlines geometry is used to define network **nodes** at vessel inlets, outlets and branching points. A number of cylindrical 
**segments** are defined representing the length and diameter between vessel **nodes**.

<br>
<figure>
  <img class="svImg svImgSm" src="documentation/1d_simulation/images/vessel-segments.png">
  <figcaption class="svCaption"> The cylindrical segments representing vessel length and diameter between branching points. </figcaption>
</figure>
<br>

Segments are then discretized into a mesh of finite elements in order to numerically solve the 1D equations of fluid flow in 
deformable vessels.

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/1d_simulation/images/segment-elements.png">
  <figcaption class="svCaption"> A segment is discretized into a mesh of finite elements. </figcaption>
</figure>
<br>


###Units 
All model quantities and associated boundary conditions are specified in CGS units.

