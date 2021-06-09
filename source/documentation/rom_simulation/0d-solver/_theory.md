<h2> 0D Solver Theory </h2>

Flow rate, pressure, and other hemodynamic quantities in 0D models of vascular anatomies are governed by a system of nonlinear differential-algebraic equations (DAEs),

$$\textbf{E}\left(\textbf{y}, t\right)\cdot\dot{\textbf{y}} + \textbf{F}\left(\textbf{y}, t\right)\cdot \textbf{y} + \textbf{c}\left(\textbf{y}, t\right) = \textbf{0},$$

where $\textbf{E} \in \mathbb{R}^{N \times N}$, $\textbf{F} \in \mathbb{R}^{N \times N}$, $\textbf{c} \in \mathbb{R}^{N}$, and $\textbf{y} \in \mathbb{R}^{N}$. Here, $\textbf{y}$ is the vector of solution quantities and $\dot{\textbf{y}}$ is the time derivative of $\textbf{y}$. $N$ is the total number of equations and the total number of global unknowns.

The DAE system is solved implicitly using the generalized-$\alpha$ method [2].

<h3>Generalized-$\alpha$ Method for 0D DAE System</h3>
We are interested in solving the DAE system for the solutions, $\textbf{y}\_{n+1}$ and $\dot{\textbf{y}}\_{n+1}$, at the next time, $t\_{n+1}$, using the known solutions, $\textbf{y}\_{n}$ and $\dot{\textbf{y}}\_{n}$, at the current time, $t\_{n}$. Note that $t\_{n+1} = t\_{n} + \Delta t$, where $\Delta t$ is the time step size. Using the generalized-$\alpha$ method, we launch a predictor step  and a series of multi-corrector steps to solve for $\textbf{y}\_{n+1}$ and $\dot{\textbf{y}}\_{n+1}$. Similar to other predictor-corrector schemes, we evaluate the solutions at intermediate times between $t\_{n}$ and $t\_{n + 1}$. However, in the generalized-$\alpha$ method, we evaluate $\textbf{y}$ and $\dot{\textbf{y}}$ at different intermediate times. Specifically, we evaluate $\textbf{y}$ at $t\_{n+\alpha\_{f}}$ and $\dot{\textbf{y}}$ at $t\_{n+\alpha\_{m}}$, where $t\_{n+\alpha\_{f}} = t\_{n} + \alpha\_{f}\Delta t$ and $t\_{n+\alpha\_{m}} = t\_{n} + \alpha\_{m}\Delta t$. Here, $\alpha\_{m}$ and $\alpha\_{f}$ are the generalized-$\alpha$ parameters, where $\alpha\_{m} = \frac{3 - \rho}{2 + 2\rho}$ and $\alpha\_{f} = \frac{1}{1 + \rho}$. In the 0D solver, we set the spectral radius, $\rho$, to be $0.1$. For each time step, the procedure works as follows.

1. $\textbf{Predictor step}$: First, we make an initial guess for $\textbf{y}\_{n+1}$ and $\dot{\textbf{y}}\_{n+1}$,

    $$\textbf{y}\_{n+1} = \textbf{y}\_{n},$$

    $$\dot{\textbf{y}}\_{n+1} = \frac{\gamma - 1}{\gamma}\dot{\textbf{y}}\_{n},$$

    where $\gamma = 0.5 + \alpha\_{m} - \alpha\_{f}$.

2. $\textbf{Initiator step}$: Then, we initialize the values of $\dot{\textbf{y}}\_{n+\alpha\_{m}}$ and $\textbf{y}\_{n+\alpha\_{f}}$,

    $$\dot{\textbf{y}}\_{n+\alpha\_{m}}^{k=0} = \dot{\textbf{y}}\_{n} + \alpha\_{m}\left(\dot{\textbf{y}}\_{n+1} - \dot{\textbf{y}}\_{n}\right),$$

    $$\textbf{y}\_{n+\alpha\_{f}}^{k=0} = \textbf{y}\_{n} + \alpha\_{f}\left(\textbf{y}\_{n+1} - \textbf{y}\_{n}\right).$$

