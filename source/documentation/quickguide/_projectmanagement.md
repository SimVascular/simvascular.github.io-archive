##Project Management

To work on a modeling/simualtion case, it is required to create a SimVascular (SV) Project first. The project can organize, manage, save all the required data. 

**To create a project:**

	Menu: File → Create SV Project...
	Provide a name for the new project
	Provde a diretory/folder in which the project will be created
	Click the button “OK”

<figure>
  <img class="svImg svImgMd" src="documentation/quickguide/imgs/newprojectdialog.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A new project is created in Data Manager as below. It has no actual data so far. Later, data will be added or created under those data nodes according to data types.

<figure>
  <img class="svImg svImgSm" src="documentation/quickguide/imgs/emptyproject.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

If you add/remove data nodes, or change data of a data node inside a SV project, you need to save those changes to the underlying files.

**To save SV projects:**

	Method 1: Toolbar -> Save SV Projects
	Method 2: Menu -> File -> Save Sv Projects

You can close a project with exiting SimVascular. Make sure you save the project before closing it. After closing a project, it's removed from Data Manager.


**To close a SV project:**

	Right click the data node of a SV project in Data Manager
	Click "Close SV Project" in the popup menu


**Undo/Redo is implemented for data changes.** To restore the data to the previous state, apply Undo/Redo.

	Undo: Ctrl+Z
	Redo: Ctrl+Y

###Add Image to Project

**To use an image for a project, the image is required to be added to the project.**

**To add a image to a project:**

	Right click the data node "Images" in the project "SVProject" in Data Manager
	Click "Add/Replace Image" in the popup menu
	Choose an image and click "Open"
	"Do you want to copy the image as vti into the project?" Choose Yes or No
	If Yes, "Do you want to scale the image (for unit conversion)?": for instance, 0.1 if from mm to cm.

Then the image is added under the data node "Images". At the same time, the image is shown in Display. If you choose to copy the image to the project, the project is portable and you can transfer the project to another computer and continue working on it.

<font color="red">**HELPFUL HINT:** </font> If you want to add a series of DICOM images to the project, just choose one of them, SimVascular will load all the images in the same folder.
