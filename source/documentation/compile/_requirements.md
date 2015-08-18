
#            Compiling SimVascular using CMake #
<br>
*This guide gives an overview of compiling SimVascular using CMake.  We also support standard MakeFiles.*

<br>

##				System Requirements


<table class="table table-bordered">
<thead>
<tr>
  <th>Windows</th>
  <th>Apple OS X</th>
  <th>Linux</th>
</tr>
</thead>
<tr>
  <td>Tested Configurations:
  		<ul>
		  <li>Windows 7 and Windows 8</li>
		  <li>C++ (required) fortran (optional) compilers</li>
		</ul>
    Supported Compilers:
      <ul>
      <li>Visual Studio 2010 Service Pack 1 (for x64)</li>
      <li>Intel Visual Fortran Fortran compiler (ifort)</li>
    </ul>
  </td>
  <td>Tested Configurations:
  		<ul>
		  <li>Version 10.8.5 (Mountain Lion) and 10.9 (Mavericks)</li>
		  <li>XCode 4.6 or 5.0 (with 4.6.3 previously installed)</li>
		</ul>
    Supported Compilers:
      <ul>
      <li>i686-apple-darwin11-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666)</li>
      <li>MacPorts with gcc (4.6.4)</li>
      <li>Clang 6.0 (experimental)</li>
    </ul>
  </td>
  <td>Tested Configurations:
  		<ul>
		  <li>Ubuntu 13.04 64-bit desktop (w/ patches)</li>
		  <li>Intel processor</li>
		  <li>C++ (required) fortran (optional) compilers</li>
		</ul>
    Supported Compilers:
      <ul>
      <li>gcc/g++/gfortran version 4.6.3 (others will most likely work too)</li>
      <li>ifort/icpc/icc intel compilers verison 13.0 (2013.1.117)</li>
    </ul>
  </td>
</tr>
</table>

*Use <code>gcc --version</code> to see which compiler you are using.*

*We currently __only support MS Visual Stuidio 2010__, later versions are __not__ supported at this time. MinGW gfortran is not supported but we plan to add this functionality in future releases.*

*XCode's tools and libraries are required but compiling with XCode is currently __unsupported.__*

*Clang 5.0+ is*  **not** *supported*, we are working on supporting this in the near future.

<!-- #### Linux
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

Use `gcc version` to see which compiler you are using.
    
*Clang 5.0+ is*  **not** *supported* -->
