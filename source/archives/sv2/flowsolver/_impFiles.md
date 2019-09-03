#### Format of Impedance boundary condition file

Impedance boundary conditions are defined through the **Qhistor.dat** file where the flow rate time history at each face is specifiedd and the **impt.dat** files containing impedance data. These two files must be present in the folder with all others solver files when executing **svSolver**. 

The **Qhistor.dat** file has the following format:

~~~
totTS
Q0,0 Q0,1 ... Q0,n
Q1,0 Q1,1 ... Q1,n
...
...
QtotTS,0 QtotTS,1 ... QtotTS,n
~~~

where **n** denotes the total number of faces with impedance boundary condition applied and **totTS** the total number of time steps. 

The **impt.dat** file has the following format:

~~~
nptsImpmax
numDataImp,1
t0 impVal0
...
t_numDataImp impVal_numDataImp
...
...
numDataImp,n
t0 impVal0
...
t_numDataImp impVal_numDataImp
~~~

where **nptsImpmax** is the maximum number of time steps defined on all the boundary faces with impedance boundary condition. 
There are **n** blocks in the file, each defining impedance data for each face. Every block is defined by two columns, the first denoting time and the second impedance values. 
