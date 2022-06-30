### Propagation model

The propagation of electrical signal in the heart is governed by a reaction-diffusion like equation,

$$\frac{\partial V}{\partial t} + \frac{I\_{ion} - I\_{app}(t)}{C\_m}  = \nabla \cdot\left( \mathbf{D}\nabla V \right) $$ 
$$ \mathrm{in~} \Omega^E\times(0,T] \nonumber$$
$$(\mathbf{D}\nabla V) \cdot \mathbf{N}=0 \mathrm{~on~} \partial\Omega^E\times(0,T]$$

$V$ is the local transmembrane potential. $C\_m$ is the local membrane capacitance per unit area. $I\_{ion}$ and $I\_{app}$ are the ionic current flux (current per unit area) and applied external current flux, respectively. Here, $\mathbf{D}$ dictates the propagation velocity of the electrical signal and has the similar physical meaning as the diffusivity. It is calculated as

$$
\mathbf{D} =\frac{\sigma}{\chi C\_m}
$$

$\sigma$ is the conductivity tensor and has the unit $S/m$. $\chi$ is the ratio of membrane area over tissue volume. Then, $\mathbf{D}$ is a tensor with the dimension $Length^2/Time$.

The above equation is the mono-domain description of the cardiac electrophysiology, i.e. we don't solve the intra- and extra-cellular electrical signal propagation separately. The mono-domain and multi-domain conductivities are connected through the following relation,

$$  \sigma = \frac{\sigma\_i\sigma\_e}{\sigma\_i + \sigma\_e} $$

where $\sigma\_i$ and $\sigma_e$ are the intra- and extra-cellular conductivity tensors <a href="#ref-1">[1]</a>. It is commonly assumed that the conductivity is transversely isotropic,

$$ \mathbf{\sigma} = \sigma\_f \mathbf{f}\otimes \mathbf{f} + \sigma\_s (\mathbf{I}-\mathbf{f}\otimes \mathbf{f}) $$

where $\sigma\_f$ and $\sigma\_s$ are the conductivities along the fiber direction and in the transverse plane. $\mathbf{f}$ is the fiber direction vector.

In <strong>svFSI</strong>, we directly specify $\mathbf{D}$ in the input file. We choose a slightly different form to enforce the transverse isotropy of the conductivity tensor,

$$  \mathbf{D} = D\_{iso}\mathbf{I} + \sum\_{n=1}^{nsd}D\_{ani,n}\mathbf{fN}\_n\otimes\mathbf{fN}\_n $$

Here, $nsd$ is the dimension, and $\mathbf{fN\_n}$ is the local orthonormal coordinate system built by fiber direction and sheet direction. To connect with the previous expression, we have $D\_f=D\_{iso}+D\_{ani}$ and $D\_s=D\_{iso}$.