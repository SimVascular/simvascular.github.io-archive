## Activation of a Purkinje Network ##

Here we perform electrophysiology simulation on a human biventricular Purkinje network. The initial stimulus is provided at the atrio-ventricular junction, and the TTP model is used to model for the activation of the individual Purkinje cells. The entire simulation set-up along with results can be found on <a href="https://github.com/SimVascular/svFSI-Tests/tree/master/08-cep/05-Purkinje">GitHub</a>.

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/PAT003_Purkinje.png">
  <figcaption class="svCaption" >A biventricular Purkinje network</figcaption>
</figure>

Here is the breakdown of the input file for this study.

<pre class="highlight plaintext"><code>
    #----------------------------------------------------------------
    # General simulation parameters

    Continue previous simulation: 1
    Number of spatial dimensions: 3
    Number of time steps: 20000
    Time step size: 0.05
    Spectral radius of infinite time step: 0.50
    Searched file name to trigger stop: STOP_SIM

    Save results to VTK format: 1
    Name prefix of saved VTK files: result
    Increment in saving VTK files: 50
    Start saving after time step: 1

    Increment in saving restart files: 1000
    Convert BIN to VTK format: 0

    Verbose: 1
    Warning: 0
    Debug: 0

    #----------------------------------------------------------------
    # Mesh data
    Add mesh: pfib_LV {
       Set mesh as fibers: t
       Mesh file path: mesh/pfib_LV.vtu
       Domain file path: mesh/domain_pfib_LV.dat
       Mesh scale factor: 10.0
    }

    Add mesh: pfib_RV {
       Set mesh as fibers: t
       Mesh file path: mesh/pfib_RV.vtu
       Domain file path: mesh/domain_pfib_RV.dat
       Mesh scale factor: 10.0
    }

    #----------------------------------------------------------------
    # Equations
    Add equation: CEP {
       Coupled: 1
       Min iterations: 1
       Max iterations: 3
       Tolerance: 1e-6

       Domain: 1 {
          Electrophysiology model: TTP
          Myocardial zone: pfib
          Conductivity (iso): 1.1
          ODE solver: RK
       }

       Domain: 2 {
          Electrophysiology model: TTP
          Myocardial zone: pfib
          Conductivity (iso): 1.1
          ODE solver: RK
          Stimulus: Istim {
             Amplitude: -52.0
             Start time: 0.0
             Duration: 2.0
             Cycle length: 1000.0
          }
       }

       Output: Spatial {
          Action_potential: t
       }

       LS type: GMRES
       {
          Max iterations:      100
          Tolerance:           1D-6
          Krylov space dimension: 50
       }
    }
</code></pre>

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/electrophysiology/images/ttp_pnet.gif">
  <figcaption class="svCaption" >Activation of the Purkinje network simulated using svFSI.</figcaption>
</figure>


