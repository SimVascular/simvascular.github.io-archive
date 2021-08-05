# Mesh Generation 

The <strong>Cardiac Geometric Modeling Tool</strong> can be used to generate left ventricle (LV) meshes from
segmentation results. These meshes can then be used CFD modeling of LV flow combined with patient medical imaging data. 
The <strong>LV Mesh Generation</strong> tool is used to automatically generate meshes for simulation. It takes as input a 
segmentation and outputs reconstructed LV surface meshes. 

Python scripts are provided for extracting a series of surfaces representing heart wall motion by registering surface meshes 
to time-resolved imaging data using the <a href='https://simpleelastix.github.io/'>SimpleElastix</a> medical image registration software.
These time-series surface meshes can also be interpolated temporally to obtain the resolution needed for simulations.

