<br>
<h2 id="image_windowing"> Image Windowing </h2>

The <i>Image Windowing</i> tool is used to adjust image brightness and contrast using a technique called <i>Windowing</i>, 
also known as gray-level mapping, contrast stretching, histogram modification or contrast enhancement.
<i>Windowing</i> manipulates the image greyscale component using image values to change the appearance of the 
image to highlight particular structures. The image brightness is adjusted by changing the <i>window center</i>. 
The image contrast is adjusted by changing the <i>window width</i>. 

A blue region in the <i>Image Windowing</i> tool shows then <i>window center</i> and <i>window width</i>.

<figure>
  <img class="svImg svImgXs"  src="documentation/quickguide/gui/images/image-window-level-tool.png" style="width:2%">
  <figcaption class="svCaption"> The <b>Image Windowing</b> tool. The <b>window width</b> and <b>window center</b> is 
      represented using a blue region within the tool. The two text boxes at the bottom of the tool show the 
      <b>window center</b> (upper box) and the <b>window width</b> (lower box).
  </figcaption>
</figure>

The <i>window center</i> is changed by selecting the center of the <i>Image Windowing</i> tool blue region with the 
left mouse button and moving up or down. 

The <i>window width</i> is changed uniformly about the <i>window center</i> by selecting either end of the 
<i>Image Windowing</i> tool blue region with the left mouse button and moving up or down. 

The <i>window width</i> is changed non-uniformly about the <i>window center</i> by selecting either end of the 
<i>Image Windowing</i> tool blue region with using shift-left mouse button and moving up or down. 

<table class="table table-bordered" style="width:100%">
  <caption> <b> Adjusting image brightness and contrast </b> </caption>
  <tr>
    <th> Operation </th>
    <th> Result </th>
  </tr>

  <tr>
    <td> No operation, original image brightness and contrast </td>
    <td> <img src="documentation/quickguide/gui/images/image-window-level-demo-1.png" width="612" height="410"> </td>
  </tr>

  <tr>
    <td> Move the <i>window center</i> up by placing the mouse cursor in the center of the <i>Image Windowing</i> tool 
         blue region holding the left mouse button down while moving the mouse cursor up </td>
    <td> <img src="documentation/quickguide/gui/images/image-window-level-demo-2.png" width="612" height="410"> </td>
  </tr>

  <tr>
    <td> Move the <i>window center</i> down by placing the mouse cursor in the center of the <i>Image Windowing</i> tool
         blue region holding the left mouse button down while moving the mouse cursor down 
    </td>
    <td> <img src="documentation/quickguide/gui/images/image-window-level-demo-3.png" width="612" height="410"> </td>
  </tr>

  <tr>
    <td> Reduce the <i>window width</i> uniformly around the <i>window center</i> by placing the mouse cursor in the upper 
         boundary of the <i>Image Windowing</i> tool blue region holding and mouse button down while moving the mouse cursor down 
    </td>
    <td> <img src="documentation/quickguide/gui/images/image-window-level-demo-4.png" width="612" height="410"> </td>
  </tr>

  <tr>
    <td> Reduce the <i>window width</i> non-informally around the <i>window center</i> by placing the mouse cursor in the upper 
         boundary of the <i>Image Windowing</i> tool blue region holding and pressing shift-left mouse button down while 
         moving the mouse cursor down 
    </td>
    <td> <img src="documentation/quickguide/gui/images/image-window-level-demo-5.png" width="612" height="410"> </td>
  </tr>

</table>
<br>


Selecting the <i>Image Window Level</i> tool with the right mouse button pops up the following menu 

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/gui/images/image-window-level-menu-1.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<table class="table table-bordered" style="width:100%">
  <caption> <b> Image Window Level Tool Menu </b> </caption>
  <tr>
    <th> Menu Option </th>
    <th> Description </th>
  </tr>

  <tr>
    <td> Hide Scale </td>
    <td> Hide the <i>Image Windowing</i> tool scale  </td>
  </tr>

  <tr>
    <td> Set Slider Fixed  </td>
    <td> Disables modifying the <i>window width</i> and <i>window center</i>. </td>
  </tr>
  
  <tr>
    <td> Use whole image grey values  </td>
    <td> Set the <i>Image Windowing</i> tool use the entire range of image values. </td>
  </tr>

  <tr>
    <td> Use optimized levelwindow </td>
    <td> Set the <i>Image Windowing</i> tool to use a range of image values that optimizes contrast and brightness. </td>
  </tr>
  
  <tr>
    <td> Set Maximum Window </td>
    <td> N/A </td>
  </tr>
  
  <tr>
    <td> Default Level/Window </td>
    <td> N/A </td>
  </tr>
  
  <tr>
    <td>     Change Scale Range   </td>
    <td> Displays a popup window used to manually change the upper and lower  <i>window width</i> bounds. </td>
  </tr>
  
  <tr>
    <td>     Default Scale Range  </td>
    <td> Resets the upper and lower <i>window width</i> bounds to their default values. </td>
  </tr>
  
  <tr>
    <td>     Presets      </td>
    <td> Displays a menu of preset upper and lower <i>window width</i> bounds for various tissues acquired using CT. </td>
  </tr>

  <tr>
    <td>     Images      </td>
    <td> N/A </td>
  </tr>
</table>




