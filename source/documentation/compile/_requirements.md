
#            Compiling Instructions for SimVascular with CMake #
<br>
This is a guide for compiling the source code for SimVascular.

<br>

#				Tested Configurations and System Requirements


#### Linux
- Ubuntu 13.04 64-bit desktop (w/ patches)
- Intel processor
- C++ (required) fortran (optional) compilers


Compilers currently supported:

- gcc/g++/gfortran version 4.6.3 (others will most likely work too)
- ifort/icpc/icc intel compilers verison 13.0 (2013.1.117)
    
#### Microsoft Windows
- Windows 7 and Windows 8
- C++ (required) fortran (optional) compilers


Compiler environments currently supported:

- Visual Studio 2010 Service Pack 1 (for x64)
- Intel Visual Fortran Fortran compiler (ifort)

*We currently __only support MS Visual Stuidio 2010__, later versions are __not__ supported at this time. MinGW gfortran is not supported but we plan to add this functionality in future releases.*

#### Apple OS X
- Version 10.8.5 (Mountain Lion) and 10.9 (Mavericks)
- XCode 4.6 or 5.0 (with 4.6.3 previously installed)

*XCode's tools and libraries are required but compiling with XCode is currently __unsupported.__*


Compilers currently supported:

- i686-apple-darwin11-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666)
- MacPorts with gcc (4.6.4)

Use `gcc --version` to see which compiler you are using.
    
*Clang 5.0+ is*  **not** *supported*
