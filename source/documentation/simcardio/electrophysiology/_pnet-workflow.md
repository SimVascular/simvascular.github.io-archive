## Purkinje Plugin Workflow & Usage ##

The Purkinje plugin can be applied only on a SimVascular generated mesh and not on the model. Therefore, it is recommended that the user first create a mesh either by following the regular workflow (i.e., Image, Path, Segmentation, Model and Mesh) or by importing a solid model using the Models tool. In the example below, we use the latter approach and load the left ventricular endocardium directly into the SV project. We then mesh the volume before using the plugin to generate Purkinje network.

<!--             Modeling & Meshing               -->
###Create SV mesh
After creating an SV project, right-click on the Models tab to import a left ventricular solid model (.vtp) and run the Global Reinit command. During the import, extract faces on the model using the default settings.

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/create-project.png">
    <figcaption class="svCaption" >Create a project or open an existing one.</figcaption>
</figure>

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/import-model.png">
    <figcaption class="svCaption" >Import .vtp surface file that you want to create a Purkinje network on.</figcaption>
</figure>

Rename the surfaces in the imported solid model and select types from the drop down menu. Optionally assign colors to each surface to identify them easily. Identify the endocardium of the left ventricle and set it as a wall.

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/rename-surfaces.png">
    <figcaption class="svCaption" >Rename the surfaces and set types to wall/cap where appropriate.</figcaption>
</figure>

The imported left ventricular model may appear as shown below,

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/imported-renamed-model.png">
    <figcaption class="svCaption" >Imported left ventricular endocardium for creating the Purkinje network.</figcaption>
</figure>

We now mesh the model before adding the Purkinje network tool. Create a new mesh under Meshes tab and open the SV Meshing window. Enter an appropriate max. edge size, deselect the Volume Meshing and run the mesher. Once the surface mesh is successfully generated, a window pops up with information about the mesh.

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/create-mesh.png">
    <figcaption class="svCaption" >Create a mesh under Meshes tab.</figcaption>
</figure>

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/mesh-params.png">
    <figcaption class="svCaption" >Set mesh Global Max Edge Size and run the mesher.</figcaption>
</figure>

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/mesh-stats.png">
    <figcaption class="svCaption" >Once the mesh is successfully generated, the mesh stats window pops up.</figcaption>
</figure>


###Plugin workflow
Here we provide a brief overview of the workflow to generate Purkinje network. Once the mesh is created, activate the Purkinje plugin so that it displays the triangular surfaces of the mesh. Purkinje network can then be created using the following steps:

<ol>
    <li>Select a face on the mesh </li>
    <li>Select the network starting point on the face </li>
    <li>Set network generation parameters</li>
    <li>Generate the network</li>
    <li>Display the network</li>
    <li>Repeat the above steps until satisfied</li>
    <li>Export the network data</li>
</ol>

Below we provide a detailed description of the above steps with illustrations.

First, activate the Purkinje Network tool on the SimVascular toolbar that brings up the Purkinje Network tool panel. If the Purkinje Network window is already visible upon launching the SimVascular application, it is recommended to close the window and reactivate it only after an SV project has been created or loaded into the Data Manager.

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/purkinje-tool.png">
    <figcaption class="svCaption" >Activate Purkinje tool by clicking the Purkinje Network icon shown on the toolbar.</figcaption>
</figure>

A mesh face is selected by moving the mouse cursor over a face and pressing the <strong>s</strong> key. Select the endocardium face you want to generate the Purkinje network on. The selected face mesh is highlighted in yellow and its name is displayed in the Mesh Surface text box.

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/select-surface.png">
    <figcaption class="svCaption" >Select the surface to generate the Purkinje network on.</figcaption>
</figure>

Provide a starting point of the Purkinje network by moving the mouse cursor to a node on the highlighted face mesh and pressing Ctrl(Cmd for OSX)+left-click. A red sphere marks the selected node and a red line segment showing the direction of the network is displayed. Adjust the starting point and direction by repeating the selection.

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/select-point.png">
    <figcaption class="svCaption" >Select the starting point and direction of the Purkinje network.</figcaption>
</figure>

Adjust the control parameters of the Purkinje network and generate by selecting the Create Network button. The network is displayed by checking the Show Network box. You can repeat the selection of the initial point and network creation until the results are satisfactory. A detailed description of the network control parameters is provided <a href="#parameters">below</a>.

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/create-network.png">
    <figcaption class="svCaption" >Create the Purkinje network after adjusting parameters.</figcaption>
</figure>

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/display-network.png">
    <figcaption class="svCaption" >Purkinje network is overlaid on the mesh in the Display window.</figcaption>
</figure>

The network is saved in .vtu format under the Purkinje-Network sub-folder of the project directory. Additionally you can find the .txt files that contain the information of end nodes, position coordinates, and network connectivity under the same folder. Further details about the contents of each file is provided <a href="#output">below</a>.

<figure>
    <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/purkinje-paraview.png">
    <figcaption class="svCaption" >The Purkinje network visualized in Paraview .</figcaption>
</figure>


###Output Description
The Purkinje Network tool writes a set of files in the Purkinje-Network sub-folder within the SimVascular project directory. The files are prefixed with the name of the selected face. The files and their contents are described below:

<ul>
    <li> <code> <font color="black"> FACENAME.vtp </font> </code> - triangular surface on which the network is generated. </li>
    <li> <code> <font color="black">FACENAME.vtu </font> </code> - network mesh represented as polylines of $n$ segments and $(n+1)$ nodes.</li>
    <li> <code> <font color="black">FACENAME_endnodes.txt </font> </code> - indices of nodes at the ends of network segments (i.e. not connected to other nodes).</li>
    <li> <code> <font color="black">FACENAME_ien.txt </font> </code> - network connectivity.</li>
    <li> <code> <font color="black">FACENAME_xyz.txt      </font> </code> - network nodal coordinates.</li>
</ul>

