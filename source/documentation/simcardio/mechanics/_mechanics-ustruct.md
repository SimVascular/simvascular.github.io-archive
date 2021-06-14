## uSTRUCT: mixed formulation nonlinear elastodynamics ##

**svFSI** allows solving nonlinear elastodynamics using a mixed formulation where the structure's velocity and pressure are the unknown degrees of freedom <a href="#ref-4">[4]</a>. Two variants are available within this feature: (a) first, a novel variational multiscale stabilized (VMS) formulation that allows equal-order interpolation of velocity and pressure bases using a unified framework <a href="#ref-4">[4]</a>; (b) second, using the classical inf-sup stable Taylor-Hood type elements where the velocity basis is derived from a function space that is one order higher relative to the pressure basis. In the displacement-based formulation, a hyperelastic material model assumes the existence of a Helmholtz free energy potential. However, uSTRUCT postulates hyperelasticity using Gibbs free energy potential <a href="#ref-4">[4]</a> and takes the following additive decoupled form as,
$$
\begin{equation}
  G(\overline{\mathbf{C}},p,T) = G_{iso}(\overline{\mathbf{C}},T) + G_{vol}(p,T)
\end{equation}
$$

where $G_{vol}(p,T)=\int \rho^{-1}dp$, $\overline{\mathbf{C}}=J^{-2/3}\mathbf{C}$, $p$ is the pressure and $T$ is the temperature. It is worth mentioning that the free energy above is the specific free energy, i.e. the energy per unit mass. The free energy per unit volume is $G^R=\rho_0G$, where $\rho_0$ is the density of the reference configuration. The Helmholtz free energy per unit volume can be obtained by a Legendre transformation of $-G^R$ as,

$$
\begin{equation}
  H^R(\overline{\mathbf{C}},J,T)=\sup_p\left(-pJ+G^R(\overline{\mathbf{C}},p,T) \right).
\end{equation}
$$

and due to the additive splitting of the Gibbs free energy, we have, 

$$
\begin{equation}
  H^R(\overline{\mathbf{C}},J,T)=G_{iso}^R(\overline{\mathbf{C}},T) + \sup_p\left(-pJ+G_{vol}^R(p,T) \right).
\end{equation}
$$

It is noted that Gibbs free energy naturally introduces pressure into the stress term. The governing equations for the motion of a continuum body in the current configuration are,

$$
\begin{equation}
  \begin{split}
    & \frac{\mathrm{d} \mathbf{u}}{\mathrm{d} t} - \mathbf{v} = \mathbf{0} \\

    & \beta(p) \frac{\mathrm{d} p}{\mathrm{d} t} + \nabla_x \cdot \mathbf{v} = 0  \\

    & \rho(p) \frac{\mathrm{d} \mathbf{v}}{\mathrm{d} t} - \nabla_x \cdot \mathbf{\sigma_{dev}} + \nabla_x p - \rho(p) \mathbf{f_b} = \mathbf{0}.
  \end{split}
\end{equation}
$$

The above system of equations represent the kinematic relation between displacement and velocity, balance of mass and linear momentum. $\sigma_{dev}$ is the deviatoric Cauchy stress, while $\rho$ and $\beta$ are the density and isothermal compressibility coefficient, respectively, defined as functions of pressure. The expressions for these quantities are given as follows,

$$
\begin{equation}
  \begin{split}
    & \rho(p) = \left( \frac{\mathrm{d} G_{vol}}{\mathrm{d} p} \right)^{-1} \quad &, \quad & \beta(p) = \frac{1}{\rho} \frac{\mathrm{d} \rho}{\mathrm{d} p} = -\frac{\partial^2 G_{vol}}{\partial p^2} / \frac{\partial G_{vol}}{\partial p} \\

    & \mathbf{\sigma_{dev}} = J^{-1} \bar{\mathbf{F}} \left( \mathbb{P}:\bar{\mathbf{S}} \right) \bar{\mathbf{F}}^T \quad &, \quad & \bar{\mathbf{S}} = 2 \frac{\partial G_{iso}^R}{\partial \bar{\mathbf{C}}} = 2 \frac{\partial (\rho_0 G_{iso})}{\partial \bar{\mathbf{C}}},
  \end{split}
