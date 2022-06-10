##Example simulation results

In this section, we show some example simulation results using the provided cylinder model. We will simply inflate the cylinder using a ramp for the pressure with a resistance outlet. Because the velocities and pressures in the domain are usually initialized to zero, it can be a good idea to slowly ramp up the pressure to avoid any sudden jump conditions that could produce oscillations. We apply a resistance boundary condition at the outlet to ensure a physiologic amount of flow. Below shows the inlet pressure vs. time, showing that we will ramp up slowly from 0 pressure to 80 mmHg over the course of a second.

<figure>
  <img class="svImg svImgMd" src="documentation/svFSI/fsi_tutorial/imgs/ramp_pressure.png">
  <figcaption class="svCaption" >Ramp pressure.</figcaption>
</figure>

For reference, this simulation was run on a parallel cluster using 48 processors. Overall the simulation took about 10 hours to complete 1000 timesteps. The figure below shows the resulting displacement distribution. The wall has a thickness of approximately 0.016 cm, and we selected a physiologic Young's modulus of about 1 MPa. The figure below shows the resulting displacement distribution across the cylinder.

<figure>
  <img class="svImg svImgMd" src="documentation/svFSI/fsi_tutorial/imgs/cylinder_displacements.png">
  <figcaption class="svCaption" >Cylinder displacements.</figcaption>
</figure>
