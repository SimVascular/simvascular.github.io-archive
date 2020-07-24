## Interactive Help ##

The Python **help** function is used to display the documentation of modules, functions, classes, keywords etc. 
Typing <b>help(sv)</b> prints information about the **sv** package. 

<pre>
<div style="font-size:10px; height: auto; overflow: visible;">
$ simvascular --python
>>> help(sv)
NAME
    sv - SimVascular Python API

DESCRIPTION
    The sv package provides an application programming interface (API) for accessing core 
    SimVascular functions. The API defines a number of Python modules and classes used to 
    access, manipulate and create data for each of the path planning, segmentation, modeling, 
    mesh generation and simulation steps in the SimVascular image-based modeling pipeline. 
    Custom Python scripts can be written to augment the functionality provided by the 
    SimVascular GUI and to automate modeling tasks for optimization, uncertainty quantification, 
    and studies with large patient cohorts.
    
    The sv package defines the following modules
    
      dmg - Access to SV Data Manager nodes </li>
      geometry - Functions operating on VTK PolyData objects </li>
      meshing - Interface to SimVascular meshing functionality </li>
      modeling - Interface to SimVascular modeling functionality </li>
      pathplanning - Interface to SimVascular path plannning functionality </li>
      segmentation - Interface to SimVascular segmentation functionality </li>
      vmtk - Interrface to several VMTK funcntions </li>

PACKAGE CONTENTS
    loft_nurbs_options
    meshsim_options

DATA
    meshsim_plugin = None
    parasolid_plugin = None
    project = None
    python_api_lib = 'lib_simvascular_python_api'
    seg_lib = 'lib_simvascular_segmentation'
    solid_occt = None
</div>
</pre>
<br>

Typing <b>help(sv.MODLENAME)</b> prints information about the **MODULENAME** module 

<ul>
  <li> List of classes defined by the module </li>
  <li> Description of each class and its methods </li>
</ul>

<pre>
<div style="font-size:10px; height: 400px; overflow: visible;">
$ simvascular --python
>>> help(sv.segmentation)
Help on module segmentation:

NAME
    segmentation - SimVascular segmentation module.

DESCRIPTION
      The segmentation module provides an interface for SV segmentation methods. A segmentation defines 
      the contour geometry of a region of interest using various 2D image segmentation methods. The segmentation 
      module provides several classes used to create and modify 2D segmentations using circle, ellipse, level set, 
      polygon, spline polygon and threshold methods. 
      
CLASSES
    builtins.Exception(builtins.BaseException)
        SegmentationError
    builtins.Segmentation(builtins.object)
        Circle
        Contour
        LevelSet
        Polygon
        SplinePolygon
        Threshold
    builtins.object
        Group
        Method
        SubdivisionType
    
    class Circle(builtins.Segmentation)
     |  Circle(radius, center=None, normal=None, frame=None)  
     |  
     |  The CircleSegmentation class provides an interface for creating a circle segmentation. 
     |  A circle segmentation is defined by a radius, a 3D point defining its center and a normal. 
     |  The normal defines its orientation (i.e. the plane the circle lies in). 
     |  
     |  A CircleSegmentation object is created using a radius, center and normal or a PathFrame obje
ct. 
     |  
     |  
     |  A PathFrame object contains a path's interpolating spline (curve points) position, tangent, 
and normal data 
     |  at a given location. The position is used for the circle center, the tangent for its normal.
     |  
     |  Args: 
     |    radius (float): The circle radius. 
     |    center (list([float,float,float]): The circle center. 
     |    normal(list([float,float,float]): The circle normal direction. 
     |    frame (Optional[PathFrame]): A PathFrame object defing the circle's center and coordinate 
frame.
     |  
     |  Method resolution order:
     |      Circle
     |      builtins.Segmentation
     |      builtins.object
     |  
     |  Methods defined here:
     |  
     |  __init__(self, /, *args, **kwargs)
     |      Initialize self.  See help(type(self)) for accurate signature.
     |  
     |  __new__(*args, **kwargs) from builtins.type
     |      Create and return a new object.  See help(type) for accurate signature.
     |  
     |  get_center(...)
     |      get_center() 
     |      
     |      Get the circle segmentation center. 
     |      
     |      Returns (list([float,float,float]): The circle center.
     |  
     |  get_normal(...)
     |      get_normal() 
     |      
     |      Get the circle segmentation normal. 
     |      Returns (list([float,float,float]): The circle normal.
.
.
.
</div> 
</pre>

<br>
The <b>help()</b> function can be used for any component (e.g. class and methods) of a module 

<pre>
<div style="font-size:10px; height: auto; overflow: visible;">
$ simvascular --python
>>> help(sv.segmentation.Circle)
Help on class Circle:

class Circle(builtins.Segmentation)
 |  Circle(radius, center=None, normal=None, frame=None)  
 |  
 |  The CircleSegmentation class provides an interface for creating a circle segmentation. 
 |  A circle segmentation is defined by a radius, a 3D point defining its center and a normal. 
 |  The normal defines its orientation (i.e. the plane the circle lies in). 
.
.
.
>>> 
>>> help(sv.segmentation.Circle.get_normal
Help on method_descriptor:

get_normal(...)
    get_normal() 
    
    Get the circle segmentation normal. 
    
    Returns (list([float,float,float]): The circle normal.
>>> 
</div>
</pre>
