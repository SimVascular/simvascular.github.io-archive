##Getting Started

###Launching

When you first launch **SimVascular**, you will see the following windows:background window and startup window.

<figure>
  <img class="svImg svImgLg"  src="documentation/userguide/imgs/getting_started/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<figure>
  <img class="svImg svImgLg"  src="documentation/userguide/imgs/getting_started/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The Startup Window will automatically disappear once SimVascular has loaded. The black Background Window will remain open, running in the background, for the entirety of your session. 

<font color="orange">**WARNING:**</font>  Do not close the black Background Window!

###Overview

Once **SimVascular** has loaded, you will see the following main window:

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/getting_started/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**BOX A | Menu Bar:** The menu bar that is enclosed by box “A” (top left corner) includes some file options. These functions will be used to load/save files such as paths and groups that you have created in **SimVascular**. It also provides view control and you can show/hide tabs in BOX B and BOX D by toggling on/off in the Image Menus and Work Menus. 

<figure>
  <img class="svImg svImgMd"  src="documentation/userguide/imgs/getting_started/3_5.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**BOX B | Display Options:** The area that is enclosed by box “B” (top right corner) includes all of the display options. The tabs that are included in this pane allow you to change the settings for displaying your medical imaging data.

**BOX C | Display Windows:** The area that is enclosed by box “C” (left half) houses the display windows. The top display window (the largest window) is the 3D display. This is where operations, such as rotating medical imaging data and creating geometric models in three-dimensional space, will be performed. The smaller, bottom two windows are 2D windows that will be useful for 2D operations such as image segmentation.

**BOX D | Functional Toolbox:** The area that is enclosed by box “D” (bottom right corner) includes the main functional components of **SimVascular**. The tabs that are housed within this pane will allow you to build a solid, 3D model from medical imaging data, mesh that solid model into a 3D volumetric finite element mesh, apply boundary conditions to your finite element mesh, and create the files that are needed to initialize your flow simulation. It will also help you post-process the files that you generate in your flow simulation.

<font color="red">**HELPFUL HINT:** </font>  The red arrows indicate panes within the window that can be resized. Just simply click and drag on the pane borders to resize each pane. For your convenience, you can enlarge or hide some panes.

###Creating a Working Directory

It is recommended that the files that are created for each project are all saved in directories outside of the directory containing the imaging data. Create a new directory for these project files in a convenient place on your hard drive. Make sure that the project directory file name does not have any spaces in it or this may cause problems in future steps. To create a project directory:

	Menu: File → Select Project Directory
	Find the working directory “demo”, click the button “OK”
	“Create a directory?” Click, “Yes.”
	“Set default filenames using project directory name?” Select, “Yes.”

<figure>
  <img class="svImg svImgSm" src="documentation/userguide/imgs/getting_started/4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>