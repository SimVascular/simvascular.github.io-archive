<h2> 0D Solver Theory </h2>

Flow rate, pressure, and other hemodynamic quantities in zero-dimensional (0D) models of vascular anatomies are governed by a system of differential-algebraic equations (DAEs),

$$\textbf{E}\left(y, t\right)\dot{y} + \textbf{F}\left(y, t\right)y + C\left(y, t\right) = 0,$$

where $\textbf{E} \in \mathbb{R}^{N \times N}$, $\textbf{F} \in \mathbb{R}^{N \times N}$, $C \in \mathbb{R}^{N}$, and $y \in \mathbb{R}^{N}$. Here, $y$ is the vector of solution quantities and $\dot{y}$ is the time derivative of $y$. $N$ is the total number of equations and the total number of global unknowns.

The DAE system is solved implicitly using the generalized-$\alpha$ method [1].

<h3>Generalized-$\alpha$ for 0D DAE System</h3>
We are interested in solving the DAE system for the solutions, $y\_{n+1}$ and $\dot{y}\_{n+1}$, at the next time, $t\_{n+1}$, using the known solutions, $y\_{n}$ and $\dot{y}\_{n}$, at the current time, $t\_{n}$. Note that $t\_{n+1} = t\_{n} + \Delta\_{t}$, where $\Delta\_{t}$ is the time step size. Using the generalized-$\alpha$ method, we launch a predictor step  and a series of multi-corrector steps to solve for $y\_{n+1}$ and $\dot{y}\_{n+1}$. Similar to other predictor-corrector schemes, we evaluate the solutions at intermediate times between $t\_{n}$ and $t\_{n + 1}$. However, in the generalized-$\alpha$ method, we evaluate $y$ and $\dot{y}$ at different intermediate times. Specifically, we evaluate $y$ at $t\_{n+\alpha\_{f}}$ and $\dot{y}$ at $t\_{n+\alpha\_{m}}$, where $t\_{n+\alpha\_{f}} = t\_{n} + \alpha\_{f}\Delta\_{t}$ and $t\_{n+\alpha\_{m}} = t\_{n} + \alpha\_{m}\Delta\_{t}$. Here, $\alpha\_{m}$ and $\alpha\_{f}$ are the generalized-$\alpha$ parameters, where where $\alpha\_{m} = \frac{3 - \rho}{2 + 2\rho}$ and $\alpha\_{f} = \frac{1}{1 + \rho}$. In the 0D solver, we set $\rho = 0.1$. For each time step, the procedure works as follows.

1. $\textbf{Predictor step}$: First, we make an initial guess for $y\_{n+1}$ and $\dot{y}\_{n+1}$,

    $$y\_{n+1} = y\_{n},$$

    $$\dot{y}\_{n+1} = \frac{\gamma - 1}{\gamma}\dot{y}\_{n},$$

    where $\gamma = 0.5 + \alpha\_{m} - \alpha\_{f}$.

2. $\textbf{Initiator step}$: Then, we initialize the values of $\dot{y}\_{n+\alpha\_{m}}$ and $y\_{n+\alpha\_{f}}$,

    $$\dot{y}\_{n+\alpha\_{m}}^{k=0} = \dot{y}\_{n} + \alpha\_{m}\left(\dot{y}\_{n+1} - \dot{y}\_{n}\right),$$

    $$y\_{n+\alpha\_{f}}^{k=0} = y\_{n} + \alpha\_{f}\left(y\_{n+1} - y\_{n}\right).$$

