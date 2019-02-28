## Introduction

This tutorial demonstrates how to use the General Boundary Conditions (GenBC) framework to define custom inlet and outlet boundary conditions for a computational fluid dynamics (CFD) simulation in SimVascular. It will cover all of the settings and parameters that need to be specified. We will follow a simple example of a cylinder with a prescribed Dirichlet inflow and RCR outflow, which should cover the basics needed to extend the framework to most situations. Additional notes will be included to explain any additional steps needed to extend the framework for more complex models. If you have any questions or if anything is unclear, please do not hesitate to contact us through the public forums!

## What is GenBC?

GenBC provides a framework to define custom inflow and outflow boundary conditions for a CFD simulation. The framework allows users to create an arbitrary lumped parameter network (LPN) layout suitable for their application. Some common examples include a lumped parameter heart model that models contraction of the heart chambers to use as an inlet boundary condition, sophisticated models of the downstream circulation for various areas of the body such as the legs and upper body, or a closed-loop formulation where all outflow of the SimVascular model returns back to the inflow after passing through the veins, heart, and pulmonary arteries!

The current implementation of GenBC is in the Fortran programming language. Users will first have to derive the governing ordinary differential equations for their lumped parameter layout of choice, and implement these equations in Fortran source code. As such, some programming experience with Fortran is recommended, especially if the user wants to use complex and sophisticated lumped parameter layouts. Once the equations and parameters have been implemented in the Fortran code, the code must be compiled to produce a GenBC executable program. This program will then interact with the SimVascular flowsolver during execution to provide the appropriate boundary conditions.


## Cylinder RCR example

This tutorial demonstrates how to use GenBC to define inflow and RCR boundary conditions for flow in a cylinder. Although these 
boundary conditions can be defined using the built-in features in SimVascular they are used here as a simple example of all the 
steps needed to implement GenBC boundary conditions. A graphical representation of the boundary conditions for the cylinder example 
is shown in the figure below. 

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/rcr_cylinder.jpeg">
  <figcaption class="svCaption" >Cylinder with sinusoidal inflow and RCR outflow.</figcaption>
</figure>

The SimVascular project for the cylinder example can be downloaded using the **Cylinder Example Project** link in the menu on the 
left-hand side of this page. The project contains all of the data (image, model, and mesh) needed for the tutorial. You will need 
to manually load the mesh by selecting **Meshes->cylinder_mesh->Load/Unload Mesh** from the **SV Data Manager** menu. The project
has two additional folders

    1) GenBC-program - Contains the Fortran code implementing the GenBC framework 
    2) flow-file - Contains the **inlet.flow** file used to to define the flow rate for Direchlet boundary conditions.


