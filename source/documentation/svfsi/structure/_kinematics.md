### Kinematics

During a cardiac cycle, the heart undergoes large deformations which can no longer be described by linear elasticity. Since the domain is continuously deforming, we introduce the concepts of a reference configuration (denoted $\Omega\_{0}$) and a current configuration (denoted $\Omega\_{t}$). The reference configuration is fixed for all times, and often refers to the initial geometry when $t=0$. We will use the vector $\mathbf{X}$ to denote the physical coordinates of the geometry in the reference configuration, and define the following relation:

$$\mathbf{x}(\mathbf{X}, t)=\mathbf{X}+\mathbf{u}(\mathbf{X}, t)$$

where $\mathbf{x}$ describes the physical coordinates of the geometry in the current configuration and $\mathbf{u}$ is the time-varying displacement vector field on $\Omega\_{0}$ which acts as a mapping between the reference and current configurations such that $\mathbf{u}: \Omega\_{0} \Rightarrow \Omega\_{t} .$ We also define the following relationships and tensors, which are standard for describing nonlinear structural mechanics:

$$ \ddot{\mathbf{u}}=\frac{d^{2} \mathbf{u}}{d t^{2}}, \quad \mathbf{F}=\frac{\partial \mathbf{x}}{\partial \mathbf{X}}, \quad  J=\operatorname{det}(\mathbf{F}) $$

$$  \mathbf{E}=\frac{1}{2}(\mathbf{C}-\mathbf{I}), ~~ \mathbf{C}=\mathbf{F}^{T} \mathbf{F} $$

where $\ddot{\mathbf{u}}$ refers to the structural acceleration and the time derivative operator, $d^{2} / d t^{2}$, is applied on the reference configuration. $\mathbf{F}$ denotes the deformation gradient tensor and $J$ is the the determinant of $\mathbf{F}$ tensor that denotes the Jacobian of the transformation. $\mathbf{C}$ is the Cauchy-Green deformation tensor while $\mathbf{E}$ is the Green-Lagrange strain tensor.
