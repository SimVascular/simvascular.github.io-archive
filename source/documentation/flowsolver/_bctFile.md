
### Format of BCT file

Inlet prescribed velocity profile is defined through the **bct.dat** file using the following format:

~~~
np nl
x1 y1 z1 nl nn
vx1  vy1  vz1  t1
 .    .    .    .
 .    .    .    .
 .    .    .    .
vxnl vynl vznl tnl
 .    .    .    .
 .    .    .    .
 .    .    .    .
xnp  ynp  znp   nl

vx1 vy1 vz1 t1
 .   .   .   .
 .   .   .   .
 .   .   .   .
~~~

The file defines the inflow boundary condition both spatially and in time. The spatial definition is obtained through $n\_p$ point-wise velocity input blocks. In this case, $n\_p = 102$, this is the total number of nodes on the **inflow.vtp** face. The temporal definition is given by $n\_l$ input lines of the values at a certain position for $n\_l$ time points, $t\_1$ to $t\_{n\_l}$. In this case, $n\_l = 2$ points (this is the value we entered in the _num pts in period_ box. 

Each block of data has, for each of the $n\_p = 102$ spatial points, the following info:

- The coordinates of the point: $x\_1$ $x\_2$ $x\_3$ and the number of time points $n\_l$.

- The list of velocity vectors $v\_x$ $v\_y$ $v\_z$ at time t.

A vtp file **bct.vtp** can be written using this option **Create Vtp** to graphically visualize the velocity distribution at the inlet surface with Paraview, as shown in the picture below.


