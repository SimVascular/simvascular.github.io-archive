# Getting Started 

This document provides beginning users with the basic knowledge needed to get started using the SimVascular suite of software
applications. The SimVascular software suite comprises the following applications

<ul style="list-style-type:none;">
  <li> <b> SimVascular </b> - Interactive image-based modeling pipeline application </li>
  <li> <b> svZeroDSolver </b> - 0D (lumped parameter) solver </li>
  <li> <b> svOneDSolver </b> - 1D fluids solver </li>
  <li> <b> svSolver </b> - Computational fluid dynamics (CFD) solver </li>
  <li> <b> svFSI </b> - Coupled fluid-solid solver </li>
</ul>

Throughout this document the interactive image-based modeling pipeline application is referred to as just SimVascular.
Input files for all of the solver applications can be created and optionally executed from the SimVascular GUI.

The <a href="#introduction"> Introduction </a> section describes important SimVascular concepts. 
The following <a href="#gui"> GUI </a> section then describes the SimVascular graphical user interface (GUI) and its basic functionality. 
The <a href="#tutorial"> Tutorial</a> section demonstrates the steps in the SimVascular image-based modeling pipeline, 
from medical image data segmentation to patient-specific blood flow simulation. A model of an aorta and two iliac 
arteries is created from medical imaging data.  A finite element mesh is then generated from the model and used in a 
CFD simulation of blood flow in the aorta and iliac arteries. 

Another useful resource for learning how to use SimVascular are the 
<a href="https://www.youtube.com/playlist?list=PL1CBZ8Wh-xvSKUsuBA4MM4Jba-psVdxXT">SimVascular Online Tutorials</a>. This series 
of recent videos demonstrate all the steps in the modeling pipeline presented in the <a href="#tutorial"> Tutorial</a> below. 

Images taken of the 
<a href="https://simtk.org/frs/download_confirm.php/file/5113/DemoProject.zip?group_id=930"> Demo Project </a>
are used to illustrate certain concepts throughout this document.


