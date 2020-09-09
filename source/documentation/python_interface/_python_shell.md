## Python Shell ##

The SimVascular **Python Shell** provides a Python interface to SimVascular without the GUI. The **Python Shell** is invoked from a 
terminal by executing the script used to launch SimVascular interactively. The launch script is located in the SimVascular install
directory and is executed for different platforms using 

<pre>
Linux: /usr/local/sv/simvascular/<em>DATE</em>/simvascular 

MacOS: /usr/local/sv/simvascular/<em>DATE</em>/simvascular 

Windows: C:\Program Files\SimVascular\SimVascular\<em>DATE</em>\sv.bat  
</pre>

where <em>DATE</em> is the SimVascular install date (e.g. 2020-04-06). In the following discussion we will use **simvascular** to represent the 
the SimVascular launch script.


<br>
The SimVascular Python interpreter, the application that executes Python programs, is invoked in interactive mode using the **---python** flag.
That means you can enter Python statements or expressions interactively and have them executed or evaluated while you wait.
The **Python Shell** behaves like the standard Python interpreter and therefore supports automatic indentation to mark blocks of code. 

<pre>
<div style="font-size:10px">
$ simvascular --python
SimVascular Python Shell
Copyright (c) Stanford University, The Regents of the University
              of California, and others.  All Rights Reserved.

Python 3.5.5 (default, Jun 14 2019, 00:18:30) 
[GCC 4.2.1 Compatible Apple LLVM 8.1.0 (clang-802.0.38)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
>>> print("Hello")
Hello
>>>
</div>
</pre>


<br>
The **Python Shell** is terminated using 

<pre>
Linux and MacOS: Ctrl-D 

Windows: exit() or hold the Ctrl key down while you enter a Z, then hit the “Enter” key to get back to your Windows command prompt
</pre>


<br>
Python scripts are read in and executed using a double-dash **---** before the script name. The **Python Shell** passes the script to the 
Python interpreter for execution and then exits.

<pre>
<div style="font-size:10px">
$ simvascular --python -- path.py
SimVascular Python Shell
Copyright (c) Stanford University, The Regents of the University
              of California, and others.  All Rights Reserved.

New gRepository created from cv_solid_init
  TetGen:      1.5.1
PyModule_Create called
               splinePolygonContour Enabled
               levelSetContour Enabled
               polygonContour Enabled
               circleContour Enabled
               splinePolygonContour Enabled
  OpenCASCADE: 7.3.0
  Itk:         4.13.2
               TetGen Adaption Enabled
pyPath initialized.
Point 0, 0.000000, 0.000000, 0.000000 
Point 1, 0.000000, 0.000000, 30.000000 
Total number of path points created is: 100 
$
</div>
</pre>


