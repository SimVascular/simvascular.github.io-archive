<h1>A coupled multi-domain method for 1D hemodynamics</h1>

Flow and pressure waves, originating due to the contraction of the heart, propagate along the deformable vessels and reflect due to tapering, branching, and other discontinuities. The size and complexity of the cardiovascular system necessitate a multidomain approach, with “upstream” regions of interest (large arteries) coupled to reduced-order models of “downstream” vessels. Previous efforts to couple upstream and downstream domains have included specifying resistance and impedance outflow boundary conditions for the nonlinear one-dimensional wave propagation equations and iterative coupling between three-dimensional and one-dimensional numerical methods. We have developed a new approach to solve the one-dimensional nonlinear equations of blood flow in elastic vessels utilizing a space-time finite element method with GLSstabilization for the upstream domain, and a boundary term to couple to the downstream domain. 

The outflow boundary conditions are derived following an approach analogous to the Dirichlet-to-Neumann (DtN) method. 

In the downstream domain, we solve simplified 0D/1D equations to derive relationships between pressure and flow accommodating periodic and transient phenomena with a consistent formulation for different boundary condition types. In this chapter, we also present a new boundary condition that accommodates transient phenomena based on a Green’s function solution of the linear, damped wave equation in the downstream domain. 

The mathematical formulation, the numerical derivation and results are presented in the next sections.

We present here the different steps that are required to develop the coupled multidomain method from the strong form in the original domain to the variational form in the computational domain that includes the information of the analytical domain.

<!--- Strong Form --->

<h2>Strong form</h2>
The one-dimensional equations for the flow of a Newtonian, incompressible fluid in a deforming, elastic domain consist of the continuity 
equation, a single axial momentum balance equation, a constitutive equation, and suitable initial and boundary conditions. The governing 
equations are derived in a general form by Hughes <a href="#ref-2">[2]</a> and 
Hughes and Lubliner <a href="#ref-1">[1]</a>. The partial differential equations for mass and momentum 
balance are given by (z is the axial coordinate):

$$\frac{\partial S}{\partial t} + \frac{\partial Q}{\partial z} = -\psi$$
          
$$\frac{\partial Q}{\partial t} + \frac{\partial}{\partial z}\left[(1 + \delta)\,\frac{Q^2}{S}\right] + \frac{S}{\rho}\,\frac{\partial p}{\partial z} = S\,f + N\,\frac{Q}{S} + \nu\frac{\partial^2 Q}{\partial z^2}$$

The primary variables are the cross-sectional area $S$, the pressure $p$, and the volumetric flow rate $Q$. 
The density of the fluid is given by ρ (assumed constant), the external force by $f$, the kinematic viscosity by $\nu$ (assumed constant) 
and $\psi$ is an outflow function (taken to be zero for impermeable vessels). 
The variables $\delta$ and $N$ are defined by the choice of a profile function for the velocity over the cross-section. Here we choose 
a time-varying, parabolic flow profile, thus Hughes and Lubliner <a href="#ref-1">[1]</a>:

   $$\delta = \frac{1}{3},\quad N = -8\,\pi\,\nu \label{1} \tag{1} $$

The governing equations are of mixed parabolic-hyperbolic type, but have mainly a hyperbolic nature since the diffusive term is small. We thus impose one boundary condition at each inlet/outlet by specifying values of the primary variables or a relationship between them. 

The flow rate is typically specified at the inlet(s) ($\Gamma\_in$), but the inlet boundaries can accommodate the same types of boundary conditions as will be subsequently discussed for the outlets:

   $$ Q(z,t) = Q\_in(t),\quad z\in\Gamma\_in $$


The initial conditions for this problem are given by (where $S^0(z)$, $Q^0(z)$ and $p^0(z)$ are prescribed functions):


   $$ S(z,0) = S^0(z),Q(z,0) = Q^0(z)\,\text{and}\, p(z,0) = p^0(z) $$


In order to complete the above system, we need to introduce a constitutive relationship. An elastic model is assumed, which relates the pressure to the cross-sectional area as follows:

   $$p(z,t) = \tilde{p}[S(z,t),z,t]$$

and its inverse function

   $$ S(z,t) = \tilde{S}[p(z,t),z,t] \label{2} \tag{2} $$


The particular constitutive relationship that we have used is that proposed by Olufsen <a href="#ref-3">[3]</a>:

   $$ \tilde{p}(S,z) = p^0(z) + \frac{4}{3}\,\frac{E\,h}{r^0(z)}\,\left(1 - \sqrt{\frac{S^0(z)}{S(z,t)}}\right) \label{3} \tag{3} $$

here the Young’s modulus $E$ and the wall thickness $h$ relate to the radius $r^0 = \sqrt{S^0(z)/\pi}$:

   $$ \frac{E\,h}{r^0(z)} = k\_1\,\exp{k\_2\,r^0(z)} + k\_3 $$

