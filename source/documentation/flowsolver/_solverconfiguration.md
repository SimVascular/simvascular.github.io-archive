### Configurating Solvers ###

SimVascular solvers(presolver, flowsolver, postsolver) are used as individual executable programs. They are called by SV Simulation tool to create data files, run simulation, and convert results to files in VTK formats. If those solvers are not included in your SimVascular package while you already have those solvers in your computer, we can tell SimVascular where to find them and how to use them.

	Goto Menu: Preferences -> SimVascular Simulation
	Use MPI:  whether to use mpi to run flowsolver. It depends on if your flowsolver supports MPI. If you wan to use MPI, make sure it's installed.
	MPIEXEC: mpiexec (by default). You may need to provide the full path and file name for the file if it's not added to system searching paths.
	Use Solver Input Custom Template: whether to use a custom tempalte file for the table of "Solver Parameters". Only for advanced users
	Custom Tempalte: the full path and file name for your custom template file.
	External Presolver: provide the full path and file name for presolver if you want to use a specified one
	External Flowsolver: provide the full path and file name for flowsolver if you want to use a specified one
	External Postsolver: provide the full path and file name for postsolver if you want to use a specified one
	
<figure>
  <img class="svImg svImgMd"  src="documentation/flowsolver/imgs/solverconfiguration.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>


#### MPI Installation ####

**Linux:**

	sudo apt-get install libmpich2-dev

**Mac OS X**

 	Install MacPorts, which you can download at macports.org
	sudo port install mpich-gcc46

**Windows**

	Install Microsoft MPI (MS-MPI)



