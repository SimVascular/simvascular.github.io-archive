## Prescribing a pressure waveform as an inlet boundary condition 

This section of the tutorial describes how to use the GenBC framework to define a Neumann boundary condition as a pressure 
waveform at an inlet surface. The pressure boundary condition is implemented in Fortran using the GenBC framework. The pressure 
at the cylinder inlet is obtained by interpolating a pressure waveform defined in the GenBC Fortan code.

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/waveform.png">
  <figcaption class="svCaption" >Pressure waveform used for the inlet Neumann boundary condition.</figcaption>
</figure>

The pressure waveform inlet boundary condition simulation is similar to the RCR simulation we created above except
for changes to the boundary conditions and some changes in the simulation parameters needed for solver stability. Create a new 
Simulation job by right-clicking the **Simulations** item in the **Data Manager**, then click **Create New Simulation Job**. 
Select the appropriate Model from the drop down menu and give it the name **cyl_pres**. Navigate to the **Solver Parameters** tab and 
set 

    Number of Time Steps: 2000 

    Time Step Size: 0.000588 

    Number of Timesteps between Restarts: 20 


We will define Neumann boundary conditions for both the inlet and outlet caps selecting **Resistance** for the **BC Type** and assigning it 
a value of 0. These settings are used to create the appropriate entries in the **solver.inp** file we will later modify. The **Inlet and 
Outlet BCs** tab should now look like this

<figure>
  <img class="svImg svImgMd" src="documentation/genbc/imgs/pres_inlet_and_outlet_bcs.png">
</figure>


To create the data files for the simulation go to the **Create Files and Run Simulation** tab, select the appropriate mesh from
the drop down menu and click **Create Data Files for Simulation**. The simulation files are written to the project directory inside
the **Simulations** folder. In this folder you will see a folder for the simulation job you created named **cyl_pres**. Now navigate
to the **cyl_pres** folder. Inside this folder are the following files and folders:

        1. mesh-complete – Contains mesh information and discretization in VTK format files
        2. cyl_pres.svpre file – Pre-solver script which instructs SimVascular how to prepare the simulation files
               from your mesh. Contains the ID numbers for mesh surfaces (used later)
        3. geombc.dat.1 – Simulation file that contains geometry information
        4. numstart.dat – Dummy file which tells the solver on which timestep to start on
        5. restart.0.1 – Contains initial conditions for pressure and velocity in your simulations
        6. solver.inp – Solver settings file

We need an additional **rcrt.dat** file containing the RCR parameters that set the relationship between flow and pressure on 
the outflow face. Copt this file from the **simulation-files** folder to here. 


the presover solver script (svpre) is needed to be modified by treating the inlet as a Neunmann face (see steady_rcr.svpre). Thus, to prepare a simulation with a prescribed pressure waveform, we run the presolver with the modified presolver script to generate geombc.dat and restart.0.1 files with surfaces properly tagged. Then we complie the GenBC files (user defined Fortran files) before calling the flow solver.

Note that apart from potentially increased computational cost and numerical instability (which might be insignificant), prescribing a pressure waveform doesn't necessarily make flow simulations better agree with clinical target values. So extra adjustments are often needed in order to match target pressures and flow. Don't forget to check resulting inflow when the Nuemann BC (pre-defined pressure or a lumped parameter model defined pressure) is applied to the inlet.