\end{equation}
$$

where $\mathbb{P} = \mathbb{I} - \frac{1}{3}\mathbf{C} \otimes \mathbf{C}^{-1}$ is the projection tensor, $\bar{\mathbf{F}} = J^{-1/3} \mathbf{F}$ and $\bar{\mathbf{C}} = J^{-2/3} \mathbf{C}$.


This mixed finite element problem is stabilized using variational multiscale method to allow using equal-order interpolating functions for velocity and pressure unknowns, employ linear elements and handle material incompressibility without suffering from locking issues. Defining an appropriate mixed function space, the stabilized weak form can then be written in the current configuration as,

  $$
  \begin{equation}
  \begin{split}
    & \mathbf{B}_k := & \int_{\Omega_x} \mathbf{w}_\mathbf{u} \cdot \left( \frac{\mathrm{d} \mathbf{u}}{\mathrm{d} t} - \mathbf{v} \right) \mathrm{d} \Omega_x = \mathbf{0} \\

    & \mathbf{B}_p := & \int_{\Omega_x} w_p \left( \beta(p) \frac{\mathrm{d} p}{\mathrm{d} t} + \nabla_x \cdot \mathbf{v} \right) \mathrm{d} \Omega_\mathbf{x} \\

    & & + \sum_e \int_{\Omega_x^e} \tau_M^e \nabla_x w_p \cdot \left( \rho(p)\frac{\mathrm{d} \mathbf{v}}{\mathrm{d} t} - \nabla_x \cdot \mathbf{\sigma_{dev}} + \nabla_x p - \rho(p)\mathbf{f_b} \right) \mathrm{d} \Omega_x^e = 0 \\

    & \mathbf{B}_m := & \int_{\Omega_x} \left( \mathbf{w}_\mathbf{v} \cdot \rho(p) \frac{\mathrm{d} \mathbf{v}}{\mathrm{d} t} + \nabla_x \mathbf{w}_\mathbf{v} : \mathbf{\sigma_{dev}} - \nabla_x \cdot \mathbf{w}_\mathbf{v} p - \mathbf{w}_\mathbf{v} \cdot \rho(p)\mathbf{f_b} \right) \mathrm{d} \Omega_x \\

     & & -\int_{\Gamma_x^h} \mathbf{w}_\mathbf{v} \cdot \mathbf{h} \mathrm{d} \Gamma_x + \sum_e \int_{\Omega_x^e} \tau_C \left(\nabla_x \cdot \mathbf{w}_\mathbf{v} \right) \left( \beta(p) \frac{\mathrm{d} p}{\mathrm{d} t} + \nabla_x \cdot \mathbf{v} \right) \mathrm{d} \Omega_x^e = 0.

    \end{split}
  \end{equation}
  $$

The stabilization parameters are chosen as, 

$$
\begin{equation}
  \mathbf{\tau}_M = \tau_M\mathbf{I}_{nd}, \quad \tau_M = c_m \frac{\Delta x^e}{c\rho}, \quad \tau_C = c_c c\Delta x^e \rho
\end{equation}
$$

where, $\Delta x^e$ is the diameter of the circumscribing sphere of the tetrahedral element, $c_m$ and $c_c$ are two non-dimensional parameters, and $c$ is the maximum wave speed in the solid body. For compressible materials, $c$ is the bulk wave speed. Assuming isotropic small-strain linear elastic material, the bulk wave speed can be approximated as, $c=\sqrt{ \left( \lambda+2\mu \right) / \rho_0}$, where $\lambda$ and $\mu$ are the Lam&eacute's parameters. For incompressible materials, $c = \sqrt{\frac{\mu}{\rho_0}}$ is the shear wave speed. Further details about the formulation, finite element discretization and time integration could be found in Liu et al. <a href="#ref-4">[4]</a>.