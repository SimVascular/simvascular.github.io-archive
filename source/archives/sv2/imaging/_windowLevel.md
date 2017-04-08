##  Changing the Window Level ##

Window leveling determines the mapping between your imaging data and the colors that are displayed.  Specifically, the “window” value actually defines the center of the color range, while the level defines the width of the “band” around the center.  For example, the default color map of “[0 255]” corresponds to values of window = 127.5 and level = 255 as seen in the following color lookup table:

<table class="table table-bordered">
<tr>
  <th>Scalar value</th>
  <th>Color</th>
</tr>
<tr>
  <td>0    (window – 0.5*level)</td>
  <td>Black  (0)</td>
</tr>
<tr>
  <td>127.5  (window)</td>
  <td>Gray  (0.5)</td>
</tr>
<tr>
  <td>255  (window + 0.5*level)</td>
  <td>White  (1)</td>
</tr>
</table>

Graphically, this is what window leveling does:

<figure>
  <img class="svImg svImgLg"  src="documentation/imaging/imgs/window_level/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To see what effect the window leveling has on the data displayed, first turn off all of the visualization techniques from the previous exercises before continuing. Position the P/A scale to position 30.  Display (i.e. click the checkbox) the “P/A” image plane. Click on the radio button to switch the color map from “[0 255]” to “native [0.0 334.0] under “Select color map”. You should see an image similar to that below in your 3D display window.
  
<figure>
  <img class="svImg svImgXl"  src="documentation/imaging/imgs/window_level/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The reason you don’t see much for the native range is because we are doing a simple linear mapping from black to white as seen in the following color lookup table:


<table class="table table-bordered">
<tr>
  <th>Intensity value</th>
  <th>Color</th>
</tr>
<tr>
  <td>0</td>
  <td>Black  (0)</td>
</tr>
<tr>
  <td>334.0</td>
  <td>White  (1)</td>
</tr>
</table>

The useful range of the imaging data is much smaller than the total range (0 to 334) that is available.

Now we are going to try a non-linear color mapping function.  Move the cursor (i.e. arrow pointer) into the 3D display window. By holding down the up-and-down arrow keys, you change the maximum displayed value (all values equal to or greater than this value are displayed as white).  By pressing the left or right arrow keys you change the minimum displayed value (all values equal or below this value are shown as black).  Can you get an image similar to that shown below?

<figure>
  <img class="svImg svImgXl"  src="documentation/imaging/imgs/window_level/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Set the color map radio button back to “[0 255]”.

 
