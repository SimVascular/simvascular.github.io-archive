# Installation Instructions for Apple OS X #

<br>
### Supported Versions ###
	
	Mac OS X 10.10 (tested)
	Mac OS X 10.11 (tested)
	Mac OS X 10.12 (tested)

<br>
### Installing SimVascular ###

1. Launch the downloaded package and agree to the terms of service.

2. Drag SimVascular into your Applications folder when this window opens.

	<figure>
	  <img class="svImg svImgXl"  src="documentation/installation/imgs/macDrag.png"> 
	  <figcaption class="svCaption" ></figcaption>
	</figure>

3. Launch SimVascular through your Applications folder or Launchpad.

		A dialog may popup when launching, saying: “SimVascular” can’t be opened because it is from an unidentified developer.”.
		Go to System Preferences -> Security & Privacy -> General, click “Open Anyway”.
		If it doesn't work, turn on  "Anywhere" for "Allow apps downloaded from"; After SimVascular launches, turn it back on to "Mac App Store and identified developers".
		If it doesn't work either, try turn off Fire wall temporarily.

4. SimVascular still provides the old GUI. If you want to launch SimVascular with the old GUI by default:

		Open a terminal.
		Run "touch ~/.simvascular_default_tcl" which creates an empty file.

5. To run simulation, you need to install svSolver (<a href="https://simtk.org/project/xml/downloads.xml?group_id=188" target="_blank">download</a>).

6. (Optional) You can also launch SimVascular using the Terminal. To install the SimvVascular command line tools run:

		sudo /Applications/SimVascular.app/Contents/Resources/setup-symlinks.sh

Notice: 

		svSolver is installed at /usr/local/sv/svsolver/yyyy-mm-dd