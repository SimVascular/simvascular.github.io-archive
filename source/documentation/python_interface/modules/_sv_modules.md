# SimVascular Python Modules #

The SimVascular **sv** Python package extends Python to include modules and classes used to access, manipulate and create
data for each of the path planning, segmentation, modeling, mesh generation and simulation steps in the SimVascular
image-based modeling pipeline. The <b>sv</b> package is imported into Python using the <b>import sv</b> statement. 
The **sv** package defines the following modules 

<ul style="list-style-type:none;">
  <li> <b> dmg </b> - Access to SV Data Manager nodes </li>
  <li> <b> geometry </b> - Functions operating on VTK PolyData objects </li>
  <li> <b> meshing </b> - Classes and methods interfacing to SimVascular meshing </li>
  <li> <b> modeling </b> - Classes and methods interfacing to SimVascular modeling </li>
  <li> <b> pathplanning </b> - Classes and methods interfacing to SimVascular path planning </li>
  <li> <b> segmentation </b> - Classes and methods interfacing to SimVascular segmentation </li>
  <li> <b> vmtk </b> - Interface to several VMTK functions </li>
</ul>

<br>
Modules are accessed using <b>sv.<i>MODULENAME</i></b>. The <b>sv</b> package can also be imported into Python using the 
<b>from sv import \*</b> statement. This makes all of the module names accessible without the **sv** prefix. A single <b>sv</b> 
module can be imported using <b>from sv import <i>MODULENAME</i></b>. The difference between the these statements is seen using 
the **dir()** function which shows imported modules

<pre>
<div style="font-size:10px; height: auto; overflow: visible;">
$ simvascular --python
>>> import sv
>>> print(dir())
['__builtins__', '__doc__', '__loader__', '__name__', '__package__', '__spec__', 'sv']
>>> dir(sv)
['MeshSimListOption', 'MeshSimOptionTemplate', 'MutableSequence', 'OrderedDict', '__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__path__', '__spec__', 'ctypes', 'dmg', 'ext', 'geometry', 'image', 'load_module', 'mesh_utils', 'meshing', 'meshsim_options', 'meshsim_plugin', 'modeling', 'parasolid_plugin', 'pathplanning', 'project', 'python_api_lib', 'repository', 'seg_lib', 'segmentation', 'solid_occt', 'sys', 'vmtk']
>>>
>>>
>>> from sv import *
>>> dir()
['MeshSimListOption', 'MeshSimOptionTemplate', 'MutableSequence', 'OrderedDict', '__builtins__', '__doc__', '__loader__', '__name__', '__package__', '__spec__', 'ctypes', 'dmg', 'ext', 'geometry', 'image', 'load_module', 'mesh_utils', 'meshing', 'meshsim_options', 'meshsim_plugin', 'modeling', 'parasolid_plugin', 'pathplanning', 'project', 'python_api_lib', 'repository', 'seg_lib', 'segmentation', 'solid_occt', 'sv', 'sys', 'vmtk']
>>> 
>>>
>>> from sv import segmentation
>>> dir()
['__builtins__', '__doc__', '__loader__', '__name__', '__package__', '__spec__', 'segmentation']
</div>
</pre>
Both of these statements show the modules defined from importing <b>sv</b>; <b>dmg</b>, <b>meshing</b>, etc. 
<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #0000e6; border-left: 6px solid #0000e6">
The <b>import sv</b> or <b>from sv import <i>MODULENAME</i></b> statements are the preferred ways to import modules because they don't pull 
everything into the global namespace, which may cause naming conflicts with custom programs. 
</div>


