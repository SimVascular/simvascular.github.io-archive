## STRUCT: displacement-based nonlinear elastodynamics ##


The STRUCT equation solves equations for nonlinear structural dynamics using finite element formulation. We start with the function spaces and weak form. We require that the trial and weighting functions satisfy their respective properties on the current domain. The strong form of the momentum balance is

  $$
  \begin{equation}
    \begin{split}
      \rho\ddot{\mathbf{u}} = \nabla_{x}\cdot{\sigma} + \rho\mathbf{f_b}, \\
      \sigma\cdot \mathbf{n} = \mathbf{h},~\mathrm{on}~\left(\Gamma_{t}\right)_{h}.
    \end{split}
  \end{equation}
  $$

where $\sigma$ is the stress term in the current configuration.

The resulting weak form of the structural dynamics equations is 

$$
\begin{equation}
  \int_{\Omega_{t}} \mathbf{w} \cdot \rho \ddot{\mathbf{u}} d \Omega+\int_{\Omega_{0}} \nabla_{X} \mathbf{w}:(\mathbf{F} \mathbf{S}) d \Omega-\int_{\Omega_{t}} \mathbf{w} \cdot \rho \mathbf{f_b} d \Omega-\int_{\left(\Gamma_{t}\right)_{h}} \mathbf{w} \cdot \mathbf{h} d \Gamma_{h}=0
\end{equation}
$$

The acceleration term (i.e. $\int_{\Omega_{t}} \mathbf{w} \cdot \rho \ddot{\mathbf{u}} d \Omega$), body forcing term (i.e. $\int_{\Omega_{t}} \mathbf{w} \cdot \mathbf{f_b} d \Omega$), and the natural boundary condition term (i.e. $\int_{\left(\Gamma_{t}\right)_{h}} \mathbf{w} \cdot \mathbf{h} d \Gamma_{h}$) are all evaluated in the current configuration. These terms are commonly referred to as external work done on the structure by body forces and surface tractions. The remaining stress term in the equation is often referred to as internal work done on the structure by internal stresses, which we will treat differently here. We rewrite this in the reference configuration in terms of the deformation gradient and the second Piola-Kirchhoff stress tensor, which is commonly denoted as $\mathbf{S}$. 

**svFSI**  uses a splitting approach where the strain energy and the resulting second Piola-Kirchhoff stress tensor, $\mathbf{S}$, are decomposed into deviatoric (or isochoric, $\mathbf{S}_{iso}$) and dilational (or volumetric, $\mathbf{S}_{vol}$) components. The specific form of $\mathbf{S}$ will depend on the chosen constitutive model (isochoric and volumetric). More information on these <a href="#material-model">Material models</a> can be found in the literature <a href="#ref-1">[1]</a>. It is noted that the symbol $E$ denotes the elastic modulus of the structure and is not to be confused with $\mathbf{E}$, which denotes the Green-Lagrange strain tensor, and $\nu$ represents Poisson's ratio. Some key material parameters can then be defined as,
$$
\begin{equation}
    \lambda=\frac{E v}{(1+v)(1-2 v)}, \quad \mu=\frac{E}{2(1+v)}, \quad \kappa=\lambda + \frac{2}{3} \mu
\end{equation}
$$

where, $\lambda$ and $\mu$ are the Lam&eacute's first and second parameters, respectively, and $\kappa$ is the bulk modulus. The second Piola-Kirchhoff stress tensors for a few standard constitutive models are given as,

$$
\begin{equation}
  \begin{split}
    & \mathbf{S}^{StVK} & = 2 \mu \mathbf{E} + \lambda \operatorname{tr}(\mathbf{E}) \mathbf{I}, & \quad \textrm{St. Venant-Kirchhoff} \\
    & \mathbf{S}^{mStVK} & = \kappa \operatorname{ln}(J) \mathbf{C}^{-1} + \mu(\mathbf{C} - \mathbf{I}), & \quad \textrm{Modified St. Venant-Kirchhoff} \\
    & \mathbf{S_{iso}}^{nHK} & = \mu J^{-2/3} \left(\mathbf{I} - \frac{1}{3} \operatorname{tr}(\mathbf{C}) \mathbf{C}^{-1} \right), & \quad \textrm{Neo-Hookean}
  \end{split}
\end{equation}
$$

where $\mathbf{I}$ is the identity matrix. For the Neo-Hookean and other hyperelastic constitutive models, the $\mathbf{S}$ tensor is computed as $\mathbf{S} = \mathbf{S_{iso}} + \mathbf{S_{vol}}$, where $\mathbf{S_{vol}} = p J \mathbf{C}^{-1}$, and $p$ is the hydrostatic pressure computed based on the chosen dilational strain-energy function. See the section on <a href="#material-model">Material models</a> and the corresponding references for the available dilational penalty models in **svFSI** .