In this relationship, $k\_1$, $k\_2$, and $k\_3$ are empirically-derived constants with values in CGS units of 
$2x10^{7} g⋅ s^{-2}⋅ cm^{-1}$, $-22.53 cm^{-1}$, and $8.65 x 10^{5} g⋅ s^{-2}⋅ cm^{-1}$, respectively. 
Here we use a constant initial pressure $p^0(z) = p^0$. By noting that the pressure gradient can be expanded as

  $$ \frac{\partial p}{\partial z} = \frac{\partial\tilde{p}}{\partial S}\,\frac{\partial S}{\partial z} + \frac{\partial\tilde{p}}{\partial z} $$

we can rewrite the system of partial differential equations in the following quasi-linear conservative form:

   $$ \frac{\partial\mathbf{U}}{\partial t} + \frac{\partial\mathbf{F}}{\partial z} - \mathbf{K}\,\frac{\partial^2\mathbf{U}}{\partial z^2} = G,\,\text{or}\quad\frac{\partial\mathbf{U}}{\partial t} + \frac{\partial\mathbf{F}}{\partial z} - \mathbf{K}\,\frac{\partial^2\mathbf{U}}{\partial z^2} = \mathbf{C}\_F\,\mathbf{U} $$

where

   $$ \mathbf{U} = \begin{bmatrix}U\_1\ \cr U\_2 \end{bmatrix} = \begin{bmatrix} S \cr Q \end{bmatrix} \label{4} \tag{4} $$

   $$ \mathbf{F} = \begin{bmatrix} U\_2 \cr (1 + \delta)\,\frac{U\_2^2}{U\_1} + \frac{1}{\rho}\,\int\_{p^0}^{p(z,t)}\tilde{S}(p,z,t)\,dp \end{bmatrix}, \quad \mathbf{K} = \begin{bmatrix} 0 & 0 \cr 0 & \nu\\ \end{bmatrix} $$

   $$ \mathbf{G} = \begin{bmatrix} -\psi \cr U\_1\,f + N\,\frac{U\_2}{U\_1} + \int\_{p^0}^{p}\frac{1}{\rho}\,\frac{\partial\tilde{S}(p,z,t)}{\partial z}\,dp \end{bmatrix},\quad $$

   $$ \mathbf{C}\_F = \begin{bmatrix} -\frac{\psi}{U\_1} & 0 \cr f + \frac{1}{U\_1}\,\int\_{p^0}^{p}\frac{1}{\rho}\,\frac{\partial\tilde{S}(p,z,t)}{\partial z}\,dp & \frac{N}{U\_1} \end{bmatrix} $$


The motivation to work with the conservative form rather than the advective form as in previous work <a href="#ref-4">[4]</a>, is to be able to integrate by part the convective term and obtain a flux (a boundary integral) through which the multidomain coupling can be performed.

Note that in the advective form, the only term that can easily be integrated by parts is the longitudinal viscous term, which is very small and often neglected in one-dimensional theory. Thus, the main difference between the two forms is the treatment of the boundary conditions. 

In the present conservative formulation, boundary conditions are prescribed in a natural way. In contrast, in the advective form, boundary conditions are enforced in an essential way: the equation for the corresponding dof is replaced by an equation representing the boundary condition.


<h2> Weak form </h2>

The weak formulation of the initial boundary value problem is given as follows with $\Omega = [0, L]$ : find $\mathbf{U}$ in $\mathcal{V} = \{\mathbf{U}:\Omega\times (0,T)\rightarrow\mathbb{R}^2\,|\,\mathbf{U}(z,t)\in H\_0^1\}$ such that $\forall\,\mathbf{W} = \left[W\_1\,W\_2\right]^T\in\mathcal{V}$,


$$ \begin{eqnarray}
   & \int\_{0}^{t}\int\_{0}^{L}\left(-\mathbf{W}\_{,t}^T\,\mathbf{U} - \mathbf{W}\_{,z}^T\,\mathbf{F} + \mathbf{W}\_{,z}^T\,\mathbf{K}\,\mathbf{U}\_{,z}-\mathbf{W}^T\,\mathbf{G}\right)\,dz\,dt + \int\_{0}^{T} \left[\mathbf{W}^T\left(\mathbf{F}-\mathbf{K}\mathbf{U}\_{,z}\right)\right]\\\_{0}^{L}\,dt + \cr
   & \int\_{0}^{L}\mathbf{W}^T(z,T)\mathbf{U}(z,T)\,dz - \cr
   & \int\_{0}^{L}\mathbf{W}^T(z,0)\,\mathbf{U}^0(z)\,dz = 0
   \end{eqnarray} $$


where the initial condition is given by $\mathbf{U}^0(z) = \left[S^0(z),Q^0(z)\right]^T$. 
The boundary conditions are not specified at this point.

<h2> Disjoint Decomposition </h2>
We adopt the disjoint decomposition approach described in 2.3 to derive appropriate outflow boundary conditions. 
First, we divide our spatial domain $\Omega=[0,L]$ into an upstream **numerical** domain $\Omega^{n}: z\in(0,B)$, 
and a downstream **analytic** domain $\Omega^{a}: z\in(B,L)$.

The boundary that separates these domains is defined as $\Gamma\_{B} : z = B$. We define a disjoint decomposition of 
our variables, for example for our unknown solution vector $\mathbf{U}$

   $$\mathbf{U} = \mathbf{U}^{n} + \mathbf{U}^{a}$$

