# Installation Instructions for Linux #

<br>
### Supported Versions ###
	
	Ubuntu 14 (tested)
	Ubuntu 15
	Ubuntu 16 (tested)

<br>
### Installing SimVascular ###

1. Unpack the installer (tar file).

2. SimVascular contains two different GUIs. To launch SimVascular:

		Open a terminal
		Go to SimVascular installation directory
		Run "./simvascular -qt" (for new GUI)
		Run "./simvascular" (for old GUI)

3. Notice: it may mention missing some libs during launch, according to the information, try "sudo apt-get install [missing lib]" to install them. Most likely you need to run:

		For new GUI:
		sudo apt-get install libgstreamer0.10-0
		sudo apt-get install libgstreamer-plugins-base0.10-dev

		For old GUI:
		sudo apt-get install tcllib tklib
		sudo apt-get install tcl-dev tk-dev

		Sometimes, you may need to:
		sudo apt-get install libxss
		sudo apt-get install libxmu-dev (for OpenCASCADE)
		sudo apt-get install libxi-dev  (for OpenCASCADE)

4. To use SimVascular Simulation tool, you need to install MPI:

		For Ubuntu 14:		
		sudo apt-get install libmpich2-dev

		For Ubuntu 16:
		sudo apt-get install libmpich-dev

5. (Optional) To add SimVascular to your path , you will need to run the post-install script:

		sudo bash setup-symlinks.sh

	This script places symbolic links in /usr/local/bin to the simvascular executable scripts.
	You may wish to edit the symbolic links.

6. (Optional) To use Meshim (if applicable) on linux,  copy your Meshsim license file into the simvascular directory and rename it meshsim-license.dat

<br>
<br>
<br>
