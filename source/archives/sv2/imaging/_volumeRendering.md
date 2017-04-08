##Using Volume Rendering

Another technique for viewing imaging data is 3-D volume rendering. Be sure to turn off all of the visualization techniques from the previous exercises before continuing (no point clouds, no imaging slices).

In the Display Options pane (top right corner), click on the “Volume Rendering” tab.  You can manually set the transfer functions for volume rendering by clicking on the "Manually set transfer functions" checkbox. Three entry boxes (opacity fn, color fn, gradient fn) should then appear underneath “Manually set transfer functions”.

The opacity transfer function should be a list of points with each point enclosed in brackets, such as:

{0 0.0} {50 0.0} {128 0.25} {200 1.0} {255 1.0}

This corresponds to the following piecewise linear opacity lookup table:

<table class="table table-bordered">
<tr>
  <th>Scalar intensity value</th>
  <th>Opacity</th>
</tr>
<tr>
  <td>0</td>
  <td>0.0 (transparent)</td>
</tr>
<tr>
  <td>50</td>
  <td>0.0</td>
</tr>
<tr>
  <td>128</td>
  <td>0.25</td>
</tr>
<tr>
  <td>200</td>
  <td>1.0</td>
</tr>
<tr>
  <td>255</td>
  <td>1.0 (opaque)</td>
</tr>
</table>

The scalar intensity value is the same as the intensity values we previously used to set thresholds and look at point cloud data.

Check on "Turn on Volume Rendering."  Depending on your hardware and dataset, you may see the program run slower using this visualization technique. You should see something similar to the following image:

<figure>
  <img class="svImg svImgXl"  src="documentation/imaging/imgs/volume_rendering/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now we are going to try a different opacity and color transfer function.  In the “Volume Rendering” tab enter the following:

opacity function:	{0 0} {70 0} {100 0.4} {350 1.0}
color function:		{0 0 0 0} {80 0 1 0} {128 1 0 0} {5000 1 0 0}

and press RETURN inside the entry widget.  You should see an image like that below:

<figure>
  <img class="svImg svImgXl" src="documentation/imaging/imgs/volume_rendering/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

How did that work?  The color function corresponds to the following table, where each color component is specified as a value between 0 (turned off) to 1.0 (full intensity):

<table class="table table-bordered">
  <tr>
    <th rowspan="2">Scalar value</th>
    <th colspan="3">Color</th>
  </tr>
  <tr>
    <th>Red</th>
    <th>Green</th>
    <th>Blue</th>
  </tr>
  <tr>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
  </tr>
  <tr>
    <td>80</td>
    <td>0</td>
    <td>1</td>
    <td>0</td>
  </tr>
  <tr>
    <td>128</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
  </tr>
  <tr>
    <td>5000</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
  </tr>
</table>

Once you have finished this exercise, you should un-click the “Turn on Volume Rendering” checkbox to turn off volume rendering. Volume rendering techniques require a large amount of memory, and the program should run faster once this visualization option is turned off. 
