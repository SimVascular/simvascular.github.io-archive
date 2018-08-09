## Introduction

This tutorial is for users who wish to use the GenBC framework for setting inlet and outlet boundary conditions in computational fluid dynamics simulations in SimVascular. It will cover all of the settings and parameters that need to be specified. We will follow a simple example of a cylinder with a prescribed Dirichlet inflow and RCR outflow, which should cover the basics needed to extend the framework to most situations. Additional notes will be included to explain any additional steps needed to extend the framework for more complex models. If you have any questions or if anything is unclear, please do not hesitate to contact us through the public forums!

## What is GenBC?

Short for “General Boundary Conditions”, GenBC offers users a framework to customize the inflow and outflow boundary conditions of their SimVascular model beyond the built-on boundary conditions (i.e. prescribed inflow, resistance outflow, RCR Windkessel, and open-loop Coronary). It allows users to craft an arbitrary lumped parameter network (LPN) layout to suit their application. Some common examples include a lumped parameter heart model that models contraction of the heart chambers to use as an inlet boundary condition, sophisticated models of the downstream circulation for various areas of the body such as the legs and upper body, or a closed-loop formulation where all outflow of the SimVascular model returns back to the inflow after passing through the veins, heart, and pulmonary arteries!

The current implementation of GenBC is in the Fortran programming language. Users will first have to derive the governing ordinary differential equations for their lumped parameter layout of choice, and implement these equations in Fortran source code. As such, some programming experience with Fortran is recommended, especially if the user wants to use complex and sophisticated lumped parameter layouts. Once the equations and parameters have been implemented in the Fortran code, the code must be compiled to produce a GenBC executable program. This program will then interact with the SimVascular flowsolver during execution to provide the appropriate boundary conditions.

We are currently working on a graphical user interface which will allow users to easily specify a lumped parameter layout using an interactive plugin. This should greatly simplify the user experience and allow for more rapid iteration on different lumped parameter layouts for cardiovascular simulation.

## Cylinder RCR example

For this tutorial, we will use a simple example of a cylinder with a prescribed inflow and RCR boundary conditions. While these simple boundary conditions can be accomplished using the built-in features in SimVascular, we felt that they provide a good test case that provides a gentle introduction to all the details that goes into implementing a GenBC simulation. A graphical representation of our test case is illustrated in the figure below. You may also find the accompanying SimVascular project and GenBC source files in a link on the left hand side toolbar.

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/rcr_cylinder.jpeg">
  <figcaption class="svCaption" >Cylinder with sinusoidal inflow and RCR outflow.</figcaption>
</figure>
