## Compiling GenBC

Once all of the settings and equations have been set in USER.f, you will need to compile the code. Navigate to the folder on your Linux or Mac machine using the terminal and type “make”. If the code compiled without any errors, you should see a GenBC executable file in the current folder (note that this is NOT GenBC.o or GenBC.f). If it does not appear, then you will need to fix any syntax errors that the compiler wishes to fix. You can sometimes get some warnings depending on the compiler, but you can mostly ignore these. The warning to pay attention to is the warning about uninitialized variables, where you have declared a variable for use but did not specify a value.

## Running a flow simulation and checking results

We now have all the files we need to run a simulation with GenBC. In particular, we will need the following files: bct.dat, geombc.dat.1, numstart.dat, restart.0.1, solver.inp, and GenBC. Once you have all of these in the same folder, you can run svSolver from there. Once the simulation starts, you should see a file named “AllData” that gets produced. This is an output file produced by GenBC that prints out the values of the state variables as a function of time, as well as the additional Xprint outputs we specified earlier.

If you are running your simulation on a machine other than your own (i.e. a supercomputing cluster) you MUST recompile GenBC on that machine. You have to compile GenBC with the same compilers as the system you are running the simulation on.

This concludes the GenBC tutorial! Please reach out to us if anything is unclear or if you need assistance crafting your custom boundary condition model!
