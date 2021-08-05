<h2 id="tutorial_create_segmentations"> Create Segmentations </h2>

Segmentation involves identifying vessel lumen boundaries from imaging data using various image processing
methods. These boundaries are represented by closed curves and form the basis for solid model construction.

SimVascular supports several methods used to manually define lumen boundaries. These methods are useful
when image contrast is poor and lumen boundaries are not well defined by variations in image intensity.

<ul style="list-style-type:none;">
  <li> <b>Circle</b> - Interactively select a center and radius, or input radius, to define a circle. </li>
  <li> <b>Ellipse</b> - Interactively select a center and two axis, or axes radii, to define an ellipse. </li>
  <li> <b>Polygon</b> - Interactively select a set of points defining a polygon. </li>
  <li> <b>SplinePoly</b> - Interactively select a set of points defining an interpolating smooth curve (spline). </li>
</ul>

SimVascular supports several methods used to automatically extract lumen boundaries based on variations in image intensity
values.
<ul style="list-style-type:none;">
  <li> <b>Level Set</b> - Use image intensity and gradient to evolve a curve to the edge of a lumen boundary. </li>
  <li> <b>Threshold</b> - Use an image intensity value to define a boundary. </li>
</ul>

Paths created by <i>Paths Tools</i> are used to extract a series of 2D image slices from the image volume.
Segmentation is then performed on each slice to extract a lumen boundary. Image points and intensity values used 
for segmentation are interactively selected from a 2D image using the <b>left mouse button</b>.

In SimVascular, a series of segmentations along a <i>Path</i> is called a <i>Contour Group</i>.

The following sections demonstrate how to create segmentations using the <b>aorta</b> and <b>left-iliac</b> <i>Paths</i>.
A detailed discussion about segmentation can be found in the SimVascular
<a href="http://simvascular.github.io/docsModelGuide.html#modelingSegmentation.html">Modeling Guide / Segmentation</a> documentation.

<h3 id="tutorial_create_segs_1"> Create an instance of a <i>Segmentations Tool</i> for the aorta/right iliac </h3>

Create an instance of a <i>Segmentations Tool</i> named <b>aorta</b> used to define a <i>Contour Group</i> 
for the main aorta and right iliac vessels. 

<table class="table table-bordered" style="width:100%">
  <caption> Create a <i>Segmentations Tool</i> instance named <b>aorta</b> </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
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
         <i>Data Manager</i> <i>Segmentations Tool Type</i>.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-seg-4.png" width="512" height="360"> </td>
    <td> Close the <i>SV Path Planning Panel</i> by selected the <b>X</b> in its <i>Tab</i>. <br><br>
         Double-click on the <i>Data Manager</i> <b>Segmentations / aorta</b> <i>Data Node</i> with the left mouse 
         button to bring up the <i>SV 2D Segmentation Panel</i>. The <i>Display</i> layout is changed to two 2D views 
         on the left and one 3D view on the right. <br><br>

         The 3D view displays geometry from any <i>Tool</i> that is selected to be visible using the 
         <img src="documentation/quickguide/tutorial/images/visible-toggle-box.png" width="20" height="18"> control. 
         The <b>aorta</b> and <b>left-iliac</b> paths are shown as yellow lines with blue markers. 

         The red rectangular region 
         <img src="documentation/quickguide/tutorial/images/create-seg-5.png" width="32" height="21"> 
         in the 3D view displays the 2D image slice extracted from the image volume. The slice is positioned and oriented 
         using <b>aorta</b> <i>Path</i> geometry. The slice is moved along a <i>Path</i> using the <b>Reslice</b> <i>Slider</i>.
         <br> <br>

         The upper left 2D view displays the 2D image slice; the lower the gradient of the 2D image slice used to visualize image edges.
         Image points and intensity values used for segmentation are interactively selected from the 2D views using the left mouse 
         button.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-seg-4.png" width="512" height="360"> </td>
    <td> 
        Some GUI controls: <br><br>
        <ul style="list-style-type:none;">
           <li> <img src="documentation/quickguide/tutorial/images/seg-gui-loft.png" width="90" height="21"> - Show the surface that
             passes through segmentation curves. </li> <br>
           <li> <img src="documentation/quickguide/tutorial/images/seg-gui-reslice.png" width="230" height="24"> - Move the image slice 
             plane along a <i>Path</i>. </li><br>
           <li> <img src="documentation/quickguide/tutorial/images/seg-gui-size.png" width="52" height="25"> - Set the size of the 
             image slice plane. </li><br>
           <li> <img src="documentation/quickguide/tutorial/images/seg-gui-delete.png" width="100" height="25"> - Delete the selected 
             segmentation. </li><br> 
           <li> <img src="documentation/quickguide/tutorial/images/seg-gui-copy.png" width="100" height="25"> - Make a copy of the 
             selected segmentation. </li><br>
           <li> <img src="documentation/quickguide/tutorial/images/seg-gui-paste.png" width="100" height="25"> - Create a new 
             segmentation at the current path location (slice plane location) from a copy of a segmentation. </li><br>
        </ul>

        <br>
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
<h3 id="tutorial_create_segs_2"> Create segmentations for the aorta/right iliac </h3>

