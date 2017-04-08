###Saving and Loading Paths  

**Saving Paths:**

That path took a while to create and you would probably prefer not to have to re-do it, so make sure you SAVE your work as you go along!

In the Menu Bar (top left), click on the “Save Paths” button.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/saving_loading_paths/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The following window should appear:

<figure>
  <img class="svImg svImgMd"  src="documentation/modeling/imgs/path_planning/saving_loading_paths/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Make sure you are in the correct project directory. Enter the desired name for the file under “File name:” with the ending “.paths” and click on the “Save” button.  All the paths since opening **SimVascular** that you’ve created will be saved into this one file.  Note that if you choose a filename that already exists, the file will be replaced and the original file will be deleted.  If you select an existing filename, you will be prompted with a dialog box asking if you wish to cancel the save prior to proceeding.

<font color="orange">**WARNING:**</font> To avoid overwriting your old paths, if you close and then restart **SimVascular**, be sure to load your paths file before you save a new path to this paths file.

**Loading Paths:**

If you need to read in a file containing path information, simply go to the File Options pane (top left), and click on the “Load Paths” button. Select the path file you would like to load, and click on the “Open” button.

Paths are not automatically created with the .paths extension, so if you haven’t named your path with a “.paths” extension, you will need to look under “Files of Type → All Types” to load in a previously created path. Note that all paths currently in memory will be deleted and the only paths in memory after loading paths from a file will be those explicitly contained in the specified file. 
