### Creating and Naming PolyData Model Faces ###

Under PolyData navigate to the “Boundaries” tab. Load the PolyData solid, “demo.vtp” with the menu on the upper right. 
Under “Boundary Extraction” set the angle of separation to around 50 degrees and click “Extract Boundaries”.
A list of the model faces found will appear in the window to the left.

If the number of faces listed in the functional toolbox exceeds the number of actual faces on your model, toggle the “Boundary Extraction” angle to a higher number, extracting boundaries until the number listed is the number of faces you want. If the number of faces listed becomes lower than the number of faces on your model, toggle the angle to a lower value. Through trial and error, try to achieve the number of desired faces for your model with the right extraction angle.

To select and name the faces, navigate to the “Model” tab in the functional toolbox. Hover over the outflow face of the right iliac on the model and press “p” to pick the face and highlight it yellow. The Face ID that corresponds to this face will be highlighted in blue on the left side of the functional toolbox. Change the surface name to “outflow_right_iliac” and click “Set Value”.

Go To “Model” Tab to rename the faces of inflow and outflow
	Pick the inflow face by hovering over it with the mouse and pressing “p” on the keyboard
	Go to “surf name” box and type in “inflow aorta”
	Do the same with the two outflow faces of the iliac arteries
	“pick” the face of the model (pick anywhere on model) and name this face “wall_model”

Repeat this with the rest of the faces renaming each “outflow_left_iliac”, “inflow” for the inlet face of the aorta, and “all_wall” for the outer surface covering the entire model.

If there are excess faces other than the ones named, and toggling the boundary extraction angle did not yield your desired results, attempt to highlight each to find the face it should be a part of. To further identify faces, select the Face ID, click “Change Color” and select a color. The face should change to the selected color in the viewing window. 	
Go Back to PolyData Tab
	Choose “Select and Combine Faces”
	Move “all_wall” and the rest of the unnamed faces to the right side of the pop up box
		this can be done quickly by shift+down arrow to highlight many faces to move over
	Click “Save” under Load Poly Data to save model
		can rename “model2_named” if want to keep old vtp model
	Now we only have boundaries where we want them (total of 4)

If necessary you can delete unwanted faces:
	Select and Delete Faces —> click the button, move the faces you want to delete to the right of the popup window and press ok
