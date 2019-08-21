# Introduction #

The SimVascular **1D Simulation Tool** is used to interactively create the geometry, boundary conditions and solver 
parameters needed to execute a **sv1DSolver** simulation. The **sv1DSolver** solves for blood pressure and flow 
in deformable one-dimensional hemodynamic networks. These equations offer a relatively efficient means to reproduce 
realistic wave propagation phenomemon in vascular networks. One-dimensional networks can be coupled to both 0D lumped 
parameter models and to more complex 3D flow simulations as boundary conditions.

## Mesh Geometry ##
The geometry of one-dimensional vascular networks is based on the centerlines of a 3D geometric model.


<img src="documentation/1d_simulation/imgs/model_geom.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
<img src="documentation/1d_simulation/imgs/centerlines.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
<p style="clear: both;">

he 3D model will be converted into a 1D model consisting of cylindrical segments that capture the length and diameter between branching points of the 3D model.



The following sections describe how to use the **1D Simulation Tool** to create one-dimensional hemodynamic networks 
from 3D vascular models and simulate them using the **sv1DSolver**.  

