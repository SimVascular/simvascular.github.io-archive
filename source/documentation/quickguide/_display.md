## Display

Display is a multi-window tool to show data in 2D/3D views, normally located on the right side of the main window. There are three 2D views and one 3D view. Typically imaging data is a set of scalar values (e.g. integers ranging from 0 to 4096) defined on a structured 3D grid. Note that this data may be acquired in 2D slices and resampled in some fashion. The most common use for (diagnostic) medical imaging data is for visualization. For example, a vascular surgeon may acquire image data on a patient suspected of having vascular disease. Traditionally, most surgeons and radiologists look at sets of 2D slices of image data acquired in a 3D volume. This requires the person to create a mental image of the patient’s 3D anatomy.

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/imgs/display.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The demo data we are using are magnetic resonance images of the aorta and the iliac bifurcation.

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/imgs/sampleimage.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Place your mouse within the 2D View windows in Display. You should find that:

	Left Mouse Button: moves the crosshairs.
	Right Mouse Button: zooms the 2D view
	Center Mouse Button (scrolling): navigates to a certain image slice

Place your mouse within the 3D View window in Display. You should find that the:

	Left Mouse Button: rotates the 3D volume
	Right Mouse Button: zooms the 3D volume
	Center Mouse Button (or ‘shift’ + left mouse button): translates the 3D volume

When you move the cursor to a window, a icon menu shows up. The menu for the first icon is shown as below. From this  menu, you can show/hide crosshair, or enable/disable crosshair rotation (change image slice orientation).

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/displaymenu1.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The second icon is to switch between single-window layout and multi-window layout. The menu for the first icon is shown as below, providing various options to change the layout.

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/displaymenu2.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

### Window Level

The right widget in Display is for “window leveling”, which is a very common technique in viewing image data. Window leveling basically creates a non-linear color mapping function to help distinguish features in the image data. Specifically, the “window” value actually defines the center of the color range, while the level defines the width of the “band” around the center.  For example, the default color map of “[1 166]” corresponds to values of window = 83 and level = 164 as seen in the following color lookup table:

<table class="table table-bordered">
<tr>
  <th>Scalar value</th>
  <th>Color</th>
</tr>
<tr>
  <td>1    (window – 0.5*level)</td>
  <td>Black  (0)</td>
</tr>
<tr>
  <td>83  (window)</td>
  <td>Gray  (0.5)</td>
</tr>
<tr>
  <td>165  (window + 0.5*level)</td>
  <td>White  (1)</td>
</tr>
</table>

Graphically, this is what window leveling does:

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/imgs/windowlevel.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

By changing thw window and level values, you can change the brightness and contrast of the image.

	Change window value: move the vertical slider or modify the value in the first text field
	Change level value: change the length of the slider or modify the value in the second text field

To access more options for window level:

	Right click at the window level widege, a menu pops up.

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/windowlevelmenu.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

