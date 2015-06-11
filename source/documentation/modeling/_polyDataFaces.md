### Creating and Naming PolyData Model Faces ###

**Extracting Faces:**

Under "Model → PolyData" navigate to the “Face Manipulation” tab. 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/faces/prenamedFaces.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

However,if you would like to have one wall surface, under “Boundary Extraction” set the angle of separation to around 50 degrees and click "Extract Boundaries".

A list of the model faces found will appear in the window to the right.

If the number of faces listed does not match the number of faces expected, you must toggle the extraction angle to get the desired number. After extracting the faces, hover over a surface in the window and select "p". Alternatively, select the face from the model in the list. Either of these methods will highlight your face in the 3D window. The key here is to make sure that the caps of your vessels are isolated from the other surfaces of your vessel. Once this is done, follow the direction below to "Select and Combine Faces". 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/faces/Selection.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Naming Faces:**

In order to rename a face, find the box called "surf name: " above the Object list.

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

If there are excess faces other than the ones named, and toggling the boundary extraction angle did not yield your desired results, attempt to highlight each to find the face it should be a part of. To further identify faces, select the Face ID, click “Color and Opacity → Change Selected Color” and select a color. The face should change to the selected color in the viewing window.      
        
        1. In the window highlight "all_wall" and any unamed faces. This can be easily done by holding "Shift" and clicking the first and last names or by holding "Ctrl" and clicking on the desired names.
        2. Choose “Select and Combine Faces”
	3. The 
        3. Click “Save Model” under "File Input/Output" to save model. You can rename this “demo_named” if want to keep the old vtp model
        4. Now we only have boundaries where we want them (total of 4)

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/faces/Combining.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

If necessary you can delete unwanted faces:

        Select and Delete Faces —> Highlight faces in the window and click the button.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/faces/Deleting.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Selecting and Remeshing Faces:**

If you would like to improve the quality of the surfaces on your mesh prior to meshing, this is possible in both the PolyData tab and the Meshing tab. In order to remesh the surface in the PolyData tab, you must select a mesh edge size that will give a reasonable surface mesh, highlight the faces you would like to remesh and then select "Select and Remesh Faces". This will take a while, as it must preserve the boundaries between surfaces, so be patient. 

**Filling Holes with Ids:**

After deleting some faces of the model, it may be desirable to keep the current names of the other surfaces in the model. In this case, select "Fill Holes with Ids" and this will fill in the holes of the model. For each new surface created, a new id number will be assigned. It is possible to name these surfaces to your liking following the instructions above for "Naming Faces".
