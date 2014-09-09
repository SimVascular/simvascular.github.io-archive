Full Format of the input.config file

~~~
# ==============
SOLUTION CONTROL
# ==============
{
  Equation of State: Incompressible     # sets ipress=-1 matflag(1,n)
  Viscous Control: Viscous              #replaces navier (0 no, 1 yes)
  Number of Timesteps: NODEFAULT        #replaces nsteps(1) (ntseq wired =1)
  Time Step Size: NODEFAULT             # Delt(1)
  Solve Flow : True            # solveflow         
  Solve Heat : False           # solveheat
  Solve Scalars : 0            # nsclrS total number of scalars must be <=4
}

# =================
MATERIAL PROPERTIES
# =================
{
  Shear Law: Constant Viscosity  # ishear=0  => matflag(2,n)
  Bulk Viscosity Law: Constant Bulk Viscosity # ibulk=0 => matflag(3,n)
  Conductivity Law: Constant Conductivity # icond=0 => matflag(4,n)
  Viscosity: NODEFAULT       # fills datmat (2 values REQUIRED if iLset=1)
  Density: 1.0               # ditto
  Thermal Conductivity: 0.2  # ditto
  Prandtl Number: 0.72  # Compressible code sets diffusivity with this
  Scalar Diffusivity: 0.2    # fills scdiff(1:nsclrS)
#     Body Force Option: Vector # ibody=1 => matflag(5,n)
#     Body Force Option: Boussinesq # ibody=2 => matflag(5,n)
#     Body Force Option: User e3source.f  # ibody=3 => matflag(5,n)
#     Body Force Option: Cooling Analytic  # ibody=4 => matflag(5,n)
#     Body Force Option: Cooling Initial Condition  # ibody=5 => matflag(5,n)
  Body Force Option: None    # ibody=0 => matflag(5,n)
  Body Force: 0.0 0.0 0.0    # (datmat(i,5,n),i=1,nsd)
  Body Force Pressure Gradient: 0.0 0.0 0.0    # (datmat(i,7,n),i=1,nsd)
  Rotating Frame of Reference: False
  Rotating Frame of Reference Rotation Rate: 0. 0. 0.
  Surface Tension Option: No #isurf=0

}

# ============
OUTPUT CONTROL
# ============
{
  Number of Timesteps between Restarts: 500 #replaces nout/ntout
  Verbosity Level: 3                        #replaces necho
  Print Statistics: False          #False=> ioform=1, True=> ioform=2
  Print Wall Fluxes: True         #No current action but it will come later
  Print Residual at End of Step: False # T lstres=1 F lstres=0
  Print FieldView: False              # outpar.iofieldv
  Print ybar: True                   # F ioybar = 0, T ioybar = 1
  Surface ID for Integrated Mass: 1   # isrfIM
  Number of Force Surfaces: 0         # nsrfCM
  Surface ID's for Force Calculation: NODEFAULT  # nreadlist(j),j=1,nsrfCM
# this must be processed as in input.f or passed to input.f for processing
# not read if nsrfCM=0
  Data Block Format : binary #iotype, options 'binary','ascii'
}

