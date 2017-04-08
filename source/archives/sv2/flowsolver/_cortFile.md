
#### Format of COR boundary condition file

Coronary boundary conditions are defined through the **cort.dat** file using the following format

~~~
nptsCORmax
numDataCOR_1
q0_1
q1_1
q2_1
p0_1
p1_1
p2_1
b0_1(=0)
b1_1
b2_1(=0)
time_1_1 Plv_1_1 (/Prv_1_1)
... 
... 
time_1_numDataCOR Plv_1_numDataCOR
...
...
...
numDataCOR_i
q0_i
q1_i
q2_i
p0_i
p1_i
p2_i
b0_i(=0)
b1_i
b2_i(=0)
time_i_1 Plv_i_1 (/Prv_i_1)
... 
... 
time_i_numDataCOR Plv_i_numDataCOR
~~~

The first quantity **nptsCORmax** defines the maximum number of time points for the curves defined at each outlet defining the ventricular pressures.
This quantity is followed by one block for each outlet, containing **numDataCOR_i**, i.e., the number of time point for Coronary outlet i.
Nine constants need also to be defined for each coronary outlet, i.e., $q\_0$, $q\_1$, $q\_2$, $p\_0$, $p\_1$, $p\_2$, $b\_0$, $b\_1$, $b\_2$.
The physical meaning of these constants is related to the resistances and capacitances used to simulated each coronary outlet, as shown in the picture below:

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/CorBC.png">
  <figcaption class="svCaption" >Circuit visualization for coronary boundary condition</figcaption>
</figure>

The following expressions are used in [this paper](docsRefs.html#refSec2).

$$
p\_0 = 1,\quad
p\_1 = R\_{a-micro}C\_a + (R\_v + R\_{v-micro})(C\_a + C\_{im}),\quad
p\_2 = C\_{a}\,C\_{im}\,R\_{a-micro}(R\_v + R\_{v-micro}).
$$

$$
q\_0 = R\_{a} + R\_{a-micro} + R\_{v} + R\_{v-micro},\quad
q\_1 = R\_{a}C\_{a}(R\_{a-micro} + R\_{v} + R\_{v-micro}) + C\_{im}(R\_{a} + R\_{a-micro})(R\_{v} + R\_{v-micro}).
$$

$$
q\_2 = C\_{a}C\_{im}R\_{a}R\_{a-micro}(R\_v + R\_{v-micro}),\quad
b\_0 = 0,\quad
b\_1 = C\_{im}(R\_v + R\_{v-micro}),\quad
b\_2 = 0.
$$

<br>
<br>


