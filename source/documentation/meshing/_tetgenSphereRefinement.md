## Spherical Refinement

When simulating blood flow, interesting phenomenon can occur around the site of vessel bifurcations. It is advantageous to have increased mesh density at and around bifurcations. In this section we will refine the mesh at the abdominal aorta and common iliac artery bifurcation using sphere refinement:

We will now refine a region with a sphere from a model of an Aorta.

1.	Set the desired mesh edge size in the "edge size:" entry widget on the Mesh Options Tab. In this case, we use "0.3".  
2.	Go to the "Advanced Mesh Options" tab under the "TetGen" tab, and select "Sphere Refinement".
3.	Play around with the radius of the sphere in the "Sphere Radius" entry box. When you put in a new value for the radius, hit ENTER to apply the new size. Find a radius that works for your model. In our case, the sphere radius we use is "3".
4. 	Move the radius to the desired location. We place ours right at the base of the aorta where is branch into the two iliac arteries, as this is an area of more complicated flow. 
5. 	Enter a mesh size for the refined region into the "Refinement Factor" entry box. The refinement factor we used in this case is "0.5". This means the elements in the refined region should be half the size of the rest of the elements.
6.	To add this spherical reginement region to the Meshing Paramters, select "Add Sphere Refinement"

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/TetGen_Load_Sphere_Refinement.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Now we will generate the mesh for the model that includes the refined mesh specifications:

1.	Go back to the "Mesh Options" tab.
2.	Click on the "Run Mesher (Internal)" button.
3.	Click "yes" button when the "Creating a mesh can take a long time. Continue Anyway?" dialog box appears.
4.	Click "yes" button when the "Use currently selected meshing options? This will save/overwrite the meshSim script file" dialog box appears.
5.	When the meshing is finished, a dialog box appears with mesh statistics.  Once you have reviewed the meshing output, you can click on the "OK" button in the "Mesh Statistics" dialog box.

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/TetGen_Sphere_Refinement.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

You can now go back and do a full mesh combining a boundary layer and spherical refinment. 
