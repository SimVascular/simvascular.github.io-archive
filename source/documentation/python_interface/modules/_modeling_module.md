## Modeling Module ##

The <b>modeling</b> module provides an interface to SimVascular modeling functionality used to generate geometric models 
from medical imaging data. Solid models of vessel geometry are created by lofting and capping 2D segmentations. 
Separate solid models are then unioned together to create a model representing a region of the vascular anatomy.                           
                                                                             
Methods are provided for querying, creating, and modifying models. This includes Boolean operations, operations 
on model faces, local operations acting on user-defined regions global operations acting on the entire model. 

Three 3D solid modeling software components (aka kernels) are supported
<ol style="list-style-type:number;">
   <li> PolyData </li>
   <li> OpenCASCADE </li>
   <li> Parasolid </li>
</ol>
    
A modeling kernel name is specified using the <b>modeling.Kernel</b> class
<ol style="list-style-type:number;">
   <li> Kernel.POLYDATA </li> 
   <li> Kernel.OPENCASCADE </li> 
   <li> Kernel.PARASOLID </li> 
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

