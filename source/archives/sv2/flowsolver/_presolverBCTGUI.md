### Inlet Boundary Condition Specification (From GUI)

First we need to create a file called **bct.dat** (its vtp format file is also created, called **bct.vtp**) that specifies the boundary conditions at the inlet defined by inflow.vtp

In the **SimVascular** GUI window, go to the _Inflow BC_ subtab under _Simulations_. You will have to enter the following values in the various boxes/buttons of the GUI (see figure below):

<figure>
  <img class="svImg scImgLg" src="documentation/flowsolver/imgs/BCT_Creation.png">
  <figcaption class="svCaption" >Creating a <b>bct.dat</b> file through the GUI</figcaption>
</figure>

- Under **Analytic Shape of Profile**, select the **parabolic** radio button. This options allows a parabolic velocity profile to be applied at the inlet. Other options are **plug**, which applies a constant velocity profile throughout the inlet face and Womerseley, that uses a closed form solution for the velocity profile of pulsatile flow in arteries. 

- In the **Mesh Face File (vtp)** box, click on the **Browse** button and select the **inflow.vtp** file in the _mesh-complete/mesh-surfaces/_ folder.

- In the **Flow Rate File** box, click on **Browse** and select the desired \*.flow file. In this case, the file is **steady.flow**.

Under the **Parameters** menu, enter the following values:

- **Period**: $1.0$ sec. For a steady flow problem like ours, the concept of _period_ is somewhat vague. In this case, $1.0$ means the amount of physical time that we are going to run our simulation for.

- **viscosity**: $0.04$ Poise (gr/cm/s).

**WARNING**: Be very careful with the units! This is one the points where it is easy to make a mistake with the dimensions. For consistency, besides entering the right numerical value, try to also modify the units listed next to it (see figure below).

- **density**: $1.06$ gr/cm$^3$. Same as before, be very careful with these units!

Under the **Output Parameters** menu, enter the following values:

- **num of periods**: always enter 1 here. If you want to run your simulation for multiple cardiac cycles, it is possible to ask **svSolver** to loop over the information given by the **bct.dat** file for just one cycle (using the **solver.inp** file). By doing this, you will minimize the size of this file that can  potentially be very large. 

- **num pts in period**: 2. This is the number of _temporal_ data points that you want to have in your bct.dat. This is not necessarily the number of time points in the \*.flow file. In this case, they match (2 in both cases), but this is because this is a very simple example using steady flow and two time points is all we need to characterize a constant flow. In general, your \*.flow file will have in the order of $20$ data points over the cardiac cycle (that’s about how many points you will be able to reconstruct using **PC-MRI**, for example), and your bct.dat will have on the order of $100$-$200$ points. Whatever is enough to have a smooth  representation of the inflow wave mapping to velocity vectors at the inlet face.

- **num fourier modes**: 1. Fourier smoothing allows to smooth your inlet flow curve and to make sure that you have a periodic function in the specified interval. 

**WARNING**: Be careful with this! **SimVascular** is doing a Fourier Series approximation of the data that you provide in the \*.flow file. Since in this case, our data is constant flow, we only need one Fourier mode to capture this appropriately. For pulsatile flow problems, we will need more Fourier Modes to accurately represent the \*.flow data (usually, $10$ Fourier modes is enough for a pulsatile problem).

After you are done entering all these parameters, click on the _CREATE 3-D FLOW SOLVER BC FILE_ button to generate the **bct.dat** file. The format of this file is as follows:

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

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/BCT_Cration_VTP.png">
  <figcaption class="svCaption" >Visualizing the inlet velocity profile in Paraview</figcaption>
</figure>



