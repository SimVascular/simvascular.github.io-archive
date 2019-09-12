<h1>User Guide </h1>

This section describes the concepts needed to define a 1D network model and execute a 1D simulation for it. 


<h3> Nodes and Segments </h3>

In the 1D formulation the arterial network is decomposed into arterial **Segments** connected to each other at **Nodes**. The 1D network
geometry is defined by the 3D coordinates of its **Nodes**. 

<br>
<figure>
  <img src="documentation/1d_simulation/solver/images/3d-model.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <img src="documentation/1d_simulation/solver/images/1d-network-model.png" style="float: left; width: 40%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
  <figcaption> <i>The geometriy of a 3D model (right) is represented by a 1D network (left) of Segments (green) and Nodes (blue). </i></figcaption>
</figure>
<br>

A **Segment** is used to represent a segment of a vessel as a cylinder with a tapered cross section. It connects two joints, one joint and one inlet/outlet or directly one inlet with one outlet.



