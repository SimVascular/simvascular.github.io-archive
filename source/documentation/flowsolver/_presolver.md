## Pre-processing: SIMVASCULAR/PRESOLVER

SIMVASCULAR/PRESOLVER is the preprocessor for SVFlowsolver. The program input are the files describing the discretization: nodal coordinates, element connectivity, nodal boundary and element boundary connectivity, and element adjacency information. Running SIMVASCULAR/PRESOLVER using the right parameters on a *.supre file generates the input files  for SVFlowsolver.

The SIMVASCULAR/PRESOLVER program is called either from the command line (in cygwin for Windows users) or using SIMVASCULAR ’s GUI. The input files for SIMVASCULAR/PRESOLVER are the set of files that are generated after a mesh is created in the final steps of the geometric modeling part of the analysis. We will review this process briefly in the following example of steady flow through a cylinder. 

### Initial files coming from the Solid Modeling Part

We assume that we have a solid model (*.xmt_txt) file, and information about the inflow wave that we will prescribe at the inlet(s) face(s) of the model. In this example, the input parasolid file is cylinder-steady.xmt_txt Furthermore, we have a solver.inp file whose meaning will be explained later. 

The files for this example can be found in the directory %SIMVASCULAR_TEST%/cylinder-steady

<img src="documentation/flowsolver/imgs/Fig_02.png" width="800">

**HINT** - It is highly recommended to start this ‘simulation part’ of the analysis with a clean set of files. Also, try to name your *.xmt_file with the same  name as the containing folder (in this case, both the folder and the *.xmt_txt file are named cylinder-steady). It will make the process of loading files simpler. It is also advisable that you place the flow files in a folder called “flow-files”. Your problem may have more that one inflow wave file. In this case, we only have a single flow file (called inflow.flow), see figure below.

<img src="documentation/flowsolver/imgs/Fig_03.png" width="800">

The format of this file is as follows:

~~~
# Time (sec) Flow (cc/sec)
0 -1.570
0.3 -1.570
~~~

The first line is a comment line that you don’t need to include, but it helps to remember what units you used in the analysis. Then, two columns of numbers follow. The first column contains time values, and the second column flow values.

**WARNING**: please note that flow coming INTO the model (forward flow) will have a negative sign, (like in the example considered here), whereas flow coming OUT OF  he model (backflow) will be positive. A good way to remember that is that in the case of forward flow, the vector that gives you the direction of the flow and the normal to the face of the model point in opposite directions, and therefore their dot product will be negative. 

<img src="documentation/flowsolver/imgs/Fig_04.png" width="400">

On the other hand, in a situation of back flow,  the numerical value in the *.flow file with be positive. 

<img src="documentation/flowsolver/imgs/Fig_05.png" width="400">

In this problem, since we are studying a steady case, out physical time goes from 0.0 to 0.2 seconds, and the flow is constant with a value of 1.570 cc/sec. We are therefore considering a very simple problem of steady flow through a cylinder. 

**HINT**: it is very important that you are absolute sure about the physical dimensions of your model: every unit (length, time, flow, density, etc.) in your  analysis must be dimensionally consistent. A quick way to check the dimensions of your model is to type in the SimVascular Command Console window:

~~~
% solid_readNative -obj <nameoftheobject> -file <nameofthefile.xmt_txt>
~~~

This generates an object called “nameoftheobject”

~~~
% nameoftheobject GetPolyData -result <nameofthepolydata>
~~~

This generates a Polydata called “nameofthepolydata” that we can query for dimensions.

~~~
% geom._bbox –obj nameofthepolydata
~~~

This command will give you the dimensions of a boundary box that tightly encloses our model (x_min, x_max, y_min, y_max, z_min, z_max). 

<img src="documentation/flowsolver/imgs/Fig_06.png" width="800">

In this case, our cylinder is bounded by a box of 0.4x0.4 in the xy plane, and it has a length of 9 in the z direction of space. These dimensions are given in cm. In short, we have a cylinder of radius r=0.2 cm and length L=9 cm. We can start the process now. First, launch SimVascular in the folder where you have the *.xmt_txt file and the flow-files folder. In the ->File->Load Files menu, make sure that for all the possible instances of a parasolid model, you load the file *.xmt_txt (from this point on, we only have one “version” of the solid model). See figure below:

