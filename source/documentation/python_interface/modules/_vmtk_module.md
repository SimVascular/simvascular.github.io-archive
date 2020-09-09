## Vmtk Module ##

The <b>vmtk</b> module provides an interface to VMTK functions.

All VMTK operations are performed using functions defined for the module. For example, computing centerlines is performed using 
the <b>centerlines()</b> function accessed directly from the <b>vmtk</b> module

<pre>
>>> centerlines = sv.vmtk.centerlines(model, source_ids, target_ids, use_face_ids=True)
</pre>

<br>
<div id="GeometryFunctions" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> Vmtk Module Functions </b> </legend>
<iframe src="documentation/python_interface/modules/docs/vmtk_functions.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>


<br> <br> <br>