so that

   $$\mathbf{U} = \begin{cases} \mathbf{U}^{n} & z\in\Omega^{n} \cr \mathbf{U}^{a} & z\in\Omega^{a} \end{cases}$$

We use a similar decomposition for our weighting function, $\mathbf{W}$ , and insert these expressions into our variational form. 

The disjoint nature of this expression is used to derive a new variational form for the 1D numerical domain: we obtain the original variational form specialized to the 1D numerical domain $\Omega^{n}$ with the addition of a boundary term accounting for the interface to the 1D analytic domain, $\Omega^{a}$

   $$\begin{eqnarray}
   & \int\_{0}^{t}\int\_{0}^{B}\left(-\mathbf{W}\_{,t}^{n\,T}\,\mathbf{U}^{n} - \mathbf{W}\_{,z}^{n\,T}\,\mathbf{F}(\mathbf{U}^{n}) + \mathbf{W}\_{,z}^{n\,T}\,\mathbf{K}\,\mathbf{U}^{n}\_{,z}-\mathbf{W}^{n\,T}\,\mathbf{G}(\mathbf{U}^{n})\right)\,dz\,dt \cr
   & -\int\_{0}^{B}\,\mathbf{W}^{n\,T}(z,T)\,\mathbf{U}^{n}(z,T)\,dz + 
   \int\_{0}^{B}\mathbf{W}^{n\,T}(z,0)\,\mathbf{U}^{n}(z,0)\,dz + \cr
   & \int\_{0}^{T}\left[\mathbf{W}^{n\,T}\left(\mathbf{F}(\mathbf{U}^{n}) - \mathbf{K}\,\mathbf{U}^{n}\_{,z}\right)\right]\_{z=0}\,dt - 
   \int\_{0}^{T}\left[\mathbf{W}^{a\,T}\left(\mathbf{F}(\mathbf{U}^{a}) - \mathbf{K}\,\mathbf{U}^{a}\_{,z}\right)\right]\_{z=B}\,dt = 0
   \end{eqnarray} \label{5} \tag{5} $$

Now, we enforce the continuity of the weighting function at the interface:

   $$ \mathbf{W}^{a}\vert\_{z=B} = \mathbf{W}^{n}\vert\_{z=B} $$

and define the operators $\mathbf{M}$ and $\mathbf{H}$ on the $\Omega^{a}$ domain based on the model of the
downstream domain:

   $$\left[\mathbf{M}(\mathbf{U}^{a})\right]\_{z=B} = \left[\mathbf{F}(\mathbf{U}^{a}) - \mathbf{K}\mathbf{U}^{a}\_{,z}\right]_{z=B} $$

$\mathbf{M}$ acts on the solution variables and $\mathbf{H}$ depends only on other terms like initial conditions, boundary conditions, and physical properties in the downstream domain. 

Finally, we enforce the continuity of the flux at the boundary:

   $$ \left[\mathbf{M}(\mathbf{U}^{n})\right]\_{z=B} = \left[\mathbf{M}(\mathbf{U}^{a})\right]\_{z=B}  \label{6} \tag{6} $$
   
The final result is

   $$ \begin{eqnarray}
   & \int\_{0}^{t}\int\_{0}^{B}\left(-\mathbf{W}\_{,t}^{n\,T}\,\mathbf{U}^{n} - \mathbf{W}\_{,z}^{n\,T}\,\mathbf{F}(\mathbf{U}^{n}) + \mathbf{W}\_{,z}^{n\,T}\,\mathbf{K}\,\mathbf{U}^{n}\_{,z}-\mathbf{W}^{n\,T}\,\mathbf{G}(\mathbf{U}^{n})\right)\,dz\,dt \cr
   & -\int\_{0}^{B}\,\mathbf{W}^{n\,T}(z,T)\,\mathbf{U}^{n}(z,T)\,dz + 
   \int\_{0}^{B}\mathbf{W}^{n\,T}(z,0)\,\mathbf{U}^{n}(z,0)\,dz + \cr
   & \int\_{0}^{T}\left[\mathbf{W}^{n\,T}\left(\mathbf{F}(\mathbf{U}^{n}) - \mathbf{K}\,\mathbf{U}^{n}\_{,z}\right)\right]\_{z=0}\,dt - 
   \int\_{0}^{T}\left[\mathbf{W}^{n\,T}\left(\mathbf{M}(\mathbf{U}^{n}) + \mathbf{H}\right)\right]\_{z=B}\,dt = 0
   \end{eqnarray} $$

We see that the solution in the numerical domain depends on the operators $\mathbf{M}$ and $\mathbf{H}$ defined by the mathematical model of the downstream domain but not the solution
variable, $\mathbf{U}^{a}$, in the downstream domain.


