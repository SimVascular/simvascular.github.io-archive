## Dmg Module ##

The <b>dmg</b> (data manager) module provides an interface for accessing the <b>SV Data Manager</b>, 
the panel located on the left side of the main window that organizes the data defined for a SimVascular 
project as a hierarchical tree of data nodes. The Data Manager organizes data nodes into predefined primary data 
node types according to the tools that create them create them  

<ul style="list-style-type:none;">
  <li> Images </li> 
  <li> Meshes </li> 
  <li> Models </li> 
  <li> Paths </li> 
  <li> Segmentations </li> 
  <li> Simulations </li> 
  <li> Simulations1d </li> 
  <li> svFSI </li> 
</ul>

When new data is added to the project a new data node is added under the appropriate data node type
with a user-defined name.

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
Scripts accessing a project's data nodes shown in the <b>SV Data Manager</b> must use the GUI <b>Python Console</b> 
because data nodes are only defined when SimVascular is executed with the GUI.
</div>

<br>
The <b>dmg</b> module does not define any classes. All access to the  <b>SV Data Manager</b> is through functions defined 
for the module. For example, getting path data from the <b>aorta</b> data node is performed using the <b>get_path()</b>
function accessed directly from the <b>dmg</b> module

<pre>
>>> path = sv.dmg.get_path('aorta')
</pre>

<br>
<div id="DmgFunctions" class="PythonClassDiv" >
<legend style="font-size:20px; text-align:left"> <b> Dmg Module Functions </b> </legend>
<iframe src="documentation/python_interface/modules/docs/dmg_functions.html" style="background-color: #FFFFFF" frameborder="0" height="400" width="95%"> </iframe>
</div>

