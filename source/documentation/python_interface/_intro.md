# Introduction #
SimVascular provides an application programming interface (API) for accessing core SimVascular functions using the
Python programming language. The API defines a number of Python modules and classes used to access, manipulate and 
create data for each of the path planning, segmentation, modeling, mesh generation and simulation steps in the SimVascular 
image-based modeling pipeline. Custom Python scripts can be written to augment the functionality provided by the
SimVascular GUI and to automate modeling tasks for optimization, uncertainty quantification, and studies with large 
patient cohorts.

# Python Programming Environment #
Python is an interpreted, high-level, general-purpose programming language. It supports an object-oriented programming 
paradigm based on the concept of **objects**, which can contain data and functions (often known as methods) which
operate on the data. In object-oriented programming, a **class** is an template for creating objects, providing initial 
values for data and functions or methods. The SimVascular API defines a number of classes that are used to interface
to SimVascular core functions.

The Python programming environment is embeded in the SimVascular executable and includes the standard library that is 
distributed with Python as well as some optional components not included in Python distributions. 
This means that Python does not need to be installed on your computer to use Python and access the API. Embeding 
Python ensures the compatability between Python and the installed module versions. However, it prevents using Python 
packages that may already be installed on your computer. 

The Python interface can be accesed from the SimVascular **Python Console** or from a terminal using the **Python Shell**. 
Scripts accessing a project's data nodes shown in the **SV Data Manager** must use the **Python Console** because data
nodes are only defined when SimVascular is executed with the GUI.

### Python Modules ###
A Python module is used to organize related code (e.g. code used to operate on paths) and encapsulates Python classes, 
functions and variables under a single module name. The SimVascular **sv** Python package is a collection of modules 
that extends Python to include classes, functions and variables used to directly call SimVascular C++ functions. Classes 
provide a means of bundling data and functionality together into a specific object type they create. Python packages and 
modules are accessed using the Python **import** statement.

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
is accessable using the SimVascular **sv.vmtk** module.

### Python Scripts ###
A Python script is a plain text file containing code written in Python. A script file containing Python code has the 
extension **.py**. Scripts are made to be directly executed. Note that a text file containing Python code can also be 
designed to be imported as a module. This is a useful way for a user application to organize code into reusable utilities.