<h2> The Map from the “DtN” Method </h2>
The operators $\mathbf{M}$ and $\mathbf{H}$ are based on the mathematical model of the downstream domain using an approach based on the “Dirichlet-to-Neumann” method <a href="#ref-5">[5-7,9]</a>.
The physics of the downstream domain depends on the upstream domain. Thus, an explicit solution on the downstream domain cannot be obtained. Instead, a relationship between the unknowns that incorporates all the information of the model, the *map*, is
derived. 
The DtN map is then inserted into the flux term previously described $eq20$, to derive the operators $\mathbf{M}$ and $\mathbf{H}$. 
In practice, the contribution of the diffusive flux term $\mathbf{K}\mathbf{U}\_{,z}$ is observed to be negligible 
in the boundary integral and is hence omitted in deriving an expression for $\mathbf{M}$ and $\mathbf{H}$ from 
equations $\eqref{4}$ and $\eqref{6}$:

   $$ \begin{eqnarray}
   M\_1(Q,S) + H\_1 & = Q \cr
   M\_2(Q,S) + H\_2 & = (1 + \delta)\,\frac{Q^2}{S} + \frac{1}{\rho}\int\_{p\_0}^{p} \tilde{S}(p,z,t)\,dp
   \end{eqnarray} \label{7} \tag{7} $$

Note that the boundary conditions are not exact since, at a minimum, a linear approximation is employed in the downstream domain whereas a nonlinear model is used in the upstream domain.


<h3> Resistance (0D, constant in time) </h3>

We can distinguish between instantaneous and memory cases. An example of an instantaneous map is when a simple proportional relationship is prescribed between pressure at time $t$ and flow at the same point in time that represents the resistance to flow
of the downstream domain, $Q(B,t) = p(B,t)/R$. The resistance $R$ can be measured, taken from the literature or derived for Poiseuille flow (steady flow) or other models. 
Then using equations $\eqref{1}$, $\eqref{2}$, $\eqref{3}$, and integrating the pressure term in $\eqref{7}$:

   $$\begin{eqnarray}
   M\_1(S) & = \frac{\tilde{p}(S,B)}{R},\quad H\_1 = 0 \cr
   M\_2(S) & = \frac{4}{3}\,\frac{M\_1(S)^2}{S} + frac{4\,\sqrt{\pi}}{3}\,\frac{E\,h}{\rho}\,\sqrt{S},\quad H\_2 = -\frac{4}{3\,\rho}\,E\,h\,\pi\,r^{0}(B)
   \end{eqnarray}$$


<h3> Windkessel RCR circuit model (0D, fully transient) </h3>

Flow and pressure are related by the following relationship

   $$Q(B,t) = \left[Q(B,0) - \frac{p^0(B)}{R}\right]\exp(-\alpha\,t) + \frac{p(B,t)}{R} - \frac{1}{R^2\,C}\,\int\_{0}^{t} p(B,\tau)\exp(-\alpha(t-\tau))\,d\tau$$

   $$\alpha = \frac{R + R\_d}{R\,R\_d\,C}$$

Then using equations $\eqref{1}$, $\eqref{2}$ and $\eqref{3}$, and integrating the pressure term in $\eqref{7}$:

   $$M\_1(S) = \frac{\tilde{p}[S(B,t),B,t]}{R} - \frac{1}{R^2\,C}\,\int\_{0}^{t}\tilde{p}[S(B,\tau),B,\tau]\,\exp(-\alpha(t-\tau))\,d\tau$$

   $$H\_1 = \left[Q(B,0) - \frac{p^0(B)}{R}\right]\exp(-\alpha\,t)$$

   $$M\_2(S) = \frac{4}{3}\,\frac{[M\_1(S) + H\_1]^2}{S} + \frac{4\,\sqrt{\pi}}{3}\,\frac{E\,h}{\rho}\,\sqrt{S}$$

   $$H\_2 = -\frac{4}{3\,\rho}\,E\,h\,\pi\, r^{0}(B)$$


The flow rate at time $t$ depends on the entire history of the pressure represented by the time integral in the above equations.

<h3> Impedance (1D, periodic) </h3>

Another example of a memory map is the impedance model: the downstream domain is approximated using linear wave propagation theory and we further assume that the solution is periodic in time. We can then derive

   $$Q(B,t) = \frac{1}{T}\int\_{t-\tau}^{t}\,p(B,\tau)\,y(B,t-\tau)\,d\tau \label{8}  \tag{8} $$


The flow rate at time $t$ depends on the history of the pressure over one period. Here $y(B,t)$ is the inverse Fourier transform of the admittance function 
The representation formula for the operators then reads, using equations $\eqref{1}$, $\eqref{2}$, $\eqref{3}$,
$\eqref{7}$, $\eqref{8}$:

   $$M\_1(S) = \frac{1}{T}\,\int\_{t-\tau}^{t}\,\tilde{p}\left[S(B,\tau),B\right]\,y(B,t-\tau)\,d\tau,\quad H\_1=0$$

   $$M\_2(S) = \frac{4}{3}\,\frac{M\_1(S)^2}{S} + \frac{4\,\sqrt{\pi}}{3}\,\frac{E\,h}{\rho}\,\sqrt{S},\quad H\_2 = -\frac{4}{3\,\rho}\,E\,h\,\pi\, r^{0}(B)$$

The flow rate at time $t$ depends on the history of the pressure over one cardiac cycle represented by the time integral in the above equations.