3. $\textbf{Multi-corrector step}$: Then, for $k \in \left[0, N\_{int} - 1\right]$, we iteratively update our guess of $\dot{y}\_{n+\alpha\_{m}}^{k}$ and $y\_{n+\alpha\_{f}}^{k}$.

    We desire $R\left(\dot{y}\_{n+\alpha\_{m}}^{k + 1}, y\_{n+\alpha\_{f}}^{k + 1}, t\_{n+\alpha\_{f}}\right) = 0$, where

    $$R\left(\dot{y}\_{n+\alpha\_{m}}^{k+1}, y\_{n+\alpha\_{f}}^{k+1}, t\_{n+\alpha\_{f}}\right) = \textbf{E}\left(y\_{n+\alpha\_{f}}^{k+1}, t\_{n+\alpha\_{f}}\right)\dot{y}\_{n+\alpha\_{m}}^{k+1} + \textbf{F}\left(y\_{n+\alpha\_{f}}^{k+1}, t\_{n+\alpha\_{f}}\right)y\_{n+\alpha\_{f}}^{k+1} + C\left(y\_{n+\alpha\_{f}}^{k+1}, t\_{n+\alpha\_{f}}\right).$$

    Using Newton's method, we linearize this equation about $\left(\dot{y}\_{n+\alpha\_{m}}^{k}, y\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right)$ to obtain

    $$\textbf{K}\left(\dot{y}\_{n+\alpha\_{m}}^{k}, y\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right)\Delta y\_{n+\alpha\_{f}}^{k} = -R\left(\dot{y}\_{n+\alpha\_{m}}^{k}, y\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right),$$

    where $\textbf{K}\left(\dot{y}\_{n+\alpha\_{m}}, y\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right) = \frac{\partial R\left(\dot{y}\_{n+\alpha\_{m}}, y\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right)}{\partial y\_{n+\alpha\_{f}}}$ is the consistent tangent matrix.

    We solve this equation to find $\Delta y\_{n+\alpha\_{f}}^{k}$ and update our guess of $\dot{y}\_{n+\alpha\_{m}}$ and $y\_{n+\alpha\_{f}}$,

    <!-- where $R\left(\dot{y}\_{n+\alpha\_{m}}^{k}, y\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right) = \textbf{E}\left(y\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right)\dot{y}\_{n+\alpha\_{m}}^{k} + \textbf{F}\left(y\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right)y\_{n+\alpha\_{f}}^{k} + C\left(y\_{n+\alpha\_{f}}^{k}, t\_{n+\alpha\_{f}}\right)$ and $\textbf{K} = \frac{\partial R\left(y, t\_{n+\alpha\_{f}}\right)}{\partial y}$ is the consistent tangent matrix. -->

    $$y\_{n+\alpha\_{f}}^{k+1} = y\_{n+\alpha\_{f}}^{k} + \Delta y\_{n+\alpha\_{f}}^{k},$$

    $$\dot{y}\_{n+\alpha\_{m}}^{k+1} = \dot{y}\_{n+\alpha\_{m}}^{k} + \frac{\alpha\_{m}}{\Delta\_{t}\alpha\_{f}\gamma}\Delta y\_{n+\alpha\_{f}}^{k}.$$


    The consistent tangent matrix is

    $$\textbf{K}\left(\dot{y}\_{n+\alpha\_{m}}, y\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right) = \underset{\text{Term 1}}{\underbrace{\frac{\partial \textbf{E}\left(y\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right)}{\partial y\_{n+\alpha\_{f}}}\dot{y}\_{n+\alpha\_{m}}}} + \textbf{E}\left(y\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right)\frac{\alpha\_{m}}{\Delta\_{t}\alpha\_{f}\gamma} + \underset{\text{Term 2}}{\underbrace{\frac{\partial \textbf{F}\left(y\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right)}{\partial y\_{n+\alpha\_{f}}}y\_{n+\alpha\_{f}}}} + \textbf{F}\left(y\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right) + \underset{\text{Term 3}}{\underbrace{\frac{\partial C\left(y\_{n+\alpha\_{f}}, t\_{n+\alpha\_{f}}\right)}{\partial y\_{n+\alpha\_{f}}}}}.$$

    For simplicity, denote terms 1, 2, and 3 as $\textbf{dE}$, $\textbf{dF}$, and $\textbf{dC}$ respectively.

    <!-- https://docs.mathjax.org/en/latest/input/tex/macros/index.html -->

    <!-- https://math.meta.stackexchange.com/questions/23244/how-to-do-a-underbracket-with-mathjax -->

    <!-- 4. Repeat Step 3 until convergence to tolerance or until hit maximum number of iterations -->

