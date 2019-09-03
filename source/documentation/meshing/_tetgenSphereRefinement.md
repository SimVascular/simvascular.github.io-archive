## Spherical Refinement

When simulating blood flow, interesting phenomenon can occur around the site of vessel bifurcations. It is advantageous to have increased mesh density at and around bifurcations. In this section we will refine the mesh at the abdominal aorta and common iliac artery bifurcation using sphere refinement:

We will now refine a region with a sphere from a model of an Aorta.

	Clear local size for wall\_right_iliac in "Local Size"	
	Go to "Regional Refinement"
	Toggle on "Sphere" and an sphere appears in the 3D-view window.
	Move the sphere and change its size to make sure the bifurcation is include inside the sphere.
	Click the button "Add" to add this region to the table
	Provide a local size for it. Here we use 0.1
	Click the button "Run Mesher"	

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/tetgen/tetgensphericalmeshing.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font> 
If you have multiple regions of interest for mesh refinement, you can move the sphere to another region, then add it to the table. If you want to adjust a sphere which is already added in the table, just select the sphere in the table. A red sphere will appear in its corresponding region in the 3D-view window. You can also set size or delete spheres from the table menu.

You can combine boundary layer, spherical refinment and local size to create a full mesh again.


**When you are satisfied with the mesh, click the tool button  “Save SV Project ” to save the mesh.**
