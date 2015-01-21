# Installation Instructions for Linux #

1. Click "Download Installation Package" on the SimVascular homepage. Once on the simtk.org choose the download link for Linux.

2. Login to SimTk or create a new account.

3. List your intended use for the software and agree to the license agreement. THe download should begin, if not, click the link given and follow the instructions.

4. You may need to install libxss, mpich2, or libgfortran. If you're on linux these may work:

		sudo apt-get install libxss
		sudo apt-get install mpich2
		sudo apt-get install gfortran

5. To use Meshim on linux copy your Meshsimlicense file into the simvascular directory and rename it meshsim-license.dat

6. To add SimVascular to your path (this is very helpful with using svsolver), you will need to run the post-install script:

		sudo bash setup-symlinks.sh

	This script places symbolic links in /usr/local/bin to the simvascular executable scripts.
	You may wish to edit the symbolic links.

	Note that the solver can be run with mpiexec.
	For example to run on two processors:

		cd /folder/with/input
		mpiexec -np 2 svsolver
<br>
<br>
<br>