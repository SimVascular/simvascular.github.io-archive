### Smoothing a Path

If you made your path by moving around the grey handles, then the path will automatically be smoothed and you can skip this exercise. However, if you made your path by hand-selecting each point and then did not adjust the grey handles, or if your resultant path appears jagged, you may want to smooth your path.  **SimVascular** provides several parameters for smoothing the path.

Start by re-setting your display options under the “Manual” tab by turning OFF (“un-checking”) “Show Points” and “Show Spline” in the “Display Options” drop-down menu and selecting the “none” radiobutton in the “Interactor” widget. Your 3D display window should now be cleared.

Under the “Path” tab, click on the “Smooth” tab.  

Under “Smoothing Options”, set the following parameters:

&nbsp;&nbsp;&nbsp;&nbsp;Subsample every 1 point<br>
&nbsp;&nbsp;&nbsp;&nbsp;Create/Replace Path ID: 101<br>
&nbsp;&nbsp;&nbsp;&nbsp;Keep Point if Threshold fails (select)<br>
&nbsp;&nbsp;&nbsp;&nbsp;Use Fourier Smoothing (select)<br>
&nbsp;&nbsp;&nbsp;&nbsp;Number of Modes: 15 

Now click on the “Smooth Current Path” button. Go back to the “Manual” tab and select “Show Spline” in the “Display Options” drop-down menu. 

<font color="red">**HELPFUL HINT:** </font> If you do not see a spline when you click on path “101” in the treeview window after selecting “Show Spline” that means that a spline was not created for the smoothed path (This is a bug in the software). To create a spline for your smoothed path first select path “101” in the review window. Under the “Manual” tab, across from “Interactor”, change “num handles to “20” by typing in “20” in the entry widget. Next to “Interactor:” click on the “spline” radio button. A yellow path with a couple transparent bubbles on it called “handles” will appear in the 3D window. You can generally move the handles but for now we will leave them as is and click the “Update Path” button next to the “handles” entry widget. Now check the “none” radio button next to “Interactor;” NOW if you select “Show Spline,” you should see a spline for path “101.”

You should see a much smoother path that better represents the medial axis of the vessel. Furthermore, you will notice that this smoothed path is saved under a new ID number in your path treeview display window. You should now see “aorta   (ID: 101) (Number of Spline Pts: 300)”.  Note that smoothing occurs on the current working path.  (See the section on “Use Fourier Smoothing” below for an example of how to select the current working path.)  Depending on how many points you had in your original path, you may find that the smoothing may make the new path deviate from the vessel! This is why smoothing should be used with caution.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/smoothing_path/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Let’s examine these parameters more closely.

“Subsample every ____ points”: This parameter specifies which points will be used in the smoothing.  If you enter “5,” then only every 5th point will be used.

“Create/Replace Path ID”: The resulting smoothed path will be saved under this ID number (integers only).  If you specify a path ID that has already been used, then that original path will be overwritten so BE CAREFUL!  In this example, our original path had a path ID of 100 and the smoothed path was written to a path ID of 101.

“Use Fourier Smoothing”: Fourier smoothing generates a path using only a subset of the modes that describe your original path.  High modes correspond to very sharp changes in your path, while low modes describe the smoother parts of your path.  If you turn on the Fourier smoothing, you need to specify the “Number of Modes” to keep.  The fewer modes your path has, the smoother it will be.

Try this exercise.  Go back to the “Smooth” tab under the “Paths” tab. If path “aorta (ID:100)” is not already selected, choose it by clicking on it in the path treeview display window. Type in the following options:

&nbsp;&nbsp;&nbsp;&nbsp;Subsample every 2 points<br>
&nbsp;&nbsp;&nbsp;&nbsp;Create/Replace Path ID: 102<br>
&nbsp;&nbsp;&nbsp;&nbsp;Keep Point if Threshold fails (select)<br>
&nbsp;&nbsp;&nbsp;&nbsp;Use Fourier Smoothing (select)<br>
&nbsp;&nbsp;&nbsp;&nbsp;Number of Modes: 5 

Click on “Smooth Current Path”. You may need to go back to the “Manual” tab and toggle “Show Spline” under the “Display Options” drop-down menu off and on before you see your new path (ID: 102). What happened when you changed the number of Fourier modes to 5? You should see a very smooth line with few to no kinks. Does this ultra-smooth path still fit inside the boundaries of the vessel?

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/smoothing_path/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font>   Smoothing occurs on whatever path is selected as the current working path.  Make sure you’ve selected the right Path ID for your current working path!
