#Introduction 

Human heart is an intrinsic multi-physics system. It's normal function requires synchronization and coupling of cardiac electrophysiology, tissue (myocardium) mechanics, and hemodynamics. Among the three physics, cardiac mechanics plays a central role, as it serves as the bridge between electrophysiology and blood flow. In a physiological setting, the myocardial cells (myocytes) in the heart tissue initiate and propagate an electrical impulse (action potential) that travels through the heart and drives the contraction of the cardiac muscle, which, in turn, propels the blood to sustain whole body circulation.

The SimVascular <strong>SimCardio</strong> software suite includes a machine learning-based tool to automatically segment heart chambers from medical data and create patient-specific cardiac models, a finite element solver for performing multi-physics cardiac simulations, and python-based plugins to interactively create cardiac models, Purkinje network and set solver parameters from within the main SimVascular GUI application. While some of the interactive plugins are under development, the software allows flexibility to use scripting and perform simulations on high performance clusters.



###Cardiac Segmentation and Geometric Modeling

The SimVascular <strong>Cardiac Image Segmentation Tool</strong> uses pre-trained deep neural network models to automatically generate segmentations for major cardiac structures, the four heart chambers, aorta and pulmonary arteries. The automatic cardiac segmentation tool utilized an ensemble of two-dimensional (2D) convolutional neural networks (CNNs) for automatic segmentation of cardiac structures from three-dimensional (3D) patient images and demonstrated state-of-the-art performance than prior approaches when evaluated on a benchmark dataset containing both magnetic resonance (MR) and computed tomography(CT) scans. This tool can be used from both the SimVascular&#39;s Python plugin in the GUI or from the command line version of the SimVascular Python.



###Multi-physics Finite Element Solver

<strong>svFSI</strong> is a new multi-physics finite element solver designed for computational modeling of the whole heart dynamics. As the next generation underlining solver for the <strong>SimVascular</strong> software, <strong>svFSI</strong> is capable of simulating myocardial electrical activity using state-of-the-art cellular activation models, employ nonlinear hyperelastic material models to simulate tissue mechanics and activation coupling strategies, and perform large deformation fluid-structure interaction (FSI) to simulate the dynamics between the heart tissue and blood flow. <strong>svFSI</strong> could also be used to perform blood flow simulations by imposing the ventricular wall motion extracted from medical image data.

<strong>svFSI</strong> is compatible with several mesh formats and can read a wide range of 2D and 3D element types. <strong>svFSI</strong> could be coupled to <a href="https://trilinos.github.io/index.html">Trilinos</a> linear solver library providing a wide choice of linear solvers and preconditioners for various applications. The methods employed are widely popular among the scientific community and continue to evolve through research and development. The solver is parallelized using MPI for inter-process communication and was demonstrated to scale efficiently on large supercomputing clusters. ParMETIS is used for partitioning the computational domains. Simulation results are outputted into VTK format that can be easily visualized in the free software <a href="https://www.paraview.org"> Paraview</a>.

The source code of <strong>svFSI</strong> is available on <a href="https://github.com/SimVascular/svFSI">GitHub</a> as part of the SimVascular project and the precompiled installers can be downloaded from <a href="https://simtk.org/projects/simvascular#">SimTK</a> website. A variety of examples are also available on <a href="https://github.com/SimVascular/svFSI-Tests">GitHub</a> for the users to get started quickly on using the solver. We recommend users to navigate through all the examples under a particular physics to educate themselves with the variety of options that the solver could accommodate. We also recommend users to use the existing input files as templates and make suitable modifications that meet their needs.

