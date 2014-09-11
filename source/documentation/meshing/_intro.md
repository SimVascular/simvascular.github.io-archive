
## Introduction

This document describes how to use the Meshing software for discrete and continuous solids. SimVascular meshing includes both open source and commercial options. The commercial mesher in SimVascular is MeshSim(citation) and provides boundary layer, mesh refinement, and isotropic/anisotropic adaptive meshing. MeshSim is a very powerful tool and can provide high quality meshes for irregular and complicated domains. The open source meshing includes the open source libraries of TetGen(citation) and the Vascular Modeling Tool Kit(VMTK)(citation). These tools are combined to provide boundary layer, mesh refinement, and isotropic adaptive meshing. 

The following describes the file formats used to by the meshers in SimVascular:

MeshSim:
	.xmt_txt
	.dsm

TetGen:
	.vtp
	.vtk
	.stl
	.ply 

Discretizing a domain can a tricky process and this document attempts to make this process more understandable and less daunting. This document will teach you the following things:

1. Preparing and running a surface remeshing
2. Preparing and running a volumetric mesh (with or without boundary layer and refinement)
3. Preparing and running an adaptive mesh  

### Using this Manual

Some conventions that will be helpful for you to know:

1. Text in italics represents things that you type into the command window.
2. Buttons, window names, and other labels in a window in the SimVascular program will be in quotes.
3. Pull-down menu selections will be indicated with an arrow ->.
