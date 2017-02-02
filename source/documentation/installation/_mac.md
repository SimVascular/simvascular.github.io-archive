# Installation Instructions for Apple OS X #

1. Launch the downloaded package and agree to the terms of service.

2. Drag SimVascular into your Applications folder when this window opens.

	<figure>
	  <img class="svImg svImgXl"  src="documentation/installation/imgs/macDrag.png"> 
	  <figcaption class="svCaption" ></figcaption>
	</figure>

3. SimVascular contains two different GUIs. To use the new GUI, please first create an empty text file your home folder:
	
		Open a terminal (found underneath Launchpad->Other).
		Type “touch ~/.simvascular_default_qt”

4. Launch SimVascular through your Applications folder or using the Terminal (see step 4).

		A dialog may popup when launching, saying: “SimVascular” can’t be opened because it is from an unidentified developer.”.
		Go to System Preferences -> Security & Privacy -> General, click “Open Anyway”.
		If it doesn't work, turn on  "Anywhere" for "Allow apps downloaded from"; After SimVascular lauches, turn it back on to "Mac App Store and identified developers".

5. (Optional) You can also launch SimVascular using the Terminal. To install the SimvVascular command line tools run:

		sudo /Applications/SimVascular.app/Contents/Resources/setup-symlinks.sh


