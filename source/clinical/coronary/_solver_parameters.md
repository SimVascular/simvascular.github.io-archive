##Solver parameters

Now we must specify some global solver parameters before we can launch a simulation. To do this, go to the “Solver Parameters” tab in the Simulations module. We will specify/adjust the following solver parameters:

2. Number of Timesteps: 6000
3. Time Step Size: 0.001
5. Number of Timesteps between Restarts: 50
11. Step Construction: 5
26. Maximum Number of Iterations for svLS NS Solver: 10

Typically when running pulsatile simulations like this, we run the simulation for 1000 timesteps for cycle for 6 cycles. In total, we will need 6000 timesteps. Since we assume our patient to have a heart period of 1 (60 beats per minute), our time step size is 0.001 (1 ms). With "Number of Timesteps between Restarts", we specify how often we want to save results. This number is up to you, but typically saving 20 time points per cycle is sufficient. The next two settings (Step Construction and Maximum Number of Iterations for svLS NS Solver) are linear solver settings that are optimized for coronary simulations. These should not need to be adjusted.
