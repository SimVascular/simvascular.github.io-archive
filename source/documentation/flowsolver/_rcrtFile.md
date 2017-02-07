
### Format of RCR boundary condition file

RCR boundary conditions are defined through the **rcrt.dat** file using the following format:

~~~
nptsRCRmax
numDataRCR_1
Rp_1
C_1
Rd_1
time_1_1 Pdist_1_1
... 
... 
time_1_numDataRCR Pdist_1_numDataRCR
...
...
numDataRCR_i
Rp_i
C_i
Rd_i
time_i_1 Pdist_i_1
... 
... 
time_i_numDataRCR Pdist_i_numDataRCR
~~~

The first quantity **nptsRCRmax** defines the maximum number of time points for the curves defined at each outlet.
This quantity is followed by one block for each outlet, containing **numDataRCR_i**, i.e., the number of time point for RCR outlet i.
The three values **Rp_i**, **C_i**, **Rd_i** are defined for the proximal resistance, compliance and distal vessel resistance, respectively.
A time series follows, defining the evolution in time of the reference pressure at the distal end of the RCR block.

