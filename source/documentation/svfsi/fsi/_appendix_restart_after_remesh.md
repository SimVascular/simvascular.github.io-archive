## Appendix: Restarting a simulation after re-meshing

If a simulation is to be restarted after re-meshing has occurred, the new mesh must be added to the input file. svFSI will create a directory called n-procs, where n is the number of MPI tasks for the simulation, and we will refer to this as the run directory.

1.  In the run directory, find the stFile\_n.bin. Make a symbolic link:

            ln -s stFile_n.bin stFile_last.bin

    Note that if the previous job completed smoothly, this file may
    already exist and no link is required to be made.

2.  If remeshing has occurred, the run directory will contain a hidden
    directory called “.remesh\_tmp.dir”, which contains new mesh files
    that should be named according according to their initial name and
    the timestep of the last remesh. For example, lumen\_21.vtu.

3.  Change the input.mfs file to set a restarted simulation and for the
    new mesh names.

    1.  Set Continue previous simulation: 1

    2.  All new paths and names for mesh files should be updated,
        including paths. For example, change
        to 120-procs/.remesh\_tmp.dir/lumen\_21.vtu.

    3.  Set Check IEN order: F.

    4.  Update the final time if desired.

4.  Run the simulation again.

<p><br/><br/><br/><br/><br/></p>