3. $\textbf{Multi-corrector step}$: Then, for $k \in \left[0, N\_{int} - 1\right]$, we iteratively update our guess of $\dot{\textbf{y}}\_{n+\alpha\_{m}}^{k}$ and $\textbf{y}\_{n+\alpha\_{f}}^{k}$.

    We desire the residual, $\textbf{r}\left(\dot{\textbf{y}}\_{n+\alpha\_{m}}^{k + 1}, \textbf{y}\_{n+\alpha\_{f}}^{k + 1}, t\_{n+\alpha\_{f}}\right)$, to be $\textbf{0}$, where

    $$\textbf{r}\left(\dot{\textbf{y}}\_{n+\alpha\_{m}}^{k+1}, \textbf{y}\_{n+\alpha\_{f}}^{k+1}, t\_{n+\alpha\_{f}}\right) = \textbf{E}\left(\textbf{y}\_{n+\alpha\_{f}}^{k+1}, t\_{n+\alpha\_{f}}\right)\cdot\dot{\textbf{y}}\_{n+\alpha\_{m}}^{k+1} + \textbf{F}\left(\textbf{y}\_{n+\alpha\_{f}}^{k+1}, t\_{n+\alpha\_{f}}\right)\cdot\textbf{y}\_{n+\alpha\_{f}}^{k+1} + \textbf{c}\left(\textbf{y}\_{n+\alpha\_{f}}^{k+1}, t\_{n+\alpha\_{f}}\right).$$

    Using Newton's method, we linearize this equation about $\textbf{y}\_{n+\alpha\_{f}}^{k}$ to obtain

    $$\textbf{K}\left(\dot{\textbf{y}}\_{n+\alpha\_{m}}^{k}, \textbf{y}\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right)\cdot\Delta \textbf{y}\_{n+\alpha\_{f}}^{k} = -\textbf{r}\left(\dot{\textbf{y}}\_{n+\alpha\_{m}}^{k}, \textbf{y}\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right),$$

    where $\textbf{K}\left(\dot{\textbf{y}}\_{n+\alpha\_{m}}, \textbf{y}\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right) = \frac{\partial \textbf{r}\left(\dot{\textbf{y}}\_{n+\alpha\_{m}}, \textbf{y}\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right)}{\partial \textbf{y}\_{n+\alpha\_{f}}}$ is the consistent tangent matrix.

    We solve this equation to find $\Delta \textbf{y}\_{n+\alpha\_{f}}^{k}$ and update our guess of $\dot{\textbf{y}}\_{n+\alpha\_{m}}$ and $\textbf{y}\_{n+\alpha\_{f}}$,

    <!-- where $\textbf{r}\left(\dot{\textbf{y}}\_{n+\alpha\_{m}}^{k}, \textbf{y}\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right) = \textbf{E}\left(\textbf{y}\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right)\dot{\textbf{y}}\_{n+\alpha\_{m}}^{k} + \textbf{F}\left(\textbf{y}\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right)\textbf{y}\_{n+\alpha\_{f}}^{k} + \textbf{c}\left(\textbf{y}\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right)$ and $\textbf{K} = \frac{\partial \textbf{r}\left(\textbf{y}, t\_{n+\alpha\_{f}}\right)}{\partial \textbf{y}}$ is the consistent tangent matrix. -->

    $$\textbf{y}\_{n+\alpha\_{f}}^{k+1} = \textbf{y}\_{n+\alpha\_{f}}^{k} + \Delta \textbf{y}\_{n+\alpha\_{f}}^{k},$$

    $$\dot{\textbf{y}}\_{n+\alpha\_{m}}^{k+1} = \dot{\textbf{y}}\_{n+\alpha\_{m}}^{k} + \frac{\alpha\_{m}}{\Delta t\alpha\_{f}\gamma}\Delta \textbf{y}\_{n+\alpha\_{f}}^{k}.$$


    The consistent tangent matrix is

    $$\textbf{K}\left(\dot{\textbf{y}}\_{n+\alpha\_{m}}, \textbf{y}\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right) = \underset{\text{Term 1}}{\underbrace{\frac{\partial \textbf{E}\left(\textbf{y}\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right)}{\partial \textbf{y}\_{n+\alpha\_{f}}}\cdot\dot{\textbf{y}}\_{n+\alpha\_{m}}}} + \frac{\alpha\_{m}}{\Delta t\alpha\_{f}\gamma}\textbf{E}\left(\textbf{y}\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right) + \underset{\text{Term 2}}{\underbrace{\frac{\partial \textbf{F}\left(\textbf{y}\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right)}{\partial \textbf{y}\_{n+\alpha\_{f}}}\cdot\textbf{y}\_{n+\alpha\_{f}}}} + \textbf{F}\left(\textbf{y}\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right) + \underset{\text{Term 3}}{\underbrace{\frac{\partial \textbf{c}\left(\textbf{y}\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right)}{\partial \textbf{y}\_{n+\alpha\_{f}}}}}.$$

    For simplicity, denote terms 1, 2, and 3 as $\textbf{dE}$, $\textbf{dF}$, and $\textbf{dc}$ respectively. Furthermore, the notation used for $\textbf{dA} = \frac{\partial\textbf{A}}{\partial\textbf{y}}\cdot\textbf{y}$ is defined as $dA\_{ik} = \frac{\partial A\_{ij}}{\partial y\_{k}}y\_{j}$.

    <!-- https://docs.mathjax.org/en/latest/input/tex/macros/index.html -->

    <!-- https://math.meta.stackexchange.com/questions/23244/how-to-do-a-underbracket-with-mathjax -->

    <!-- 4. Repeat Step 3 until convergence to tolerance or until hit maximum number of iterations -->

