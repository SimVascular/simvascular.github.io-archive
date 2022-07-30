## Troubleshooting
### Bad Elements
In an earlier version of this script, if the fiber generation software encountered an error for any one element in the mesh, the entire generation script would crash. This has been updated with a try-except block that replaces any bad elements with the most recently successfully obtained fiber direction. For example, if the fiber generation works for cells 1 and 2 but fails for 3 and 4, cells 3 and 4 will both be assigned the fiber orientation of cell 2. Given that the cells are numbered in a spatially random fashion (at least subjectively), the effect is to have each bad element populated with a random fiber orientation (**Figure 7**).

<figure>
  <img class="svImg svImgSm" src="documentation/simcardio/fiberGeneration/images/fig7.png" style="width:100%;height:auto;max-width: 50vw;">
  <figcaption class="svCaption" >Figure 7. Bad Elements</figcaption>
</figure>

Strategies to minimize the number of bad elements mainly rely on remeshing with a finer resolution. Future work for the code could consider nearest neighbor interpolation of good elements' fiber orientation to the bad elements. With the current implementation, we can measure how many bad elements there are compared to the total number of elements by calling the following script in the interpreter after running the fiber generation code.

```python
# get error count and total number of cells in mesh
err_ct, ncell
```
For the model shown in **Figure 7**, the error count is 301 and the total number of cells is 217765.

By using a finer mesh, we can obtain a lower error count. This is shown below in **Figure 8**. For the model shown in **Figure 8**, the error count is 3 and the total number of cells is 507823.

<figure>
  <img class="svImg svImgSm" src="documentation/simcardio/fiberGeneration/images/fig8.png" style="width:100%;height:auto;max-width: 50vw;">
  <figcaption class="svCaption" >Figure 8. Improved Results with Local Mesh Refinement</figcaption>
</figure>

### Nearest Neighbor Mesh Re-sampling
The next challenge is that we do not always want to use a fine mesh for our electrophysiology and mechanics simulations due to high computational burden. However, as we have seen, in certain circumstances a fine mesh is required to generate fibers. We therefore need a way to cast the fiber direction information obtained from the fine mesh onto a coarser mesh intended for downstream finite element simulations.

The script to perform remeshing is located at [./biventricular/P1/heat_sim/fibers/](https://github.com/StanfordCBCL/Cardiac_Modeling_Tools/tree/master/cardiac-multiphysics-pipeline/01-fibers/biventricular/P1/heat_sim/fibers/) and is called remeshv5.py. The script uses a nearest neighbor look-up to find the fiber orientation at the closest point on the fine mesh corresponding to the points on the coarse mesh. Unfortunately, the mesh must be converted to point data first and then back to cell data once the nearest neighbor exercise has been performed.

To perform NN Resampling:
1. Convert both the target mesh (course mesh) and the source mesh (finely resolved mesh) to point data and save as 'fibers_p.vtu' in their respective folders ([./biventricular/P1/heat_sim/fibers/](https://github.com/StanfordCBCL/Cardiac_Modeling_Tools/tree/master/cardiac-multiphysics-pipeline/01-fibers/biventricular/P1/heat_sim/fibers/) and [./biventricular/P1-refined/heat_sim/fibers/](https://github.com/StanfordCBCL/Cardiac_Modeling_Tools/tree/master/cardiac-multiphysics-pipeline/01-fibers/biventricular/P1-refined/heat_sim/fibers/))
2. Open and run the remeshv5.py script
3. Open the resulting fiber file, which should be entitled fibers_sampled_p.vtu and should be in the [./biventricular/P2/heat_sim/fibers/](https://github.com/StanfordCBCL/Cardiac_Modeling_Tools/tree/master/cardiac-multiphysics-pipeline/01-fibers/biventricular/P1/heat_sim/fibers/) directory
4. Convert the mesh back to cell data using the [Point Data to Cell Data filter](https://docs.paraview.org/en/latest/UsersGuide/filteringData.html) in paraview
5. Inspect the mesh to ensure that the magnitude of FIB_DIR is always 1.0 (**Figure 9A**). If it is not:
   * Use the calculator filter on the resulting cell data with the expression shown in **Figure 9B**. The result is shown in **Figure 9C**.
   * Last, save the mesh. Select the calculator object in the pipeline and ctrl-s to save. Name the file normals_remeshed.vtu (**Figure 9D**)


<figure>
  <img class="svImg svImgSm" src="documentation/simcardio/fiberGeneration/images/fig9.png" style="width:100%;height:auto;max-width: 50vw;">
  <figcaption class="svCaption" >Figure 9. Improved Results with Local Mesh Refinement</figcaption>
</figure>

The completed coarse mesh shown in **Figure 9D** now has the fiber orientation information from the locally refined mesh. Note how the defect shown in **Figure 7B** has been fixed.

With the refined mesh, generation of the orthogonal second set of fibers can be performed as described above.