# ===========
LINEAR SOLVER
# ===========
{

#  Solver Type: ACUSIM                           # iprjFlag=0 ipresPrjFlag=0
#  Solver Type: ACUSIM with P Projection          # iprjFlag=0 ipresPrjFlag=1
#  Solver Type: ACUSIM with Velocity Projection  # iprjFlag=1 ipresPrjFlag=0
#  Solver Type: ACUSIM with Full Projection      # iprjFlag=1 ipresPrjFlag=1
#  The above 4 are for incompressible flow.

  Solver Type: memLS                           # iprjFlag=2 ipresPrjFlag=0

  Number of GMRES Sweeps per Solve: 1      # replaces nGMRES
  Number of Krylov Vectors per GMRES Sweep: 100           # replaces Kspace
  Number of Solves per Left-hand-side Formation: 1  #nupdat/LHSupd(1)

  Tolerance on Momentum Equations: 0.05                   # epstol(1)
  Tolerance on Continuity Equations: 0.4                   # epstol(7)
  Tolerance on memLS NS Solver: 0.4                   # epstol(8)

  Number of Solves of Temperature per Left-hand-side Formation: 1 
  Temperature Solver Tolerance: 0.001

  Number of Solves of Scalar 1 per Left-hand-side Formation: 1 
  Number of Solves of Scalar 2 per Left-hand-side Formation: 1 
  Number of Solves of Scalar 3 per Left-hand-side Formation: 1 
  Number of Solves of Scalar 4 per Left-hand-side Formation: 1 
  Scalar 1 Solver Tolerance: 0.001
  Scalar 2 Solver Tolerance: 0.001
  Scalar 3 Solver Tolerance: 0.001
  Scalar 4 Solver Tolerance: 0.001

  Tolerance on ACUSIM Pressure Projection: 0.1           # prestol 
  Minimum Number of Iterations per Nonlinear Iteration: 1  # minIters
  Maximum Number of Iterations per Nonlinear Iteration: 500 # maxIters
  Velocity Delta Ratio :0.   #utol deltol(1,1)  Stop factor for steady solve
  Pressure Delta Ratio :0.   #ptol deltol(1,2)  Stop factor for steady solve
  Number of Velocity Projection Vectors: 20  #nPrjs
  Number of Pressure Projection Vectors: 20  #nPresPrjs
  ACUSIM Verbosity Level               : 0   #iverbose

#  DES - CAREFUL FOR DEFORMABLE WALL SIM - USE 10,20,400
  Maximum Number of Iterations for memLS NS Solver : 1  #maxNSIters
  Maximum Number of Iterations for memLS Momentum Loop: 2  #maxMomentumIters
  Maximum Number of Iterations for memLS Continuity Loop: 400  #maxContinuityIters
}

# ====================
DISCRETIZATION CONTROL
# ====================
{
  Basis Function Order: 1                 # ipord

# Time Integration Rule: First Order      # 1st Order sets rinf(1) -1
  Time Integration Rule: Second Order    # Second Order sets rinf next
  Time Integration Rho Infinity: 0.5     # rinf(1) Only used for 2nd order
  Predictor at Start of Step : Same Velocity  # ipred=1 (more options later)
  Weak Form: SUPG # alternate is Galerkin only for compressible
  Flow Advection Form: Convective        # iconvflow=2
# Flow Advection Form: Conservative       # iconvflow=1
  Scalar Advection Form: Convective       # iconvsclr=2
# Scalar Advection Form: Conservative     # iconvsclr=1
# Use Conservative Scalar Convection Velocity: True
  Use Conservative Scalar Convection Velocity: False
  Tau Matrix: Diagonal-Shakib                #itau=0
# Tau Matrix: Diagonal-Franca               #itau=1
# Tau Matrix: Diagonal-Jansen(dev)          #itau=2
# Tau Matrix: Diagonal-Compressible         #itau=3
# Tau Matrix: Matrix-Mallet                 #itau=10
  Tau Time Constant: 1.                      #dtsfct
  Tau C Scale Factor: 1.0                    # taucfct  best value depends on Tau Matrix chosen
  Discontinuity Capturing: Off               # Sets IDC to 0 for now
# Discontinuity Capturing:  "DC-mallet"      #Sets IDC to 1
  Scalar Discontinuity Capturing: 0 0        #Sets idcsclr to [0 0], no DC 
                                             #on any scalar
# idcsclr(1)--> Type of DC (see flow), idcsclr(2)---> on which scalar DC acting
# Scalar Discontinuity Capturing: 1 1       #Sets DC=1 on first scalar
# Scalar Discontinuity Capturing: 1 2       #Sets DC=1 on second scalar
  Include Viscous Correction in Stabilization: True    # if p=1 idiff=1
                                                          # if p=2 idiff=2  
  Lumped Mass Fraction on Left-hand-side: 0.           # flmpl
  Lumped Mass Fraction on Right-hand-side: 0.          # flmpr
  Dump CFL: False                           #iCFLworst=0
  Quadrature Rule on Interior: 2           #int(1)
  Quadrature Rule on Boundary: 3           #intb(1)
  Number of Elements Per Block: 255        #ibksiz
  Entropy Form of Pressure Constraint on Weight Space: 0  # 1 turns it on
}

# =========================
SOLUTION SCALING PARAMETERS
# =========================
{
  Density: 1.     #ro      This is used in sponge
  Velocity: 1.    #vel     This affects tau currently
  Pressure: 1.    #pres    This is used in sponge
  Temperature: 1. #temper  This scales diagonal energy tau (see e3tau.f)
  Entropy: 1.     #entrop
}

