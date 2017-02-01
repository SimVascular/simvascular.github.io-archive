### Face Operations ###

**Face Names and Types**

After the model is created, face informations are listed in a table in the tab "Face List", like name, type, visibility(V),color( C),opacity(O). You can change the properties in the table. 

	Name: double click the name; input a new name in the text field
	Type: double click the type; select a type (like "wall", "cap") from the combo box
	V: double click the eye icon to show/hide the face in Display
	C: double click the table cell; select a color from the popup dialg
	O: double click the table cell; set a value [0,1] for the face opacity
	You can also use the table menu to change multiple faces at the same time.
	Click the table header like "Name", "Type", etc to sort the table

<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/polydata/facetable.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Selecting(highlighting) Faces**

Select faces in the table:

	Select a single face: Click on the row
	Select multiple faces: Ctrl + Click
	Select all the faces between two rows: Shift + Click
	Deselect all the faces: Click on the empty ares of the table

Select faces (interactively):

	Move the curso to a face in 3D-view of Display
	Click once to make sure the window is active
	Slect only this face: Press key "S"
	Select multiple faces: Press key "S" + Shift
	Deselect the face: Press key "D"
	Deselect all faces: move the cursor outside of the surface, press "S"s

**Combining and Deleting Faces:**

	Select faces
	To combine them to one face: Face Ops -> button "Combine"
	To delete them: Face Opts -> button "Delete"
	To delete them(interactively): Make sure the cursor is in the Dislay Window; press key "Delete"

**Filling Holes with Ids:**

After deleting some faces of the model, it may be desirable to keep the current names of the other surfaces in the model. In this case, click the button "Fill Holes w. IDs" and this will fill in the holes of the model. For each new surface created, a new name be assigned. Please rename it and assign a corret type for it.

**Remeshing Faces:**

If you would like to improve the quality of the faces on your mesh prior to meshing, you can remesh them.
	
	Select faces
	Go to Face Ops -> Remesh
	Click the button "Estimate Size" or assign a proper value for Remesh Size
	Click the button "Remesh"

This will take a while, as it must preserve the boundaries between surfaces, so be patient. 

<figure>
  <img class="svImg svImgMd"  src="documentation/modeling/imgs/polydata/faceremesh.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Extracting Faces:**

Sometimes, you may want to re-extract faces.
	
	Go to Face Ops -> Extract
	Set "Sep. Angle" to 50
	Click the button "Extract Faces"

A list of the model faces found will appear in the table. If the number of faces listed does not match the number of faces expected, you must tune the the "Sep. Angle" to get the desired number. The key here is to make sure that the caps of your vessels are isolated from the other surfaces of your vessel. Once this is done, you need to assign names and type for the new faces. 