<h3> Wave in a tube (1D, fully transient) </h3>
Another example of a memory map is the more general one-dimensional wave equation. The derivation of a minimally reflecting boundary condition for the one-dimensional non-linear equations using the wave equation for the downstream domain has been inspired by the work of Givoli, Grote and colleagues <a href="#ref-7">[7-9]</a> on exact nonreflecting boundary conditions for the linear wave equation. 
For this latter case, we approximate the downstream domain using one-dimensional linear wave propagation theory but do not assume periodicity in time. 
As an example, in the case where the downstream domain is a single elastic vessel with length $l$ and wave speed $c$, going from the boundary point $B$ to the far end point $L$, we derived a map with the related Green’s function that relates cross-sectional area and its derivative at the inlet of a segment:

  $$\frac{\partial S}{\partial z}(B,t) = -\frac{S(B,t)}{l} + \exp(\gamma\, t)\,\int\_{0}^{t}\int\_{B}^{L}\,\frac{\partial G}{\partial z}(B,t,z\_0,t\_0)\,f\_B(z\_0,t\_0)\,dz\_0\,dt\_0 + \mathcal{H}(t)$$


Furthermore we integrate the balance of momentum equation in time to obtain:

  $$Q(B,t) = -c^2\,\int\_{0}^{t}\,\frac{\partial S}{\partial z}(B,t)\,\exp(2\gamma(t-t\_0))\,dt\_0 + Q^0(B)\exp(2\,\gamma\,t)$$

We can then derive a map between the flow rate and the cross-sectional area using (3.29) and (3.30):

   $$Q(B,t) = 
   c^2\,\int\_{0}^{t}\left[\frac{S(B,t^{\*})}{l} - \exp(\gamma\,t^{\*})\,\int\_{0}^{t^{\*}}\int\_{B}^{L}\frac{\partial G}{\partial z}(B,t^{\*},z\_0,t\_0)\,f\_{B}(z\_0,t\_0)\,dz\_0\,dt\_0\right]\exp(2\,\gamma\,(t-t^{\*}))\,dt^{\*} + 
   c^2\,\int\_{0}^{t}\mathcal{H}(t^{\*})\exp(2\,\gamma\,(t-t^{\*}))\,dt^{\*} + Q^0(B)\exp(2\,\gamma\,t) $$


After integrating by parts in time, the derivatives that constitute $f\_B(z\_0,t\_0)$, and using the 
Green’s function $\eqref{5}$, the final map reads:

   $$Q(B,t) = \frac{c^2}{l}\,\int\_{0}^{t}\left[1 + \sum\_{n=1}^{\infty}2\right]\,S(B,t^{\*})\exp(2\,\gamma\,(t-t^{\*}))\,dt^{\*}
   -\left(\frac{c}{l}\right)^3\,\int\_{0}^{t}\exp(\gamma\,(2\,t - t^{\*}))\int\_{0}^{t^{\*}}\,S(B,t\_0)\exp(-\gamma\,t\_0)\left[\sum\_{n=1}^{\infty}\frac{2\,n^2\,\pi^2}{\sqrt{\lambda\_n}}\,\sin(c\,\sqrt{\lambda\_n}(t^{\*}-t\_0))\right]\,dt\_0\,dt^{\*}
    + Q^0(B)\exp(2\,\gamma\,t) + \Theta\,\left[S^0(B), \dot{S}\_0(B), S\_L(t),\dot{S}\_L(t),\ddot{S}\_L(t)\right] \label{9} \tag {9} $$

and

   $$\Theta\,\left[S^0(B), \dot{S}\_0(B), S\_L(t),\dot{S}\_L(t),\ddot{S}\_L(t)\right] = - \left[\sum\_{n=1}^{\infty}\frac{2\,c}{l\,\sqrt{\lambda\_n}}\,\sin(c\,\sqrt{\lambda\_n}\,t)\right]\exp(\gamma\,t)\,S(B,0) 
   + \left[\sum\_{n=1}^{\infty}\,\frac{2\,l}{c\,n^2\,\pi^2\,\sqrt{\lambda\_n}}\left(\gamma\,\sin(c\,\sqrt{\lambda}\,t)\right) + c\,\sqrt{\lambda\_n}\,\left(\cos(c\,\sqrt{\lambda\_n}\,t) - \exp(\gamma\,t)\right)\right]\exp(\gamma\,t)\,\dot{S}(B,0) + 
   -c^2\int\_{0}^{t}\mathcal{H}(t^{\*})\exp(2\,\gamma\,(t-t^{\*}))\,dt^{\*}$$

