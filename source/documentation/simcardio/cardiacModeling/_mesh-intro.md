# Mesh Generation 

One application of the <strong>Cardiac Geometric Modeling Tool</strong> is to generate left ventricle (LV) meshes from the 
segmentation results. We can use these meshes to perform computational fluid dynamics (CFD) modeling of LV flow combined with 
patient medical imaging data. A typical LV model construction pipeline usually starts with segmentation of the LV by manual 
delineation followed by mesh generation and registration techniques using separate software tools. In SimVascular, we have included 
an <strong>LV Mesh Generation</strong> tool to automate each of these steps to generate simulation-ready meshes.

The <strong>LV Mesh Generation</strong> tool takes in the generated segmentation and output reconstructed LV surface meshes 
for CFD simulations. Besides we also provide Python scripts for registering the surface meshes to compute wall motion 
using <a href='https://simpleelastix.github.io/'>SimpleElastix</a>. These registered surface meshes can also be interpolated to 
obtain sufficient temporal resolution.

