<h1 id="tutorial"> Tutorial </h1>

This section demonstrates how to use the SimVascular image-based modeling pipeline to create a patient-specific geometric model 
of the human vasculature and perform a finite element computational fluid dynamics (CFD) simulation of blood flow in that model.
A model of an aorta with left and right iliac arteries is created from an MR image volume.

The following lists the sections in this tutorial used to demonstrate how to use SimVascular to create an anatomic model from 
image data and perform a blood flow simulation for it.

<ol>

  <li> <a href="#tutorial_starting_simvascular">Starting Simvascular</a>  

  <li> <a href="#tutorial_create_project">Create a Project</a> 

  <li> <a href="#tutorial_add_image_data">Add Image Data</a> 

  <li> <a href="#tutorial_create_paths">Create Vessel Paths</a> 
    <ol type="A">
      <li> <a href="#tutorial_create_paths_1">Create an instance of a <i>Paths Tool</i> for the aorta/right iliac </a>
      <li> <a href="#tutorial_create_paths_2"> Create the aorta/right iliac path </a>
      <li> <a href="#tutorial_create_paths_3"> Create an instance of a <i>Paths Tool</i> for the left iliac </a>
      <li> <a href="#tutorial_create_paths_4"> Create the left iliac path </a>
    </ol>

</ol>


The <a href="https://simtk.org/frs/download_confirm.php/file/5113/DemoProject.zip?group_id=930"> Demo Project </a>
is a complete SimVascular project containing the data created by each of these steps. 


