## Mathematical Model of Cardiac Electrophysiology ##

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



## Cellular Activation Models ##

Depending on how the depolarization and repolarization within a single cardiac myocyte is described, the electrophysiology models can be roughly divided into two categories: biophysics-based ionic models (such as the ten Tusscher-Panfilov (TTP) model<a href="#ref-2">[2]</a><a href="#ref-3">[3]</a>), and phenomenological models (such as the Aliev-Panfilov (AP), Fitzhugh-Nagumo (FN) models<a href="#ref-4">[4]</a>).


###Biophysics-based Ionic Models

Between cardiac myocytes, the propagation of the electrical signal is enabled by the transmembrane motion of different ions, such as $K^+$, $Na^+$ and $Ca^{2+}$ during depolarization and repolarization of the myocytes. Cellular biophysics-based activation models are designed to capture these ionic movements. One of the popular biophysics-based ionic models, the TTP model <a href="#ref-3">[3]</a> is implemented in <strong>svFSI</strong>. Here, we will briefly illustrate the ionic currents involved in the TTP model.

In the TTP model, the ionic current is expressed as

$$  I\_{ion} = I\_{Na} + I\_{Kl} + I\_{to} + I\_{Kr} + I\_{Ks} + I\_{CaL} + I\_{NaCa} + I\_{NaK} + I\_{pCa} + I\_{pK} + I\_{bCa} + I\_{bNa} $$

The governing equations for each current can be found in <a href="#ref-3">[3]</a>.

Since, intracellular calcium concentration is the driving factor behind excitation-contraction coupling, we focus on the calcium dynamics here. In the TTP model,the following calcium concentrations are included:

<ul>
  <li> $Ca_{itotal}$: total (free+buffered) cytoplasmic $Ca^{2+}$ concentration.</li>
  <li> $Ca_{SRtotal}$: total SR $Ca^{2+}$ concentration.</li>
  <li> $Ca_{SStotal}$: total dyadic space $Ca^{2+}$ concentration.</li>
  <li> $Ca_i$: free cytoplasmic $Ca^{2+}$ concentration.</li>
  <li> $Ca_{SR}$: free SR $Ca^{2+}$ concentration.</li>
  <li> $Ca_{SS}$: free dyadic space $Ca^{2+}$ concentration.</li>
</ul>

Sarcoplasmic reticulum (SR) is a membrane structure within the muscle cell, whose main function is to store $Ca^{2+}$. Dyadic space is the region bounded by the T-tubule and SR. $Ca^{2+}$ ions are considered buffered if they are bound to negatively charged proteins (called buffers). Otherwise they are considered free. The action potential transmitted through the gap junction cause the current myocyte to depolarize. The depolarization opens the L-type (long-lasting) Ca channel located on the surface membrane. A small amount of $Ca^{2+}$ enters the myocyte due to potential, leading to a sharp increase of $Ca^{2+}$ in the dyadic space, which is a small region. This increase triggers the SR to release a large amount of $Ca^{2+}$ (calcium-induced calcium release) to enable the excitation-contraction. During diastole, calcium is removed from the cytoplasm through two ways. Ca is pumped (1) back into the SR and (2) out of the cell, mainly by the sodium-calcium exchange (NCX).

For the TTP model in <strong>svFSI</strong>, the following units have to be used: time in [ms], length [mm], amount of substance [mmol], voltage [mV]. Mass can be in [g].


<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/Calcium.png">
  <figcaption class="svCaption" >Structures involved in $Ca^{2+}$ cycling<a href="#ref-6">[6]</a>.</figcaption>
</figure>


###Phenomenological Models

Phenomenological models are derived based on some observations of the full ion model <a href="#ref-4">[4]</a>. Instead of following the transmembrane ionic currents, they use an oscillation system with a fast ($V$) and a slow ($r$) variable to mimic the behaviors of the action potentials. The oscillators, without considering the diffusion term, are modeled as

$$ \frac{\mathrm{d}V}{\mathrm{d}t}=f^{V}(V,r)  $$
$$ \frac{\mathrm{d}r}{\mathrm{d}t}=f^{r}(V,r)  $$

Note that this set of equations describes the electrophysiology in a single cardiac myocyte, and the choice of $f^V$ and $f^r$ will determine if this is a pacemaker cell or a non-pacemaker cell.

The FitzHugh-Nagumo (FN) model describes the pacemaker cells with

$$  f^V = c[V(V-\alpha)(1-V)-r] $$
$$  f^r = V-br+a $$

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/FN_model.png">
  <figcaption class="svCaption" >Action potential calculated from FitzHugh-Nagumo model.</figcaption>
</figure>

The Aliev-Panfilov (AP) model describes the non-pacemaker cells with

$$  f^V = cV(V-\alpha)(1-V)-Vr $$

$$  f^r = \left( \gamma+\frac{\mu\_1r}{\mu\_2+V}\right)[-r-cV(V-b-1)] $$

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/AP_model.png">
  <figcaption class="svCaption" >Action potential calculated from Aliev-Panfilov model.</figcaption>
</figure>

Note that $V$ and $t$ are non-dimensional values here. The following equations are used to recover the physiological action potential and time:

$$  \mathrm{FitzHugh-Nagumo model}: V^{fhn}=(65V-35)mV; ~~ t^{fhn} = (220t) ms $$

$$  \mathrm{Aliev-Panfilov model}: V^{ap}=(100V-80)mV; ~~ t^{ap} = (12.9t) ms  $$

Another class of phenomenological models exists that include additional variables to account for intra-cellular calcium kinetics. One such model is the Bueno-Orovio (BO) model <a href="#ref-5">[5]</a> that can serve as a trade-off between the complex TTP model and the simplified phenomenological AP model.


###Activation Models Available in svFSI

The following table provides a summary of all the available electrophysiology models in <strong>svFSI</strong>.

  <table class="table table-bordered">
    <caption>Available cardiac electrophysiology models.</caption>
    <thead>
    <tr>
      <th>Electrophysiology Model</th>
      <th>Input Keyword</th>
    </tr>
    </thead>
    <tr>
      <td>Aliev-Panfilov model<a href="#ref-4">[4]</td>
      <td>"ap", "aliev-panfilov"</td>
    </tr>
    <tr>
      <td>Fitzhugh-Nagumo model<a href="#ref-4">[4]</a></td>
      <td>"fn", "fitzhugh-nagumo"</td>
    </tr>
    <tr>
      <td>Bueno-Orovio-Cherry-Fenton model<a href="#ref-5">[5]</a></td>
      <td>"bo", "bueno-orovio"</td>
    </tr>
    <tr>
      <td>tenTusscher-Panfilov model<a href="#ref-3">[3]</a></td>
      <td>"ttp", "tentusscher-panfilov"</td>
    </tr>
  </table>



