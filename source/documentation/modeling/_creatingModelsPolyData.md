### Creating a PolyData Model from 2D/3D Segmentations ###

This exercise will assume that you have created segmentations down the aorta and common iliac artery that you can now use to create a solid model.
 
**To create a PolyData model (empty):**

	Right click the data node "Models" in the SV project in Data Manager
	Click "Create Model" in the popup menu
	Model Type: PolyData
	Model Name: demo
	Click "OK"

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/polydata/createemptymodel.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/polydata/createmodeldialog.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now a new data node “demo” for the model is created under the data node "Models" in Data Manager. Double click the data node “demo" and the tool "SV Modeling” automatically shows up. The new model is empty and has no data so far. 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polydata/emptymodel.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Union (Boolean) groups to create model:**

	Click the button "Create Model..."
	A dialog pops up, showing all avaiable groups
	Toggle on the checkboxs in the column "Use" for the groups you want
	You can also use the table menu to decide whether to use some groups 
	Number of Sampling Points: (optional for PolyData models)
	Advanced Lofting: (optional), if on, NURBS lofting will be used to create the model.
	Click "OK"

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/polydata/uniondialog.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font> 
At the end of the Boolean operation, the model is created. The status bar will display the number of free edges and bad cells on the surfaces. Bad cells are denoted by triangles that have more than one neighbor which should not be possible if you have a valid 3D surface. If these numbers are not zero, please report this occurence to the SimVascular development team.


<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/polydata/polydatamodel.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

In addition, you should now be able to see the face names retained from your group segmentations. There should be wall and cap surfaces. If there are two caps for a surface, this means that after lofting, this surface had two holes. For a typical model, you should have one vessel like this and the rest should have one cap. If you have two caps, it may be the case that one of your vessels does not completely intersect into another vessel.


**Union (Boolean) 2D/3D segmentations to create model:**

SimVascular is capable to union both 2D segmentations (groups) and 3D segmentations (vtp surfaces) to create a solid model. 

To add 3D segmentations to the folder "Segmentations":

	Use "Segmentation" tool from MITK to create a vtp surface, and copy/paste it to the folder "Segmentations"
	or Right click the folder "Segmentations" and import a vtp (surface) file created by other external software.

To union 2D/3D segmentations:

	Click the button "Create Model..."
	All 2D/3D segmentations are listed in the popup dialog
	Choose those that you would like to union

**More options availale in Data Manager for visualization**

Right click the model "demo" in Data Manager, the menu pops up with more options for the model.

	Show/Hide Edges: show/hid edges on the model surface
	Show Full/Faces: show the model as one full surface or a set of faces
	Surface Representation: show the model surface with points, wireframe or surface

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/polydata/datamenuformodel.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Export info for cap faces**

To export cap info (area) to a file: 

	Right click the model "demo" in Data Manager, the menu pops up
	Click "Export Cap Info"
	Provide a file and Save



