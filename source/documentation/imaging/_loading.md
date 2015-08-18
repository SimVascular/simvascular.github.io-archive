##Loading Medical Imaging Data##

**SimVascular** allows you to load in your image data as VTI data. Once you have the new window open, in the Menu bar, select File → Load Image (VTI). Choose the file: sample\_data/image_data/vti/sample\_data-cm.vti, and then click on “Open.” 

<figure>
  <img class="svImg svImgMd" src="documentation/imaging/imgs/loading/1.jpg">
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:**</font> Unfortunately, you cannot load in other image data into **SimVascular** once you have loaded in the first data set. You have to open another window. You can always close the current window you are working on as long as you have already saved any work that you have done during the given session.  You can also have multiple windows of SimVascular open at once.

You can also load your image data as DICOM Data (CT or MRA). In Functional Toolbox, select the tab DICOM. Click on the “Browse” button for the “Image Data Directory:” Choose the folder sample\_data/image\_data/volume, and then click on OK. Click on the “Load Volumetric Image Data” button. This time the software will ask you, “Would you like to convert this volume from mm to cm?” Select “Yes.” Another window will ask, “Would you like to save this volume as a VTI file?” This allows you to convert DICOM data to VTI data. This may be useful in the future but for now select, “No.” 

<font color="green">**ALTERNATIVE:**</font>  You could also have typed in the file name for the first image in the data series (not the directory!) into the field for “Image Data Directory:” 
