## Python Shell ##

The SimVascular **Python Shell** provides a Python interface to SimVascular without the GUI. The **Python Shell** is envoked from a terminal using the
SimVascular launch shell script **simvascular**

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
</div>
</pre>

The **Python Shell** behaves identically to the standard Python interperter and therefore supports automatic indentation to mark blocks of code. 

<pre>
<div style="font-size:10px">
>>> import sv
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
>>> p = sv.Path.pyPath()
pyPath initialized.
>>> p.NewObject('path1')
True
>>> p.AddPoint([0.,0.,0.])
True
>>> p.AddPoint([0.,0.,20.])
True
>>> p.PrintPoints()
Point 0, 0.000000, 0.000000, 0.000000 
Point 1, 0.000000, 0.000000, 20.000000 
True
>>> p.CreatePath()
Total number of path points created is: 100 
True
>>> 
</div>
</pre>

Python scripts are read in and executed using the following command

<pre>
<div style="font-size:10px">
$ sv --python -- path.py
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
</div>
</pre>



