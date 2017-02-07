# Installation Instructions for Linux #

<br>
### Supported Versions ###
	
	Ubuntu 14 (tested)
	Ubuntu 15
	Ubuntu 16

<br>
### Installing SimVascular ###

1. Unpack the installer (tar file).

2. Before launching SimVascular, you may need to install a few extra packages. If you're on linux these may work:

		sudo apt-get install libxss
		sudo apt-get install libxmu-dev (for OpenCASCADE)
		sudo apt-get install libxi-dev  (for OpenCASCADE)

3. To use Meshim on linux copy your Meshsim license file into the simvascular directory and rename it meshsim-license.dat

4. To add SimVascular to your path , you will need to run the post-install script:

		sudo bash setup-symlinks.sh

	This script places symbolic links in /usr/local/bin to the simvascular executable scripts.
	You may wish to edit the symbolic links.

5. SimVascular contains two different GUIs. To use the new GUI, please first create an empty text file your home folder, for example "~/.simvascular\_default_qt"

6. To lanuch SimVascular, open a terminal and run "simvascular". If it mentions missing some libs, according to the information, try "sudo apt-get install [missing lib]" to install them.

<br>
<br>
<br>