This section demonstrates how to create a set of segmentations from the start of the aorta to the end of the right iliac arteries
using the <i>Level Set</i> segmentation method.

<table class="table table-bordered" style="width:100%">
  <caption> Create level set segmentations using the <b>aorta</b> <i>Segmentations Tool</i> </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-aorta-seg-1.png" width="512" height="360"> </td>
    <td> In the <i>Segmentations</i> <i>Tool</i> <i>Panel</i> select the 
         <img src="documentation/quickguide/tutorial/images/seg-gui-levelset.png" width="50" height="18"> <i>Button</i>. 
         <br> <br>
         The <b>LevelSet</b> sub-panel is displayed containing GUI controls used to set parameters controlling the
         level set computation (<b>Stage 1</b> and <b>Stage 2</b>) and the resulting contour geometry. Select the
         <b>Convert to Spline</b> <i>CheckBox</i> to represent the level set contour as a smooth interpolating
         spline.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-aorta-seg-2.png" width="512" height="360"> </td>
    <td> Select the <img src="documentation/quickguide/tutorial/images/seg-gui-levelset.png" width="50" height="18"> 
         <i>Button</i> again to perform a level set segmentation on the 2D image. 
         <br> <br>
         The level set contour is displayed in all three views as a closed red curve segmenting the vessel lumen from 
         surrounding tissue. 

         <br><br>
         The contour is added to the <b>Contour List</b> <i>Table</i> as <b>0:SplinePolygon,LevelSet</b>, where <i>0</i> is 
         the contour ID, <i>SplinePolygon</i> is geometric representation and <i>LevelSet</i> the segmentation method. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-aorta-seg-3.png" width="400" height="375"> </td>
    <td> The upper left <i>Axial</i> view shows the level set contour as a closed red curve with square green markers
         enclosing a straight red line with two green markers located in the contour center.
         <br><br>
         The blue and yellow markers in the center of the contour represent the location of a point on a path from 
         which the 2D image is extracted. 
         <br><br>
         The 10 green markers represent the control points use to control the shape of the interpolating spline. Moving
         a control point alters the shape of the level set contour. The number of control points is changed using the 
         <b>Ctrl. No.</b> <i>TextBox</i>. 
         <br><br>
         The straight red line with two green markers is the <b>Contour Manipulator</b>. 
         The center control point is used to translate the contour center in the 2D image plane. The outer control point 
         is used to contract/expand the contour. 
         <br><br>
         Positioning the mouse cursor over a control point highlights it in red. It can then be moved with the left mouse 
         button. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-aorta-seg-4.png" width="512" height="360"> </td>
    <td> Segmentations for the entire aorta/right iliac are created by moving the 2D slice plane to a new position along 
         the <b>aorta</b> <i>Path</i> using the <b>Reslice</b> <i>Slider</i> and selecting the 
         <img src="documentation/quickguide/tutorial/images/seg-gui-levelset.png" width="50" height="18"> <i>Button</i>.
         <br><br>
         Press the <img src="documentation/quickguide/gui/images/gui-save-icon.png" width="40" height="35">
         icon in the  <i>ToolBar</i> to save the <i>Project</i>. <br><br>
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-aorta-seg-5.png" width="512" height="360"> </td>
    <td> Contours can be selected from the <b>Contour List:</b> <i>Table</i> or from the 3D view using the left 
         mouse button. 
         <br><br>
         Once selected, a contour can be modified (e.g. change its segmentation method or parameters), copied/pasted, or deleted. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-aorta-seg-6.png" width="512" height="360"> </td>
    <td> The surface passing through the contours is visualized by selecting the <b>Lofting Preview</b> <i>CheckBox</i>.
         <br><br>
         This is the surface that will eventually be used to create a solid model so any surface features that would 
         lead to a poor model (e.g. overlapping regions) should be identified and fixed.
    </td>
  </tr>
</table> 


<br>
<h3 id="tutorial_create_segs_3"> Create an instance of a <i>Segmentations Tool</i> for the left iliac </h3>

Create an instance of a <i>Segmentations Tool</i> named <b>left-iliac</b> used to define a <i>Contour Group</i>
for the aorta/right iliac bifurcation to the end of the left iliac artery.