4. $\textbf{Update step}$: Finally, we update $\textbf{y}\_{n+1}$ and $\dot{\textbf{y}}\_{n+1}$ using our final value of $\dot{\textbf{y}}\_{n+\alpha\_{m}}$ and $\textbf{y}\_{n+\alpha\_{f}}$.

    $$\textbf{y}\_{n+1} = \textbf{y}\_{n} + \frac{\textbf{y}\_{n+\alpha\_{f}}^{N\_{int}} - \textbf{y}\_{n}}{\alpha\_{f}}$$

    $$\dot{\textbf{y}}\_{n+1} = \dot{\textbf{y}}\_{n} + \frac{\dot{\textbf{y}}\_{n+\alpha\_{m}}^{N\_{int}} - \dot{\textbf{y}}\_{n}}{\alpha\_{m}}$$

<h3> Assembly </h3>

Similar to a finite element solver, the 0D solver defines local element contributions to $\textbf{E}$, $\textbf{F}$, $\textbf{c}$, $\textbf{dE}$, $\textbf{dF}$, and $\textbf{dc}$. The solver automatically assembles these local contributions into the global arrays,

<!-- https://math.meta.stackexchange.com/questions/11900/text-and-mathjax-above-symbol -->

$$\textbf{E} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{E}^{e},$$


$$\textbf{F} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{F}^{e},$$


$$\textbf{c} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{c}^{e},$$

$$\textbf{dE} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{dE}^{e},$$


$$\textbf{dF} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{dF}^{e},$$


$$\textbf{dc} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{dc}^{e}.$$

where $\mathbb{A}$ is the assembly operator and $N\_{elem}$ is the total number of 0D elements in our 0D model.

<h3> Local element contributions </h3>

For each 0d element, if a local element array is not specified, then it is implied to be an array of zeros.

Note that the governing equations for an element, $e$, can be cast into the form of

$$\textbf{E}^{e}\left(\textbf{y}^{e}, t\right)\cdot\dot{\textbf{y}}^{e} + \textbf{F}^{e}\left(\textbf{y}^{e}, t\right)\cdot\textbf{y}^{e} + \textbf{c}^{e}\left(\textbf{y}^{e}, t\right) = \textbf{0}.$$

<h4> Vessel elements </h4>

<h5> Resistor </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/resistor.png">
  <figcaption class="svCaption"> Resistor element.
  </figcaption>
</figure>

The governing equations for the local resistor element are

<!-- https://github.com/mathjax/MathJax/issues/329 -- need to add a backslash before all underscore in an equation -->
$$P\_{in}^{e} - P\_{out}^{e} - RQ\_{in}^{e} = 0$$

$$Q\_{in}^{e} - Q\_{out}^{e} = 0.$$

The local contributions to the global arrays are

