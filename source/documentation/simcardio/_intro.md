# Cardiac Modeling Guide 

Human heart is an intrinsic multi-physics system. It's normal function requires synchronization and coupling of cardiac electrophysiology, tissue (myocardium) mechanics, and hemodynamics. Among the three physics, cardiac mechanics plays a central role, as it serves as the bridge between electrophysiology and blood flow. In a physiological setting, the myocardial cells (myocytes) in the heart tissue initiate and propagate an electrical impulse (action potential) that travels through the heart and drives the contraction of the cardiac muscle, which, in turn, propels the blood to sustain whole body circulation.

Here we present a software suite for cardiac modeling, which includes a machine learning-based tool to automatically segment heart chambers from medical data and create patient-specific cardiac models, a finite element solver for performing multi-physics cardiac simulations, and python-based plugins to interactively create cardiac models, Purkinje network and set solver parameters from within the main SimVascular GUI application. While some of the interactive plugins are under development, the software allows flexibility to use scripting and perform simulations on high performance clusters.


####[<strong>Cardiac Geometric Modeling Tool</strong>](http://simvascular.github.io/docsSimCardio.html#automatic-cardiac-modeling): 
This SimVascular tool provides an automated workflow to generate CFD-ready models from medical images. It uses pre-trained deep neural network models to automatically generate segmentations for major cardiac structures, the four heart chambers, aorta and pulmonary arteries. The automatic cardiac segmentation tool utilized an ensemble of two-dimensional (2D) convolutional neural networks (CNNs) for automatic segmentation of cardiac structures from three-dimensional (3D) patient images and demonstrated state-of-the-art performance than prior approaches when evaluated on a benchmark dataset containing both magnetic resonance (MR) and computed tomography(CT) scans. This tool can be used from both the SimVascular&#39;s Python plugin in the GUI or from the command line version of the SimVascular Python.


####[<strong>Multi-physics Finite Element Solver</strong>](http://simvascular.github.io/docssvFSI.html):
<strong>svFSI</strong> is a new multi-physics finite element solver designed for computational modeling of the whole heart dynamics. As the next generation underlining solver for the <strong>SimVascular</strong> software, <strong>svFSI</strong> is capable of simulating myocardial electrical activity using state-of-the-art cellular activation models, employ nonlinear hyperelastic material models to simulate tissue mechanics and activation coupling strategies, and perform large deformation fluid-structure interaction (FSI) to simulate the dynamics between the heart tissue and blood flow. <strong>svFSI</strong> could also be used to perform blood flow simulations by imposing the ventricular wall motion extracted from medical image data.


####[<strong>Purkinje Network Plugin</strong>](http://simvascular.github.io/docsSimCardio.html#purkinje):
SimVascular provides a Purkinje plugin that can be used to generate Purkinje network on arbitrary patient-specific cardiac models. Our Purkinje plugin uses a fractal-tree-based method to generate the network and provides a simple interface to adjust the parameters that control the network density and coverage. The Purkinje mesh is then exported in vtu format compatible with [**svFSI**](http://simvascular.github.io/docssvFSI.html) for the ensuing electrophysiology simulations.


