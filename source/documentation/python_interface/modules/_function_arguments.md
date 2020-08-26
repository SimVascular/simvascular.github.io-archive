## Function Arguments ##

The methods and functions used in the Python API are able to use Python keyword (named) arguments. This allows functions to 
know the names of the arguments they accept. Keyword arguments are used to clarify which values are used by what arguments.
For example, creating a **Circle** segmentation with a given <i>radius</i>, <i>center</i>and <i>normal</i> using keyword arguments makes clear
the meaning of the data passed to the **Circle** class constructor

<pre>
>>> seg = sv.segmentation.Circle(radius=1.0, center=[1.0,1.0,1.0], normal=[1.0,0.0,0.0])
</pre>

<br>
All data passed to a function is checked against the type expected by the function. A type mismatch generates an error.
General type errors are detected by Python. For example, using a string for the <i>radius</i> argument which expects a 
float generates a Python **TypeError**

<pre>
>>> seg = sv.segmentation.Circle(radius='a', center=[1.0,1.0,1.0], normal=[1.0,0.0,0.0])
TypeError: CircleSegmentation() argument 1 must be float, not str
</pre>

<br>
Errors associated with data needed by the C++ functions called from the SimVascular API are detected within the API C++
implementation. For example, passing in a list of two instead of three floats for the **Circle** class constructor 
<i>normal</i> argument generates a **segmentation** module error

<pre>
>>> seg = sv.segmentation.Circle(radius=1.0, center=[1.0,0.0,0.0], normal=[1.0])
segmentation.Error: CircleSegmentation() The 'normal' argument is not a 3D point (three float values).
</pre>

<br>
All API errors are handled using exceptions. See the <a href="#modules_error_handling"> Error Handling </a> section.. 

