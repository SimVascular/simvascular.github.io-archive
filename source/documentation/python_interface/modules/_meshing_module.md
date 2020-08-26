## Meshing Module ##

The <b>meshing</b> module provides an interface to SimVascular meshing functionality used to generate a 
finite element tetrahedral mesh from a solid model. 

Methods are provided for setting meshing parameters, generating meshes and extracting mesh results as VTK 
unstructured mesh objects. User-defined regions on model faces can be defined for local mesh refinement. 

Two mesh generation software components (aka kernels) are supported
<ol style="list-style-type:number;">
   <li> MeshSim </li>
   <li> TetGen </li>
</ol>

MeshSim is a commercial software package used to generate meshes from Parasolid solid models. 
Using MeshSim requires purchasing a license from Simmetrix, a Parasolid license from Siemens 
and SimVascular plugins providing an interface to the software. 

TetGen is an open source software package used to generate meshes from PolyData solid models.

A mesh generation kernel name is specified using the <b>meshing.Kernel</b> class
<ol style="list-style-type:number;">
   <li> Kernel.MESHSIM </li> 
   <li> Kernel.TETGEN </li> 
</ol>

<br>
The <b> meshing </b> module defines the following classes
<ul style="list-style-type:none;">
  <li> <b> <a href="#AdaptMeshingKernelClass"> AdaptiveKernel </a> </b> </li>
  <li> <b> <a href="#MeshingKernelClass"> Kernel </a> </b> </li>
  <li> <b> <a href="#MeshSimClass"> MeshSim </a> </b> </li>
  <li> <b> <a href="#MeshingSeriesClass"> Series </a> </b> </li>
  <li> <b> <a href="#TetGenClass"> TetGen </a> </b> </li>
  <li> <b> <a href="#TetGenOptionsClass"> TetGenOptions </a> </b> </li>
</ul>

<br>
<div id="AdaptMeshingKernelClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> AdaptiveKernel </b> </legend>
<iframe src="documentation/python_interface/modules/docs/meshing_AdaptiveKernel.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="MeshingKernelClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> Kernel </b> </legend>
<iframe src="documentation/python_interface/modules/docs/meshing_Kernel.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="MeshSimClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> MeshSim </b> </legend>
<iframe src="documentation/python_interface/modules/docs/meshing_MeshSim.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="MeshingSeriesClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> Series </b> </legend>
<iframe src="documentation/python_interface/modules/docs/meshing_Series.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="TetGenClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> TetGen </b> </legend>
<iframe src="documentation/python_interface/modules/docs/meshing_TetGen.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="TetGenClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> TetGenOptions </b> </legend>
<iframe src="documentation/python_interface/modules/docs/meshing_TetGenOptions.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>


