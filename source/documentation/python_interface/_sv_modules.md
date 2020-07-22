# SimVascular Python Modules #

The <b>sv</b> module is imported into Python using the <b>import sv</b> command. Importing the **sv** module defines additional modules 
displayed in the left panel of the <b>Python Console</b>. Typing <b>help(sv.MODLENAME)</b> prints information about the **MODULENAME** module. For example, you can 
type <b>help(sv.Contour)</b> to see the names of functions defined for the <b>Contour</b> module.

<pre>
<div style="font-size:8px; color: green; height: 70px; overflow: visible;">
>>> help(sv.Contour)
Help on module pyContour:

NAME
    pyContour

CLASSES
    builtins.Exception(builtins.BaseException)
        error
    builtins.object
        pyContour
        pyContourFactoryRegistrar
    
    class error(builtins.Exception)
     |  Common base class for all non-exit exceptions.
     |  
     |  Method resolution order:
     |      error
     |      builtins.Exception
     |      builtins.BaseException
     |      builtins.object
     |  
     |  Data descriptors defined here:
     |  
     |  __weakref__
     |      list of weak references to the object (if defined)
     |  
     |  ----------------------------------------------------------------------
     |  Methods inherited from builtins.Exception:
     |  
     |  __init__(self, /, *args, **kwargs)
     |      Initialize self.  See help(type(self)) for accurate signature.
     |  
     |  __new__(*args, **kwargs) from builtins.type
     |      Create and return a new object.  See help(type) for accurate signature.
     |  
     |  ----------------------------------------------------------------------
     |  Methods inherited from builtins.BaseException:
     |  
     |  __delattr__(self, name, /)
     |      Implement delattr(self, name).
     |  
     |  __getattribute__(self, name, /)
     |      Return getattr(self, name).
     |  
     |  __reduce__(...)
     |      helper for pickle
     |  
     |  __repr__(self, /)
     |      Return repr(self).
     |  
     |  __setattr__(self, name, value, /)
     |      Implement setattr(self, name, value).
     |  
     |  __setstate__(...)
     |  
     |  __str__(self, /)
     |      Return str(self).
     |  
     |  with_traceback(...)
     |      Exception.with_traceback(tb) --
     |      set self.__traceback__ to tb and return self.
     |  
     |  ----------------------------------------------------------------------
     |  Data descriptors inherited from builtins.BaseException:
     |  
     |  __cause__
     |      exception cause
     |  
     |  __context__
     |      exception context
     |  
     |  __dict__
     |  
     |  __suppress_context__
     |  
     |  __traceback__
     |  
     |  args
    
    class pyContour(builtins.object)
     |  pyContour  objects
     |  
     |  Methods defined here:
     |  
     |  Area(...)
     |  
     |  Center(...)
     |  
     |  Create(...)
     |  
     |  CreateSmoothCt(...)
     |  
     |  GetObject(...)
     |  
     |  GetPolyData(...)
     |  
     |  NewObject(...)
     |  
     |  Perimeter(...)
     |  
     |  SetCtrlPts(...)
     |  
     |  SetCtrlPtsByRadius(...)
     |  
     |  SetImg(...)
     |  
     |  SetThresholdValue(...)
     |  
     |  __init__(self, /, *args, **kwargs)
     |      Initialize self.  See help(type(self)) for accurate signature.
     |  
     |  __new__(*args, **kwargs) from builtins.type
     |      Create and return a new object.  See help(type) for accurate signature.
    
    class pyContourFactoryRegistrar(builtins.object)
     |  pyContourFactoryRegistrar wrapper
     |  
     |  Methods defined here:
     |  
     |  __new__(*args, **kwargs) from builtins.type
     |      Create and return a new object.  See help(type) for accurate signature.

FUNCTIONS
    SetContourKernel(...)

FILE
    (built-in)
</div>
</pre>



<br>
<br>
<br>
<br>