The operators for the wave boundary condition can now be derived using $\eqref{7} and $\eqref{9},, assuming as for the upstream numerical domain that the initial cross-sectional area is the same as the reference cross-sectional area:

   $$Q(B,t) = M\_1(S) + H\_1,\, \gamma = \frac{N}{2\,S^{0}},\, \forall n \in \mathbb{N}\_{>0},\,\lambda = \frac{n^2\,\pi^2}{l^2} - \frac{\gamma^2}{c^2}$$

   $$M\_1(S) = \frac{c^2}{l}\int\_{0}^{t}\left[1 + \sum\_{n=1}^{\infty}\,2\right]\,S(B,t^{\*})\exp\left[2\gamma(t-t^{\*})\right]\,dt^{\*} 
   - \left(\frac{c^2}{l}\right)^3\,\int\_{0}^{t}\exp\left[\gamma(2t - t^{\*})\right]\int\_{0}^{t^{\*}}S(B,t\_0)\exp(-\gamma\,t\_{0})\left[\sum\_{n=1}^{\infty}\frac{2\,n^2\,\pi^2}{\sqrt{\lambda\_n}}\,sin\left(t^{\*} - t\_{0}\right)\right]\,dt\_0\,dt^{\*}$$

   $$H\_1 = Q^{0}(B)\exp\left(2\,\gamma\,t\right) + \Theta\left[S^0(B), \dot{S}^{0}(B), S\_L(t), \dot{S}\_L(t), \ddot{S}\_L(t)\right]$$

   $$M\_2(S) = \frac{4}{3}\frac{\left[M\_1(S) + H\_1\right]^2}{S} + \frac{4\,\sqrt{\pi}}{3}\frac{E\,h}{\rho}\sqrt{S}$$

   $$H\_2 = -\frac{4}{3\,\rho}\,E\,h\,\pi\,r^0(B)$$


The flow rate is a function of pressure history and depends also on waves coming from the far end boundary conditions and the initial conditions everywhere in the downstream domain. 
For simplicity, we implemented the equation above assuming that the initial state corresponded to the static solution around which the wave equation is derived, with zero initial derivative of the cross-sectional area and a constant distant cross-sectional area.

The *DtN* map has now been derived for a variety of boundary conditions. The reader interested in the effect of a different boundary condition can follow the same approach to derive the corresponding map. 
In particular, this approach can be applied for complex lumped models of the coronary bed, and can also be performed very similarly for lumped-parameter heart models at the inlet of the numerical domain.

<h2> Finite Element Discretization </h2>
We employ a stabilized space-time finite element method, known for its robustness, based on the Discontinuous Galerkin method in time. The procedure presented herein employs ideas developed in Hughes and Mallet <a href="#ref-10">[10]</a> and Hughes, Franca and Hulbert <a href="#ref-11">[11]</a>. 
We previously <a href="#ref-4">[4]</a> described a space-time method with flow rate, pressure and resistance boundary conditions that employed a  different strong form (non conservative).
Here we retained the same stabilization term. The present formulation accommodates more general inflow and outflow boundary conditions. We use shape functions that are piecewise constant in time and piecewise linear in space. 
Let $\tilde{\mathcal{V}}$ be the finite-dimensional approximation of $\mathcal{V}$ restricted to $(0,B)\times(t\_n,t\_n+1)$. Thus, the weak form for slab $n+1$, from $t\_n$ to $t\_n+1$ reads:

Find $\mathbf{U^h}$ in $\mathbf{V^h}$ such that $\forall\mathbf{W^h}$ in $\mathbf{V^h}$.

  $$\int\_{t\_n^{+}}^{t\_{n+1}^{-}}\int\_{0}^{B}\left[\mathbf{W}\_{,t}^{T}\,\mathbf{U}^{\mathbf{h}} + 
  \mathbf{W}\_{,z}^{T}\,\mathbf{F}(\mathbf{U}) - 
  \mathbf{W}\_{,z}^{T}\,\mathbf{K}\,\mathbf{U}\_{,z} + 
  \mathbf{W}^{T}\,\mathbf{G}\left(\mathbf{U}\right)
  \right]\,dz\,dt $$
  $$ - \int\_{0}^{B}\mathbf{W}^{T}\left(z,t\_{n+1}^{-}\right)\,\mathbf{U}\left(z,t\_{n+1}^{-}\right)\,dz 
  + \int\_{0}^{B}\,\mathbf{W}^{T}\left(z,t\_{n+1}^{+}\right)\,\mathbf{U}\left(z,t\_{n+1}^{-}\right)\,dz $$

  $$ + \int\_{t\_{n}^{+}}^{t\_{n+1}^{-}}{\mathbf{W}[\mathbf{F}(\mathbf{U}) - 
  \mathbf{K}\,\mathbf{U}\_{,z}]}\_{z = 0}\,dt
  - \int\_{t\_{n}^{+}}^{t\_{n+1}^{-}}{\mathbf{W}[\mathbf{M}(\mathbf{U}) + \mathbf{H}]}\_{z = B}\,dt = 0$$

For simplicity, we have dropped the superscript $h$. After discretization in time, (3.34) becomes 
(the superscript $n+1$ refers to time slab $n+1$):

   $$\Delta t\_n\int\_{0}^{B}\left[\mathbf{W}\_{,z}^{T,n+1}\,\mathbf{F}^{n+1}(\mathbf{U^{n+1}}) - \mathbf{W}\_{,z}^{T,n+1}\,\mathbf{K}\,\mathbf{U}\_{,z}^{n+1} + \mathbf{W}^{T,n+1}\,\mathbf{G}^{n+1}(\mathbf{U}^{n+1})\right]\,dz $$

   $$ - \int\_{0}^{B}\,\mathbf{W}^{T,n+1}\left(\mathbf{U}^{n+1} - \mathbf{U}^{n}\right)\,dz
   + \Delta t\_{n}\left[\mathbf{W}^{T,n+1}\left(\mathbf{F}^{n+1}(\mathbf{U}^{n+1}) - \mathbf{K}\,\mathbf{U}\_{,z}^{n+1}\right)\right]\_{z=0}
   - \int\_{t\_n^{+}}^{t\_{n+1}^{-}}\left[\mathbf{W}^{T,n+1}\left(\mathbf{M}^{n+1}(\mathbf{U}) + \mathbf{H}^{n+1}\right)\right]\_{z=B} = 0 \label{10} \tag{10} $$

