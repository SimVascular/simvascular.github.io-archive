### Global/Local Operations ###

Besides face operations, SimVascular provides more options to modify and improve solid model, such as global and local operations. **The main diference between them is that global operations apply to the whole model surface while local operations only apply to the selected faces, regions, or cells.**

**Local Selection/Deleting**

Before apply local operations, make sure you only select the faces, regions, cells, or a combination of them that you want. For face selection, refer to [Section: Face Operations](#modelingPolyDataFaces).

To select a region (using a sphere interactively)
	
	Local Ops -> toggle on the checkbox "Show Sphere"
	An sphere shows in the 3D view window of Display
	Move the cursor to the sphere
	Left press and move to change the location of the sphere
	Right press and move to change the size of the sphere
	Make sure the surface region that you want to apply local operation to is inside the sphere.
	After local operations, remember to toggle off "Show Sphere" if you don't need it any more.
	
<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/polydata/localsphere.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>


To select/delete cells on the surface (interactively)

	Move the cursor to the model surface in in the 3D-view window
	Click once to make sure the window is active	
	Select a single cell: press key "C"
	Select multiple cells: press key "C" + Shift
	Select a cell and its neighboring cells: press key "B" (often used)
	Deselect a cell: press key "E"
	Deselect a cell and its neighboring cells: press key "E" + Shift
	Deselect all cells: move the cursor outside of the surface, press key "C"
	Delete selected cells: press key "Delete"
	
<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/polydata/cellselection.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>
	
**Various Operations** 

        Fill Holes w/o IDs (global): 
                Fill all holes for the model without extracting faces. Only a full model surface is obtained.

        Sel Lg Connected (global): 
                Select largest connected surface area on the model and combine them to onw full model surface, remove the rest area.

        Remesh (global): 
                Click the button "Estimate Size" or provide a proper value for "Target edge size"
                Click the button "Remesh"

        Decimation (global/local):
                Based on target rate, removes certain triangles of the mesh while decreasing
                error to give less triangles on the surface

        Butterfly Subdivision(BF Subdiv.)(global):
                Divides the meshing triangles based on number placed in “Num Divisions”
                For example, to divide each triangle in half: Num Divisions = 1
                This creates a finer mesh made up of smaller triangles

        Laplacian Smooth(Lap. Smooth) (global/local):
                smooths the bumps and ridges of the model
                Relax Factor: choose between .01 and .05
                
        WindowSync Smooth(WS Smooth) (global):
                Smooths more than Laplacian smooth
                still smooths caps of arteries

        Densify (global):
                divides triangles based on “Num Divisions”

        Constrain Smooth (local):
                Uses an alteration of laplacian smoothing. New surface becomes a minimization
                between the original surface and the laplacian smoothed surface
                Num Iters: choose between 3 and 10
                Constrain Factor: choose between 0 and 1, deciding how much the smoothed surfac
                should be pushed back to the original
		
        Linear Subdivision (local):
                Divides the meshing triangles based on number placed in “Num Divisions”
                For example, to divide each triangle into four triangles: Num Divisions = 1
                This creates a finer mesh made up of smaller triangles

        Loop Subdivision (local):
                Divides the meshing triangles based on number placed in “Num Divisions”
                For example, to divide each triangle into four triangles: Num Divisions = 1
                This creates a finer mesh made up of smaller triangles

**Trimming a PolyData Model:**

To trim a model, that is to cut a piece of it off that you don’t want:

Cut by Plane:

	Go to Trim -> By Plane
	Toggle on the check box "Show Plane"
	A plane shows in the 3D-view window
	You can directly manipulate it by mouse.
	Or you can select a path and move the slider
	The plane will go to the specified path point position and be perpendicular to the path.
	Click the button "Cut Above" or "Cut Below" to remove the unwanted part.

<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/polydata/cutplane.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Cut by Box is similar to by Plane. The only difference is that it only cuts the part included in the box.


**When you are satisfied with the level of blending you have chosen for your model, click on the tool button  “Save SV Project ” to save this model.**

