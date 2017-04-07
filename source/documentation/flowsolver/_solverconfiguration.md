### Configurating Solvers (Optional) ###

SimVascular solvers(presolver, flowsolver, postsolver) are used as individual executable programs. They are called by SV Simulation tool to create data files, run simulation, and convert results to files in VTK formats. Normally those solvers are included in SimVascular or installed separately. In either way, SimVascular can automatically find those solvers. In case your SimVascular can't find them, or you want to use different solvers, you need to explicitly tell SimVascular where to find or how to use them.

	Goto Menu: Preferences -> SimVascular Simulation
	Use MPI:  whether to use mpi to run flowsolver. It depends on if your flowsolver supports MPI. By default, we assume using MPI.
	MPIExec: (mpiexec, by default) It's opional. Specify the full path and file name for the mpiexec to use.
	Use Solver Input Custom Template: whether to use a custom tempalte file for the table of "Solver Parameters". Only for advanced users.
	Custom Tempalte: the full path and file name for your custom template file.
	Presolver: Specify the full path and file name for the presolver to use.
	Flowsolver: Specify the full path and file name for the flowsolver to use.
	Postsolver: Specify the full path and file name for the postsolver to use.
	
<figure>
  <img class="svImg svImgMd"  src="documentation/flowsolver/imgs/solverconfiguration.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

#### Availability of Solvers and MPI####

**Linux:**

If solvers are included in SimVascular:

	Presolver: [SimVascular_Home_Dir]/bin/svpre
	Flowsolve: [SimVascular_Home_Dir]/bin/svsolver
	Postsolver: [SimVascular_Home_Dir]/bin/svpost

If solvers are installed separately:

	Presolver: /usr/local/sv/svsolver/xxxxxxx/bin/svpre
	Flowsolve: /usr/local/sv/svsolver/xxxxxxx/bin/svsolver
	Postsolver: /usr/local/sv/svsolver/xxxxxxx/bin/svpost

In case you can't run mpiexec when using flowsolver, please make sure mpi is installed.

To install MPI:

	For Ubuntu 14:
	sudo apt-get install libmpich2-dev

	For Ubuntu 16:
	sudo apt-get install libmpich-dev

**Mac OS X**

If solvers and mpiexec are included in SimVascular:

	MPIExec: /Applications/SimVascular.app/Contents/Resources/mpiexec 
	Presolver: /Applications/SimVascular.app/Contents/Resources/svpre
	Flowsolve: /Applications/SimVascular.app/Contents/Resources/svsolver
	Postsolver: /Applications/SimVascular.app/Contents/Resources/svpost

If solvers and mpiexec are installed separately:

	MPIExec: /usr/local/sv/svsolver/xxxxxxx/bin/mpiexec
	Presolver: /usr/local/sv/svsolver/xxxxxxx/svpre
	Flowsolve: /usr/local/sv/svsolver/xxxxxxx/svsolver
	Postsolver: /usr/local/sv/svsolver/xxxxxxx/bin/svpost

**Windows**

	There is a separate installer for svsolvers at simtk.org.
	Download and install svsolver-xxxx.exe (including MPI installer)
	Simulation tool should be able to find them. If it couldn't find them, configure them in terms to the instrcutions above.
	The solvers are located at C:\Program Files (x86)\SimVascular\svSolver\Release\xxxxxxxxxx\
	Presolver: C:\Program Files (x86)\SimVascular\svSolver\Release\xxxxxxxxxx\svpre-bin.exe
	Flowsolver: C:\Program Files (x86)\SimVascular\svSolver\Release\xxxxxxxxxx\svsolver-msmpi-bin.exe
	Postsolver: C:\Program Files (x86)\SimVascular\svSolver\Release\xxxxxxxxxx\svpost-bin.exe




