### Input file
The input file mostly follows the master input file [`svFSI_master.inp`](./svFSI_master.inp). Some specific input options are discussed below:

For Newtonian fluid:

```
   Viscosity: Constant {
      Vsalue: 0.04
   }
```

For Casson fluid

```
   Viscosity: Cassons {
      Asymptotic viscosity parameter: 0.3953
      Yield stress parameter: 0.22803
      Low shear-rate threshold: 0.5
   }
```

For Carreau-Yasuda fluid

```
   Viscosity: Carreau-Yasuda {
      Limiting high shear-rate viscosity: 0.022
      Limiting low shear-rate viscosity: 0.22
      Shear-rate tensor multiplier (lamda): 0.11
      Shear-rate tensor exponent (a): 0.644
      Power-law index (n): 0.392
   }
```