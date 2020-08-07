## Meshing Module ##

The <b>meshing</b> module provides an interface to SimVascular functionality used to generate a finite element mesh 
from solid models of vessel geometry. 
                                                                             
Methods are provided for creating finite element meshes using a set of parameters similar to those found in the 
SimVascular Meshing tool. This includes setting user-defined regions on model faces for local mesh refinement. 

Two mesh generation software components (aka kernels) are supported
<ol style="list-style-type:number;">
   <li> MeshSim </li>
   <li> TetGen </li>
</ol>
    
A mesh generation kernel name is specified using the <b>meshing.Kernel</b> class
<ol style="list-style-type:number;">
   <li> Kernel.MESHSIM </li> 
   <li> Kernel.TETGEN </li> 
</ol>

The PolyData modeling kernel represents models as unstructured surfaces composed of 3-sided polygons. 
    
The OpenCASCADE modeling kernel is an open source software 3D CAD package.  Models are represented as 
Non-Uniform Rational B-Spline (NURBS) surfaces. 
    
The Parasolid modeling kernel is a commercial software package providing 3D solid modeling functionality. 
Using Parasolid requires purchasing a license from Siemens for the Parasolid libraries and a SimVascular 
plugin providing an interface to the libraries.

<br>
The <b>modeling</b> module defines the following classes
<ul style="list-style-type:none;">
  <li> <b> <a href="#KernelClass"> Kernel </a> </b> </li>
  <li> <b> <a href="#ModelerClass"> Modeler </a> </b> </li>
  <li> <b> <a href="#OpenCascadeClass"> OpenCascade </a> </b> </li>
  <li> <b> <a href="#ParasolidClass"> Parasolid </a> </b> </li>
  <li> <b> <a href="#PolyDataClass"> PolyData </a> </b> </li>
</ul>

<br>
<div id="KernelClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> Kernel </b> </legend>
<iframe src="documentation/python_interface/modules/docs/modeling_Kernel.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="ModelerClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> Modeler </b> </legend>
<iframe src="documentation/python_interface/modules/docs/modeling_Modeler.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="OpenCascadeClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> OpenCascade </b> </legend>
<iframe src="documentation/python_interface/modules/docs/modeling_OpenCascade.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="ParasolidClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> Parasolid </b> </legend>
<iframe src="documentation/python_interface/modules/docs/modeling_Parasolid.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="PolyDataClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> PolyData </b> </legend>
<iframe src="documentation/python_interface/modules/docs/modeling_PolyData.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>


<br>
<br>
<br>
<br>

