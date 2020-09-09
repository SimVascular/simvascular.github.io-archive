# Python Programming Environment #
Python is an interpreted, high-level, general-purpose programming language. It supports an object-oriented programming 
paradigm based on the concept of **objects**, which can contain data and functions (often known as methods) which
operate on the data. In object-oriented programming, a **class** is an template for creating objects, providing initial 
values for data and functions or methods. The SimVascular API defines a number of classes that are used to interface
to SimVascular core functions.

The Python programming environment is embedded in the SimVascular executable and includes the standard library that is 
distributed with Python as well as some optional components not included in Python distributions. 
This means that Python does not need to be installed on your computer to use Python and access the API. Embedding 
Python ensures the compatibility between Python and the installed module versions. However, it prevents using Python 
packages that may already be installed on your computer. 

The Python interface can be accessed from the SimVascular **Python Console** or from a terminal using the **Python Shell**. 

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
Scripts accessing a project's data nodes shown in the <b>SV Data Manager</b> must use the <b>Python Console</b> because 
data nodes are only defined when SimVascular is executed with the GUI.
</div>

### Python Modules ###
A Python module is used to organize related code (e.g. code used to operate on paths) and encapsulates Python classes, 
functions and variables under a single module name. The SimVascular **sv** Python package is a collection of modules 
that extends Python to include classes, functions and variables used to directly call SimVascular C++ functions. Classes 
provide a means of bundling data and functionality together into a specific object type they create. Python packages and 
modules are accessed using the Python **import** statement.

Components of a module are accessed using a dot <b>.</b> notation. For example, the <b>Circle</b> class defined
in the <b>segmentation</b> module is accessed using  <b>sv.segmentation.Circle()</b>.

### Python Objects ###
Almost everything in Python is an object. An object is an encapsulation of data members (variables) functions into a single entity.
A <b>class</b> is an template for creating objects. A class <i>constructor</i> is used for instantiating an object by initializing 
or assigning values to its data members when an object is created. A constructor can be passed arguments just like a function and 
used the values of those arguments to assign values to its data members. For example, the <b>segmentation.Circle</b> class is used 
to create a circle segmentation with a given radius, center and normal arguments passed to its constructor 

<pre>
>>> circle_seg = sv.segmentation.Circle(radius=1.0, center=[1.0,1.0,1.0], normal=[1.0,0.0,0.0])
</pre>

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
The SimVascular Python API uses the following naming conventions
<ul style="list-style-type:none;">
  <li> <b>Classes</b> - The first letter is capitalized: sv.pathplanning.<b>Path</b>, sv.modeling.<b>Modeler</b>  </li> 
  <li> <b>Modules</b> - All lower case: sv.<b>pathplanning</b>, sv.<b>modeling</b>  </li> 
  <li> <b>Functions and Methods</b> - All lower case and underscores: sv.segmention.Circle.<b>get_center()</b>  </li> 
</div>

### Visualization Toolkit ###
SimVascular uses the Visualization Toolkit (VTK), an open-source software system for image processing, 3D graphics, volume 
rendering and visualization, for many applications and uses its file formats to store image, model and mesh data. Many Python 
API functions return VTK objects that can be used in further computations or displayed in a graphics window. The VTK package 
is included in the SimVascular Python environment. It is accessed using the **import vtk** statement.

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
Scripts that use SimVascular API functions returning VTK objects must import the VTK package, otherwise the functions
will not be able to create VTK objects and the script will generate an error. 
</div>

### Vascular Modeling Toolkit ###
SimVascular uses the Vascular Modeling Toolkit (VMTK), a collection of libraries and tools for 3D reconstruction, geometric 
analysis, mesh generation and surface data analysis for image-based modeling of blood vessels, from some applications. 
The VMTK Python module is not included in the Python programming environment. However, some of the VMTK functionality
is accessible using the SimVascular **sv.vmtk** module.

### Python Scripts ###
A Python script is a plain text file containing code written in Python. A script file containing Python code has the 
extension **.py**. Scripts are made to be directly executed. Note that a text file containing Python code can also be 
designed to be imported as a module. This is a useful way for a user application to organize code into reusable utilities.


