## Mathematical Model of Cardiac Electrophysiology ##

The propagation of electrical signal in the heart is governed by a reaction-diffusion like equation,

    \begin{equation}
        \begin{split}
        & \frac{\partial V}{\partial t} + \frac{I_{ion} - I_{app}(t)}{C_m}  = \nabla \cdot\left( \mathbf{D}\nabla V \right) \\
        &~~~~~~~~~~~~~~~~~~\mathrm{in~} \Omega^E\times(0,T] \nonumber\\
        &~~(\mathbf{D}\nabla V) \cdot \mathbf{N}=0 \mathrm{~on~} \partial\Omega^E\times(0,T]
        \end{split}
    \end{equation}

$V$ is the local transmembrane potential. $C_m$ is the local membrane capacitance per unit area. $I_{ion}$ and $I_{app}$ are the ionic current flux (current per unit area) and applied external current flux, respectively. Here, $\mathbf{D}$ dictates the propagation velocity of the electrical signal and has the similar physical meaning as the diffusivity. It is calculated as

    \begin{equation}
        \mathbf{D} =\frac{\sigma}{\chi C_m}
    \end{equation}

$\sigma$ is the conductivity tensor and has the unit $S/m$. $\chi$ is the ratio of membrane area over tissue volume. Then, $\mathbf{D}$ is a tensor with the dimension $Length^2/Time$.

The above equation is the mono-domain description of the cardiac electrophysiology, i.e. we don't solve the intra- and extra-cellular electrical signal propagation separately. The mono-domain and multi-domain conductivities are connected through the following relation,

    \begin{equation}
        \sigma = \frac{\sigma_i\sigma_e}{\sigma_i + \sigma_e}.
    \end{equation}

where $\sigma_i$ and $\sigma_e$ are the intra- and extra-cellular conductivity tensors <a href="#ref-1">[1]</a>. It is commonly assumed that the conductivity is transversely isotropic,

    \begin{equation}
        \mathbf{\sigma} = \sigma_f \mathbf{f}\otimes \mathbf{f} + \sigma_s (\mathbf{I}-\mathbf{f}\otimes \mathbf{f}).
    \end{equation}

where $\sigma_f$ and $\sigma_s$ are the conductivities along the fiber direction and in the transverse plane. $\mathbf{f}$ is the fiber direction vector.

In <strong>svFSI</strong>, we directly specify $\mathbf{D}$ in the input file. We choose a slightly different form to enforce the transverse isotropy of the conductivity tensor,

    \begin{equation}
        \mathbf{D} = D_{iso}\mathbf{I} + \sum_{n=1}^{nsd}D_{ani,n}\mathbf{fN}_n\otimes\mathbf{fN}_n
    \end{equation}

Here, $nsd$ is the dimension, and $\mathbf{fN_n}$ is the local orthonormal coordinate system built by fiber direction and sheet direction. To connect with the previous expression, we have $D_f=D_{iso}+D_{ani}$ and $D_s=D_{iso}$.

