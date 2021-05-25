<h2> 0d Solver Theory </h2>

Flow rate and pressure in zero-dimensional (0D) models of vascular anatomies are governed by a system of differential-algebraic equations (DAEs),

$$\textbf{E}\frac{dy}{dt} + \textbf{F}y + C = 0$$

where $\textbf{F} \in \mathbb{R}^{N \times N}$, $\textbf{E} \in \mathbb{R}^{N \times N}$, $C \in \mathbb{R}^{N}$, and $y \in \mathbb{R}^{N}$. Here, $y$ is the vector of unknown quantities, flow rate $Q$ and pressure $P$. $N$ is the total number of equations and the total number of global unknowns.

0D models are analogous to electrical circuit systems, where flow rate represents current and pressure represents voltage. Resistance portrays the viscous effects of blood flow, capacitance represents the compliance and distensibility of the vessel wall, and inductance represents the inertia of the blood flow.

Similar to a finite element solver, the 0D solver defines the local element contributions to $\textbf{F}$, $\textbf{E}$, and $C$ and assembles these local contributions into the global arrays.

The DAE system is then solved implicitly using the generalized-alpha method and a Newton solver.

todo: need to include equations for tangent matrices and residuals. -- is this really needed?? maybe, if users want to define their own elements

<h3> Vessel elements </h3>

For each 0d element, if a local element array is not specified, then  it is an array of zeros.

Note that the governing equations for element, $e$, can be cast into the form of

$$\textbf{E}^{e}\frac{dy^{e}}{dt} + \textbf{F}^{e}y^{e} + C^{e} = 0.$$

<h4> Resistor </h4>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/resistor.png">
  <figcaption class="svCaption"> Resistor element.
  </figcaption>
</figure>

The governing equations for the local resistor element are

<!-- https://github.com/mathjax/MathJax/issues/329 -- need to add a backslash before all underscore in an equation -->
$$P\_{in}^{e} - P\_{out}^{e} = RQ\_{in}^{e}$$

$$Q\_{in}^{e} - Q\_{out}^{e} = 0.$$

The local contributions to the global arrays are

5/23/21 last here -- need to check that everything below looks good
last here - make sure that figure captions look good

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

<h4> Capacitor </h4>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/capacitor.png">
  <figcaption class="svCaption"> Resistor element.
  </figcaption>
</figure>

The governing equations for the local capacitor element are

$$Q\_{in}^{e} = C\frac{d\left( P\_{in}^{e} - P\_{out}^{e} \right)}{dt}$$

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

<h4> Inductor </h4>

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/inductor.png">
  <figcaption class="svCaption"> Resistor element.
  </figcaption>
</figure>

The governing equations for the local inductor element are

$$P\_{in}^{e} - P\_{out}^{e} = L\frac{dQ\_{in}^{e}}{dt}$$

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

<h4> Junction </h4>

Across all inlets and outlets of the junction, mass is conserved and pressure is continuous.

<h3> Boundary condition elements </h3>

<h4> RCR </h4>

todo: review the contents in this section

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/rcr_bc.png">
  <figcaption class="svCaption"> Resistor element.
  </figcaption>
</figure>

The governing equations for the RCR boundary condition are

$$R\_{d}Q - P\_{c} + P\_{ref} - R\_{d}C\frac{dP\_{c}}{dt} = 0,$$

$$P - P\_{c} - R\_{p}Q = 0.$$

The local contributions to the global arrays are

\begin{gather}
    y^{e} =
        \begin{bmatrix}
            P & Q & P\_{c}
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
            0 \ \cr
            P\_{ref}
        \end{bmatrix}.
\end{gather}

<h4> Coronary </h4>

todo: review the contents in this section

<br>
<figure>
  <img class="svImg svImgMd" src="documentation/rom_simulation/0d-solver/images/coronary_bc.png">
  <figcaption class="svCaption"> Resistor element.
  </figcaption>
</figure>

The governing equations for the coronary boundary condition are

$$C\_{im}R\_{v}Q - V\_{im} - C\_{im}P\_{im} + C\_{im}P\_{v} - C\_{im}R\_{v}\frac{dV\_{im}}{dt} - C\_{a}C\_{im}R\_{v}\frac{dP}{dt} + R\_{a}C\_{a}C\_{im}R\_{v}\frac{dQ}{dt} + C\_{a}C\_{im}R\_{v}\frac{dP\_{a}}{dt} = 0,$$

$$C\_{im}R{v}P - C\_{im}R\_{v}R\_{a}Q - R\_{v}V\_{im} - C\_{im}R\_{v}P\_{im} - C\_{im}R\_{v}R\_{am}\frac{dV\_{im}}{dt} - R\_{am}V\_{im} - C\_{im}R\_{am}P\_{im} + R\_{am}C\_{im}P\_{v} = 0.$$

The local contributions to the global arrays are

\begin{gather}
    y^{e} =
        \begin{bmatrix}
            P & Q & V\_{im}
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
            1 &  C\_{im}R\_{v} & -1 \ \cr
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

Let $P\_{a} = 0$.
