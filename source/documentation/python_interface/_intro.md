# Introduction #
SimVascular provides an application programming interface (API) used to access core SimVascular functions using the
Python programming language. The API defines a number of modules and classes used to access, manipulate and create
data for each of the path planning, segmentation, modeling, mesh generation and simulation steps in the SimVascular 
image-based modeling pipeline. Custom Python scripts can be written to augment the functionality provided by the
SimVascular GUI and to automate modeling tasks for optimization, uncertainty quantification, and studies with large 
patient cohorts.

The Python programming environment is embeded in the SimVascular executable and has several Python packages preinstalled. 
This means that Python does not need to be installed on your computer to use Python and access the API. Embeding Python
ensures the compatability between Python and the installed package versions. However, it prevents using Python packages 
that may already be installed on your computer. 

A Python module is a way to organize related code (e.g. code used to operate on paths) and encapsulates Python classes, 
functions and variables under a single module name. The SimVascular **sv** Python module extends Python to include modules, 
functions and variables used to directly call SimVascular C++ functions. Classes provide a means of bundling data and 
functionality together into a specific object type they create. 

A Python script is a plain text file containing code written in Python. A script file containing Python code has the 
extension **.py**. Scripts are made to be directly executed. Note that a text file containing Python code can also be 
designed to be imported as a module. This is a useful way for a user application to organize code into common utilities.

The Python interface can be accesed from the SimVascular **Python Console** or from a terminal using the **Python Shell**. 
The following sections describe how to use the **sv** module in both of these environments.


