### Creating and Naming PolyData Model Faces ###

**Extracting Faces:**

Under PolyData navigate to the “Face Selection” tab. Load the PolyData solid, “demo.vtp” with the menu on the upper right. Under “Boundary Extraction” set the angle of separation to around 50 degrees and click “Extract Boundaries".

A list of the model faces found will appear in the window to the left.

If the number of faces listed in the functional toolbox exceeds the number of actual faces on your model, toggle the “Boundary Extraction” angle to a higher number, extracting boundaries until the number listed is the number of faces on your model, toggle the angle to a lower value. Through trial and error, try to achieve the number of desired faces for your model with the right extraction angle.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/faces/Selection.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Naming Faces:**

To select and name the faces, navigate to the “Model” tab in the functional toolbox. Hover over the outflow face of the right iliac on the model and press “p” to pick the face and highlight it yellow. The Face ID that corresponds to this face will be highlighted in blue on the left side of the functional toolbox. Change the surface name to “outflow_right_iliac” and click “Set Value”.


Go To “Model” Tab to rename the faces of inflow and outflow

        1. Pick the inflow face by hovering over it with the mouse and pressing “p” on the keyboard
        2. Go to “surf name” box and type in “inflow_aorta”
        3. Do the same with the outflow faces of the left iliac artery naming “outflow_left_iliac”
        4. “pick” the face of the model (pick anywhere on model) and name this face “all_wall”

Naming the wall of the model:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/faces/Naming.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Combining and Deleting Faces:**

If there are excess faces other than the ones named, and toggling the boundary extraction angle did not yield your desired results, attempt to highlight each to find the face it should be a part of. To further identify faces, select the Face ID, click “Change Color” and select a color. The face should change to the selected color in the viewing window.      

Go Back to PolyData Tab
        
        1. Choose “Select and Combine Faces”
        2. Move “all_wall” and the rest of the unnamed faces to the right side of the pop up box
                This can be done quickly by shift+down arrow to highlight many faces to move over
        3. Click “Save” under Load Poly Data to save model
                You can rename this “demo_named” if want to keep old vtp model
        4. Now we only have boundaries where we want them (total of 4)

If necessary you can delete unwanted faces:

        Select and Delete Faces —> click the button, move the faces you want to delete to the right of the popup window and press ok

In this case, we deleted the face 5/5 which did not respresent a known face on the model:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/faces/Deleting.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>
