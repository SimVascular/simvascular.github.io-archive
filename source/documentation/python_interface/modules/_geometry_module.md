## Geometry Module ##

The <b>geometry</b> module provides functions for performing geometric operations on vtkPolyData objects used to 
represents vertices, lines and polygons. 

All geometric operations are performed using functions defined for the module. For example, aligning contours is performed using 
the <b>align_profile()</b> function accessed directly from the <b>geometry</b> module

<pre>
>>> align_cont = sv.geometry.align_profile(source_cont, cont2)
</pre>

<br>
The <b>geometry</b> module defines two classes used to set lofting parameters
<ul style="list-style-type:none;">
  <li> <b> <a href="#LoftOptionsClass"> LoftOptions </a> </b> </li>
  <li> <b> <a href="#LoftNurbsOptionsClass"> LoftNurbsOptions </a> </b> </li>
</ul>

<br>
<div id="GeometryFunctions" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> Geometry Module Functions </b> </legend>
<iframe src="documentation/python_interface/modules/docs/geometry_functions.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="LoftOptionsClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> LoftOptions Class </b> </legend>
<iframe src="documentation/python_interface/modules/docs/geometry_LoftOptions.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

<br>
<div id="LoftNurbsOptionsClass" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> LoftNurbsOptions Class </b> </legend>
<iframe src="documentation/python_interface/modules/docs/geometry_LoftNurbsOptions.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>


