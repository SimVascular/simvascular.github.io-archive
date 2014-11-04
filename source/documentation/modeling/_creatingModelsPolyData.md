### Creating a PolyData Model from 2D Segmentations ###

This exercise will assume that you have completed [Section: Putting It All Together](#modelingPuttingTogether) and have created segmentations down the aorta and common iliac artery that you can now create a solid model with.

Make sure the paths and groups you intend to model have been loaded.

Navigate to the “PolyData —> Boolean” tab in the functional toolbox. Click “Select Ordered Groups” and a window should pop up containing your groups. Move the groups “aorta” and “right iliac” from the “available” to “selected” by clicking each to highlight them and pressing right arrow button in the window.

Using the default parameters, click the button “Boolean” under “Execute and Save”. A solid model created from the selected groups should appear in the Display Window. 

To save the model, click “Save” on the bottom left, select the correct directory and save the model as “demo.vtp” ensuring it is a “.vtp” file.

<font color="red">**HELPFUL HINT:** </font> Some Useful Keyboard Shortcuts:
W - view the model as a wire mesh
S - view the model as a solid
E - view the edges of the triangulated mesh on the solid model
P - “pick” or select the model, highlighting it yellow for a better visualization
C - “choose” and highlight a cell to be modified or deleted

**Viewing the created PolyData Model:**

Clear the Display Window by choosing “Clear Window” under the window tab.

Navigate to “Model” tab and by “Solid Model Type” select “PolyData”
Hit “Read Model” and select the model created with PolyData, in this case “demo.vtp”.
The Model should appear in the Display Window.
