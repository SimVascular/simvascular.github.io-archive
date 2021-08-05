## Run Simulation ##

Though we can run the simulation through the GUI. It currently does not support some advanced features. Hence, we will use the aforementioned input file to directly run the simulation in terminals. The MPI run can be initiated through the following command
<pre class="highlight plaintext"><code>
mpiexec -np {number of MPI processes}  {path to svFSI executable}  {path to the input file}
</code></pre>

**Please remember to change the path to mesh folder and path to the load.dat in the input file according to your local configuration.**  **svFSI**  will create a results directory called n-procs, where n is the number of MPI processes for the simulation. This directory will have vtu files that contain all the requested output fields and a log file called histor.dat.