The boundary term appears in the box in this last equation. 
Stabilization terms are added to $\eqref{10}$. To that end, we define the matrices $\mathbf{A}$ and $\mathbf{C\_A}$:


   $$\mathbf{A} = 
   \begin{bmatrix}
   0 & 1 \cr
   -(1 + \delta)\,\left(\frac{U\_2}{U\_1}\right)^2 + \frac{U\_1}{\rho}\frac{\partial\tilde{p}}{\partial S} & (1 + \delta)\,\frac{2\,U\_2}{U\_1} \cr
   \end{bmatrix} $$

   $$\mathbf{C\_A} = 
   \begin{bmatrix}
   -\frac{\psi}{U\_1} & 0 \cr
   f-\frac{1}{\rho}\,\frac{\partial\tilde{p}}{\partial z} & \frac{N}{U\_1} \cr
   \end{bmatrix}   
   $$

We also define the matrix differential operator:

   $$\mathcal{L}(\mathbf{U}) = \mathbf{I}\,\frac{\partial}{\partial t} + \mathbf{A}(\mathbf{U})\,\frac{\partial}{\partial z} - \mathbf{K}\,\frac{\partial^2}{\partial z^2} - \mathbf{C\_A}(\mathbf{U})
   $$

Note that $\mathcal{L}(\mathbf{U})\,\mathbf{U}$ is the residual of the advective form of the partial differential equation system. For the current case of a piecewise constant approximation in time and a piecewise linear approximation in space this simplifies to

   $$\mathcal{L}(\mathbf{U})\,\mathbf{U} = \mathbf{A}(\mathbf{U})\,\mathbf{U}\_{,z} - \mathbf{C\_A}(\mathbf{U})\,\mathbf{U}$$

The stabilization term takes the form:

   $$\Delta t\_n\sum\_{e}\int\_{\Omega\_e}\left(\mathcal{L}(\mathbf{U})^T\,\mathbf{W}\right)^T\boldsymbol{\tau}\,\mathcal{L}(\mathbf{U})\,\mathbf{U}\,dz $$

The summation ranges over the element interiors and $\tau = \tau(\mathbf{U})$ is the stabilization matrix defined by:

   $$\boldsymbol{\tau} = \left[\frac{2}{\Delta t\_n}\mathbf{I} + \frac{2}{h}\vert\mathbf{A}\vert + 3\,\left(\frac{2}{h}\right)^2\,\mathbf{K} + \vert\mathbf{C\_A}\vert\right]^{-1}
   $$

Here, the absolute value of a 2x2 matrix B can be obtained from the Cayley-Hamilton theorem,

   $$
   \vert\mathbf{B}\vert = \frac{\mathbf{B}^2 + \sqrt{det(\mathbf{B}^2)}\,\mathbf{I}}{\sqrt{tr(\mathbf{B}^2) + 2\,\sqrt{det(\mathbf{B}^2)}}}
   $$

Therefore the final variational problem is: find $\mathbf{U}^{n+1}$ such that $\forall\,\mathbf{W}$:

   $$
  \Delta t\_n\int\_{0}^{B}\left[\mathbf{W}\_{,z}^{T,n+1}\,\mathbf{F}^{n+1}(\mathbf{U^{n+1}}) - \mathbf{W}\_{,z}^{T,n+1}\,\mathbf{K}\,\mathbf{U}\_{,z}^{n+1} + \mathbf{W}^{T,n+1}\,\mathbf{G}^{n+1}(\mathbf{U}^{n+1})\right]\,dz
$$ 
  $$- \int\_{0}^{B}\,\mathbf{W}^{T,n+1}\left(\mathbf{U}^{n+1} - \mathbf{U}^{n}\right)\,dz
  + \Delta t\_{n}\left[\mathbf{W}^{T,n+1}\left(\mathbf{F}^{n+1}(\mathbf{U}^{n+1}) - \mathbf{K}\,\mathbf{U}\_{,z}^{n+1}\right)\right]\_{z=0} $$

  $$- \int\_{t\_n^{+}}^{t\_{n+1}^{-}}\left[\mathbf{W}^{T,n+1}\left(\mathbf{M}^{n+1}(\mathbf{U}) + \mathbf{H}^{n+1}\right)\right]\_{z=B} = 0 $$
  $$ + \Delta\,t\_{n}\sum\_{e}\int\_{\Omega\_e}\left(\mathbf{W}\_{,z}^{T}\,\mathbf{A}^{n+1} - \mathbf{W}^{T}\,\mathbf{C}\_{A}^{n+1}\right)\boldsymbol{\tau}\left(\mathbf{A}^{n+1}\mathbf{U}\_{,z}^{n+1} - \mathbf{C}\_{A}^{n+1}\,\mathbf{U}^{n+1}\right)\,dz = 0
   $$


