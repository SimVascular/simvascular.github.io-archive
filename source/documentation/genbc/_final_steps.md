## Compiling GenBC

Once all of the settings and equations have been set in USER.f you can compile the source code. Navigate to the **GenBC-program** folder 
on your Linux or Mac machine using the terminal and type **make**. This creates an executable named **GenBC** in the current folder. 
Copy the executable to the project **Simulations** **cyl_sim** folder.

## Running a flow simulation and checking results

Now navigate to the  **Simulations** **cyl_sim** folder. You can now run the svSolver program. Once the simulation starts it will 
create a file named **AllData**. This is an output file produced by GenBC which contains the values of the state variables as a 
function of time and the additional Xprint outputs we specified earlier.

