## Appendix: Creating the mesh for ALE simulations using Meshmixer

In this appendix section, we discuss an alternative method for producing a wall mesh using the software Meshmixer. For users with highly complex geometrical models with a large number of bifurcations, this method provides a higher degree of flexibility and robustness, at the cost of a higher number of steps and higher complexity.

To run an FSI simulation we need a mesh for both the structural domain and the fluid domain. These two meshes must have their interfacial nodes coincide exactly in order to satisfy the interfacial conditions that result from conservation of mass and momentum. The coincident nodes of the fluid mesh are mapped onto the corresponding nodes on the structural mesh and the solution of velocity, displacement, pressure, etc. are treated as equal in the structural and fluid domains.

We will now go through the procedure to create such a mesh step by step.

  1. Create the geometry for the fluid domain
  2. Create the geometry for the structural domain
  3. Create the mesh for the structural domain
  4. Create the mesh for the fluid domain
  
We will use both SimVascular and Meshmixer, which is a freely available software from [https://www.meshmixer.com](https://www.meshmixer.com).
Meshmixer is a versatile tool that is useful for preparing meshes.
We will cover a subset of features in Meshmixer that is convenient for preparing meshes for FSI simulations, but more detailed documentation can be found at [https://www.mmmanual.com](https://www.mmmanual.com).

   










































