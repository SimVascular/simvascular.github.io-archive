<h2 id="tutorial_create_model">Create Solid Model</h2>

A solid model is used as a geometric representation of a volume of vascular anatomy. It is created by joining together 
vessel surfaces fitted to groups of 2D segmentations. A solid model provides the geometric information 
needed to generate a finite element volumetric mesh.

A solid model represents a volume in space by a set of faces with well-defined boundary connected to form a closed surface.
The solid model boundary faces are defined geometrically to be either polygonal or NURBS surfaces.

The lofted surface created from groups of 2D segmentations is a surface with open ends and is therefore not a solid. It is converted
into a solid model by attaching planar surfaces (caps) to its open ends to form a closed surface. 

SimVascular assigns a <i>Face Type</i> to each face in the solid model

<ul style="list-style-type:none;">
  <li> <b>wall</b> - A lofted surface representing the vessel wall.
  <li> <b>cap</b> - The planar surface caps used to form a closed surface. These are Used to assign inlet and outlet boundary conditions 
       for simulations. 
</ul>

SimVascular has two solid modelers

<ul style="list-style-type:none;">
  <li> <b>PolyData</b> - Faces are represented as a surface composed of triangles 
  <li> <b>OpenCASCADE</b> - Faces are represented as a NURBS surface
</ul>

The <b>PolyData</b> is the solid modeler most often used to build solid models. 

The following sections demonstrate how to create a <i>PolyData</i> solid model from the <b>aorta</b> and <b>left-iliac</b> segmentations. 
A detailed discussion about modeling can be found in the SimVascular
<a href="http://simvascular.github.io/docsModelGuide.html">Modeling Guide</a> documentation.


<h3 id="tutorial_create_model_1"> Create an instance of a <i>Models Tool</i> for the aorta and iliacs </h3>

Create an instance of a <i>Models Tool</i> named <b>aorta-iliacs</b> used to create a model for the main aorta and iliac vessels. 

<table class="table table-bordered" style="width:100%">
  <caption> Create a <i>Models Tool</i> instance named <b>aorta-iliacs</b> </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-1.png" width="512" height="360"> </td>
    <td> Select the <i>Models</i> <i>Tool</i> in the <i>Data Manager</i> with the right mouse button. 
         <br><br>
         Select the <b>Create Model</b> menu option.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-2.png" width="512" height="360"> <br><br>
    </td>
    <td> A <b>Create New Model</b> <i>DiaglogBox</i> appears. 
         <br><br>
         The <b>Model Type:</b> <i>ComboBox</i> is used to select the solid modeler. Leave it on <b>PolyData</b>.
         <br><br>
         Enter <b>aorta-iliacs</b> for the <i>Model</i> name in the <b>Model Name:</b> <i>TextBox</i> 
         <br><br>
         Press the <b>Create New Model</b> <i>DiaglogBox</i> <b>OK</b> <i>Button</i>. <br><br>
         <br><br>
    </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/tutorial/images/create-model-3.png" width="512" height="360"> </td>
    <td> A <i>Data Node</i> named <b>aorta-iliacs</b> (an instance of a <i>Models Tool</i>) is created under the
         <i>Data Manager</i> <i>Models Tool Type</i>.
    </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/tutorial/images/create-model-4.png" width="512" height="360"> </td>
    <td> Select the <b>Lofted</b> <i>CheckBox</i> to toggle off the visibility of the lofted surfaces for 
         both the <b>aorta</b> and <b>left-iliac</b> <i>Segmentations Data Nodes</i>.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-5.png" width="512" height="360"> </td>
    <td> Close the <i>SV 2D Segmentation Panel</i> by selected the <b>X</b> in its <i>Tab</i>. 
         <br><br>
         Double-click on the <i>Data Manager</i> <b>Models / aorta-iliacs</b> <i>Data Node</i> with the left mouse
         button to bring up the <i>SV Modeling Panel</i>. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-5.png" width="512" height="360"> </td>
    <td> Some GUI controls: <br><br>
         <ul style="list-style-type:none;">
           <li> <img src="documentation/quickguide/tutorial/images/model-gui-delete.png" width="114" height="25"> - Delete the selected
                face(s). </li> <br>

           <li> <img src="documentation/quickguide/tutorial/images/model-gui-fill-holes.png" width="114" height="25"> - Fill holes in the
                surface with faces. </li> <br>

           <li> <img src="documentation/quickguide/tutorial/images/model-gui-est-size.png" width="114" height="25"> - Estimate a good
                size triangle edge size used to remesh the model's triangular surface.  </li> <br>

           <li> <img src="documentation/quickguide/tutorial/images/model-gui-size.png" width="114" height="25"> - The 
                triangle edge size <i>TextBox</i> used to remesh the model's triangular surface. </li> <br>

           <li> <img src="documentation/quickguide/tutorial/images/model-gui-remesh.png" width="114" height="25"> - Remesh the model's 
                triangular surface mesh using the traingle edge size given in the <i>TextBox</i>. </li> <br>
         </ul>

    </td>
  </tr>


  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-6.png" width="512" height="360"> </td>
    <td> Select the <img src="documentation/quickguide/tutorial/images/3d-view-icon.png" width="13" height="12"> 
         icon in the <i>3D View</i> to change the <i>Display</i> layout to a single 3D view. 
    </td>
  </tr>
