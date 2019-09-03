## Boundary Condition Specification: the Physical Side of the Problem

Boundary conditions are crucial to obtaining high quality cardiovascular simulation results. It is essential that boundary conditions accurately capture the physiology of vascular networks outside of the 3D domain of the model. **SimVascular** provides several different options for boundary condition assignment at inlets and outlets that are described in this section. Typically, we begin with some physiologic information about our problem, for instance:

- Flow rate info coming from **MRI** or **ultrasound** measurements.
- Pressure values in the model obtained with a **catheter** transducer or a pressure cuff.
- Vessel wall elastic properties (if we are modeling the vessel walls as deformable).

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/Fig_15.png">
  <figcaption class="svCaption" >Inflow, outflow and wall characterization in a simple cylindrical vessel</figcaption>
</figure>

From a conceptual standpoint, no matter how geometrically complex a vascular model is (we’ll refer to this as $\Omega$), its boundaries can be classified into three groups (see figure above):

- An **inflow** boundary $\Gamma_g$. This is the set of face(s) of the model where we will prescribe a flow wave as obtained from a clinical measurement.
- A vessel **wall** boundary $\Gamma_s$. This boundary represents the interface between the fluid domain and the vessel wall. In the physical world, this boundary is lined by a layer of endothelial cells, the treatment of which can be complex. Many blood flow simulations have traditionally used a **rigid wall assumption**. Under these circumstances, a zero velocity condition is applied on these surfaces. **SimVascular** also offers options for fluid structure interaction as discussed below.
- An **outflow** boundary $\Gamma_h$. On this boundary, we will typically prescribe a pressure value that is uniform over the face (i.e. spatially not temporally constant) in a **weak manner**. A **weakly applied** pressure means that we are not prescribing nodal values of pressure at the nodes of the outlet face as Dirichlet boundary conditions. Instead, we apply this pressure by enforcing that the integral of the pressure field on that face must be a certain value.

These boundaries have an absolutely critical impact on the numerical simulation results. The SimVascular package contains several options for boundary condition assignment. All of these use a weakly prescribed pressure formulation, with the purpose of accounting for effects of the downstream vasculature on the vascular model (see figure below). These boundary conditions include:

- **Resistance Boundary condition**. Here, the condition prescribed on the face is a relationship between flow and pressure of the form 
$p = p\_0 + R\,Q$, where $R$ is the resistance parameter that characterizes the downstream vasculature, $p$ is the weakly prescribed pressure, $Q$ is the flow rate passing through the face and $p_0$ is a “flag” that sets the boundary as a “weakly-prescribed pressure boundary”. This flag has a “zero” numerical value, so the total value of the pressure on that face is simply given by $R\,Q$.

- **Impedance Boundary condition**. Here, the condition prescribed on the face is a relationship of the form:

$$
p(t)=p\_0 + \frac{1}{T}\,\int\_{t-T}^{t} Z(t−\tau) \, Q(\tau) \, d\tau
$$

where $Z$ is the Inverse Fourier Transform of an impedance function that characterizes the downstream vasculature, $p$ is the weakly prescribed pressure, $Q$ is the flow rate passing through the face, and $T$ is the cardiac cycle.

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/Fig_16.png">
  <figcaption class="svCaption" >Cardiovascular model with various boundary conditions</figcaption>
</figure>

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/Fig_17.png">
  <figcaption class="svCaption" >Frequency content of impedance from the literature for the left external iliac and a canine femoral artery</figcaption>
</figure>

The mathematical definition of an impedance function is:

$$
Z(\omega)=P(\omega)\,Q(\omega),\,\omega=0,1,2,\dots
$$

That is, a relationship between pressure and flow modes for different frequencies. The figure above shows the typical shape of these impedances as a function of  the frequency in the human iliac artery under rest and exercise conditions. Getting a good characterization of these impedance functions is once again critical to accurately represent the way blood flows in our computational domain.

- **RCR lumped parameters condition**. In this boundary condition type, we use a _reduced-order_ model of the downstream vasculature, considering an electric circuit analog. In this theory, the behavior of the vasculature is represented by three parameters: a proximal resistance $R\_p$, a capacitance $C$, and a distal resistance $R\_d$.

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/Fig_18.png">
  <figcaption class="svCaption" >Circuit representation of RCR block</figcaption>
</figure>

- **Coronary boundary conditions**. These conditions simulate what happens at the coronary outlets. The implementation in the **svSolver** follows the derivations in [this paper](docsRefs.html#refSec2).

- **Closed-loop boundary circulation model**. The capability of coupling a 3D finite element model with a lumped parameter model is built into the **svSolver**. Documentation on this feature will be available with later releases of the code. 

### Boundary conditions considered in Example 1

Before we move on, let us recap the type of _physical problem_ (**Example 1**) we are solving: the geometry used in this problem consists of an idealized blood vessel, represented by a cylindrical segment with a radius $r=2$ cm and length $L=30$ cm. We prescribe an idealized constant inlet volumetric flow rate $Q$ of $100$ cc/sec to a parabolic profile at the inlet face of the model ($\Gamma\_g$). The dynamic viscosity $\mu$ and density $\rho$ of the blood are 0.04 poise and 1.06 gr/cm$^3$, respectively. The lateral surface of the vessel ($\Gamma\_{s}$) is considered to be rigid (therefore, we will apply a zero-velocity condition there). For the outlet boundary ($\Gamma_h$), a spatially-constant pressure boundary condition is weakly enforced via a resistance $R$. 
In this problem, we will consider a resistance of $R = 1333.0$ dynes·s/cm$^5$. 

This resistance will give a (weakly-applied) pressure at the outlet face of

$$
p=p\_0 + R\,Q = 0.0 + 1333.0 \cdot 100.0=133300.00 \approx 100\,\text{mmHg}
$$

(recall that $1.0$ mmHg = $1333.2$ dyn/cm$^2$). For steady flow in a long tube with a circular cross  section, the flow will develop a flow profile known as the _Poiseuille_ flow profile assuming the flow remains laminar. The flow will remain laminar in a circular tube assuming that the non-dimensional parameter given by the _Reynolds_ number $Re$ is $Re < 2100$.

The definition of the Reynolds number is given by:

$$
Re = \frac{\rho\,D\,V}{\mu}
$$

where $V$ is a representative velocity of the flow, $D$ is a characteristic dimension of the vessel where the flow is happening (in this case, the diameter), and $\mu$ and $\rho$ are the dynamic viscosity and density, respectively.

For this problem, the Reynolds number is about $884$, so it is well within the laminar flow regime. For a fully developed flow, the axisymmetric profile is parabolic and is given by: 

$$
v\_z(a) = v\_z^{max}\left[1-\left(\frac{a}{r}\right)^2\right]
$$

where $v_z^{max}$ is the maximum velocity at the center of the vessel, a is the radial coordinate from center of the vessel $0\le a \le r$ . The expression for maximum velocity is given by:

$$
v\_z^{max} = 2\frac{Q}{\pi\,r^2}
$$

where $Q$ is the volumetric flow rate. The wall shear stress $\tau$, is given by

$$
\tau = \frac{2\,\mu\,v\_z^{max}}{r}
$$

For this example, the maximum velocity is $v\_z^{max} = 15.92$ cm/s and the wall shear stress is $\tau$ = $0.64$ dynes/cm$^2$.