\begin{gather}
    \textbf{y}^{e} =
        \begin{bmatrix}
            P\_{in}^{e} & Q\_{in}^{e} & P\_{out}^{e} & Q\_{out}^{e}
        \end{bmatrix}^T,
\end{gather}

\begin{gather}
    \textbf{F}^{e} =
        \begin{bmatrix}
            1 & -R & -1 &  0 \ \cr
            0 &  1 &  0 & -1
        \end{bmatrix}.
\end{gather}

<h5> Capacitor </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/capacitor.png">
  <figcaption class="svCaption"> Capacitor element.
  </figcaption>
</figure>

The governing equations for the local capacitor element are

$$C\frac{d\left( P\_{in}^{e} - P\_{out}^{e} \right)}{dt} - Q\_{in}^{e} = 0$$

$$Q\_{in}^{e} - Q\_{out}^{e} = 0.$$

The local contributions to the global arrays are

\begin{gather}
    \textbf{y}^{e} =
        \begin{bmatrix}
            P\_{in}^{e} & Q\_{in}^{e} & P\_{out}^{e} & Q\_{out}^{e}
        \end{bmatrix}^T,
\end{gather}

\begin{gather}
    \textbf{E}^{e} =
        \begin{bmatrix}
            C &  0 & -C &  0 \ \cr
            0 &  0 &  0 &  0
        \end{bmatrix},
\end{gather}

\begin{gather}
    \textbf{F}^{e} =
        \begin{bmatrix}
            0 & -1 &  0 &  0 \ \cr
            0 &  1 &  0 & -1
        \end{bmatrix}.
\end{gather}

<h5> Inductor </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/inductor.png">
  <figcaption class="svCaption"> Inductor element.
  </figcaption>
</figure>

The governing equations for the local inductor element are

$$P\_{in}^{e} - P\_{out}^{e} - L\frac{dQ\_{in}^{e}}{dt} = 0$$

$$Q\_{in}^{e} - Q\_{out}^{e} = 0.$$

The local contributions to the global arrays are

\begin{gather}
    \textbf{y}^{e} =
        \begin{bmatrix}
            P\_{in}^{e} & Q\_{in}^{e} & P\_{out}^{e} & Q\_{out}^{e}
        \end{bmatrix}^T,
\end{gather}

\begin{gather}
    \textbf{E}^{e} =
        \begin{bmatrix}
            0 & -L &  0 &  0 \ \cr
            0 &  0 &  0 &  0
        \end{bmatrix},
\end{gather}

\begin{gather}
    \textbf{F}^{e} =
        \begin{bmatrix}
            1 &  0 & -1 &  0 \ \cr
            0 &  1 &  0 & -1
        \end{bmatrix}.
\end{gather}

<h5> Resistor-Capacitor </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/RC.png">
  <figcaption class="svCaption"> Resistor-Capacitor element.
  </figcaption>
</figure>

The governing equations for the local resistor-capacitor element are

$$P\_{in}^{e} - P\_{out}^{e} - RQ\_{in}^{e} = 0$$

$$Q\_{in}^{e} - Q\_{out}^{e} - C\frac{dP\_{out}^{e}}{dt} = 0.$$

The local contributions to the global arrays are

\begin{gather}
    \textbf{y}^{e} =
        \begin{bmatrix}
            P\_{in}^{e} & Q\_{in}^{e} & P\_{out}^{e} & Q\_{out}^{e}
        \end{bmatrix}^T,
\end{gather}

\begin{gather}
    \textbf{E}^{e} =
        \begin{bmatrix}
            0 &  0 &  0 &  0 \ \cr
            0 &  0 & -C &  0
        \end{bmatrix},
\end{gather}

\begin{gather}
    \textbf{F}^{e} =
        \begin{bmatrix}
            1 & -R & -1 &  0 \ \cr
            0 &  1 &  0 & -1
        \end{bmatrix}.
\end{gather}

<h5> Resistor-Inductor </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/RL.png">
  <figcaption class="svCaption"> Resistor-Inductor element.
  </figcaption>
</figure>

The governing equations for the local resistor-inductor element are

$$P\_{in}^{e} - P\_{out}^{e} - RQ\_{in}^{e} - L\frac{dQ\_{out}^{e}}{dt} = 0$$

