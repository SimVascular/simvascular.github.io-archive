# Installation Instructions for Apple OS X #

<br>
### Supported Versions ###
	
Mac OS X versions 10.11 or higher.

	SimVascular is compiled on MacOS 10.11 and should be compatible with newer versions of MacOS. 

<br>
### Installing SimVascular ###

1. Download the SimVascular MacOS installer from [SimTK](https://simtk.org/frs/index.php?group_id=188).

2. Double-click on the downloaded installation (.dmg) file.

3. Agree to the terms of service.

4. Drag the SimVascular application to the Applications folder.

	<figure>
	  <img class="svImg svImgXl"  src="documentation/installation/imgs/macDrag.png"> 
	  <figcaption class="svCaption" ></figcaption>
	</figure>

5. Launch SimVascular through your Applications folder or Launchpad.

		SimVascular is not a registered app with Apple so when you open it a warning dialog is displayed stating “SimVascular can’t be opened because it is from an unidentified developer.”. You can then open SimVascular by going to 'System Preferences>Security & Privacy>General' and click on “Open Anyway”.        

6. Setup SimVascular to run from a terminal. (optional)

		sudo /Applications/SimVascular.app/Contents/Resources/setup-symlinks.sh

		This creates a script called 'simvascular' in /usr/local/bin/ that can be executed from the command line.

<br>
### Installing svSolver ###

1. Download the svSolver MacOS installer.

2. Double-click on the downloaded installation (.pkg) file.

3. Follow the instructions.

4. The solver is installed in /usr/local/sv/svsolver/yyyy-mm-dd

### Installing MPI

	svSolver uses MPICH implementation of MPI. To install MPI type the follow command in a terminal window

  		brew install mpich2

  	Note that some applications may install a different implementation (e.g. Open MPI) of MPI. This may interfere with the MPI version needed by the svSolver or cause the solver not to execute correctly.



