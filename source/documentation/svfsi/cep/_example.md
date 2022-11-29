## Example - Activation of a Myocardial Block

In this section, we will provide a example of cardiac electrophysiology modeling. This example is a widely used benchmark test, activation of a block of cardiac tissue <a href="#ref-1">[1]</a>. More examples are available on <a href="https://github.com/SimVascular/svFSI-Tests/tree/master/08-cep">GitHub</a>.

The computational domain is a rectangular block, with dimensions of $3\times 7\times 20 mm$. A small cluster of cells located at one corner of the block (marked as S) will recive an initial stimulus, and the TTP model is used to model the activation of the rest of the domain. The entire simulation set-up along with results can be found on <a href="https://github.com/SimVascular/svFSI-Tests/tree/master/08-cep/03-benchmark_tTP">GitHub</a>.

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/cep/imgs/cuboid.png">
  <figcaption class="svCaption" >Computational domain.<a href="#ref-1">[1]</a></figcaption>
</figure>


Here is the breakdown of the input file for this study.

```
# File svFSI.inp
#----------------------------------------------------------------
# General simulation parameters

Continue previous simulation: f
Number of spatial dimensions: 3
Number of time steps: 100000
Time step size: 0.01
Spectral radius of infinite time step: 0.50
Searched file name to trigger stop: STOP_SIM

Save results to VTK format: 1
Name prefix of saved VTK files: result
Increment in saving VTK files: 100
Start saving after time step: 1

Increment in saving restart files: 100
Convert BIN to VTK format: 0

Verbose: 1
Warning: 1
Debug: 0

#----------------------------------------------------------------
# Mesh data
Add mesh: msh {
   Mesh file path):   mesh/h0.1/mesh-complete.mesh.vtu
   Add face: X0 {
      Face file path: mesh/h0.1/mesh-surfaces/X0.vtp
   }
   Add face: X1 {
      Face file path: mesh/h0.1/mesh-surfaces/X1.vtp
   }
   Add face: Y0 {
      Face file path: mesh/h0.1/mesh-surfaces/Y0.vtp
   }
   Add face: Y1 {
      Face file path: mesh/h0.1/mesh-surfaces/Y1.vtp
   }
   Add face: Z0 {
      Face file path: mesh/h0.1/mesh-surfaces/Z0.vtp
   }
   Add face: Z1 {
      Face file path: mesh/h0.1/mesh-surfaces/Z1.vtp
   }

   Fiber direction: (1, 0, 0)

   # Here we also need to supply a domain information to separate
   # pacemaker cells and non-pacemaker cells. domain_info.dat
   # is a plaintext file store the domain ID of each element.
   # id == 1: non-pacemaker cells
   # id == 2: pacemaker cells (recivies stimulus)
   Domain file path: mesh/h0.1/domain_info.dat
}

#----------------------------------------------------------------
# Equations
Add equation: CEP {
   Coupled: 1
   Min iterations: 1
   Max iterations: 5
   Tolerance: 1e-6

   # Here domain id == 1 are non-pacemaker cells
   Domain: 1 {
      Electrophysiology model: TTP
      Conductivity (iso): 0.012571
      Conductivity (ani): 0.082715
      ODE solver: RK
   }

   # Here domain id == 2 are pacemaker cells
   Domain: 2 {
      Electrophysiology model: TTP
      Conductivity (iso): 0.012571
      Conductivity (ani): 0.082715
      # Stimulus to initiate the depolarization process
      Stimulus: Istim {
         Amplitude: -35.714
         Start time: 0.0
         Duration: 2.0
         Cycle length: 10000.0
      }
      ODE solver: RK
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
```

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/cep/imgs/ttp_cuboid.gif">
  <figcaption class="svCaption" >Activation of the cuboid.</figcaption>
</figure>