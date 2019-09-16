## Boundary Layer Meshing

When simulating blood flow, interesting phenomenon can occur near the vessel walls.  Under laminar flow, for example, boundary layers can form with large velocity and pressure gradients near the wall.  It is advantageous to have increased mesh density in the areas of high gradients.  If a preferential flow direction is known, you can often “elongate” elements in the direction of the flow without loss of accuracy to reduce computational costs. In the area of mesh generation applied to fluid flow, this is often referred to as boundary layer meshing. Let's explain a few parameters used in boundary layer meshing.

	* Portion of Edge Size: the portion of the edge size to use as the size for the initial boundary layer (typically this is a value between zero and one.
	* Num Layers: the number of layers desired. Too many layers can cause self intersections on smaller vessels, so be careful.
	* Layer Decreasing Ratio: the amount of the size decrease between successive boundary layers. This gradation factor is multiplied by the previous layer to get the thickness of the new layer. In order to decrease the layers by a factor of 2, apply a decreasing ratio of 0.5. 

We will now generate a boundary layer mesh from a solid model.

	Make sure the model has correct types (wall,cap) assigned for all its faces
	Go to Advance Options
	Toggle on the checkbox "Boundary Layer Meshing"
	Portion of Edge Size: in this case, we use 0.5.
	Make sure Volume Meshing and Surface Meshing are on
	Number of Layers: in this case, we use 4 layers.
	Layer Decreasing Ratio: in this case, we would like each layer to be 0.6 of the previous layer. 
	Make sure Volume Meshing and Surface Meshing are on
	Click the button "Run Mesher"

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/tetgen/tetgenboundarylayer.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**WARNNING:** </font> Fast Meshing is automatically disabled if using boundary layer meshing. 

The mesh generated will have the boundary layer mesh on the specified region. Zooming in, you can see that the number of layers in the volumetric mesh is four. The boundary layer extends all the way down the length of the surface named wall, and each layer is 0.8 of the previous layer.

It is important to note, once again, that you have generated a volumetric mesh. That is, the entire volume of the geometry has been filled with tetrahedral elements. Thus, the boundary layer meshing pattern that you see on the surface continues up the entire volume of the aorta. It is difficult to visualize thousands of elements at one time, so we only visualize this refinement on the exterior surface mesh.