</table> 


<br>
<h3 id="tutorial_create_model_2"> Create a solid model of the aorta and iliacs </h3>
This section demonstrates how to create a <i>PolyData</i> solid model from the <b>aorta</b> and <b>left-iliac</b> segmentations. 

<table class="table table-bordered" style="width:100%">
  <caption> Create a solid model </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-7.png" width="512" height="360"> </td>
    <td> Select the <img src="documentation/quickguide/tutorial/images/model-gui-create-model.png" width="114" height="25"> 
         <i>Button</i> in the upper right of the <i>SV Modeling Panel</i>. 

         <br><br>
         A <b>Create Solid Model</b> <i>DiaglogBox</i> appears. This displays the names of the <b>aorta</b> and <b>left-iliac</b> 
         <i>Segmentations Data Nodes</i> with a <i>CheckBox</i>. The <i>CheckBox</i>s are used to select the segmentation
         lofted surfaces that will be joined together to create a solid model.

         <br><br>
         Select the <i>CheckBox</i> for the <b>aorta</b> and <b>left-iliac</b> segmentations. 

         <br><br>
         Press the <b>Create Solid Model</b> <i>DiaglogBox</i> <b>OK</b> <i>Button</i>. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-8.png" width="512" height="360"> </td>
    <td>The solid model has been constructed and is shown in the <i>3D View</i>. 
        <br><br>
        Select <img src="documentation/quickguide/gui/images/gui-a-plane-icon.png" width="20" height="20">, 
        <img src="documentation/quickguide/gui/images/gui-s-plane-icon.png" width="20" height="20">, and 
        <img src="documentation/quickguide/gui/images/gui-c-plane-icon.png" width="20" height="20"> icons to hide the
        axial,  sagittal, and, coronal image scan slices. 
        <br><br>
        Press the <img src="documentation/quickguide/gui/images/gui-save-icon.png" width="40" height="35">
        icon in the  <i>ToolBar</i> to save the <i>Project</i>. 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-9.png" width="512" height="360"> </td>
    <td> The <b>Face List</b> <i>Table</i> lists the four <i>Faces</i> created by joining the <b>aorta</b> and 
         <b>left-iliac</b> segmentations into a complete solid model. 
       
        <br><br>
        The <b>Face List</b> <i>Table</i> columns define <i>Face</i> attributes
          <ul style="list-style-type:none;">
            <li> <b>Name</b> - The <i>Face</i> name. This name is later used in <i>Meshes</i> and <i>Simulation Tools</i>. </li>
            <li> <b>Type</b> - The <i>Face Type</i>: <b>wall</b> or <b>cap</b>. </li>
            <li> <b>V</b> - The <i>Face</i> visibility.  </li>
            <li> <b>C</b> - The <i>Face</i> color.  </li>
          </ul> 
        Each of these attributes can be changed by double-clicking the left mouse button on the appropriate row for the <b>Face</b> 
        and column for the specific attribute.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-10.png" width="512" height="360"> </td>
     <td> Select the <i>Data Manager</i> <i>Paths</i> and <i>Segmentations</i> <i>CheckBox</i> to toggle off the visibility of 
          all paths and segmentation geometry. 
    </td>
  </tr>

</table>

