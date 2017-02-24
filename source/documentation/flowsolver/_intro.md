
## Introduction

**SV Simulation** tool can solve the three-dimensional incompressible Navier-Stokes equations in an arbitrary domain, generally a vascular model reconstructed from image data. This is a complex subject with extensive underlying theory, and therefore this document will focus mainly on the practical aspects of simulation and analysis. 

**Notice**: To get full functions from the Simulation tool, it uses three solvers: **Presolver (svPre), Flowsolver (svSolver), Postsolver (svPost)**. Normally, SimVascular already includes the solvers and can find them automatically. User don't need to set up the solvers. However, in case SimVascular can't find them while users are using the Simulation tool, refer to [Solver Configuration](#solverconfiguration).

The **svSolver** evolved from the academic finite element code PHASTA (Parallel, Hierarchical, Adaptive, Stabilized, Transient Analysis), developed mainly at RPI (Rensselaer Polytechnic Institute, Troy, NY) by Professor Kenneth Jansen. This code was in turned inspired by the Stabilized Finite Element theory developed by Professor Thomas J.R. Hughes during his Stanford years.

Building on the original PHASTA code, there have been a number of important additions and modifications. Professor Charles Taylor’s group at Stanford University developed key additions in the areas of Boundary Conditions and Fluid-Solid Interaction (FSI) coupling. These additions are crucial to represent with a high level of realism the way blood flows in arteries, since this flow is highly dependent on the characteristics of the vascular trees that are downstream of our three-dimensional model, and the compliance of the three-dimensional vascular tree.

### What's New?
Building on the above features, the Marsden lab at Stanford has added additional key functionality enabling efficient and stable solutions with models of the circulatory physiology:

- [**Backflow stabilization.**](docsRefs.html#refSec2) This problem usually arises in large vessels that are exposed to backflow in 3D and 2D flow simulations. This phenomenon may be a cause of divergence of the numerical scheme due to bulk reversal of the flow through an outlet, localized areas of flow reversal or use of a boundary 0D circulation model. 

- Custom and efficient [**linear solver.**](docsRefs.html#refSec3) Accurate simulation of blood flow in vessels require the repeated solution of linear systems of equations with millions of unknowns. Moreover, use of closed-loop boundary models significantly increases the degree of coupling between boundary degrees of freedoms. The **svLS** linear solver is designed to efficiently handle large cardiovascular simulations with arbitrary boundary conditions and reduce solution times. 

- Multiscale Coupling for [**closed loop boundary conditions.**](docsRefs.html#refSec2)  Coupling a three-dimensional finite element solver with a 0D lumped circulation model drastically improves the possibility of realistically simulate patient-specific hemodynamics and phisiology.

### About this guide

This document will teach you:

1. setting initial conditions and boundary conditions
2. setting mechanical properties for vessel walls (if deformable)
3. setting parameters for flowsolver
4. running the flow solver
5. converting and analyzing the simualtion results 

In addition, this tutorial will show you a number of good practices that are important to observe during the simulation process. We will do this considering very simple geometry (a straight cylinder) to illustrate different points in a simple way.

### Theory and Implementation

The theory and implementation details are not covered in this document. For more information about those details, please refer to our [publications page](docsRefs.html).
