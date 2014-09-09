### Boundary Condition Specification: the Physical Side of the Problem

The first question we need to address when specifying boundary conditions for a problem is to think about what kind of things are going on at the boundaries of our model from a physical standpoint. To do this, we need to know some physiologic information about our problem, for instance:
- Flow rate info coming from MRI or ultrasound measurements.
- Pressure values in the model obtained with a catheter transducer or a pressure cuff.
- Vessel wall elastic properties (if we are modeling the vessel walls as deformable).

<img src="documentation/flowsolver/imgs/Fig_15.png" width="800">

From a conceptual standpoint, no matter how geometrically complex a vascular model (we’ll refer to this as “Ω”) is, its boundaries can be classified into three groups (see figure above):

- An inflow boundary Γ g . This is the set of face(s) of the model where we will prescribe a flow wave that we obtain from a clinical measurement.
- A vessel wall boundary Γ s . This boundary represents the interface between the fluid domain and the vessel wall. In the physical world, this boundary is lined by a layer of endothelial cells. The treatment of this boundary can be pretty complex. In general, to this date, most of the blood flow simulations consider the so-called rigid wall assumption whereby, as a first approximation, the motion of the vessel wall due to the interaction with the internal pulsatile flow is neglected. Under these circumstances, a zero velocity condition is applied on these surfaces. In this tutorial, we will adopt this simplification, but we will also how to run a deformable wall analysis.
- An outflow boundary Γ h . On this boundary, we will typically prescribe a constant pressure (by constant we mean CONSTANT OVER THE FACE, spatially, not necessarily temporally) in a “weak manner”. We don’t want to get into too much detail about this here, but here are a couple of notes about this type of boundary:

+ A “weakly applied” pressure means that we are not prescribing nodal values of pressure at the nodes of the outlet face in a Dirichlet way. If we did this, we would be using the *.nbc.gz file (file containing the list of nodes on that face) of that face to apply this condition. Instead, we applied this pressure by enforcing that the integral of the pressure field on that face must be a certain value. In doing this, we make use of the *.ebc.gz file (the file containing the element connectivity of that face)

+ These boundaries have an absolutely critical impact on the numerical simulation results. The Taylor lab has developed a number of boundary conditions techniques that allow prescribing a weak pressure in a way that takes into account the effects of the downstream vasculature on the vascular model (see figure below). These boundary conditions include:


1. Resistance Boundary condition. Here, the condition prescribed on the face
is a relationship between flow and pressure of the form: 

$$
p = p_0 + R\,Q
$$

where R is the resistance parameter that characterizes the downstream
vasculature, p is the weakly prescribed pressure, Q is the flow rate passing
through the face and p 0 is a “flag” that sets the boundary as a “weakly-prescribed pressure boundary”. This flag has a “zero” numerical value, so the total value of the pressure on that face is simply given by RQ.

2.Impedance Boundary condition. Here, the condition prescribed on the face
is a relationship of the form:

$$
p(t)=p_0 + \frac{1}{T}\,\int_{t-T}^{t} Z(t−\tau) \, Q(\tau) \, d\tau
$$


$$
\pi=\int\limits_{n=0}^{+\infty} \frac{{(n!)^2 2^{n+1}}}{(2n+1)!}
$$


 

where Z is the Inverse Fourier Transform of an impedance function that
characterizes the downstream vasculature, p is the weakly prescribed
pressure, Q is the flow rate passing through the face, and T is the cardiac
cycle.

<img src="documentation/flowsolver/imgs/Fig_16.png" width="800">

<img src="documentation/flowsolver/imgs/Fig_17.png" width="800">

The mathematical definition of an impedance function is:

$$
Z(\omega)=P(\omega)\,Q(\omega),\,\omega=0,1,2,\dots
$$

That is, a relationship between pressure and flow modes for different
frequencies. The figure above shows the typical shape of these
impedances as a function of the frequency in the human iliac artery under
rest and exercise conditions. Getting a good characterization of these
impedance functions is once again critical to accurately represent the way
blood flows in our computational domain.

2. RCR lumped parameters condition. In this boundary condition type, we
use a “reduced-order” of the downstream vasculature, considering an
electric circuit analog. In this theory, the behavior of the vasculature is
represented by three parameters: a proximal resistance R p , a capacitance C, and a distal resistance $R_d$.

<img src="documentation/flowsolver/imgs/Fig_18.png" width="800">

### Boundary conditions considered in this problem

Before we move on, let us recap the type of “physical problem” we are solving: the geometry used in this problem consists of an idealized blood vessel, represented by a cylindrical segment with a radius $r$ of 0.2 cm and length $L$ of 9 cm (see figure below). 

<img src="documentation/flowsolver/imgs/Fig_19.png" width="800">

We prescribe an idealized constant inlet volumetric flow rate Q of 1.570 cc/sec to a parabolic profile at the inlet face of the model ( $\Gamma_g$ ). The dynamic viscosity $\mu$ and density $\rho$ of the blood are 0.04 poise and 1.06 gr/cm 3 , respectively. The lateral surface of the vessel ($\Gamma_{s}$) is considered to be rigid (therefore, we will apply a zero-velocity condition there). As for the outlet boundary ($\Gamma_h$), a spatially-constant pressure boundary condition is weakly enforced via a resistance $R$. 
In this problem, we will consider a resistance of $R$ = 84917 dynes·s/cm$^5$. 

This resistance will give a (weakly-applied) pressure at the outlet face of

$$
p=p_0 + R\,Q = 0.0 + 84917 \cdot 1.57=133319.69 \approx 100\,\text{mmHg}
$$

(recall that 1mmHg = 1333.2 dyn/cm 2 ). For steady flow in a long tube with a circular cross  section, the flow will develop a flow profile known as the Poiseuille flow profile assuming the flow remains laminar. The flow will remain laminar in a circular tube assuming that the non-dimensional parameter given by the Reynolds number Re is Re < 2100.

The definition of the Reynolds number is given by:

$$
Re = \frac{\rho\,D\,V}{\mu}
$$

where V is a representative velocity of the flow, D is a characteristic dimension of the vessel where the flow is happening (in this case, the diameter), and $\mu$ and $\rho$ are the dynamic viscosity and density, respectively.

For this problem, the Reynolds number is 125, so it is well within the  laminar flow regime. For a fully developed flow, the axisymmetric profile is parabolic and is given by: 

$$
v_z(a) = v_z^{max}\left(1-\left(\frac{a}{r}\right)^2\right)
$$

where $v_z^{max}$ is the maximum velocity at the center of the vessel, a is the radial coordinate from center of the vessel $0\le a \le r$ . The expression for maximum velocity is given by:

$$
v_z^{max} = 2\frac{Q}{\pi\,r^2}
$$

where Q is the volumetric flow rate. The wall shear stress $\tau$, is given by

$$
\tau = \frac{2\,\mu\,v_z^{max}}{r}
$$

For this example, the maximum velocity is $v_z^{max} = 25$ cm/s and the wall shear stress is $\tau$ = 10 dynes/cm$^2$.


