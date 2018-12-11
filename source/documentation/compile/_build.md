
## Steps for compiling

  <p>Building SimVascular can be thought of as building two separate projects:
    <li>SimVascular's externals</li>
    <li>SimVascular itself</li>
  </p>
		<p>
		 <pre class="highlight plaintext">
<code><img src="documentation/compile/imgs/folder.png" height="20" width="20"alt="..."><font color="##0000FF"> SimVascularSrc</font>
--- CMakeLists.txt: <ul><em>Highest level CMake file that contains very little. Simply builds the Externals project and then the SimVascular project. Should be the entrance location for anyone familiarizing themselves with SimVascular.</em></ul>
--- <img src="documentation/compile/imgs/folder.png" height="20" width="20"alt="..."><font color="##0000FF"> Externals</font>
<ul>--- CMakeLists.txt: <ul><em>Main CMake file for Externals. Very involved and contains options to use different versions of the externals, to build or download certain externals, etc. Many of these options are not available using the highest level CMake file, so if fine tuning of the Externals is desired, this is the spot to be.</em></ul></ul>
--- <img src="documentation/compile/imgs/folder.png" height="20" width="20"alt="..."><font color="##0000FF"> Code</font>
<ul>--- CMakeLists.txt: <ul><em>Main CMake file for SimVascular. Very involved and contains options for building/not building certain libraries, shared/static libraries, etc. Many of these options are also not available using the highest level CMake file, so if fine tuning of the SimVascular build is desirec, this is the spot to be.</em></ul></ul>
--- <img src="documentation/compile/imgs/folder.png" height="20" width="20"alt="..."><font color="##0000FF"> Remaining Src</font></code></pre>
		</p>
  <p>
   <h3 id="buildingItAll">Building it all</h3>
   <p>This is the easiest and most basic way to build SimVascular. If using a supported operating system and compiler, this is likely to work.</p>
     <p>Follow the setup instructions for <a href="#sysSetupMac">Mac</a>, <a href="#sysSetupLinux">Linux</a>, or <a href="#sysSetupWin">Windows</a>.</p>
     <p>Use git to clone the SimVascular source:</p>
     <pre class="highlight plaintext"><code>git clone https://github.com/SimVascular/SimVascular.git SimVascularSrc</code></pre>
     <p>Or fork the project on <a href="https://github.com/SimVascular/SimVascular">github</a>, and then clone the forked repository:</p>
     <pre class="highlight plaintext"><code>git clone https://github.com/github_username/SimVascular.git SimVascularSrc</code></pre>
     <h4>CMake command line</h4>
     <p>If you use cmake on the command line (you must install cmake command line tools), enter the source and setup the project:</p>
     <pre class="highlight plaintext"><code>cd SimVascularSrc
mkdir Build
cd Build
ccmake ..</code></pre>
     <p>Configure the project with 'c'. CMake will run and then error because it needs Qt. Point it to the location of the Qt5Config.cmake file:</p>
     <pre class="highlight plaintext"><code><img src="documentation/compile/imgs/cmake_command_find_qt.png" alt="..."></code></pre>
     <p>Reconfigure the project with 'c' until you can generate make files with 'g'. </p>
     <p>If you have no errors, generate the make files with 'g'.</p>
     <p>Proceed to <a href="#buildEverything">building the project</a>.</p>
     <h4>CMake GUI</h4>
     <p>If you use the cmake GUI, start the GUI and point to the source directory and a new build directory. You can choose a non-existent build directory, cmake will generate it for you.</p>
     <pre class="highlight plaintext"><code><img src="documentation/compile/imgs/cmake_gui_setup.png" alt="..."></code></pre>
     <p>Configure the project with 'c'. Unless you want to specify custom compilers, use the default compilers. CMake will run and then error because it needs Qt. Point it to the location of the Qt5Config.cmake file:</p>
     <pre class="highlight plaintext"><code><img src="documentation/compile/imgs/cmake_gui_find_qt.png" alt="..."></code></pre>
     <p>Configure the project again and if Qt is found succesfully, Qt variables will show up in the GUI. Configure one more time, and then the 'Generate' button should be clickable. Generate the build files with Generate and exit the CMake GUI.</p>
     <p>Proceed to <a href="#buildEverything">building the project</a>.</p>
     <h4>Toplevel SimVascular Variables</h4>
     <p>Most likely, all these variables should be fine and they should not be changed. These variables indicate what version of the pre-built binaries to download from the simvascular server. You can navigate and see the available pre-buit binaries <a href="http://simvascular.stanford.edu/downloads/public/simvascular/externals">here</a>.The toplevel variables you can edit correspond to the directory structure.</p>
     <pre class="highlight plaintext"><code>$SV\_PLATFORM\_DIR -> Platform being used (mac\_osx, ubuntu, windows)
