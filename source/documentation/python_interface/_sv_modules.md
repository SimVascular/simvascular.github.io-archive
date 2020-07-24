# SimVascular Python Modules #

The SimVascular **sv** Python package extends Python to include modules and classes used to access, manipulate and create
data for each of the path planning, segmentation, modeling, mesh generation and simulation steps in the SimVascular
image-based modeling pipeline. The <b>sv</b> package is imported into Python using the <b>import sv</b> statement. 
The **sv** package defines the following modules 

<ul>
  <li> <b> dmg </b> - Access to SV Data Manager nodes </li>
  <li> <b> geometry </b> - Functions operating on VTK PolyData objects </li>
  <li> <b> meshing </b> - Interface to SimVascular meshing functionality </li>
  <li> <b> modeling </b> - Interface to SimVascular modeling functionality </li>
  <li> <b> pathplanning </b> - Interface to SimVascular path plannning functionality </li>
  <li> <b> segmentation </b> - Interface to SimVascular segmentation functionality </li>
  <li> <b> vmtk </b> - Interrface to several VMTK funcntions </li>
</ul>

Modules can then be accessed using **sv.MODULENAME**. The <b>sv</b> package can also be imported into Python using the 
<b>from sv import \*</b> statement. This makes all of the module names accessible without the **sv** prefix. The difference
between the two statements can be seen using the **dir()** function which shows imported modules

<pre>
<div style="font-size:10px; height: auto; overflow: visible;">
$ simvascular --python
>>> import sv
>>> print(dir())
['__builtins__', '__doc__', '__loader__', '__name__', '__package__', '__spec__', 'sv']
>>> print(dir(sv))
['MeshSimListOption', 'MeshSimOptionTemplate', 'MutableSequence', 'OrderedDict', '__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__path__', '__spec__', 'ctypes', 'dmg', 'ext', 'geometry', 'image', 'load_module', 'mesh_utils', 'meshing', 'meshsim_options', 'meshsim_plugin', 'modeling', 'parasolid_plugin', 'pathplanning', 'project', 'python_api_lib', 'repository', 'seg_lib', 'segmentation', 'solid_occt', 'sys', 'vmtk']
>>>
>>> from sv import *
>>> print(dir())
['MeshSimListOption', 'MeshSimOptionTemplate', 'MutableSequence', 'OrderedDict', '__builtins__', '__doc__', '__loader__', '__name__', '__package__', '__spec__', 'ctypes', 'dmg', 'ext', 'geometry', 'image', 'load_module', 'mesh_utils', 'meshing', 'meshsim_options', 'meshsim_plugin', 'modeling', 'parasolid_plugin', 'pathplanning', 'project', 'python_api_lib', 'repository', 'seg_lib', 'segmentation', 'solid_occt', 'sv', 'sys', 'vmtk']
>>> 
</div>
</pre>
Both of these statements show the modules defined from importing <b>sv</b>; 'dmg', 'meshing', etc. 
<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #0000e6; border-left: 6px solid #0000e6">
The <b>import sv</b> statement is the prefered way to import <b>sv</b> because it does not pull everything into the global namespace,
which may cause naming connflicts with custom programs.
</div>
<br>

