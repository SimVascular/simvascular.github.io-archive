### Prerequisite Files for svPre 

These prerequisite files for svPre are generate by the output from Meshing Module (Click _Write Files_ button in Mesh tab after meshing).

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/meshfiles.png">
  <figcaption class="svCaption" >Folder structure and file created after clicking on <b>Write Files</b></figcaption>
</figure>

These files are:

in the **mesh-complete/** folder: 

- **mesh-complete.mesh.vtu**, vtu file containing the solid mesh generated with TetGen.
- **mesh-complete.exterior.vtp**, vtp file containig all the exterior elements of the mesh generated with TetGen.
- **walls_combined.vtp**, vtp file containing all surface elements assigned to the wall, possibily combined from various surfaces. 

in the **mesh-complete/mesh-surfaces/** folder:

- **inflow.vtp**, vtp file containing the meshed inlet surface.
- **outlet.vtp**, vtp file containing the meshed outlet surface.
- **wall.vtp**, vtp file containing the meshed wall surface.

The files for Example 1 can be found [here](documentation/flowsolver/files/examples.zip). Create an empty folder on your hard drive to unzip the content of the archive. The following files are contained:

**HINT** - It is advisable that you set the project folder as _cylinder_. **SimVascular** will use this folder name as the default when creating new files. Using a meaningful folder name will make sure that your model files are named consistently. Also store the files containing the inlet flow rates in a folder called _flow-files_. Your problem may have more that one inflow wave form file. In this case, we only have a single flow file (called inflow.flow).

The format of the **steady.flow** file is as follows:

~~~
# Time (sec) Flow (cc/sec)
0 -100.0
1 -100.0
~~~

The first line is a comment line that you don’t need to include, but it helps to remember what units you used in the analysis. Then, two columns of numbers follow. The first column contains time values, and the second column flow values.

**WARNING**: please note that flow coming **into** the model (forward flow) will have a negative sign, (like in the example considered here), whereas flow coming **out of** the model (backflow) will be positive. A good way to remember that is that in the case of forward flow, the vector that gives you the direction of the flow and the normal to the face of the model point in opposite directions, and therefore their dot product will be negative.

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/Fig_04.png">
  <figcaption class="svCaption" >Cylinder with negative inflow</figcaption>
</figure>

On the other hand, in a situation of back flow,  the numerical value in the \*.flow file with be positive. 

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/Fig_05.png">
  <figcaption class="svCaption" >Cylinder with positive inflow</figcaption>
</figure>

In this problem, since we are running a steady case, our physical time goes from 0.0 to 1.0 seconds, and the flow is constant with a value of 100.0 cc/sec.

**HINT**: it is very important that you are absolutely sure about the physical dimensions of your model: every unit (length, time, flow, density, etc.) in your analysis must be dimensionally consistent. You can easily check the size of your model in [Paraview](http://www.paraview.org/) before importing it into **SimVascular**.

In this case, our cylinder has a radius $r=2.0$ cm and length $L=30$ cm.


