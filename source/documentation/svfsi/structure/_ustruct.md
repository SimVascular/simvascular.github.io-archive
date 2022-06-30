### uSTRUCT: mixed formulation nonlinear elastodynamics

**svFSI** allows solving nonlinear elastodynamics using a mixed formulation where the structure's velocity and pressure are the unknown degrees of freedom <a href="#ref-4">[4]</a>. Two variants are available within this feature: (a) first, a novel variational multiscale stabilized (VMS) formulation that allows equal-order interpolation of velocity and pressure bases using a unified framework <a href="#ref-4">[4]</a>; (b) second, using the classical inf-sup stable Taylor-Hood type elements where the velocity basis is derived from a function space that is one order higher relative to the pressure basis. In the displacement-based formulation, a hyperelastic material model assumes the existence of a Helmholtz free energy potential. However, uSTRUCT postulates hyperelasticity using Gibbs free energy potential <a href="#ref-4">[4]</a> and takes the following additive decoupled form as,
$$
G(\overline{\mathbf{C}},p,T) = G\_{iso}(\overline{\mathbf{C}},T) + G\_{vol}(p,T)
$$

where $G\_{vol}(p,T)=\int \rho^{-1}dp$, $\overline{\mathbf{C}}=J^{-2/3}\mathbf{C}$, $p$ is the pressure and $T$ is the temperature. It is worth mentioning that the free energy above is the specific free energy, i.e. the energy per unit mass. The free energy per unit volume is $G^R=\rho\_0G$, where $\rho\_0$ is the density of the reference configuration. The Helmholtz free energy per unit volume can be obtained by a Legendre transformation of $-G^R$ as,

$$
H^R(\overline{\mathbf{C}},J,T)=\sup\_p\left(-pJ+G^R(\overline{\mathbf{C}},p,T) \right).
$$

and due to the additive splitting of the Gibbs free energy, we have, 

$$
H^R(\overline{\mathbf{C}},J,T)=G\_{iso}^R(\overline{\mathbf{C}},T) + \sup\_p\left(-pJ+G\_{vol}^R(p,T) \right).
$$

It is noted that Gibbs free energy naturally introduces pressure into the stress term. The governing equations for the motion of a continuum body in the current configuration are,

$$ \frac{\mathrm{d} \mathbf{u}}{\mathrm{d} t} - \mathbf{v} = \mathbf{0} $$
$$ \beta(p) \frac{\mathrm{d} p}{\mathrm{d} t} + \nabla\_x \cdot \mathbf{v} = 0 $$
$$ \rho(p) \frac{\mathrm{d} \mathbf{v}}{\mathrm{d} t} - \nabla\_x \cdot \mathbf{\sigma\_{dev}} + \nabla\_x p - \rho(p) \mathbf{f\_b} = \mathbf{0}. $$

The above system of equations represent the kinematic relation between displacement and velocity, balance of mass and linear momentum. $\sigma\_{dev}$ is the deviatoric Cauchy stress, while $\rho$ and $\beta$ are the density and isothermal compressibility coefficient, respectively, defined as functions of pressure. The expressions for these quantities are given as follows,

$$ \rho(p) = \left( \frac{\mathrm{d} G\_{vol}}{\mathrm{d} p} \right)^{-1}, $$
$$ \beta(p) = \frac{1}{\rho} \frac{\mathrm{d} \rho}{\mathrm{d} p} = -\frac{\partial^2 G\_{vol}}{\partial p^2} / \frac{\partial G\_{vol}}{\partial p}, $$
$$ \mathbf{\sigma\_{dev}} = J^{-1} \bar{\mathbf{F}} \left( \mathbb{P}:\bar{\mathbf{S}} \right) \bar{\mathbf{F}}^T, $$
$$ \bar{\mathbf{S}} = 2 \frac{\partial G\_{iso}^R}{\partial \bar{\mathbf{C}}} = 2 \frac{\partial (\rho\_0 G\_{iso})}{\partial \bar{\mathbf{C}}}, $$

