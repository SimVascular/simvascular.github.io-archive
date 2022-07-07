### STRUCT: displacement-based nonlinear elastodynamics


The STRUCT equation solves equations for nonlinear structural dynamics using finite element formulation. We start with the function spaces and weak form. We require that the trial and weighting functions satisfy their respective properties on the current domain. The strong form of the momentum balance is

$$ \rho\ddot{\mathbf{u}} = \nabla\_{x}\cdot{\sigma} + \rho\mathbf{f\_b}, $$
$$ \sigma\cdot \mathbf{n} = \mathbf{h},~\mathrm{on}~\left(\Gamma\_{t}\right)\_{h}. $$

where $\sigma$ is the stress term in the current configuration.

The resulting weak form of the structural dynamics equations is 

$$ \int\_{\Omega\_{t}} \mathbf{w} \cdot \rho \ddot{\mathbf{u}} d \Omega+\int\_{\Omega\_{0}} \nabla\_{X} \mathbf{w}:(\mathbf{F} \mathbf{S}) d \Omega-\int\_{\Omega\_{t}} \mathbf{w} \cdot \rho \mathbf{f\_b} d \Omega-\int\_{\left(\Gamma\_{t}\right)\_{h}} \mathbf{w} \cdot \mathbf{h} d \Gamma\_{h}=0 $$

The acceleration term (i.e. $\int\_{\Omega\_{t}} \mathbf{w} \cdot \rho \ddot{\mathbf{u}} d \Omega$), body forcing term (i.e. $\int\_{\Omega\_{t}} \mathbf{w} \cdot \mathbf{f\_b} d \Omega$), and the natural boundary condition term (i.e. $\int\_{\left(\Gamma\_{t}\right)\_{h}} \mathbf{w} \cdot \mathbf{h} d \Gamma\_{h}$) are all evaluated in the current configuration. These terms are commonly referred to as external work done on the structure by body forces and surface tractions. The remaining stress term in the equation is often referred to as internal work done on the structure by internal stresses, which we will treat differently here. We rewrite this in the reference configuration in terms of the deformation gradient and the second Piola-Kirchhoff stress tensor, which is commonly denoted as $\mathbf{S}$. 

**svFSI**  uses a splitting approach where the strain energy and the resulting second Piola-Kirchhoff stress tensor, $\mathbf{S}$, are decomposed into deviatoric (or isochoric, $\mathbf{S}\_{iso}$) and dilational (or volumetric, $\mathbf{S}\_{vol}$) components. The specific form of $\mathbf{S}$ will depend on the chosen constitutive model (isochoric and volumetric). More information on these <a href="#material-model">Material models</a> can be found in the literature <a href="#ref-1">[1]</a>. It is noted that the symbol $E$ denotes the elastic modulus of the structure and is not to be confused with $\mathbf{E}$, which denotes the Green-Lagrange strain tensor, and $\nu$ represents Poisson's ratio. Some key material parameters can then be defined as,

$$ \lambda=\frac{E v}{(1+v)(1-2 v)}, \quad \mu=\frac{E}{2(1+v)}, \quad \kappa=\lambda + \frac{2}{3} \mu $$

where, $\lambda$ and $\mu$ are the Lame's first and second parameters, respectively, and $\kappa$ is the bulk modulus. The second Piola-Kirchhoff stress tensors for a few standard constitutive models are given as,

$$ \mathbf{S}^{StVK} = 2 \mu \mathbf{E} + \lambda \operatorname{tr}(\mathbf{E}) \mathbf{I}, ~~~ \textrm{St. Venant-Kirchhoff} $$
$$ \mathbf{S}^{mStVK} = \kappa \operatorname{ln}(J) \mathbf{C}^{-1} + \mu(\mathbf{C} - \mathbf{I}), ~~~ \textrm{Modified St. Venant-Kirchhoff} $$
$$ \mathbf{S\_{iso}}^{nHK} = \mu J^{-2/3} \left(\mathbf{I} - \frac{1}{3} \operatorname{tr}(\mathbf{C}) \mathbf{C}^{-1} \right), ~~ \textrm{Neo-Hookean} $$

where $\mathbf{I}$ is the identity matrix. For the Neo-Hookean and other hyperelastic constitutive models, the $\mathbf{S}$ tensor is computed as $\mathbf{S} = \mathbf{S\_{iso}} + \mathbf{S\_{vol}}$, where $\mathbf{S\_{vol}} = p J \mathbf{C}^{-1}$, and $p$ is the hydrostatic pressure computed based on the chosen dilational strain-energy function. See the section on <a href="#material-model">Material models</a> and the corresponding references for the available dilational penalty models in **svFSI** .
