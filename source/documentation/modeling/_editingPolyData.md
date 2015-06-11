### Editing a PolyData Model ###

In order to select and delete cells, make sure the model is being visualized as a full surface. This will insure that the cells are deleted from the actual model. 

**Deleting Cells:**

If there is a unwanted bump or rough part of the model, specific cells can be selected and deleted and the hole created filled to create a smoother model. 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/editing/selectingCells.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

        Navigate to “Model → PolyData” → “Delete Cells”
        Press “e” while hovering over the model in the view window to view the edges of the triangulated surface
        Select cells to be deleted by hovering over them and pressing “c”. 
        Pressing “C” (Shift - c) will select multiple cells at the same time
        “Delete Selected Cells” will delete these cells, making a hole in the model.
        “Fill Holes” will fill in this hole with a triangulated mesh surface.
        The goal is to create a new surface that is smoother than the section just deleted.

**Smoothing a PolyData Model (Global):**

Navigate to "Model → PolyData → Global Ops"

Selecting any of the following surface operators will edit the entire surface of the model

Surface Operators summary:

        Smooth Poly Data Model: 
                smooths the bumps and ridges of the model
                Laplacian Smooth -> Relax Factor -> Choose between .01 and .05 


        Butterfly Subdivision:
                Divides the meshing triangles based on number placed in “Num Divisions”
                For example, to divide each triangle in half: Num Divisions = 1
                This creates a finer mesh made up of smaller triangles


        Decimate Surface:
                Based on target rate, removes certain triangles of the mesh while decreasing
		error to give less triangles on the surface
                

        WindowSync Smooth:
                Smooths more than Laplacian smooth
                still smooths caps of arteries

        Densify:
                divides triangles based on “Num Divisions”
                        

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/editing/globalSmoothing.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>    
   
**Smoothing a PolyData Model (Local):**

There are specialized operations to perform function only on specific portions of the model.

Navigate to "Model → PolyData → Local Ops". There are four ways to select regions of the model for localized operations. 

	1. Face Selection - Highlight faces in the list, and then click "Add Faces" to add the faces to the  "Local Parameters" window will be operated on. Only these faces will be operated on now when performing local operations.
	2. Blend - When faces are highlighted and then added to the "Local Parameters" window, a special region will be selected for operation. The boundary between the two faces will be found and the radius value corresponds to the size of a sphere to be selected from this boundary region to perform localized operations. 
	2. Sphere Region - With a model highlighted, select "Show Sphere Interactor". Move the sphere around and set a radius for the sphere. When the desired location is selected, click "Add Sphere Region". This will add a line to the "Local Parameters" window. 
	2. Cell Selection - First, a model must be displayed as a Full Model. Then, it is possible to select a cell with "c", or multiple with "C". After selecting cells, click "Add Cells" to add these cells to the "Local Parameters" window. 

Highlight the walls of the surface and click "Add Faces" under the "Face Selection" Tab. 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/editing/selectingLocalRegions.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>    

This will add the following line to the Local Parameters window:
	
	faces 1 2 ModelFaceID ActiveCells 1

These have the following meaning:
	
	* faces - Use faces as local region selection
	* 1 2 - These are the ids of the faces the use for region selection
	* ModelFaceID (Do not change!) - This is the array to look for on the polydata for the face ids
	* ActiveCells (Do not change!) - This is the arrayname to give for region selection
	* 1 (Do not change!) - This designates that the output region selection array will be a cell data array

Now, when an operation is clicked (i.e Decimate, Laplacian Smooth), the information in the Local Parameters window is used to set the local regions. If you no longer want to use a region selection, the line should be deleted from this window!
Local Surface Operators summary:

        Decimate Surface:
                Based on target rate, removes certain triangles of the mesh while decreasing
		error to give less triangles on the surface

        Laplacian Smooth:
                smooths the bumps and ridges of the model
                Laplacian Smooth -> Relax Factor -> Choose between .01 and .05 

	Constrain Smooth:
		Uses an alteration of laplacian smoothing. New surface becomes a 
		minimization between the original surface and the laplacian smoothed
		surface
		Num Iters - Choose between 3 and 10
		Constrain Factor - How much the smoothed surface should be 
		pushed back to the original - Choose between 0 and 1.

       Linear Suvdivision
                Divides the meshing triangles based on number placed in “Num Divisions”
                For example, to divide each triangle into four triangles: Num Divisions = 1
                This creates a finer mesh made up of smaller triangles

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/editing/localSmoothing.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>    

**Trimming a PolyData Model:**

To trim a model, that is to cut a piece of it off that you don’t want:
        Navigate to Model -> PolyData -> Trim

Cut Surface:
        
	Highlight the model you would like to trim in the box window.

        Cut with plane -> check on “Show Plane Interactor”
        move the interactor to the desired position and click “Cut Above” or “Cut Below” 
                This will cut either above or below the entire plane depending on its orientation shown by the arrows 

        Cut with box -> check on “Show Box Interactor”
                expand the box in any direction by clicking and dragging the grey spheres that appear
                rotate the box by clicking on a face of the box and dragging
                “Cut With Box” -> cuts all of the model contained inside the box

        Save model: File Input/Output -> click “Save Model”
                name “demo_trimmed.vtp”, make sure it is in the right directory, click save
<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/editing/polydataTrim.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>    

<br>
<br>
<br>
