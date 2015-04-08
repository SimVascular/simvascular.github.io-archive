#### Load image and path programatically

This script shows how to import VTI image data and segmentation paths using the SimVascular console. 

```tcl
set home $env(HOME) # you can use the home variable.

global gImageVol
set gImageVol(xml_filename) "$home/path/to/vti/sample_data-cm.vti"
createPREOPloadsaveLoadVol

global gFilenames
set gFilenames(path_file) "$home/path/to/pathsfile/0110_0001-cm.paths"
guiFNMloadHandPaths
```

---
<br>
