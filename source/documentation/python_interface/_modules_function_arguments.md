## Function Arguments ##

The methods and functions used in the Python API are able to use Python keyword (named) arguments. This allows functions to 
know the names of the arguments they accept. Keyword arguments are used to clarify which values are used by what arguments.
For example, creating a **Circle** segmentation with a given radius, center and normal using keyword arguments makes clear
the meaning of the data being passed to the function (constructor)

<pre>
>>> seg = sv.segmentation.Circle(radius=1.0, center=[1.0,1.0,1.0], normal=[1.0,0.0,0.0])
</pre>

<br>
All data passed to a function is checked against the type expected by the function. A type mismatch generates an error.
General type errors are automaticall detected by Python. For example, using a string for the <i>radius</i> generates a Python
**TypeError**.

<pre>
>>> seg = sv.segmentation.Circle(radius='a', center=[1.0,1.0,1.0], normal=[1.0,0.0,0.0])
TypeError: CircleSegmentation() argument 1 must be float, not str
</pre>

<br>
Errors associated with data needed by the C++ functions called by the SimVascular API are detected by the API C++
implementation. For example, passing in a list of two elements for the <i>normal</i> generates a **segmentation** module error

<pre>
>>> seg = sv.segmentation.Circle(radius=1.0, center=[1.0,0.0,0.0], normal=[1.0])
segmentation.SegmentationError: CircleSegmentation() The 'normal' argument is not a 3D point (three float values).
</pre>

<br>
All API errors are handled using exceptions. See the <a href="#modules_error_handling"> Error Handling </a> section.. 

