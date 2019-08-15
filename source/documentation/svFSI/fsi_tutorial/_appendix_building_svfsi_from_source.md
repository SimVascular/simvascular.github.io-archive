In this appendix section, we discuss how to build svFSI from source.

##Building svFSI from source

The source code for svFSI includes a build system in cmake. To build from source, one needs compilers for c,c++, fortran, an MPI compiler and runtime, and the lapack and blas libraries. LAPACK and BLAS must be installed in a standard location, which cmake will find automatically. For example, on OSX to install using the package manager brew (see <span>https://brew.sh/</span>) one might run

    brew install cmake gcc open-mpi lapack 

or, on ubuntu, to install using apt-get run sudo apt-get install to add the following packages:

    cmake
    cmake-curses-gui
    cmake-gui
    gcc 
    gfortran
    libopenmpi-dev
    libblas-dev
    liblapack-dev
    git

We recommend letting cmake find the default compilers for easy of building.

To build the svFSI solver, download the source code from

    https://github.com/simvascular/svFSI

to a directory of your choosing. Make a build directory and go there.

    mkdir svFSI\_build && cd svFSI\_build 

Initiate the cmake terminal interface to generate makefiles.

    ccmake ../svFSI 

This will automatically search for compilers. Follow instructions if necessary. Push “c” for configure repeatedly until cmake presents the option “g” for generate. Hit “g” to create makefiles and exit. Run make:

    make 

This will place the solver binary, called "svFSI" in a directory called svFSI\_build/svFSI-build/bin. This will also create a script svFSI\_build/svFSI-build/mysvfsi. If non-defuault compilers were passed to cmake, then runtime errors can occur, especially relating to libraries. If this occurs, try using the script, which will set paths appropriately. 

- Optional Trilinos package

The svFSI solver contains its own linear solver. Optionally, the advanced user may link to the Trilinos package. To accomplish this, the user must build Trilinos using cmake, then provide a path and change a single flag. Before building svFSI, download the Trininos source from github. 

    git clone https://github.com/trilinos/Trilinos.git

We recommend compiling the following branch, with which we have tested Trilinos. 

    git checkout remotes/origin/trilinos-release-12-10-branch

Make a build directory and go there.

    mkdir Trilinos\_build && cd Trilinos\_build 

Run the cmake GUI to build Trilinos. 

    ccmake -DCMAKE_BUILD_TYPE=RELEASE \
          -DCMAKE_INSTALL_PREFIX:PATH=~/Trilinos_build \
          -DTPL_ENABLE_MPI:BOOL=ON \
          -DTrilinos_ENABLE_Amesos:BOOL=ON \
          -DTrilinos_ENABLE_AztecOO:BOOL=ON \
          -DTrilinos_ENABLE_Epetra:BOOL=ON \
          -DTrilinos_ENABLE_Ifpack:BOOL=ON \
          -DTrilinos_ENABLE_ML:Bool=ON \
          -DTrilinos_ENABLE_MueLu:Bool=ON \
          -DTrilinos_ENABLE_TESTS:BOOL=OFF \
          ../Trilinos

Note that CMAKE_INSTALL_PREFIX should point to your build directory. Run make to build the Trilinos source 

    make 

Run make install to place header and library files 

    make install 

This will create a directories lib/cmake/Trilinos and inside them a file called TrilinosConfig.cmake

    lib/cmake/Trilinos/TrilinosConfig.cmake

If this directory does not exist or is empty, then an error has occured. 

In the svFSI cmake source, change the SV_USE_TRILINOS option to on. This can be found in svFSI/Code/CMake/SimVascularOptions.cmake. 

    option(SV_USE_TRILINOS "Use Trilinos Library with svFSI" ON)

Now, when compiling svFSI, add 

    ccmake -DCMAKE_PREFIX_PATH=~/Trilinos_build/lib/cmake/Trilinos  ../svFSI

Run make. 

    make 

If Trilinos is found you should see output that says "Found Trilinos!" and displays the associated variables. The output should look something like this, wherein the elipsis contain many libraries and packages. 

    Found Trilinos!  Here are the details: 
       Trilinos_DIR = ~/Trilinos_build/lib/cmake/Trilinos
       Trilinos_VERSION = 12.10.1
       Trilinos_PACKAGE_LIST = MueLu;
       ...
       Trilinos_INCLUDE_DIRS = /Users/alex/sfw/Trilinos_build/include
       Trilinos_TPL_LIST = DLlib;LAPACK;BLAS;MPI;Pthread
       Trilinos_TPL_INCLUDE_DIRS = 
       Trilinos_TPL_LIBRARIES = /usr/lib/libdl.dylib
       ...
       Trilinos_BUILD_SHARED_LIBS = FALSE
       Trilinos_CXX_COMPILER = /usr/local/bin/mpicxx
       Trilinos_C_COMPILER = /usr/local/bin/mpicc
       Trilinos_Fortran_COMPILER = /usr/local/bin/mpif90
       Trilinos_CXX_COMPILER_FLAGS =  -std=c++11 -O3 -DNDEBUG
       Trilinos_C_COMPILER_FLAGS =  -O3 -DNDEBUG
       Trilinos_Fortran_COMPILER_FLAGS =  -O3
       Trilinos_LINKER = /usr/bin/ld
       Trilinos_EXTRA_LD_FLAGS = 
       Trilinos_AR = /usr/bin/ar
    End of Trilinos details

    Setting WITH_TRILINOS to true

If these are filled in, then cmake has found Trilinos and it will be linked. The Trilinos linear solvers are then available for use. In the linear solver options there are now the following Trilinos options for preconditioners. 

    Trilinos-Diagonal
    Trilinos-BlockJacobi 
    Trilinos-ILU
    Trilinos-ILUT
    Trilinos-IC
    Trilinos-ML

This will automatically set the Trilinos linear solvers to be called, rather than the svFSILS linear solvers. The three options are GMRES,BICG,CG. There is currently no option to call Trilinos without a preconditioner. If one wishes to use the simplest possible preconditioning with Trilinos, use Trilinos-Diagonal. 

For example, set 

    LS type: GMRES
    {
      Preconditioner: Trilinos-ILU
      Tolerance:           1D-3
      Krylov space dimension: 200
    }

- Plugin installation

To build the svFSI plugin, download the source code from

        https://github.com/SimVascular/SimVascular-Plugin-svFSI

to a directory of your choosing. (Note that this repo is currently private, and the plugin is included with SimVascular). The plugin source code should not be in your SimVascular directory tree. Make a build directory and go there.

        mkdir SimVascular-Plugin-svFSI_build && cd SimVascular-Plugin-svFSI_build 

Initiate the cmake terminal interface to generate makefiles.

        ccmake ../SimVascular-Plugin-svFSI

This will automatically search for compilers. Follow instructions if necessary. Push “c” for configure repeatedly until cmake presents the option “g” for generate. Hit “g” to create makefiles and exit. Run make:

        make 

This will build the plugin. If passed, there should be a directory

        SimVascular-Plugin-svFSI/build/lib/plugins

Add that directory to the environment variable

        SV_PLUGIN_PATH

for example

        export SV_PLUGIN_PATH=$SV_PLUGIN_PATH:~/SimVascular-Plugin-svFSI_build/lib/plugins

That directory should contain a library file, a “.dylib” on mac. It should follow the naming convention

        libNAME.extension 

For example,

        liborg_sv_gui_qt_svfsi.dylib

Strip the “lib” prefix and the file extension, then add it to the variable

        SV_CUSTOM_PLUGINS 

as in

        export SV_CUSTOM_PLUGINS=$SV_CUSTOM_PLUGINS:org_sv_gui_qt_svfsi

Finally, if running on linux also set  

        LD_LIBRARY_PATH

For example, 

        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/SimVascular-Plugin-svFSI_build/lib/plugins

SimVascular will look for these variables in the current environment, and assuming that everything has passed, load the plugin without any additional information. It is a good idea to use the same compilers for anything you build, which cmake will do be default if also building SimVascular from source. These instructions are generic for SimVascular plugin, and work for plugins other that the svFSI plugin.\
