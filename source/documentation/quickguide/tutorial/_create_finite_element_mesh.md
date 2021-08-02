<h2 id="tutorial_create_finite_element_mesh">Create Finite Element Mesh</h2>

A solid model of a vascular network is created by generating vessel surfaces fitted to groups of 2D segmentations and joining them 
together to form a geometric representation of a volume of vascular anatomy. A solid model provides the geometric information 
needed to generate a finite element volumetric mesh.

The following sections demonstrate how to create a <i>PolyData</i> solid model from the <b>aorta</b> and <b>left-iliac</b> segmentations. 

<h3 id="tutorial_create_mesh_1"> Create an instance of a <i>Meshes Tool</i> for the <b>aorta-iliacs</b> model.  </h3>

Create an instance of a <i>Models Tool</i> named <b>aorta-iliacs</b> used to create a model for the main aorta and iliac vessels. 

<table class="table table-bordered" style="width:100%">
  <caption> Create a <i>Models Tool</i> instance named <b>aorta-iliacs</b> </caption>
  <tr>
    <th> GUI </th>
    <th> Descriptiton </th>
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
         <i>Data Manager</i> <i>Models Tool</i> type.
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

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-7.png" width="512" height="360"> </td>
    <td> Select the <img src="documentation/quickguide/tutorial/images/model-gui-create-model.png" width="114" height="25"> 
         <i>Button</i> in the upper right of the <i>SV Modeling Panel</i>. 

         <br><br>
         A <b>Create Solid Model</b> <i>DiaglogBox</i> appears. This displays the names of the <b>aorta</b> and <b>left-iliac</b> 
         <i>Segmentations Data Nodes</i> with a <i>CheckBox</i>. The <i>CheckBox</i>s are used to select the segmentation
         lofted surfaces that will be included in a model.

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
        Press the <img src="documentation/quickguide/gui/images/gui-save-icon.png" width="40" height="35">
        icon in the  <i>ToolBar</i> to save the <i>Project</i>. 

        <br><br>
        Select <img src="documentation/quickguide/gui/images/gui-a-plane-icon.png" width="20" height="20">, 
        <img src="documentation/quickguide/gui/images/gui-s-plane-icon.png" width="20" height="20">, and 
        <img src="documentation/quickguide/gui/images/gui-c-plane-icon.png" width="20" height="20"> icons to hide the
        axial,  sagital, and, coronal image scan slices. 
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
            <li> <b>Type</b> - The <i>Face</i> type: <b>wall</b> or <b>cap</b>. </li>
            <li> <b>V</b> - The <i>Face</i> visibility.  </li>
            <li> <b>C</b> - The <i>Face</i> color.  </li>
          </ul> 
        Each of these attributes can be changed by double-clicking the left mouse button on the appropriate row for the <b>Face</b> 
        and column for the specific attribute.
        <br><br>
        A <i>Face</i> is selected from the <b>Face List</b> <i>Table</i> using the left moust button.
        <br><br>
        Select the <b>wall_left-iliac</b> <i>Face</i> from the <b>Face List</b> <i>Table</i> using the left moust button.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-model-11.png" width="512" height="360"> </td>
     <td> The <b>wall_left-iliac</b> <i>Face</i> is highlighted in yellow in the <i>3D View</i>.
    </td>
  </tr>


</table>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
