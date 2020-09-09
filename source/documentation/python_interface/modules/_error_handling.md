## Error Handling ##

A Python program terminates when it encounters an error. An error can be a syntax error or an exception. 
A syntax error occurs when the Python parser is unable to understand a line of code. An exception is an 
error detected during the execution of a Python program. Both syntax errors and exceptions are fatal and
cause a program to terminate.

Exceptions come in different types. The exception type is included as part of the a message printed by Python when 
an exception is encountered. For example, a divide by zero generates a <b>ZeroDivisionError</b> exception type

<pre>
>>> 10 * (1/0)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ZeroDivisionError: division by zero
</pre>

Python has many standard exception names that are built-in identifiers (not reserved keywords). The <b>TypeError</b> exception 
is generated when an inappropriate type is passed to an API function. For example, using a string for the <i>radius</i> argument 
for the <b>Circle</b> constructor generates a Python **TypeError**

<pre>
>>> seg = sv.segmentation.Circle(radius='a', center=[1.0,1.0,1.0], normal=[1.0,0.0,0.0])
TypeError: CircleSegmentation() argument 1 must be float, not str
</pre>

<br>
### Try / Except Block ###
Exceptions cause program termination unless they are explicitly caught and handled by a try/except block. Python executes code 
following the try statement as it would normally do. If an exception is generated in this code section then the code following the 
except statement is executed and the program continues. 

The **TypeError** exception generated from using a string for the <i>radius</i> argument when creating a <b>Circle</b> segmentation 
is caught using a try/except block like this

<pre>
>>> try:
>>>     seg = segmentation.Circle(radius=1.0, center=[0.0,0.0,0.0], normal=[1.0,0.0,0.0])
>>> except TypeError as err:
>>>     print("TypeError: ", err)
>>>
TypeError:  CircleSegmentation() argument 1 must be float, not str
</pre>

Errors associated with the C++ functions called by the SimVascular API can use exception names defined by the API in the <b>except</b> statement. 
For example, passing in a list of two elements for the <i>normal</i> argument generates a **segmentation** module error is caught using 
the <b>segmentation.Error</b> exception name and a try/except block like this

<pre>
>>> try:
>>>    seg = segmentation.Circle(radius=1.0, center=[1.0,0.0,0.0], normal=[1.0])
>>> 
>>> except segmentation.Error as err:
>>>    print("Exception type: ", type(err))
>>>    print("Error: ", err)
Exception type: class 'segmentation.Error'
Error:  CircleSegmentation() The 'normal' argument is not a 3D point (three float values).
</pre>

Any exception can be caught using the <b>except Exception as err: </b> statement.

<pre>
>>> try:
>>>    seg = segmentation.Circle(radius=1.0, center=[1.0,0.0,0.0], normal=[1.0])
>>> 
>>> except Exception as err:
>>>    print("Exception type: ", type(err))
>>>    print("Unexpected error: ", err)
Exception type: class 'segmentation.Error'
Unexpected error:  CircleSegmentation() The 'normal' argument is not a 3D point (three float values).
</pre>

<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #0000e6; border-left: 6px solid #0000e6">
The try/except block is used to recover from errors and continue program execution. This is useful for a long-runninng program
processing lots of data sets; if the programs fails for one data set then it can still continue processing others. For some 
applications it might be acceptable to not handle exceptions and just let the program terminate. 
</div>




