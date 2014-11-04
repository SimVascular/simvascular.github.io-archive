### Editing a PolyData Model ###

To load the model for editing navigate to “PolyData” —> “Smooth” —> Click “Load” next to “Input File” and select the file you want to modify, in this case “demo.vtp” and the path should appear in the box. 
Next, click “Save” next to output file and name it with a .vtp extension i.e.: demo_smooth.vtp the path should appear in the box. This is the file that the modified or “smoothed” model with be saved to.
Click Visualize Surface to show a triangle meshed model that can be modified using the Global Operators in the functional toolbox. Again, this can be viewed a variety of ways using the keyboard shortcuts.

If there is a unwanted bump or rough part of the model, specific cells can be selected and deleted and the hole created filled to create a smoother model.
	Navigate to “PolyData” —>  “Delete Cells”
	Press “E” while hovering over the model in the view window to view the edges of the triangulated surface
	Select cells to be deleted by hovering over them and pressing “C”. Pressing “ctrl + C” will select multiple cells at the same time
	“Delete Selected Cells” will delete these cells, making a hole in the model.
	“Fill Holes” will fill in this hole with a triangulated mesh surface that is hopefully smoother than the section just deleted.

**Smoothing a PolyData Model:**

Navigate to PolyData -> Smooth

Selecting any of the following surface operators will edit the entire surface of the model

<font color="red">**HELPFUL HINT:** </font> to undo the any of the following operations:
	Undo -> Undo last operation

Surface Operators summary:

	Smooth Poly Data Model: 
		smooths the bumps and ridges of the model
		Laplacian Smooth -> Relax Factor -> Choose between .01 and .05 


	Butterfly Subdivision:
		Divides the meshing triangles based on number placed in “Num Divisions”
		For example, to divide each triangle in half: Num Divisions = 1
		This creates a finer mesh made up of smaller triangles


	Decimate Surface:
		Based on target rate, makes the meshing triangles bigger
		

	WindowSync Smooth:
		Smooths more than Laplacian smooth
		still smooths caps of arteries

	Densify:
		divides triangles based on “Num Divisions”
			does same thing as Butterfly Subdivision?

**Trimming a PolyData Model:**

To trim a model, that is to cut a piece of it off that you don’t want:
	Trim -> Load the Model you wish to trim
	Click “Save” and name the model demo_trimmed.vtp
		the path of the model should show up in the box to the left

Visualization Options
	to see the model you are trimming: have “Initial Surface” checked on
	to see the trimmed model: check “Cut Surface” and deselect initial

Cut Surface:
	
	Cut with plane -> check on “Show Plane Interactor”
	move the interactor to the desired position and click “Cut Above” or “Cut Below” 
		This will cut either above or below the entire plane depending on its orientation shown by the arrows 

	Cut with box -> check on “Show Box Interactor”
		expand the box in any direction by clicking and dragging the grey spheres that appear
		rotate the box by clicking on a face of the box and dragging
		“Cut With Box” -> cuts all of the model contained inside the box

	Save model: File I/O -> click “save”
		name “demo_trimmed.vtp”, make sure it is in the right directory, click save
<br>
<br>
<br>