<img src="documentation/flowsolver/imgs/Fig_07.png" width="800">

**HINT**: After loading all these *.xmt_txt instances, go to ->File->Save Options and click on the “Save Options” button to save a *.patient file containing the names of all the files you will be generating for this  problem. This patient file is automatically loaded the next time you launch SimVascular in this folder. It’s a convenient way of accessing your files in a faster way in the future.

**HINT**: At this point, you must make sure as well that your model has appropriate names for all the faces. For example, the inflow should be named “inflow”, the outflow(s) should have meaningful names to you (for example, in an model with multiple outflows, a good choice of names could be the name of the different vessels), and the vessel wall faces should be named “wall” (if you only have one face) or “wall_*” where * represents the name of the artery under consideration (for example, wall_renal).

To check this quickly, go to the Solids->View Model tab, click on the “File Input/Output” button and select “Read Model”, select the *.xmt_txt file in the window. 

<img src="documentation/flowsolver/imgs/Fig_08.png" width="800">

Once you do this, a new window called “SimVascular 3-D Graphics Window” will pop up, displaying the model.

<img src="documentation/flowsolver/imgs/Fig_09.png" width="800">

Also, in the SimVascular GUI, you will have a list of Face Ids. If you click on them, you will be able to see what name the face associated with that id has. Alternative, you can also right-mouse-click in the SimVascular 3-D Graphics Window, place the mouse pointer on top of a face of the model, click the key “p” (for “pick”), and see what face name it has in the  SimVascular GUI.

Let’s go now to the meshing menu to generate the mesh and the rest of the input files that will be used by SIMVASCULAR/PRESOLVER. In the Meshing->Mesh Options tab, enter a value of 0.05 (cm) in the “Global Max Edge Size”
box. This will give us approximately 8 finite elements across the diameter of the vessel (recall that the diameter of this cylinder is D = 2r = 0.4 cm). 

<img src="documentation/flowsolver/imgs/Fig_10.png" width="800">

Click on the “Run Mesher (Internal)” button to generate the finite element mesh. This process will take a few seconds. 
This will generate an isotropic mesh with 97,032 elements and 21,172 nodes. 

<img src="documentation/flowsolver/imgs/Fig_11.png" width="800">
<img src="documentation/flowsolver/imgs/Fig_12.png" width="800">

Now, click on the “Write Output Files” button to generate all the files that SIMVASCULAR/PRESOLVER will need.

<img src="documentation/flowsolver/imgs/Fig_13.png" width="800">

These files are:

#### all_exterior_faces.ebc.gz
This file contains the element connectivity of all the exterior faces (i.e., faces on the boundary) of the model. 

The format of this file is as follows:

~~~
element_number face_ID node1 node2 node3
~~~

**NOTES:**

1. The face_ID label is currently ignored.
2. This format is common to all the *.ebc files. Once again, the *.ebc files contain the element connectivities of the boundary elements. These elements are triangles (the boundary on a tetrahedron is a triangle), and therefore have three nodes per element.


#### cylinder-steady.connectivity.gz
This file contains the element connectivity of all volumetric mesh (i.e., the tetrahedra filling the volume of the model). The format of this file is as follows:

~~~
element_label node1 node2 node3 node4
~~~

#### cylinder-steady.coordinates.gz
This file contains the coordinates of all the nodes of the mesh. The format of this file is as follows:

~~~
node_label x_coord y_coord z_coord
~~~

#### cylinder-steady.sms
This file is the mesh database, in the MeshSim format

#### cylinder-steady.supre
This is the input file of SIMVASCULAR/PRESOLVER. The format of this file will be the main point of the following section, but for now you should keep in the mind that this is the file that contains the instructions for the Boundary Condition specifications of our problem.

#### cylinder-steady.xadj.gz
This file contains the element adjacency.

#### inflow_mesh_face.vtk
This file is a vtk representation of the face of the model named “inflow”.  We will use it later on to prescribe the analytic velocity profile  according to the inflow.flow data. There is also a “mesh-surfaces” folder that contains, for each face of the model, the following
files (see figure below):
- A boundary element connectivity *.ebc.gz file.
- A nodal boundary *.nbc.gz file. These files contain the list of nodes that belong to that face.
- A *.vtk face that could be use for visualization purporses.

<img src="documentation/flowsolver/imgs/Fig_14.png" width="800">


