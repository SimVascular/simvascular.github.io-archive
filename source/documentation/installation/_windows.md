
# Installation Instructions for Windows #

<br>
### Supported Versions ###
	
	Windows 10 (tested)

<br>
### Installing SimVascular ###

1. Install SimVascular 

2. SimVascular still provides the old GUI. If you want to launch SimVascular with the old GUI:

		Right click on the SimVascular icon on the desktop.
		Add "-tcl" to the very end of the "Target:" command line, for example:
			"C:\Program Files\SimVascular\sv\yyyy-mm-dd\simvascular-bin.exe "Tcl/SimVascular_2.0/simvascular_startup.tcl -tcl"
		Or
		Copy the original icon and make such change so you have one icon for the new GUI and the other for the old GUI.

3. To run simulation, you need to install svSolver (<a href="https://simtk.org/project/xml/downloads.xml?group_id=188" target="_blank">download</a>).

4. For **Windows 7**, you may need to install a few extra package to use SimVascular.

		NetFx20SP2_x86.exe

Notice: 

		svSolver is installed at C:\Program Files\SimVascular\svSolver\yyyy-mm-dd