$$Q\_{in}^{e} - Q\_{out}^{e} = 0.$$

The local contributions to the global arrays are

\begin{gather}
    \textbf{y}^{e} =
        \begin{bmatrix}
            P\_{in}^{e} & Q\_{in}^{e} & P\_{out}^{e} & Q\_{out}^{e}
        \end{bmatrix}^T,
\end{gather}

\begin{gather}
    \textbf{E}^{e} =
        \begin{bmatrix}
            0 &  0 &  0 & -L \ \cr
            0 &  0 &  0 &  0
        \end{bmatrix},
\end{gather}

\begin{gather}
    \textbf{F}^{e} =
        \begin{bmatrix}
            1 & -R & -1 &  0 \ \cr
            0 &  1 &  0 & -1
        \end{bmatrix}.
\end{gather}

<h5> Resistor-Capacitor-Inductor </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/RCL.png">
  <figcaption class="svCaption"> Resistor-Capacitor-Inductor element.
  </figcaption>
</figure>

The governing equations for the local resistor-capacitor-inductor element are

$$P\_{in}^{e} - P\_{out}^{e} - RQ\_{in}^{e} - L\frac{dQ\_{out}^{e}}{dt} = 0$$

$$Q\_{in}^{e} - Q\_{out}^{e} - C\frac{dP\_{c}^{e}}{dt} = 0.$$

$$P\_{in}^{e} - RQ\_{in}^{e} - P\_{c} = 0$$

The local contributions to the global arrays are

\begin{gather}
    \textbf{y}^{e} =
        \begin{bmatrix}
            P\_{in}^{e} & Q\_{in}^{e} & P\_{out}^{e} & Q\_{out}^{e} & P\_{c}
        \end{bmatrix}^T,
\end{gather}

\begin{gather}
    \textbf{E}^{e} =
        \begin{bmatrix}
            0 &  0 &  0 & -L &  0 \ \cr
            0 &  0 &  0 &  0 & -C \ \cr
            0 &  0 &  0 &  0 &  0
        \end{bmatrix},
\end{gather}

\begin{gather}
    \textbf{F}^{e} =
        \begin{bmatrix}
            1 & -R & -1 &  0 &  0 \ \cr
            0 &  1 &  0 & -1 &  0 \ \cr
            1 & -R &  0 &  0 & -1
        \end{bmatrix}.
\end{gather}

<h5> Stenosis </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/stenosis.png">
  <figcaption class="svCaption"> Stenosis element.
  </figcaption>
</figure>

The governing equations for the local stenosis element [3] are

$$P\_{in}^{e} - P\_{out}^{e} - R\_{pre}\left(Q\_{in}^{e}\right)Q\_{in}^{e} = 0$$

$$Q\_{in}^{e} - Q\_{out}^{e} = 0,$$

where $R\_{pre}\left(Q\right) = K\_{t}\frac{\rho}{2A\_{o}^{2}}\left(\frac{A\_{o}}{A\_{s}} - 1\right)^{2}|Q| + R\_{p}$ and $R\_{p} = \frac{8\mu L}{\pi r^{4}}.$

The local contributions to the global arrays are

\begin{gather}
    \textbf{y}^{e} =
        \begin{bmatrix}
            P\_{in}^{e} & Q\_{in}^{e} & P\_{out}^{e} & Q\_{out}^{e}
        \end{bmatrix}^T,
\end{gather}

\begin{gather}
    \textbf{F}^{e} =
        \begin{bmatrix}
            1 & -R\_{pre}|Q\_{in}^{e}| - R\_{p} & -1 &  0 \ \cr
            0 &  1 &  0 & -1
        \end{bmatrix}.
\end{gather}

\begin{gather}
    \textbf{dF}^{e} =
        \begin{bmatrix}
            1 & -R\_{pre}|Q\_{in}^{e}| & -1 &  0 \ \cr
            0 &  0 &  0 & 0
        \end{bmatrix}.
\end{gather}

<h5> Junction </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/junction.png">
  <figcaption class="svCaption"> An example junction element with one inlet and two outlets.
  </figcaption>
</figure>

Across all inlets and outlets of the junction, mass is conserved and pressure is continuous.