where $\mathbb{P} = \mathbb{I} - \frac{1}{3}\mathbf{C} \otimes \mathbf{C}^{-1}$ is the projection tensor, $\bar{\mathbf{F}} = J^{-1/3} \mathbf{F}$ and $\bar{\mathbf{C}} = J^{-2/3} \mathbf{C}$.


This mixed finite element problem is stabilized using variational multiscale method to allow using equal-order interpolating functions for velocity and pressure unknowns, employ linear elements and handle material incompressibility without suffering from locking issues. Defining an appropriate mixed function space, the stabilized weak form can then be written in the current configuration as,

$$ \mathbf{B}\_k :=  \int\_{\Omega\_x} \mathbf{w}\_\mathbf{u} \cdot \left( \frac{\mathrm{d} \mathbf{u}}{\mathrm{d} t} - \mathbf{v} \right) \mathrm{d} \Omega\_x = \mathbf{0} $$

$$ \mathbf{B}\_p :=  \int\_{\Omega\_x} w\_p \left( \beta(p) \frac{\mathrm{d} p}{\mathrm{d} t} + \nabla\_x \cdot \mathbf{v} \right) \mathrm{d} \Omega\_\mathbf{x} \\ + \sum\_e \int\_{\Omega\_x^e} \tau\_M^e \nabla\_x w\_p \cdot \left( \rho(p)\frac{\mathrm{d} \mathbf{v}}{\mathrm{d} t} - \nabla\_x \cdot \mathbf{\sigma\_{dev}} + \nabla\_x p - \rho(p)\mathbf{f\_b} \right) \mathrm{d} \Omega\_x^e = 0 $$

$$ \mathbf{B}\_m :=  \int\_{\Omega\_x} \left( \mathbf{w}\_\mathbf{v} \cdot \rho(p) \frac{\mathrm{d} \mathbf{v}}{\mathrm{d} t} + \nabla\_x \mathbf{w}\_\mathbf{v} : \mathbf{\sigma\_{dev}} - \nabla\_x \cdot \mathbf{w}\_\mathbf{v} p - \mathbf{w}\_\mathbf{v} \cdot \rho(p)\mathbf{f\_b} \right) \mathrm{d} \Omega\_x \\ -\int\_{\Gamma\_x^h} \mathbf{w}\_\mathbf{v} \cdot \mathbf{h} \mathrm{d} \Gamma\_x + \sum\_e \int\_{\Omega\_x^e} \tau\_C \left(\nabla\_x \cdot \mathbf{w}\_\mathbf{v} \right) \left( \beta(p) \frac{\mathrm{d} p}{\mathrm{d} t} + \nabla\_x \cdot \mathbf{v} \right) \mathrm{d} \Omega\_x^e = 0. $$

The stabilization parameters are chosen as, 

$$
\mathbf{\tau}\_M = \tau\_M\mathbf{I}\_{nd}, \quad \tau\_M = c\_m \frac{\Delta x^e}{c\rho}, \quad \tau\_C = c\_c c\Delta x^e \rho
$$

where, $\Delta x^e$ is the diameter of the circumscribing sphere of the tetrahedral element, $c\_m$ and $c\_c$ are two non-dimensional parameters, and $c$ is the maximum wave speed in the solid body. For compressible materials, $c$ is the bulk wave speed. Assuming isotropic small-strain linear elastic material, the bulk wave speed can be approximated as, $c=\sqrt{ \left( \lambda+2\mu \right) / \rho\_0}$, where $\lambda$ and $\mu$ are the Lame's parameters. For incompressible materials, $c = \sqrt{\frac{\mu}{\rho\_0}}$ is the shear wave speed. Further details about the formulation, finite element discretization and time integration could be found in Liu et al. <a href="#ref-4">[4]</a>.