$SV\_PLATFORM\_VERSION\_DIR -> Platform version #
$SV\_COMPILER\_DIR -> Compiler being used
$SV\_COMPILER\_VERSION\_DIR -> Compiler version #
$SV\_ARCH\_DIR -> Architecture (x32, x64)
$SV\_BUILD\_TYPE\_DIR -> Compile type (Release, Debug, RelWithDebInfo, MinSizeRel)</code></pre>
     <p>Note that changing these variables will only change the versions of the pre-built binaries downloaded. They will not change your physical configuration settings! For example, to actually change the compiler being used, the CMAKE_CXX_COMPILER variable should be changed.</p>

   <h4 id="buildEverything">Build the project</h4>
   <p>Navigate to the cmake build directory where you just generated the makefiles.</p>
     <pre class="highlight plaintext"><code>cd /Users/username/Documents/Software/SimVascularSrc/Build
make</code></pre>
     <p>If the build immediately errors, the system you are using is most likely not supported.</p>
     <p>If you see warnings, please read them. It may be the case that your system does not have pre-built binaries of the externals. In which case, a default version of the pre-built externals will be download; however, it could cause errors when finally building the SimVascular project.</p>
     <p>The build will proceed in two steps:
       <ol>
         <li>The externals will first be downloaded and then SimVascular will be automatically configured to build with these pre-built downloaded externals. If the build errors during the download of the externals, see the section about the <a href="#buildExternals">Externals</a>.</li>
         <li>The SimVascular project itself will be built second. If the build errors during the actual build of SimVascular, see the section about building <a href="#buildSimVascular">standalone SimVascular</a>.
       </ol>
     </p>
     <p>If the build did not error, navigate to the SimVascular build directory and launch the project!</p>
     <pre class="highlight plaintext"><code>cd SimVascular-build
./mysim -qt</code></pre>
   </p>
   <p>
   <h3 id="buildExternals">SimVascular's Externals</h3>
   <p>SimVascular depends directly on 9 major open source libraries:</p>
   <ol>
     <li><a href="https://www.tcl.tk">Tcl/Tk</a></li>
     <li><a href="https://www.python.org">Python</a></li>
     <li><a href="https://www.freetype.org">FreeType</a></li>
     <li><a href="http://gdcm.sourceforge.net/wiki/index.php/Main_Page">GDCM</a></li>
     <li><a href="https://itk.org">ITK</a></li>
     <li><a href="http://www.vtk.org">VTK</a></li>
     <li><a href="https://www.mmgtools.org">MMG</a></li>
     <li><a href="https://www.opencascade.com">OpenCASCADE</a></li>
     <li><a href="http://mitk.org/wiki/MITK">MITK</a></li>
   </ol>
   <p>Building all of these dependencies can take quite a while; thus, pre-built
   binaries are provided for the supported operating systems.</p>
   <p>If you want to build all of SimVascular, this information is likely unnecessary and go to <a href="#buildingItAll">building it all</a>.</p>
   <h4>Downloading SimVascular's Externals</h4>
   <p>To download the most basic version of the externals, navigate to the externals, create a build directory, and configure:</p>
     <pre class="highlight plaintext"><code>cd SimVascularSrc/Externals
mkdir Build
cd Build
ccmake ..</code></pre>
   <p>By default, all externals should be set to be downloaded. To turn on and off certain externals, toggle the SV_EXTERNALS_ENABLE_'External' variables.</p>
   <h4>Building SimVascular's Externals</h4>
   <p>If using pre-built binaries isn't working for your system, you may need to build your own externals.</p>
   <p>To do this, toggle off the SV_EXTERNALS_DOWNLOAD_'External' variables.</p>
   <p>Building of externals has only been tested on the supported platforms, so there may be difficulties that arrise on other platforms</p>
   <p>Note that on Mac you will need to obtain MacPorts with additional libraries, while on linux, additional packages will likely have to be installed with the package manager.</p>
   <p>The latest externals source can be downloading frome <a href="http://simvascular.stanford.edu/downloads/public/simvascular/externals/2018.05/src/originals">here</a>.</p>
   </p>
   <p>
   <h3 id="buildSimVascular">Building Standalone SimVascular</h3>
   <p>If you choose to build SimVascular by itself, you will have to make sure you have all of SimVascular's dependencies. If you are using your own versions of some of the externals like ITK, VTK, Python, Tcl, MITK, etc., be very careful. A VTK not built with the same version of Python, or an MITK not built with the corresponding versions of ITK, VTK, and Python can cause significant build issues. In addition, different versions of the externals have varying nuances that could cause both build problems and performance problems. This is why the suggested way to build is with the pre-built externals if possible. If not, the next best solution is to build the externals with the default versions of the externals.</p>
   <p>If proceeding, create a build directory and configure the project</p>
     <pre class="highlight plaintext"><code>cd SimVascularSrc/Code
mkdir Build
cd Build
ccmake ..</code></pre>
   <p>You should come across a series of errors in which you need to specify the location of the externals package. For most externals, the location of the Config.cmake file needs to be specified; however, for TCL, PYTHON, MMG, and FREETYPE, the location of the toplevel directory needs to be specified.</p>
   <p><a href="https://github.com/SimVascular/SimVascular/tree/master/Externals/TestWithCMake">Examples</a> of configuration setting can be found in the SimVascular source.</p>
   </p>
