# Installation Instructions for Linux #

<br>
### Supported Versions ###

Ubuntu 14.04

	SimVascular requires a newer version of GLIBCXX than is shipped with Ubuntu 14.

Ubuntu 16.04 and 18.04

	No system updates should be required.

Red Hat 7 / CentOS 7

	Red Hat 7 releases are considered alpha with very limited testing.

	CentOS 7 requires an updated compiler.


<br>
### Installing SimVascular on Ubuntu 14.04 ###

1. Download the SimVascular Ubuntu installer from [SimTK](https://simtk.org/frs/index.php?group_id=188). 

2. Double-click on the downloaded installation (.deb) file.

		SimVascular is installed in /usr/local/sv/simvascular/yyyy-mm-dd, where yyyy-mm-dd represents the SimVascular release date (e.g. 2018-11-25).

3. Install the gcc-4.9 compiler to get a newer version of GLIBCXX.

		% sudo add-apt-repository ppa:ubuntu-toolchain-r/test
		% sudo apt-get update
		% sudo apt-get install gcc-4.9 g++-4.9

4. To launch SimVascular:

		Go to Unity Dash and search for "SimVascular"
		Click the SimVascular icon.

5. Setup SimVascular to run from a terminal. (optional)

		sudo bash /usr/local/sv/simvascular/yyyy-mm-dd/setup-symlinks.sh

		This creates a script called 'simvascular' in /usr/local/bin/ that can be executed from the command line.


### Installing SimVascular on Ubuntu 16.04 and 18.04 ###

1. Download the SimVascular Ubuntu installer from [SimTK](https://simtk.org/frs/index.php?group_id=188). 

2. Double-click on the downloaded installation (.deb) file.

		SimVascular is installed in /usr/local/sv/simvascular/yyyy-mm-dd, where yyyy-mm-dd represents the SimVascular release date (e.g. 2018-11-25).


3. To launch SimVascular:

		Go to Unity Dash and search for "SimVascular"
		Click the SimVascular icon.


4. Setup SimVascular to run from a terminal. (optional)

		sudo bash /usr/local/sv/simvascular/yyyy-mm-dd/setup-symlinks.sh

		This creates a script called 'simvascular' in /usr/local/bin/ that can be executed from the command line.


### Installing SimVascular on CentOS 7 ###

1. Download the SimVascular CentOS installer from [SimTK](https://simtk.org/frs/index.php?group_id=188). 

		The intaller is a .tar.gz file that is manually installed.

2. Create a /usr/local/package directory if it does not already exist.

		% su root

		% cd /usr/local

		% mkdir package

3. Untar the contents of the installer .tar.gz file to the SimVascular application directory.

		% tar xzvf ~/Downloads/SimVascular-centos7-x64.Nov.25-2018.tar.gz

		SimVascular is installed in /usr/local/package/simvascular/2018-11-25

4. Execute a shell script to setup SimVascular to run from the command line.

		% /usr/local/package/simvascular/2018-11-25/post-install.sh

                This creates a 'simvascular' script file in /usr/local/bin.

5. Launch SimVascular 

		% simvascular


<br>
#### Note 
	SimVascular may fail to launch if certain shared libraries are missing from your computer. Missing libraries can be installed using "sudo apt-get install [missing lib name]". The following commands can be used to install some libraries commonly missing from standard Ubuntu distributions:

		sudo apt-get install libgstreamer0.10-0
		sudo apt-get install libgstreamer-plugins-base0.10-dev
		sudo apt-get install libxss
		sudo apt-get install libxmu-dev (for OpenCASCADE)
		sudo apt-get install libxi-dev  (for OpenCASCADE)

<br>

### Installing svSolver ###

1. Download the svSolver Ubuntu installer.

2. Double-click on the downloaded installation (.deb) file.

3. The solver is installed in /usr/local/sv/svsolver/yyyy-mm-dd

### Installing svFSI ###

1. Download the svFSI Ubuntu installer.

2. Double-click on the downloaded installation (.deb) file.

3. The solver is installed in /usr/local/sv/svfsi/yyyy-mm-dd



### Installing MPI

	Both svSolver and svFSI use MPI. 

	For Ubuntu 14:		
		sudo apt-get install libmpich2-dev

	For Ubuntu 16:
		sudo apt-get install libmpich-dev

	Note that some applications may install a different implementation (e.g. Open MPI) of MPI. This may interfere with the MPI version needed by the svSolver or cause the solver not to execute correctly.


<br>
<br>
<br>