4. $\textbf{Update step}$: Finally, we update $y\_{n+1}$ and $\dot{y}\_{n+1}$ using our final value of $\dot{y}\_{n+\alpha\_{m}}$ and $y\_{n+\alpha\_{f}}$.

    $$y\_{n+1} = y\_{n} + \frac{y\_{n+\alpha\_{f}}^{N\_{int}} - y\_{n}}{\alpha\_{f}}$$

    $$\dot{y}\_{n+1} = \dot{y}\_{n} + \frac{\dot{y}\_{n+\alpha\_{m}}^{N\_{int}} - \dot{y}\_{n}}{\alpha\_{m}}$$

<h3> Assembly </h3>

Similar to a finite element solver, the 0D solver defines local element contributions to $\textbf{E}$, $\textbf{F}$, $C$, $\textbf{dE}$, $\textbf{dF}$, and $\textbf{dC}$. The solver automatically assembles these local contributions into the global arrays,

<!-- https://math.meta.stackexchange.com/questions/11900/text-and-mathjax-above-symbol -->

$$\textbf{E} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{E}^{e},$$


$$\textbf{F} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{F}^{e},$$


$$C = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}C^{e},$$

$$\textbf{dE} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{dE}^{e},$$


$$\textbf{dF} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{dF}^{e},$$


$$\textbf{dC} = \underset{e = 1}{\overset{N\_{elem}}{\mathbb{A}}}\textbf{dC}^{e}.$$

where $\mathbb{A}$ is the assembly operator and $N\_{elem}$ is the total number of 0D elements in our 0D model.

<h3> Local element contributions </h3>

For each 0d element, if a local element array is not specified, then it is implied to be an array of zeros.

Note that the governing equations for an element, $e$, can be cast into the form of

$$\textbf{E}^{e}\left(y^{e}, t\right)\dot{y}^{e} + \textbf{F}^{e}\left(y^{e}, t\right)y^{e} + C^{e}\left(y^{e}, t\right) = 0.$$

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
    y^{e} =
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
    y^{e} =
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
    y^{e} =
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

<h5> Stenosis </h5>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/stenosis.png">
  <figcaption class="svCaption"> Stenosis element.
  </figcaption>
</figure>

The governing equations for the local stenosis element [2] are

$$P\_{in}^{e} - P\_{out}^{e} - R\_{pre}\left(Q\_{in}^{e}\right)Q\_{in}^{e} = 0$$

$$Q\_{in}^{e} - Q\_{out}^{e} = 0,$$

where $R\_{pre}\left(Q\right) = K\_{t}\frac{\rho}{2A\_{o}^{2}}\left(\frac{A\_{o}}{A\_{s}} - 1\right)^{2}|Q| + R\_{p}$ and $R\_{p} = \frac{8\mu L}{\pi r^{4}}.$

The local contributions to the global arrays are

\begin{gather}
    y^{e} =
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
    y^{e} =
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
    C^{e} =
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

The governing equations for the coronary boundary condition [3] are

$$C\_{im}R\_{v}Q^{e} - V\_{im}^{e} - C\_{im}P\_{im} + C\_{im}P\_{v} - C\_{im}R\_{v}\frac{dV\_{im}^{e}}{dt} - C\_{a}C\_{im}R\_{v}\frac{dP^{e}}{dt} + R\_{a}C\_{a}C\_{im}R\_{v}\frac{dQ^{e}}{dt} + C\_{a}C\_{im}R\_{v}\frac{dP\_{a}^{e}}{dt} = 0,$$

$$C\_{im}R{v}P^{e} - C\_{im}R\_{v}R\_{a}Q^{e} - R\_{v}V\_{im}^{e} - C\_{im}R\_{v}P\_{im} - C\_{im}R\_{v}R\_{am}\frac{dV\_{im}^{e}}{dt} - R\_{am}V\_{im}^{e} - C\_{im}R\_{am}P\_{im} + R\_{am}C\_{im}P\_{v} = 0.$$

The local contributions to the global arrays are

\begin{gather}
    y^{e} =
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
    C^{e} =
        \begin{bmatrix}
            C\_{im} \left(-P\_{im} + P\_{v} \right) + C\_{a}C\_{im}R\_{v}\frac{dP\_{a}}{dt} \ \cr
            -C\_{im}\left( R\_{v} + R\_{am}\right)P\_{im} + R\_{am}C\_{im}P\_{v}
        \end{bmatrix}.
\end{gather}

Assume $P\_{a} = 0$.
