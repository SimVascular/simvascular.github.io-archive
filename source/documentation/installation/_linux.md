# Installation Instructions for Linux #

<br>
### Supported Versions ###
	
	Ubuntu 14 (tested)
	Ubuntu 15

<br>
### Installing SimVascular ###

1. Unpack the installer (tar file).

2. Before launching SimVascular, you may need to install a few extra packages. If you're on linux these may work:

		sudo apt-get install libxss
		sudo apt-get install libxmu-dev (for OpenCASCADE)
		sudo apt-get install libxi-dev  (for OpenCASCADE)

3. To use SimVascular Simulation tool, you need to install MPI:

		sudo apt-get install libmpich2-dev

4. SimVascular contains two different GUIs. To launch SimVascular:

		Open a terminal
		Go to SimVascular installation directory
		Run "./simvascular -qt" (for new GUI)
		Run "./simvascular" (for old GUI)

5. (Optional) To add SimVascular to your path , you will need to run the post-install script:

		sudo bash setup-symlinks.sh

	This script places symbolic links in /usr/local/bin to the simvascular executable scripts.
	You may wish to edit the symbolic links.

6. (Optional) To use Meshim (if applicable) on linux,  copy your Meshsim license file into the simvascular directory and rename it meshsim-license.dat

7. Notice: If it mentions missing some libs during launch, according to the information, try "sudo apt-get install [missing lib]" to install them.


<br>
<br>
<br>
