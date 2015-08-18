
## Steps for compiling


By default SimVascular will build using a superbuild mode that downloads and
configures many of the libraries automatically.  If you wish to perform this
step manually, turn off SimVascular_SUPERBUILD from the CMake menu.

- Open CMake and point the source directory to [simvascular source]/Code.  Then set the Build directory to any location not in your simvascular source directory. *In source builds are not supported at this time.* For example:


		Source: /home/[username]/SimVascular/Code
		Build: /home/[username]/SimVascularBin

**Note to Windows Users:** *There is a bug in MSVC10 that causes errors if the compile paths are too long,  It is reccomended that you place your source directoy so that the path to it is short (C:/Code/SimVascular is known to work).*

- Select your desired options in the GUI, hit configure. Continue to hit configure till no options change (or in curses-gui continue till the generate option apears.  Once configured, hit generate.  
	

Now you can compile the project using whichever generator you specificed to 
CMake (i.e. make or MSVC build all).  Alternatively, you may use CMake to call 
the command for you.

On Mac and Linux for example use make. Navigate to build directory in terminal and type `make`

For Windows build in Visual Studio

On all systems (from the command prompt or terminal) this command is: 

	cmake --build /path/to/build-directory --config RelWithDebInfo