<h1 id="tutorial"> Tutorial </h1>

This section demonstrates how to use the SimVascular image-based modeling pipeline to create a patient-specific geometric model 
of the human vasculature and perform a finite element computational fluid dynamics (CFD) simulation of blood flow for that model.
A model of an aorta with left and right iliac arteries is created from an MR image volume.

The following lists the sections in this tutorial 

<ol>

  <li> <a href="#tutorial_starting_simvascular">Starting SimVascular</a>  

  <li> <a href="#tutorial_create_project">Create a Project</a> 

  <li> <a href="#tutorial_add_image_data">Add Image Data</a> 

  <li> <a href="#tutorial_create_paths">Create Vessel Paths</a> 
    <ol type="i">
      <li> <a href="#tutorial_create_paths_1">Create an instance of a <i>Paths Tool</i> for the aorta/right iliac </a>
      <li> <a href="#tutorial_create_paths_2"> Create the aorta/right iliac path </a>
      <li> <a href="#tutorial_create_paths_3"> Create an instance of a <i>Paths Tool</i> for the left iliac </a>
      <li> <a href="#tutorial_create_paths_4"> Create the left iliac path </a>
    </ol>

  <li> <a href="#tutorial_create_segmentations">Create Segmentations</a> 
    <ol type="i">
      <li> <a href="#tutorial_create_segs_1">Create an instance of a <i>Segmentations Tool</i> for the aorta/right iliac </a>
      <li> <a href="#tutorial_create_segs_2">Create segmentations for the aorta/right iliac </a>
      <li> <a href="#tutorial_create_segs_3">Create an instance of a <i>Segmentations Tool</i> for the left iliac </a>
      <li> <a href="#tutorial_create_segs_4">Create segmentations for the left iliac </a>
    </ol>

  <li> <a href="#tutorial_create_model">Create Solid Model</a> 
    <ol type="i">
      <li> <a href="#tutorial_create_model_1">Create an instance of a <i>Models Tool</i> for the aorta and iliacs </a>
      <li> <a href="#tutorial_create_model_2">Create a solid model of the aorta and iliacs </a>
    </ol>

  <li> <a href="#tutorial_create_finite_element_mesh">Create Finite Element Mesh</a> 
    <ol type="i">
      <li> <a href="#tutorial_create_mesh_1">Create an instance of a <i>Meshes Tool</i> for the <b>aorta-iliacs</b> model.</a>
      <li> <a href="#tutorial_create_mesh_2"> Generate a finite element mesh from the <b>aorta-iliacs</b> model.</a>
    </ol>

  <li> <a href="#tutorial_create_simulation">Create CFD Simulation</a> 
    <ol type="i">
      <li> <a href="#tutorial_create_simulation_1"> Create an instance of a <i>Simulations Tool</i> for the <b>aorta-iliacs</b> model.</a>
      <li> <a href="#tutorial_create_simulation_2"> Set inlet and outlet boundary conditions.</a> 
      <li> <a href="#tutorial_create_simulation_3"> Set solver parameters. </a> 
      <li> <a href="#tutorial_create_simulation_4"> Run the simulation. </a> 
      <li> <a href="#tutorial_create_simulation_5"> Convert simulation results. </a> 
    </ol>

</ol>


<br>
The <a href="https://simtk.org/frs/download_confirm.php/latestzip/2256/SimVascularTutorialProject-latest.zip?group_id=930"> SimVascular Tutorial Project </a>
is a complete SimVascular project containing the data created by each of these steps. It also includes a <i>OSMSC0110-aorta</i> directory 
containing DICOM image data used in the tutorial.

