### Smoothing a Path

If your resultant path appears jagged, you may want to smooth your path.  **SimVascular** provides several parameters for smoothing the path.

	Click the button "Smooth"
	Subsample: 1
	Based on: Control Points
	Fourier Mode Number: 15
	Click the button "OK

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/path_planning/pathsmoothdialog.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

You should see a much smoother path. "Subsample: 1" means Subsample every 1 point. Depending on how many points you had in your original path, you may find that the smoothing may make the path deviate from the vessel! This is why smoothing should be used with caution.

<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/path_planning/pathsmooth1.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Let’s examine these parameters more closely.

"Subsample": This parameter specifies which points will be used in the smoothing.  If you enter “5,” then only every 5th point will be used.

"Based on": Choose to use control points or path points to smooth the path

“Fourier Mode Number”: Fourier smoothing generates a path using only a subset of the modes that describe your original path.  High modes correspond to very sharp changes in your path, while low modes describe the smoother parts of your path. The fewer modes your path has, the smoother it will be.

Try this exercise useing the following options:

	Subsample: 2
	Based on: Control Points
	Fourier Mode Number: 5

You should see a very smooth line with few to no kinks. Does this ultra-smooth path still fit inside the boundaries of the vessel?

<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/path_planning/pathsmooth2.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>


<font color="red">**Save the path:** </font> When the data in the project change, remember to save the project by:

	Click "Save SV Projects" on the tool bar

The path will be saved to a file inside the project folder.