# ================================
CARDIOVASCULAR MODELING PARAMETERS
# ================================  
{   
  Backflow Stabilization Coefficient: 0.2 # backFlowStabCoef 
  Time Varying Boundary Conditions From File: False # F itvn=0 T itvn=1
  BCT Time Scale Factor : 1.0
  Number of Coupled Surfaces: 0 # icardio
  Pressure Coupling: None # Explicit, Implicit, P-Implicit 
                          # none ipvsq=0, expl ipvsq=1, 
                          # impl ipvsq=2, P-Imp ipvsq=3
  Number of Resistance Surfaces: 0 # numResistSrfs   
  List of Resistance Surfaces: NODEFAULT # nsrflistResist(j), j=0,MAXSURF
  Resistance Values : NODEFAULT  # ValueListResist(j),j=1,icardio
   
# CLOSEDLOOP
  Number of Neumann Surfaces: 0 # numNeumannSrfs   
  List of Neumann Surfaces: NODEFAULT # nsrflistNeumann(j), j=0,MAXSURF
  Find the GenBC Inside the Running Directory: True # iGenFromFile
  Number of Timesteps for GenBC Initialization: 0 # iGenInitialization
  Number of Dirichlet Surfaces: 0 # numDirichletSrfs   
  List of Dirichlet Surfaces: NODEFAULT # nsrflistDirichlet(j), j=0,MAXSURF

  Number of Normal Constrained Surfaces: 0 # numNormalSrfs
  List of Normal Constrained Surfaces: NODEFAULT # nsrflistNormal(j), j=0,MAXSURF
# ==========
   
  Number of Impedance Surfaces: 0 # numImpSrfs
  List of Impedance Surfaces: NODEFAULT # nsrflistImp(j), j=0,MAXSURF
  Impedance From File: False #False impfile=0, True impfile=1
  Number of RCR Surfaces: 0 # numRCRSrfs
  List of RCR Surfaces: NODEFAULT # nsrflistRCR(j), j=0,MAXSURF
  RCR Values From File: False #False ircrfile=0, True ircrfile=1

# CORONARY
  Number of COR Surfaces: 0 # numRCRSrfs
  List of COR Surfaces: NODEFAULT # nsrflistRCR(j), j=0,MAXSURF
  COR Values From File: False #False ircrfile=0, True ircrfile=1
# ========

  Number of Surfaces which zero out in-plane tractions: 0 # numVisFluxSrfs
  List of Surfaces which zero out in-plane tractions: NODEFAULT # nsrflistVisFlux(j), j=0,MAXSURF        
  Number of Surfaces which Output Pressure and Flow: 0 # numCalcSrfs
  List of Output Surfaces: NODEFAULT # nsrflistCalc(j), j=0,MAXSURF
  Lagrange Multipliers: False # False Lagrange=0, True Lagrange=1
  Number of Constrained Surfaces: 0 # numLagrangeSrfs
  List of Constrained Surfaces: NODEFAULT # nsrflistLagrange(j)  
  Constrained Surface Information From File: False #False iLagfile=0, True iLagfile=1
  Residual Control: True # False rescontrol=0, True rescontrol=1
  Residual Criteria: 0.01 # ResCriteria 
  Minimum Required Iterations: 3 # MinNumIter
  Deformable Wall: False #False ideformwall=0, True ideformwall=1

# VARWALL
  Variable Wall Thickness and Young Mod: Flase # False ivarwallprop=0, True ivarwallprop=1 
# =======
  Number of Wall Properties per Node: 10 # nProps
                                         # nProps=10: Isotropic
                                         # nProps=21: Orthotropic
  Density of Vessel Wall: NODEFAULT # rhovw
  Thickness of Vessel Wall: NODEFAULT # thicknessvw
  Young Mod of Vessel Wall: NODEFAULT # evw
  Poisson Ratio of Vessel Wall: 0.5 # rnuvw
  Shear Constant of Vessel Wall: NODEFAULT # rshearconstantvw
  Wall Mass Matrix for LHS: True   # iwallmassfactor=1
# Wall Mass Matrix for LHS: False  # iwallmassfactor=0
  Wall Stiffness Matrix for LHS: True   # iwallstiffactor=1
# Wall Stiffness Matrix for LHS: False  # iwallstiffactor=0
}

# ===========
STEP SEQUENCE
# ===========
{
  Step Construction  : 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1
}
~~~


