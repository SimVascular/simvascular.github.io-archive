## Run Simulation ##

Though we can run the simulation through the **SimVascular** GUI. It currently does not support some advanced features. Hence, we recommend use the aforementioned input file to directly run the simulation in terminals. The MPI runs can be initiated through the following command

```
mpiexec -np {number of MPI processes}  {path to svFSI executable}  {path to the input file}
```

By default, **svFSI**  will create a results directory called n-procs, where n is the number of MPI processes for the simulation. This directory will have vtu files that contain all the requested output fields and a log file called histor.dat.
