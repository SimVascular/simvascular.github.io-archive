##Mesh format

**svFSI** supports multiple mesh types, such as plain text files (coordinates + connectivity), ".msh" file generated by Gambit, vtk files and NURBS meshes. 

SimVascular-based vtu/vtp format for mesh/faces is the default
choice. svFSI supports below element types in vtu/vtp format:
-  line (linear, quadratic)
-  triangle (linear, quadratic)
-  quadrilateral (bilinear, serendipity, biquadratic)
-  tetrahedron (linear, quadratic)
-  hexagonal brick (trilinear, quadratic/serendipity, triquadratic)
-  wedge

Users can generate these mesh files following the [tutorial].

svFSI also supports loading NURBS meshes. Limited support is
available to import a bilinear quadrilateral mesh from Gambit-based
".msh". An option to convert this into a biquadratic mesh is also
available. svFSI also supports importing mesh in the form of a list
of nodal coordinates and element connectivity. It is, however, the
user's responsibility to provide information on faces. The face
connectivity should include a "GlobalElementID" mapping between the
face element and the corresponding mesh element to which the face
belongs.

Nested keywords "Add mesh" and "Add face" could be used to provide
paths to the mesh and face files. The users should also provide a
string-based name for each mesh and face immediately after the
colon.

Multiples meshes can be loaded for the same or different equations
within svFSI. svFSI supports reading multiple mesh formats as noted
below. Some additional information specific to an equation may also
be loaded within the mesh attribute such as domains, fiber
directions, and initial values.