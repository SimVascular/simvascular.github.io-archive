In this appendix section, we discuss how to build svFSI from source.

##Building svFSI from source

The source code for svFSI includes a build system in cmake. To build from source, one needs compilers for c,c++, fortran, an MPI compiler and runtime, and the lapack and blas libraries. LAPACK and BLAS must be installed in a standard location, which cmake will find automatically. For example, on OSX to install using the package manager brew (see <span>https://brew.sh/</span>) one might run

        brew install gfortran openmpi lapack

or, on ubuntu, to install using apt-get run

       sudo apt-get install gcc gfortran openmpi libblas-dev liblapack-dev

We recommend letting cmake find the default compilers for easy of building.

To build the svFSI solver, download the source code from

        https://github.com/alexkaiser/svSolver/tree/svFSI

to a directory of your choosing. Make sure you are on the branch svFSI to include the solver. (Note that this repo is currently does not contain the FSI solver, but will be updated shortly.) Change into wherever this was downloaded.

        cd svSolver

Make a build directory and go there.

        mkdir svSolver\_build && cd svSolver\_build

Initiate the cmake terminal interface to generate makefiles.

        ccmake ../svSolver

This will automatically search for compilers. Follow instructions if necessary. Push “c” for configure repeatedly until cmake presents the option “g” for generate. Hit “g” to create makefiles and exit. Run make:

        make

This will place the solver in a directory called svSolver-build/svFSI.

- SimVasvular source

SimVasvular source, if there is any difficulty.

    https://github.com/gmaher/SimVascular/tree/project\_manager\_update

- Plugin installation

To build the svFSI plugin, download the source code from

        https://github.com/SimVascular/SimVascular-Plugin-MUPFES

to a directory of your choosing. (Note that this repo is currently private) The plugin source code should not be in your SimVascular directory tree. Change into wherever this was downloaded.

        cd SimVascular-Plugin-MUPFES

Make a build directory and go there.

        mkdir build && cd build

Initiate the cmake terminal interface to generate makefiles.

        ccmake ..

This will automatically search for compilers. Follow instructions if necessary. Push “c” for configure repeatedly until cmake presents the option “g” for generate. Hit “g” to create makefiles and exit. Run make:

        make

This will build the plugin. If passed, there should be a directory

       SimVascular-Plugin-MUPFES/build/lib/plugins

Add that to the environment variable

       SV_PLUGIN_PATH

for example

       export SV_PLUGIN_PATH=$SV_PLUGIN_PATH:~/SimVascular-Plugin-MUPFES/build/lib/plugins

That directory should contain a library file, a “.dylib” on mac. It should follow the naming convention

       libNAME.extension

For example,

       liborg_sv_gui_qt_mupfes.dylib

Strip the “lib” prefix and the file extension, then add it to the variable

        SV_CUSTOM_PLUGINS

as in

       export SV_CUSTOM_PLUGINS=$SV_CUSTOM_PLUGINS:org_sv_gui_qt_mupfes

SimVascular will look for these variables in the current environment, and assuming that everything has passed, load the plugin without any additional information. It is a good idea to use the same compilers for anything you build, which cmake will do be default if also building SimVascular from source. These instructions are generic for SimVascular plugin, and work for plugins other that the svFSI plugin.\
