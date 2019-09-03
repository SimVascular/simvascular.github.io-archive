
## Introduction

### Mesh Generation

Discretization, also known as grid or mesh generation, is defined as the process of breaking up a physical domain into smaller sub-domains (usually called elements).  Discretization is necessary in order to facilitate the numerical solution of partial differential equations.  In other words, there are few analytic solutions for geometries of engineering interest thus the geometry must be divided into an aggregate of simpler pieces for analysis.  

Automatic mesh generation has been an area of intense research for decades, and a tremendous amount of literature and numerous algorithms have been developed.  There are three fundamental challenges in the field:  robustness, mesh quality, and computational efficiency in generating the mesh.  A recent survey indicated there were over 80 commercial and academic meshing products available, of which 39 automatically generated tetrahedral ("tet") elements compared to 20 that performed unstructured hexahedral ("brick") mesh generation.  The current dominance of tetrahedral meshing can be attributed most notably to its ability to robustly mesh arbitrary, complex geometries.  In addition, the use of tetrahedral elements often simplifies the process of adapting the mesh during simulation.

Once we have a geometric (solid) model representing a device of interest, we need to discretize the flow domain into little pieces (called elements) for simulation.  This process is known as mesh generation. 

We will review several important concepts prior to discussing mesh generation:

1.	For the applications discussed herein, a geometric model representing each energy domain of interest (fluid, mechanical, thermal, etc.) must exist.  That is, if you are simulating the mechanical forces of a balloon expandable stent deployed in air, you need a geometric model representing at a minimum the stent geometry.  However, if you want to simulate flow around a stent deployed in a vessel, you need a geometric model of the flow lumen (i.e. flow domain) not of the stent itself.

2.	There are multiple sources of geometric models.  The most common source of geometry in the device community is likely from commercial CAD packages (SDRC I-deas, SolidEdge, SolidWorks, Pro-E, etc.).  A second potential source of geometric models is digitized data (imaging data, etc.).  Finally, a less common (but increasingly important) source of data is the results of a previous simulation.   For example, if one simulated the deployment of a stent into a diseased artery, the results of this analysis (i.e. displacements) could be used for the initial geometry for a subsequent blood flow analysis around the deployed stent.

3.	As will be shown using a beam example, a simple geometry allows for great flexibility in choice of element type (e.g. tetrahedral vs. hexahedral elements).  However, for many geometries of engineering interest, the complex geometry motivates the need for automatic mesh generation and often restricts the user to tetrahedral or possibly hex-dominate meshing.  Pure hexahedral mesh generation for complex geometries is an area of active research.

In this manual, a finite-octree based tetrahedral mesh generator is used.  The basic idea behind finite-octree methods is to decompose a complex geometry into simpler pieces and then mesh the individual pieces using a mesh generation technique (e.g. templates, Delaunay triangulation (see Figure 1), etc.). An example quadtree decomposition (the 2-D analog of finite-octree) is shown in Figure 2.  A structured (i.e. tensor-product) quadtree grid that completely fills the space occupied by the geometric model (i.e. bounding box) is initially created based on a user-defined mesh density.  Subdivision of the octants is then performed to reach a desired complexity of the geometry contained therein.  Restricting the “level difference” or gradation between adjacent octants is essential to preserve mesh quality.  After the geometry is decomposed, surface meshing is performed using projected 2-D Delaunay surface triangulation.  Templates are used to create the interior volume mesh (i.e. octants contained completely inside of the geometric model), and 3-D Delaunay triangulation is used in the boundary octants (i.e. octants containing part of the geometric model boundary) to finish the meshing process.

Finally, we note that there are several techniques to evaluate the quality of a given discretization.  For the exterior surface mesh, a visual inspection may provide useful information.  However, it is impractical to visualize the individual tetrahedral elements for large meshes, so geometric-based mesh quality indicators are used.  Specifically, three mesh quality indicators will be discussed (see Figure 3): 

- Minimum solid angle
- Radius ratio
- Aspect ratio 

In the present work, a combination of these quality indicators is used by an iterative mesh optimization algorithm to improve the overall quality of the mesh.  It should be noted that there is current research interest in generating error estimators that include both solution and geometric information that may lead to more accurate solutions while requiring ewer elements.

<figure>
<img class="svImg svImgLg" src="documentation/meshing/img/Delaunay_Criterion.png">
  <figcaption class="svCaption" >
    Figure 1. Delaunay criterion.  The Delaunay criterion states that no other point in the triangulation can fall within the circumscribing sphere (circle in 2-D) of the points defining a simplex in the triangulation.  Figure (a) shows a valid Delaunay triangulation of four points in $\mathbb{R}^2$ while (b) shows a non-Delaunay triangulation of the same four points.  In 2-D, the Delaunay criterion minimizes the maximum interior angle producing an optimal triangulation for a given set of points.
  </figcaption>
</figure>

<figure>
<img class="svImg svImgLg" src="documentation/meshing/img/Quadtree.png">
  <figcaption class="svCaption" >
    Figure 2. Quadtree decomposition.  The figure shows an example quadtree decomposition (directly analogous to octree decomposition in 3-D) that is used to divide the geometry into less complex individual pieces for automatic mesh generation.
  </figcaption> 
</figure>

<figure>
<img class="svImg svImgLg" src="documentation/meshing/img/Quality_Measures.png">
  <figcaption class="svCaption" >
    Figure 3. Geometric mesh quality measures.  Shown are 2-D geometric mesh quality measures with direct analogies in 3-D. The radius ratio (a) is the ratio of the radius of the maximum inscribed circle (sphere in 3-D) over the radius of the circumscribed circle (sphere in 3-D).  The aspect ratio (b) is a ratio of the minimum height to the maximum base length. The maximum/minimum interior (dihedral in 3-D) angle is shown in (c). In this lab we will construct meshes automatically for two different geometries.  The first example is that of an idealized vessel (i.e. cylinder).  The second example will be an idealized stent, deployed in an idealized stenotic vessel with incomplete apposition.
  </figcaption> 
</figure>

### SimVascular Meshers

This document describes how to use the Meshing software for discrete and continuous solids. SimVascular meshing includes both open source and commercial options. The open source meshing includes the open source libraries of TetGen and the Vascular Modeling Tool Kit(VMTK). These tools are combined to provide boundary layer, mesh refinement, and isotropic adaptive meshing. The commercial mesher in SimVascular is MeshSim and provides boundary layer, mesh refinement, and isotropic/anisotropic adaptive meshing. MeshSim is a very powerful tool and can provide high quality meshes for irregular and complicated domains.

