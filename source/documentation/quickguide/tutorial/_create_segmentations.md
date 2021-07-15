<h2 id="tutorial_create_segmentations"> Create Segmentations </h2>

Segmentation involves identifying vessel lumen boundaries from imaging data using various image processing
methods. These boundaries are represented by closed curves and form the basis for solid model construction.

Paths created by <i>Paths Tools</i> are used to extract a series of 2D image slices from the image volume.
Segmentation is then performed on each slice to extract a lumen boundary. 

In SimVascular, a series of segmentations along a <i>Path</i> is called a <i>Contour Group</i>.

<h3 id="tutorial_create_segs_1"> Create an instance of a <i>Segmentations Tool</i> for the aorta/right iliac </h3>

Create an instance of a <i>Segmentations Tool</i> named <b>aorta</b> used to define a <i>Contour Group</i> 
for the main aorta and right iliac vessels. 

<table class="table table-bordered" style="width:100%">
  <caption> Create a <i>Segmentations Tool</i> instance named <b>aorta</b> </caption>
  <tr>
    <th> GUI </th>
    <th> Descriptiton </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-seg-1.png" width="512" height="360"> </td>
    <td> Select the <i>Segmentations</i> <i>Tool</i> in the <i>Data Manager</i> with the right mouse button. <br><br>
         Select the <b>Create Contour Group</b> menu option.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-seg-2.png" width="512" height="360"> <br><br>
    </td>
    <td> A <b>Create Contour Group</b> <i>DiaglogBox</i> appears. <br><br>
         Select <b>aorta</b> for the <i>Path</i> name from the <b>Select Path:</b> <i>ComboBox</i> <br><br>
         Enter <b>aorta</b> for the <i>Contour Group</i> name in the <b>Group Name:</b> <i>TextBox</i> <br><br>
         Press the <b>Create Contour Group</b> <i>DiaglogBox</i> <b>OK</b> <i>Button</i>. <br><br>
    </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/tutorial/images/create-seg-3.png" width="512" height="360">
    </td>
    <td> A <i>Data Node</i> named <b>aorta</b> (an instance of a <i>Segmentations Tool</i>) is created under the
         <i>Data Manager</i> <i>Segmentations Tool</i> type.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-seg-4.png" width="512" height="360"> </td>
    <td> Close the <i>SV Path Planning Panel</i> by selected the <b>X</b> in its <i>Tab</i>. <br><br>
         Double-click on the <i>Data Manager</i> <b>Segmentations / aorta</b> <i>Data Node</i> with the left mouse 
         button to bring up the <i>SV 2D Segmentation Panel</i>. The <i>Display</i> layout is changed to 2D views on the left 
         and one 3D view on the right. <br><br>

         The 3D view displays geometry from any <i>Tool</i> that is selected to be visible using the 
         <img src="documentation/quickguide/tutorial/images/visible-toggle-box.png" width="20" height="18"> control. 
         The <b>aorta</b> and <b>left-iliac</b> paths are shown as yellow lines with blue markers. 

         The red rectangular region 
         <img src="documentation/quickguide/tutorial/images/create-seg-5.png" width="32" height="21"> 
         in the 3D view displays the 2D image slice extracted from the image volume. The slice is positioned and oriented 
         using <b>aorta</b> <i>Path</i> geometry. The slice is moved along a <i>Path</i> using the <b>Reslice</b> <i>Slider</i>.
         <br> <br>

         The upper left 2D view displays the 2D image slice; the lower the gradient of the 2D image slice used to visualize image edges.
         Image points and pixel values used for segmentation are interactively selected from the 2D views using the left mouse button.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-seg-4.png" width="512" height="360"> </td>
    <td> 
        Some important GUI controls: <br><br>
        <ul style="list-style-type:none;">
           <li> <img src="documentation/quickguide/tutorial/images/seg-gui-loft.png" width="90" height="21"> - Show the surface that
             passes through the segmentation geometry. </li> <br>
           <li> <img src="documentation/quickguide/tutorial/images/seg-gui-reslice.png" width="230" height="24"> - Move the slice 
             plane along a <i>Path</i>. </li><br>
           <li> <img src="documentation/quickguide/tutorial/images/seg-gui-size.png" width="52" height="25"> - Set the size of the 
             slice plane. 
        </ul>

        Segmentation methods: <br><br>
        <ul style="list-style-type:none;">
          <li> <img src="documentation/quickguide/tutorial/images/seg-gui-levelset.png" width="103" height="27"> &nbsp 
               <img src="documentation/quickguide/tutorial/images/seg-gui-threshold.png" width="103" height="27"> &nbsp 
               <img src="documentation/quickguide/tutorial/images/seg-gui-circle.png" width="103" height="27"> </li><br>
          <li> <img src="documentation/quickguide/tutorial/images/seg-gui-ellipse.png" width="103" height="27"> &nbsp 
               <img src="documentation/quickguide/tutorial/images/seg-gui-spline.png" width="103" height="27"> &nbsp 
               <img src="documentation/quickguide/tutorial/images/seg-gui-polygon.png" width="103" height="27"> &nbsp 
          </li>
        </ul>
    </td>
  </tr>

</table>

<br>
<br>
<br>
<br>
<br>




