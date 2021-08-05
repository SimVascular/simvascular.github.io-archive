<h2 id="tutorial_create_finite_element_mesh">Create Finite Element Mesh</h2>
The continuous volume enclosed by a solid model of vascular anatomy is subdivided into discrete tetrahedral elements using mesh 
generation software. This finite element mesh is used by the SimVascular <i>svSolver</i> and <i>svFsi</i> computational fluid 
dynamics programs to simulate blood flow in a vascular network.

A good mesh is integral to finite element CFD simulation techniques. It enables computers to numerically solve the 
underlying governing fluid equations and simulate physical effects. The mesh quality influences the accuracy, convergence, 
and speed of the simulation process.

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
<i>Modeling</i> and <i>Meshing</i> are typically the most time consuming steps in the image-based modeling pipeline.
It often takes multiple iterations between the <i>Modeling</i> and <i>Meshes Tools</i> to obtain a model that can
be successfully meshed and suitable for a CFD simulation.
</div>

<br>
The following sections demonstrate how to create a finite element mesh from the <b>aorta-iliacs</b> <i>PolyData</i> solid model 
using the <i>TetGen</i> mesh generation software. A detailed discussion about mesh generation can be found in the SimVascular
<a href="http://simvascular.github.io/docsMeshing.html">Meshing Guide</a> documentation.

<h3 id="tutorial_create_mesh_1"> Create an instance of a <i>Meshes Tool</i> for the <b>aorta-iliacs</b> model.  </h3>

Create an instance of a <i>Meshes Tool</i> named <b>aorta-iliacs</b> used to create a model for the main aorta and iliac vessels. 

<table class="table table-bordered" style="width:100%">
  <caption> Create a <i>Meshes Tool</i> instance named <b>aorta-iliacs</b> </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-mesh-1.png" width="512" height="360"> </td>
    <td> Select the <i>Meshes</i> <i>Tool</i> in the <i>Data Manager</i> with the right mouse button. 
         <br><br>
         Select the <b>Create Mesh</b> menu option.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-mesh-2.png" width="512" height="360"> <br><br>
    </td>
    <td> A <b>Create Mesh</b> <i>DiaglogBox</i> appears. 
         <br><br>
         The <b>Select Model:</b> <i>ComboBox</i> is used to select a model. Leave it on <b>aorta-iliacs</b>.
         <br><br>
         The <b>Mesh Type:</b> <i>ComboBox</i> is used to select the mesh generator. Leave it on <b>TetGen</b>.
         <br><br>
         Don't enter anything in the <i>Mesh Name:</i> <i>TextBox</i>; by default it will use the <b>aorta-iliacs</b> model 
         name for the mesh.
         <br><br>
         Press the <b>Create Mesh</b> <i>DiaglogBox</i> <b>OK</b> <i>Button</i>. <br><br>
         <br><br>
    </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/tutorial/images/create-mesh-3.png" width="512" height="360"> </td>
    <td> A <i>Data Node</i> named <b>aorta-iliacs</b> (an instance of a <i>Meshes Tool</i>) is created under the
         <i>Data Manager</i> <i>Meshes Tool</i> type.

         <br><br>
         Select the <i>Data Manager</i> <i>Models</i> <i>CheckBox</i> to toggle off the visibility of the solid model segmentation geometry.

         <br><br>
         Close the <i>SV Modeling Panel</i> by selected the <b>X</b> in its <i>Tab</i>. 

         <br><br>
         Double-click on the <i>Data Manager</i> <b>Meshes / aorta-iliacs</b> <i>Data Node</i> with the left mouse
         button to bring up the <i>SV Meshing Panel</i>. 
    </td>
  </tr>
</table> 

<br>
<h3 id="tutorial_create_mesh_2"> Generate a finite element meshes from the <b>aorta-iliacs</b> model.</h3>
The section demonstrates how to generate a finite element mesh from the <b>aorta-iliacs</b> <i>PolyData</i> solid model.

<table class="table table-bordered" style="width:100%">
  <caption> Generate a mesh from the <b>aorta-iliacs</b> model </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-mesh-4.png" width="512" height="360"> </td>
    <td> Some GUI controls: 
         <br><br>
         <ul style="list-style-type:none;">
           <li> <img src="documentation/quickguide/tutorial/images/mesh-gui-info.png" width="86" height="24"> - Displays a 
                <i>InformationPopup</i> showing the number of elements generated for the current mesh. </li> <br>
           <li> <img src="documentation/quickguide/tutorial/images/mesh-gui-run.png" width="90" height="23"> - Run the mesh generator. 
                </li> <br>
           <li> <img src="documentation/quickguide/tutorial/images/mesh-gui-estimate.png" width="73" height="25"> - Estimate the element
                size used to control mesh resolution. </li> <br>
         </ul>
         <br><br>
         Select the <img src="documentation/quickguide/tutorial/images/mesh-gui-estimate.png" width="73" height="25"> <i>Button</i>.
         <br><br>
         Select the <img src="documentation/quickguide/tutorial/images/mesh-gui-run.png" width="90" height="23"> <i>Button</i>.
         <br><br>
         Select the <b>Yes</b> <i>Button</i> on the <i>QuestionPopup</i> asking to continue.
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/create-mesh-5.png" width="512" height="360"> </td>
    <td> A <i>InformationPopup</i> is displayed showing the number of elements generated.
         <br><br>
         Press the <i>InformationPopup</i> <b>OK</b> <i>Button</i>.
         <br><br>
         Press the <img src="documentation/quickguide/gui/images/gui-save-icon.png" width="40" height="35">
         icon in the <i>ToolBar</i> to save the <i>Project</i>.
    </td>
  </tr>
</table>

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
When opening a <i>Project</i> SimVascular does not automatically read in and display <i>Meshes Tool</i> meshes.
A mesh must be manually loaded by right clicking on a <i>Data Manager</i> Meshes Data Node</i> and selecting the
<b>Load/Unload Volume Mesh</b> menu option.
</div>

