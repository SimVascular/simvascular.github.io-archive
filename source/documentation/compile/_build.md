
# Building SimVascular
<br>
This readme gives an overview of compiling SimVascular using CMake.  We also 
support standard MakeFiles.

## Required Libraries to build SimVascular

### Linux
	
You will need the following packages, available from the APT repository:

```bash
sudo apt-get cmake-curses-qui
sudo apt-get cmake-gui
```

##### Build Tools (Fortran is optional)
```
sudo apt-get install gcc-multilib build-essential g++ gfortran
```

##### Tcl/Tk
```bash
sudo apt-get install tcl8.5 tcl8.5-dev tcl8.5-lib
sudo apt-get install tk8.5 tk8.5-dev tk8.5-lib
```

##### For flowsolver
```
sudo apt-get install libmpich2-dev
```

##### For VTK   
```
sudo apt-get install libglu1-mesa-dev libxt-dev libgl1-mesa-dev
```

##### Optional (plugin libraries)
```
sudo apt-get install glib2.0-dev
```


### Apple OS X
To install CMake on OS X visit http://www.cmake.org/ for details

If you have clang 5.0, you will also need to install MacPorts. MacPorts can be
downloaded at: https://www.macports.org/. The following libraries and tool
should be installed using MacPorts:

##### Build Tools 
```
sudo port install gcc46
sudo port install mpich-gcc46
```

##### For flowsolver only (Optional)
```
port install mpich
```
##### For Plugins (Optional)
```
sudo port install glib2-devel
sudo port install pkgconfig
```

### Windows
You need to install: 
 - CMake, Visit http://www.cmake.org/ for details
 - Microsoft Visual Studio 2010 Win (with x64 compilers)
 - Intel Visual Fortran installed. 
 - MPICH2, available at: mpich2-1.4.1p1-win-x86-64.msi

<br>

## Steps for compiling


By default SimVascular will build using a superbuild mode that downloads and
configures many of the libraries automatically.  If you wish to perform this
step manually, turn off SimVascular_SUPERBUILD from the CMake menu.

- Open CMake and point the source directory to [simvascular source]/Code.  Then set the Build directory to any location not in your simvascular source directory. *In source builds are not supported at this time.* For example:

````
  Source: /home/[username]/SimVascular/Code
  Build: /home/[username]/SimVascularBin.
````
**Note to Windows Users:** *There is a bug in MSVC10 that causes errors if the compile paths are too long,  It is reccomended that you place your source directoy so that the path to it is short (C:/Code/SimVascular is known to work).*

- Select your desired options in the GUI, hit configure. Continue to hit configure till no options change (or in curses-gui continue till the generate option apears.  Once configured, hit generate.  
	

Now you can compile the project using whichever generator you specificed to 
CMake (i.e. make or MSVC build all).  Alternatively, you make use CMake to call 
the command for you.

On all systems (from the command prompt or terminal) this command is: 
`cmake --build /path/to/build-directory --config RelWithDebInfo`