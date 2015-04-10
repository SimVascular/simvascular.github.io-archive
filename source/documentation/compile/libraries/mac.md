### Apple OS X
To install CMake on OS X visit <a href="http://www.cmake.org/"target="blank"> cmake.org</a> for details

If you have Clang 5.0, you will also need to install MacPorts, which you can download at <a href="https://www.macports.org/"target="blank"> macports.org</a>
<br>


The Xcode comman line tools need to be installed. This can done with this command:
	
	xcode-select --install

#####The following libraries and tools should be installed using MacPorts:

Build Tools:

	sudo port install gcc46
	sudo port install mpich-gcc46


For SVsolver (Optional):

	sudo port install mpich

*__To use Clang 6.0, you must insatll mpich 2 which is available in macports__*

Plugin Libraries (Optional):

	sudo port install glib2-devel
	sudo port install pkgconfig