<table class="table table-bordered" style="width:100%">
  <caption> Create a <i>Segmentations Tool</i> instance named <b>left-iliac</b> </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-seg-6.png" width="512" height="360"> </td>
    <td> Select the <i>Segmentations</i> <i>Tool</i> in the <i>Data Manager</i> with the right mouse button. <br><br>
         Select the <b>Create Contour Group</b> menu option.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-seg-7.png" width="512" height="360"> <br><br>
    </td>
    <td> A <b>Create Contour Group</b> <i>DiaglogBox</i> appears. <br><br>
         Select <b>left-iliac</b> for the <i>Path</i> name from the <b>Select Path:</b> <i>ComboBox</i> <br><br>
         Enter <b>left-iliac</b> for the <i>Contour Group</i> name in the <b>Group Name:</b> <i>TextBox</i> <br><br>
         Press the <b>Create Contour Group</b> <i>DiaglogBox</i> <b>OK</b> <i>Button</i>. <br><br>
    </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/tutorial/images/create-seg-8.png" width="512" height="360">
    </td>
    <td> A <i>Data Node</i> named <b>left-iliac</b> (an instance of a <i>Segmentations Tool</i>) is created under the
         <i>Data Manager</i> <i>Segmentations Tool Type</i>.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-seg-9.png" width="512" height="360"> </td>
    <td> Double-click on the <i>Data Manager</i> <b>Segmentations / left-iliac</b> <i>Data Node</i> with the left mouse
         button to bring up the <i>SV 2D Segmentation Panel</i>. The <i>Display</i> layout is changed to two 2D views
         on the left and one 3D view on the right. <br><br>

         The red rectangular region
         <img src="documentation/quickguide/tutorial/images/create-seg-5.png" width="32" height="21">
         in the 3D view displays the 2D image slice extracted from the image volume. The slice is positioned and oriented
         using <b>left-iliac</b> <i>Path</i> geometry. The slice is moved along a <i>Path</i> using the <b>Reslice</b> <i>Slider</i>.
         <br> <br>

         The upper left 2D view displays the 2D image slice; the lower the gradient of the 2D image slice used to visualize image edges.
         Image points and intensity values used for segmentation are interactively selected from the 2D views using the left mouse
         button.
    </td>
  </tr>
</table> 


<br> 
<h3 id="tutorial_create_segs_4"> Create segmentations for the left iliac </h3>
This section demonstrates how to create a set of segmentations from the aorta/right iliac bifurcation to the end of the left iliac artery.
using the <i>Level Set</i> segmentation method.

<table class="table table-bordered" style="width:100%">
  <caption> Create level set segmentations using the <b>left-iliac</b> <i>Segmentations Tool</i> </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-left-iliac-seg-1.png" width="512" height="360"> </td>
    <td> In the <i>Segmentations</i> <i>Tool</i> <i>Panel</i> select the
         <img src="documentation/quickguide/tutorial/images/seg-gui-levelset.png" width="50" height="18"> <i>Button</i>.
         <br> <br>
         The <b>LevelSet</b> sub-panel is displayed containing GUI controls used to set parameters controlling the
         level set computation (<b>Stage 1</b> and <b>Stage 2</b>) and the resulting contour geometry. Select the
         <b>Convert to Spline</b> <i>CheckBox</i> to represent the level set contour as a smooth interpolating
         spline.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-left-iliac-seg-2.png" width="512" height="360"> </td>
    <td> Segmentations for the entire left iliac are created by moving the 2D slice plane to a new position along
         the <b>left-iliac</b> <i>Path</i> using the <b>Reslice</b> <i>Slider</i> and selecting the
         <img src="documentation/quickguide/tutorial/images/seg-gui-levelset.png" width="50" height="18"> <i>Button</i>.
         <br><br>
         Press the <img src="documentation/quickguide/gui/images/gui-save-icon.png" width="40" height="35">
         icon in the  <i>ToolBar</i> to save the <i>Project</i>. <br><br>
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-left-iliac-seg-3.png" width="512" height="360"> </td>
    <td> The surface passing through the contours is visualized by selecting the <b>Lofting Preview</b> <i>CheckBox</i>.
         <br><br>
         This is the surface that will eventually be used to create a solid model so any surface features that would
         lead to a poor model (e.g. overlapping regions) should be identified and fixed.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-left-iliac-seg-4.png" width="512" height="360"> </td>
    <td> Select the <b>Lofted</b> box under the <i>Data Manager</i> <b>Segmentations / aorta</b> <i>Data Node</i>
         to visualize both the </b>aorta</b> and <b>left-iliac</b> lofted surfaces.
         <br><br>
         The upper left 2D <i>Axial</i> view displays the intersection of the 2D slice plane with the two surfaces as white lines. 
         This shows that the <b>left-iliac</b> surface does not completely fit in the </b>aorta</b>. This could later cause problems 
         when creating a model or generating a finite element mesh.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-left-iliac-seg-5.png" width="512" height="360"> </td>
    <td> Select the outer control point of the <b>Contour Manipulator</b> to reduce the size of the first contour until
         it completely fits in the </b>aorta</b>.

         <br><br>
         Press the <img src="documentation/quickguide/gui/images/gui-save-icon.png" width="40" height="35">
         icon in the  <i>ToolBar</i> to save the <i>Project</i>. <br><br>
    </td>
  </tr>
</table> 
