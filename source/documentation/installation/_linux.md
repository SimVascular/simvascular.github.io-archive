# Installation Instructions for Linux #

<br>
### Supported Versions ###
	
	Ubuntu 14 (tested)
	Ubuntu 16 (tested)

<br>
### Installing SimVascular ###

1. Install the SimVascular deb package. Notice: for Ubuntu1 16, you need to install Ubuntu Software Center before installing the deb package!

2. To launch SimVascular:

		Go to Unity Dash, search for "SimVascular"
		Click the SimVascular icon.

3. Notice: it may mention missing some libs during launch, according to the information, try "sudo apt-get install [missing lib]" to install them. Most likely you need to run:

		sudo apt-get install libgstreamer0.10-0
		sudo apt-get install libgstreamer-plugins-base0.10-dev

		Sometimes, you may need to:
		sudo apt-get install libxss
		sudo apt-get install libxmu-dev (for OpenCASCADE)
		sudo apt-get install libxi-dev  (for OpenCASCADE)

4. SimVascular still provides the old GUI. If you want to launch SimVascular with the old GUI by default:

		Open a terminal.
		Run "touch ~/.simvascular_default_tcl" which creates an empty file.

		you may need to:
		sudo apt-get install tcllib tklib (for old GUI)
		sudo apt-get install tcl-dev tk-dev (for old GUI)

5. To run simulation, you need to install svSolver (<a href="https://simtk.org/project/xml/downloads.xml?group_id=188" target="_blank">download</a>), and MPI:

		For Ubuntu 14:		
		sudo apt-get install libmpich2-dev

		For Ubuntu 16:
		sudo apt-get install libmpich-dev

6. (Optional) To add SimVascular to your path , you will need to run the post-install script:

		sudo bash setup-symlinks.sh
		
	This script places symbolic links in /usr/local/bin to the simvascular executable scripts. You may wish to edit the symbolic links.

Notice: 

		Simvascular is installed at /usr/local/sv/simvascular/yyyy-mm-dd
		svSolver is installed at /usr/local/sv/svsolver/yyyy-mm-dd

<br>
<br>
<br>
