### Inspecting Meshes
After creating a mesh in SimVascular, you can view the surface and make a visual inspection of the surface of the mesh. However, this is based purely on your idea of a "quality" mesh, and you can only see the surface of a volume mesh. In order to inspect a mesh more closely, we use open source software ParaView. ParaView contains filters to identify multiple quality measure such as volume and aspect ration. 

To visualize and inspect a mesh in paraview, follow the steps below:

1) Download, Install, and Run ParaView. Go to File->Open->Choose the vtu file generated when saving the mesh.

2) Using the dropdown menus, select Filters->Mesh Quality. 

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/Mesh_Filters.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

3) Adjust the paramters of the Filter in the Properties tab on the left hand side of the ParaView screen.

4) Change Tet Quality Measure to the new desired mesh. Here we select Volume:

5) To visualize the metric, select the Representation to be "Volume", and select the Array under Coloring to be "Quality".

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/Mesh_Volume_Quality.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

6) We can similarly do the same thing for many other metrics such as Minimum Dihedral Angle.

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/Mesh_Dihedral_Quality.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

7) Apply any other qulity type to visualize the range and values of the corresponding metric. 
<br>
<br>
<br>
<br>