Using piecewise linear shape functions in space $N\_A, A = 1,\dots, m$ with $m$ the number of nodes, the global nodal residual is:

  $$
  \mathbf{R}\_{A} = \Delta\,t\_{n}\,\int\_{0}^{B}\,N\_{A,z}\left(\mathbf{F}^{n+1}(\mathbf{U}^{n+1}) - \mathbf{K}\,\mathbf{U}\_{,z}^{n+1}\right) + N\_{A}\,\mathbf{G}^{n+1}(\mathbf{U^{n+1}})\,dz
  $$

  $$ - \int\_{0}^{B}\,N\_{A}\left(\mathbf{U}^{n+1} - \mathbf{U}^{n}\right)\,dz
  + \Delta\,t\_n\left[N\_{A}\left(\mathbf{F}^{n+1}(\mathbf{U}^{n+1}) - \mathbf{K}\,\mathbf{U}\_{,z}^{n+1}\right)\right]\_{z=0}
  $$

  $$
  - \int\_{t\_{n}^{+}}^{t\_{n+1}^{-}}\left[N\_{A}\left(\mathbf{M}^{n+1}(\mathbf{U}) + \mathbf{H}^{n+1}\right)\right]\_{z=B}\,dt
  $$

  $$ + \Delta\,t\_{n}\,\sum\_{e}\,\int\_{\Omega\_e}\left(N\_{A,z}\,\mathbf{A}^{n+1} - N\_{A}\,\mathbf{C}\_{A}^{n+1}\right)\,\boldsymbol{\tau}\,\left(\mathbf{A}^{n+1}\,\mathbf{U}\_{,z}^{n+1} - \mathbf{C}\_{A}^{n+1}\,\mathbf{U}^{n+1}\right)\,dz = 0
  $$

These nonlinear equations are then solved with a modified Newton-Raphson technique <a href="#ref-4">[4]</a>. At each iteration k+1 in the time step n+1, the non-linear loop consists of two steps:

Solve for the increment $\Delta\mathbf{U}\_{C}^{n+1,k+1}$:

   $$
   \mathbf{K}\_{AC}^{n+1,k}\,\Delta\mathbf{U}\_{C}^{n+1,k+1} = -\mathbf{R}\_{A}^{n+1,k},\quad\text{with}\quad\mathbf{K}\_{AC}^{n+1,k} = \frac{\partial\mathbf{R}\_{A}^{n+1,k}}{\partial\mathbf{U}\_{C}},\quad A,C=1,\dots,m
   $$

Update the solution:

   $$
   \mathbf{U}\_{C}^{n+1,k+1} = \mathbf{U}\_{C}^{n+1,k} + \Delta\mathbf{U}\_{C}^{n+1,k+1}
   $$

The matrices $\mathbf{A}$, $\mathbf{C^A}$, $\mathbf{C^F}$ (recall :eq:$eq13$) and $\tau$ are frozen in the calculation of the tangent matrix:

   $$ \mathbf{K}\_{AC} = \Delta\,t\_n\,\int\_{0}^{B}\,N\_{A,z}\,\left(\frac{\partial\,\mathbf{F}^{n+1,k}}{\partial\,\mathbf{U}\_{C}^{n+1,k}} 
  - \mathbf{K}\,N\_{C,z}\right) + N\_A\,N\_C\,\mathbf{C}\_{F}^{n+1,k}\,dz $$

  $$ - \int\_{0}^{B}\,N\_A\,N\_C\,\mathbf{I}\,dz $$

  $$ + \Delta\,t\_n\left[N\_A\left(\frac{\partial\,\mathbf{F}^{n+1,k}}{\partial\,\mathbf{U}\_{C}^{n+1,k}} - \mathbf{K}\,N\_{C,z}\right)\right]\_{z=0} $$

  $$ - \int\_{t\_n^{+}}^{t\_{n+1}^{-}}\,\left[N\_A\,\frac{\partial\,\mathbf{M}^{n+1,k}}{\partial\,\mathbf{U}\_{C}^{n+1,k}}\right]\_{z=B}\,dt $$

  $$ + \Delta\,t\_{n}\,\sum\_{e}\,\int\_{\Omega\_e}\left(N\_{A,z}\,\mathbf{A}^{n+1} - N\_{A}\,\mathbf{C}\_{A}^{n+1}\right)\,\boldsymbol{\tau}\,\left(\mathbf{A}^{n+1}\,\mathbf{U}\_{,z}^{n+1} - \mathbf{C}\_{A}^{n+1}\,\mathbf{U}^{n+1}\right)\,dz = 0 $$

After the residual converges to a chosen tolerance, the scheme is advanced in time to solve for a new time step, initialized with the solution at the previous time step.

**Remark 1** In practice, the residuals and the tangent matrices are coded at the element level. The detailed finite element  residuals and tangent matrices are presented for reference in Appendix A for each boundary condition.

**Remark 2** So far, we have presented the derivation for a single segment. At a connection of multiple segments, pressure continuity and conservation of mass are enforced using Lagrange multipliers. Pressure, cross-sectional area and flow rate boundary conditions are treated as essential boundary conditions. 
Both of these features are exactly the same as in Wan et al. <a href="#ref-4">[4]</a> and are therefore not repeated here.
