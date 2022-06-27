##Introduction

<strong>svFSI</strong> is a new open-source multi-physics finite element solver designed for computational modeling of the whole heart dynamics. As the next generation underlining solver for the <strong>SimVascular</strong> software, <strong>svFSI</strong> is capable of simulating myocardial electrical activity using state-of-the-art cellular activation models, employing nonlinear hyperelastic material models to simulate tissue mechanics and activation coupling strategies, and performing large deformation fluid-structure interaction (FSI) to simulate the dynamics between the heart tissue and blood flow. <strong>svFSI</strong> could also be used to perform blood flow simulations by imposing the ventricular wall motion extracted from medical image data.

<strong>svFSI</strong> is compatible with several mesh formats and can read a wide range of 2D and 3D element types. <strong>svFSI</strong> could be coupled to <a href="https://trilinos.github.io/index.html">Trilinos</a> linear solver library providing a wide choice of linear solvers and preconditioners for various applications. The methods employed are widely popular among the scientific community and continue to evolve through research and development. The solver is parallelized using MPI for inter-process communication and was demonstrated to scale efficiently on large supercomputing clusters. ParMETIS is used for partitioning the computational domains. Simulation results are outputted into VTK format that can be easily visualized in the free software <a href="https://www.paraview.org"> Paraview</a>.