$$\sum\_{i \in \text{inlets}} Q\_{i}^{e} = \sum\_{j \in \text{outlets}} Q\_{j}^{e}$$

$$ P\_{i}^{e} = P\_{j}^{e}, \forall i \in \text{inlets}, j \in \text{outlets}$$

<h4> Boundary condition elements </h4>

<h5> RCR </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/rcr_bc.png">
  <figcaption class="svCaption"> RCR boundary condition element.
  </figcaption>
</figure>

The governing equations for the RCR boundary condition are

$$R\_{d}Q^{e} - P\_{c}^{e} + P\_{ref} - R\_{d}C\frac{dP\_{c}^{e}}{dt} = 0,$$

$$P^{e} - P\_{c}^{e} - R\_{p}Q^{e} = 0.$$

The local contributions to the global arrays are

\begin{gather}
    \textbf{y}^{e} =
        \begin{bmatrix}
            P^{e} & Q^{e} & P\_{c}^{e}
        \end{bmatrix}^T,
\end{gather}

\begin{gather}
    \textbf{E}^{e} =
        \begin{bmatrix}
            0 & 0 & -R\_{d}C \ \cr
            0 & 0 & 0
        \end{bmatrix},
\end{gather}

\begin{gather}
    \textbf{F}^{e} =
        \begin{bmatrix}
            0 & R\_{d} & -1 \ \cr
            1 & -R\_{p} & -1
        \end{bmatrix},
\end{gather}

\begin{gather}
    \textbf{c}^{e} =
        \begin{bmatrix}
            P\_{ref} \ \cr
            0
        \end{bmatrix}.
\end{gather}

<h5> Coronary </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/coronary_bc.png">
  <figcaption class="svCaption"> Coronary boundary condition element.
  </figcaption>
</figure>

The governing equations for the coronary boundary condition [4] are

$$C\_{im}R\_{v}Q^{e} - V\_{im}^{e} - C\_{im}P\_{im} + C\_{im}P\_{v} - C\_{im}R\_{v}\frac{dV\_{im}^{e}}{dt} - C\_{a}C\_{im}R\_{v}\frac{dP^{e}}{dt} + R\_{a}C\_{a}C\_{im}R\_{v}\frac{dQ^{e}}{dt} + C\_{a}C\_{im}R\_{v}\frac{dP\_{a}^{e}}{dt} = 0,$$

$$C\_{im}R{v}P^{e} - C\_{im}R\_{v}R\_{a}Q^{e} - R\_{v}V\_{im}^{e} - C\_{im}R\_{v}P\_{im} - C\_{im}R\_{v}R\_{am}\frac{dV\_{im}^{e}}{dt} - R\_{am}V\_{im}^{e} - C\_{im}R\_{am}P\_{im} + R\_{am}C\_{im}P\_{v} = 0.$$

The local contributions to the global arrays are

\begin{gather}
    \textbf{y}^{e} =
        \begin{bmatrix}
            P^{e} & Q^{e} & V\_{im}^{e}
        \end{bmatrix}^T,
\end{gather}

\begin{gather}
    \textbf{E}^{e} =
        \begin{bmatrix}
            -C\_{a}C\_{im}R\_{v} & R\_{a}C\_{a}C\_{im}R\_{v} & -C\_{im}R\_{v} \ \cr
            0 &  0 &  -C\_{im}R\_{v}R\_{am}
        \end{bmatrix},
\end{gather}

\begin{gather}
    \textbf{F}^{e} =
        \begin{bmatrix}
            0 &  C\_{im}R\_{v} & -1 \ \cr
            C\_{im}R\_{v} & -C\_{im}R\_{v}R\_{a} &  -\left(R\_{v} + R\_{am}\right)
        \end{bmatrix},
\end{gather}

\begin{gather}
    \textbf{c}^{e} =
        \begin{bmatrix}
            C\_{im} \left(-P\_{im} + P\_{v} \right) + C\_{a}C\_{im}R\_{v}\frac{dP\_{a}}{dt} \ \cr
            -C\_{im}\left( R\_{v} + R\_{am}\right)P\_{im} + R\_{am}C\_{im}P\_{v}
        \end{bmatrix}.
\end{gather}

Assume $P\_{a} = 0$.
