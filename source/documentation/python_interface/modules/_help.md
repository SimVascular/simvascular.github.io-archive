## Interactive Help ##

The Python **help** function is used to display the documentation of modules, functions, classes, keywords etc. 
Typing <b>help(sv)</b> prints information about the **sv** package. 

<div style="background-color:#eeeeee;font-size:10px; height: auto; overflow: visible;">
  <p><iframe src="documentation/python_interface/files/sv-help.txt" frameborder="0" height="400" width="95%"></iframe></p>
</div>

<br>
Typing <b>help(sv.MODLENAME)</b> prints information about the **MODULENAME** module 

<ul>
  <li> List of classes defined by the module </li>
  <li> Description of each class and its methods </li>
</ul>

<div style="background-color:#eeeeee;font-size:10px; height: auto; overflow: visible;">
  <p><iframe src="documentation/python_interface/files/seg-help.txt" frameborder="0" height="400" width="95%"></iframe></p>
</div>

<br>
The <b>help()</b> function can be used for any component (e.g. class and methods) of a module. For example, 
<b>help(sv.segmentation.Circle)</b> prints the documentation for the <b>segmentation</b> module <b>Circle</b> class 

<div style="background-color:#eeeeee;font-size:10px; height: auto; overflow: visible;">
  <p><iframe src="documentation/python_interface/files/circle-help.txt" frameborder="0" height="400" width="95%"></iframe></p>
</div>

<br>
### Documentation Format ###
The help documentation describes the **sv** package using Python <b>docstrings</b> format, a string literal that occurs as the first 
statement in a module, function, class, or method definition. A docstring is stored in the the <b>\_\_doc\_\_</b> special attribute 
of an object. The docstring for a function or method summarizes its behavior and documents its arguments and return value(s). 

Constructor, method and function arguments are listed under the <b>Args:</b> heading. Each argument is described with its name, type
and description. Optional arguments are indicated using <b>Optional</b> preceding the argument type. The default value of optional 
arguments are given in the argument list. An optional argument without a default value is documented using NAME=None in the function 
or method definition. For example,
the <b>Circle</b> class constructor that has <i>center</i>, <i>normal</i> and <i>frame</i> optional arguments that have no default value
is documented using
<pre>
Circle(radius, center=None, normal=None, frame=None)
</pre>

<br>
Argument types are described using the following naming convention

<ul style="list-style-type:none;">
  <li> bool - Data with one of two built-in values True or False 
  <li> dict - Unordered collection of data in a key:value pair form put in curly brackets <b>{ }</b>
  <li> float - Real number with a floating point representation in which a fractional component is denoted by a decimal symbol or scientific notation 
  <li> int - Positive or negative whole numbers without a fractional part
  <li> list - A list object is an ordered collection of one or more data items put in square brackets <b>[ ]</b> 
  <li> str - A string value is a collection of one or more characters put in single, double or triple quotes
  <li> [float, float, float] - A list of three floats; used to represent 3D points and vectors. 
</ul>

<br>
A 3D point is represented as a list of three floats
<pre>
[float, float, float]
<br>
Example: pt = [1.0, 2.0, 3.0] 
</pre>

<br>
A list of 3D points is represented as a list of a list of three floats 
<pre>
list( [float, float, float] ) 
<br>
Example: control_points = [ [1.0, 2.0, 3.0], [2.0, 3.0, 4.0], [3.0, 4.0, 5.0] ]
</pre>
</ul>

<br>
SimVascular Python object types used as function arguments and return values are designated using the class name. 
For example, the <b>Modeling</b> <b>union</b> method, which takes two <b>sv.modeling.Model</b> arguments, is documented 
using just the <b>Model</b> class name 
<pre> <strong> union(model1, model2)  </strong>
<br>
&nbsp;&nbsp;&nbsp; Create a solid from the Boolean union operation on two solids. 
<br>
&nbsp;&nbsp;&nbsp; Args:
      model1 (Model): A solid model created by a modeler.
      model2 (Model): A solid model created by a modeler. 
<br>
&nbsp;&nbsp;&nbsp; Returns (Model): The solid model of the unioned models.
</pre>



