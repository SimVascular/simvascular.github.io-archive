### Configuring Solvers (Optional) ###

SimVascular solvers(presolver, flowsolver, postsolver) are used as individual executable programs. They are called by SV Simulation tool to create data files, run simulation, and convert results to files in VTK formats. Normally those solvers are installed separately. However, SimVascular can automatically find those solvers. In case your SimVascular can't find them, or you want to use different solvers, you need to explicitly tell SimVascular where to find or how to use them.

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

#### Locations of Installed Solvers####

**Linux:**

	Presolver: /usr/local/sv/svsolver/yyyy-mm-dd/bin/svpre
	Flowsolve: /usr/local/sv/svsolver/yyyy-mm-dd/bin/svsolver
	Postsolver: /usr/local/sv/svsolver/yyyy-mm-dd/bin/svpost

In case you can't run mpiexec when using flowsolver, please make sure mpi is installed.

To install MPI:

	For Ubuntu 14:
	sudo apt-get install libmpich2-dev

	For Ubuntu 16:
	sudo apt-get install libmpich-dev

**Mac OS X**

	MPIExec: /usr/local/sv/svsolver/yyyy-mm-dd/bin/mpiexec
	Presolver: /usr/local/sv/svsolver/yyyy-mm-dd/svpre
	Flowsolve: /usr/local/sv/svsolver/yyyy-mm-dd/svsolver
	Postsolver: /usr/local/sv/svsolver/yyyy-mm-dd/bin/svpost

**Windows**

For the versions from 2017-04-09

	The solvers are located at C:\Program Files\SimVascular\svSolver\yyyy-mm-dd\
	Presolver: C:\Program Files\SimVascular\svSolver\yyyy-mm-dd\svpre-bin.exe
	Flowsolver: C:\Program Files\SimVascular\svSolver\yyyy-mm-dd\svsolver-msmpi-bin.exe
	Postsolver: C:\Program Files\SimVascular\svSolver\yyyy-mm-dd\svpost-bin.exe
	Flowsolver (without mpi): C:\Program Files\SimVascular\svSolver\yyyy-mm-dd\svsolver-nompi-bin.exe

For the versions before 2017-04-09

	The solvers are located at C:\Program Files (x86)\SimVascular\svSolver\Release\xxxxxxxxxx\
	Presolver: C:\Program Files (x86)\SimVascular\svSolver\Release\xxxxxxxxxx\svpre-bin.exe
	Flowsolver: C:\Program Files (x86)\SimVascular\svSolver\Release\xxxxxxxxxx\svsolver-msmpi-bin.exe
	Postsolver: C:\Program Files (x86)\SimVascular\svSolver\Release\xxxxxxxxxx\svpost-bin.exe
	Flowsolver (without mpi): C:\Program Files (x86)\SimVascular\svSolver\Release\xxxxxxxxxx\svsolver-nompi-bin.exe


