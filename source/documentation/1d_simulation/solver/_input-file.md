# Input File Format

The 1D Solver executes using a single input text file. The 1D Solver reads in the input text file and 
executes keyword statements to define data for

<ol>
  <li>Finite element mesh</li>
  <li>Boundary conditions</li>
  <li>Material model</li>
  <li>Solver parameters </li>
</ol>

The general format for a keyword statement is a capitalized name followed by list of data values
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  KEYWORD <i>value$\_1$</i> <i>value$\_2$</i> ... <i>value$\_N$</i>
</div>
<br>

The following keywords are used by the 1D Solver to define and execute a 1D simulation

<ol>
  <li> <a href="#format_data_table"> DATATABLE / ENDDATATABLE </a> </li>
  <li> <a href="#format_include"> INCLUDE </a> </li>
  <li> <a href="#format_joint"> JOINT </a> </li>
  <li> <a href="#format_joint_inlet"> JOINTINLET </a> </li>
  <li> <a href="#format_joint_outlet"> JOINTOUTLET </a> </li>
  <li> <a href="#format_material"> MATERIAL </a> </li>
  <li> <a href="#format_model"> MODEL </a> </li>
  <li> <a href="#format_node"> NODE </a> </li>
  <li> <a href="#format_output"> OUTPUT </a> </li>
  <li> <a href="#format_segment"> SEGMENT </a> </li>
  <li> <a href="#format_solver_options"> SOLVEROPTIONS </a> </li>
</ol>

<!-- DATATABLE --> 

<br>
<a id="format_data_table"> <h3> DATATABLE / ENDDATATABLE </h3></a> 
The DATATABLE statement is used to specify constant and time-varying quantities for inlet/outlet boundary conditions 
as a list of List of time/value pairs.
It also computes admittance and impedance from a parametric definition of the downstream vessel morphometry. 

Format
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  DATATABLE <i>name</i>  <i>type</i> 
  <ul style="list-style-type:none;">
  <li><i>$row\_1$</i></li>
  <li><i>$row\_2$</i></li>
  <li><i>...</i></li>
  <li><i>$row\_N$</i></li>
  </ul>
  ENDDATATABLE
  <br>
  <br>

  Arguments
  <ul style="list-style-type:none;">
    <li><i>name</i> (string)) - Data table name </li><br>
    <li><i>type</i> (string) - Data table type. 
  </ul>
  <br>

  Data table type
  <ul style="list-style-type:none;">
    <li>LIST - Table values are specified by alternating the time and the quantity of interest at that instant in time. 
      <ul style="list-style-type:none;">
      <li>$row\_1$</i> = <i>time$\_1$ value$\_1$</i></li>
      <li><i>$row\_2$</i> = time$\_2$ value$\_2$</i></li>
      <li><i>...</i></li>
      <li><i>$row\_N$</i> = time$\_N$ value$\_N$</i></li>
      </ul>
   </li><br>
  </ul>

</div>

 <br>
Example: Set a constant inlet flow rate of 14.0.

```
  DATATABLE INLETDATA LIST
  0.0 14.0 
  10.0 14.0
  ENDDATATABLE
```

 <br>
Example: Set a time-varying inlet flow rate. 

```
  DATATABLE INLETDATA LIST
  0.0 14.0 
  1.0 20.0
  2.0 50.0
  2.5 89.2
  3.5 110.0
  5.0 70.0
  6.0 48.0
  7.0 20.0
  8.0 14.0
  ENDDATATABLE
```
<br>

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid green; border-left: 6px solid green">
When entering values for PRESSURE, RESISTANCE, RCR, etc. a time value must be given even if its value will not be read. 
</div>
<br>

Example: Set outlet resistance value of 1000.0 Barye s/mL.

```
  DATATABLE RTABLE LIST
  0.0 1000.0 
  ENDDATATABLE
```

<!-- INCLUDE -->

<br>
<a id="format_include"> <h3> INCLUDE </h3></a> 
The INCLUDE statement is used to recursively include input files in the project. 

Format
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  INCLUDE <i>name</i>  <i>activate</i>

  Arguments
  <ul style="list-style-type:none;">
    <li><i>name</i> (string, no spaces) -  Name of the file to include </li><br>
    <li><i>activate</i> (boolean) -  Activate file. 
       If set to TRUE then the file is included in the current model. If set to FALSE then the file is not used. 
    </li><br> 
  </ul>
</div>

Example: Include the file named *auxFile.in* in the current model.

```
  INCLUDE auxFile.in TRUE
```

<!-- JOINT -->

<br>
<a id="format_joint"> <h3> JOINT </h3></a> 
The JOINT statement is used to specify a connection between vessel segments. By entering the inlet and outlet vessel segments is it possible to enforce a unique value of pressure in the junction and a flow rate that satisfy conservation of mass. 

Format

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  JOINT <i>name</i>  <i>node</i> <i>inlet</i> <i>outlet</i>
  <br>
  <br>

  Arguments
  <ul style="list-style-type:none;">
    <li><i>name</i> (string) -  Joint name </li><br>
    <li><i>node</i> (integer) -  Joint node ID </li><br>
    <li><i>inlet</i> (string) - Joint inlet name </li><br>
    <li><i>outlet</i> (string) - Joint outlet name </li><br>
  </ul>
</div>
<br>

Example: Define a joint named *JOINT1* at node *1* connecting inlet *IN0* to outlet *OUT0*. 

```
  JOINT JOINT1 1 IN0 OUT0
```

<!-- JOINTINLET -->

<br>
<a id="format_joint_inlet"> <h3> JOINTINLET </h3></a> 
The JOINTINLET statement is used to specify a list of segments IDs as inlets for a joint entity. 

Format
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  JOINTINLET <i>name</i>  <i>nsegs</i>  <i>list</i>
  <br>
  <br>

  Arguments
  <ul style="list-style-type:none;">
    <li><i>name</i> (string) - Inlet name </li><br>
    <li><i>nsegs</i> (integer) - Total number of segments </li><br>
    <li><i>list</i> (list of integers) - List of segment IDs </li><br>
  </ul>
<br>
</div>
<br>

Example: Define a inlet joint named *IN0* with segment ID equal to 2, 4, and 5.

```
  JOINTINLET IN0 3 2 4 5
```

<!-- JOINTOUTLET -->

<br>
<a id="format_joint_outlet"> <h3> JOINTOUTLET </h3></a> 
The JOINTOUTLET statement is used to specify a list of segment IDs as outlets for a joint entity. 

Format

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  JOINTOUTLET <i>name</i>
  <br> <br>

  Arguments
  <ul style="list-style-type:none;">
    <li><i>name</i> (string) - Outlet name </li><br>
    <li><i>nsegs</i> (integer) - Total number of segments </li><br>
    <li><i>list</i> (list of integers) - List of segment IDs </li><br>
  </ul>
<br>
</div>
<br>

Example: Define an outlet joint named *OUT0* with 3 inlets and segment IDs 2, 4, and 5. 

```
  JOINTOUTLET OUT0 3 2 4 5
```

<!-- MATERIAL -->

<br>
<a id="format_material"> <h3> MATERIAL </h3></a> 
The MATERIAL statement is used to specify a constitutive relationship between pressure, cross section diameter and thickness. 

Format

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  MATERIAL <i>name</i> 
    <i>type</i>
    <i>density</i>
    <i>viscosity</i>
    <i>exponent</i>
    <i>$k_1$</i> [ <i>$k_2$</i> <i>$k_3$</i> ]
  <br> <br>

  Arguments
  <ul style="list-style-type:none;">
    <li><i>name</i> (string) - Material name. </li><br>
    <li><i>type</i> (string) - Material type. </li><br>
    <li><i>density</i> (double) - Material density.  </li><br>
    <li><i>viscosity</i> (double) - Material viscosity.  </li><br>
    <li><i>pressure</i> (double) - Material reference pressure.  </li><br>
    <li><i>exponent</i> (double) - Material exponent.  </li><br>
    <li><i>$k_1$</i> (double) - Material $k_1$ parameter.  </li><br>
    <li><i>$k_2$</i> (double) - Material $k_2$ parameter. Optional, used for OLUFSEN material. </li><br>
    <li><i>$k_3$</i> (double) - Material $k_3$ parameter. Optional, used for OLUFSEN material. </li><br>
  </ul>

  Material types
  <ul style="list-style-type:none;">
    <li>LINEAR - Linear material. </li><br>
    <li>OLUFSEN - Olufsen material. </li><br>
  </ul>

</div>
<br>

Example: Linear material

```
  MATERIAL MAT1 LINEAR  1.06 0.04 120000.0 1.0 7.1e4
```
<br>

Example: Olufsen material

```
  MATERIAL MAT1 OLUFSEN 1.06 0.04 120000.0 1.0 2.0e7 -22.5267 8.65e5
```

<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid green; border-left: 6px solid green">
The reference pressure is the pressure associated with the undeformed area of the vessel. Typically this is the diastolic pressure for a specific vessel. Multiple reference pressures can be assigned to segments using multiple material models.
</div>

<br>
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid green; border-left: 6px solid green">
For the OLUFSEN material model, all three parameters need to be defined, i.e., $k\_1$, $k\_2$,$k\_3$. For a LINEAR material 
model instead only the first material parameter $k\_1$ is used and set equal to $E\,h/r$, i.e., the product of elastic modulus and 
thickness divided by the radius.
</div>


<!-- MODEL -->

<br>
<a id="format_model"> <h3> MODEL </h3></a> 
The MODEL statement is used to define a name for the model that is used when generating the output files. 

Format
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  MODEL <i>name</i> 

  Arguments
  <ul style="list-style-type:none;">
    <li><i>name</i> (string) - Model name. </li><br>
  </ul>
</div>
<br>

Example: Define a model named *Artery*.

```
  MODEL Artery
```

<!-- NODE -->

<br>
<a id="format_node"> <h3> NODE </h3></a> 
The NODE statement is used to specify the coordinates of a connection between vessel segments. 

Format
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  NODE <i>id</i> <i>x</i>  <i>y</i>  <i>z</i>
  <br>

  Arguments
  <ul style="list-style-type:none;">
    <li><i>id</i> (integer) - Node ID. </li><br>
    <li><i>x</i> (double) - Node X coordinate. </li><br>
    <li><i>y</i> (double) - Node Y coordinate. </li><br>
    <li><i>z</i> (double) - Node Z coordinate. </li><br>
  </ul>
</div>
<br>

Example: Define a node with ID *1* and coordinates *1.0 2.0 3.0*.

```
  NODE 0 1.0 2.0 3.0
```

<!-- OUTPUT -->

<br>
<a id="format_output"> <h3> OUTPUT </h3></a> 
The OUTPUT statement specifies the file formats for the program outputs. 

Format
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  OUTPUT <i>format</i> [ <i>option</i> ]
 
  Arguments
  <ul style="list-style-type:none;">
    <li><i>format</i> (string) - Output file format. </li><br>
    <li><i>option</i> (integer) - VTK export option. </li><br>
  </ul>

  Output formats
  <ul style="list-style-type:none;">
    <li>TEXT  - Writes each segment in a separate text file for the flow rate, pressure, area and Reynolds number.  The rows contain output values at varying locations along the segment while columns contains results at various time instants.  </li><br>
    <li>VTK  - Results for all time steps are plotted to a 3D-like model using the XML VTK file format. </li><br>
    <li>BOTH -  Write both TEXT and VTK results. </li><br>
  </ul>

  VTK export options
  <ul style="list-style-type:none;">
    <li>0 - Output multiple files (default). A separate file is written for each saved increment. A **pvd** file is also provided which contains the time information of the sequence. This is the best option to create animations. </li><br>
    <li>1 - The results for all time steps are plotted to a single XML VTK file. </li><br>
  </ul>

</div>
<br>

Example: Write results in VTK format to multiple files.

```
  OUTPUT VTK 0
```

<!-- SEGMENT -->

<br>
<a id="format_segment"> <h3> SEGMENT </h3></a> 
The SEGMENT statement is used to define a vessel segment. 

Format
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  SEGMENT <i>name</i> 
    <i>id</i>
    <i>length</i>
    <i>nelems</i>
    <i>inode</i>
    <i>onode</i>
    <i>iarea</i>
    <i>oarea</i>
    <i>iflow</i>
    <i>material</i>
    <i>mltype</i>
    <i>angle</i>
    <i>uid</i>
    <i>bid</i>
    <i>bctype</i>
    <i>dname</i>
  <br>
  <br>

  Arguments
  <ul style="list-style-type:none;">
    <li><i>name</i> (string) -  Segment name. </li><br>
    <li><i>id</i> (integer) - Segment ID. </li><br>
    <li><i>length</i> (double - Segment length. </li><br>
    <li><i>nelems</i> (integer) - Total finite elements in segment. </li><br>
    <li><i>inode</i> (integer) - Segment inlet **Node**. </li><br>
    <li><i>onode</i> (integer) - Segment outlet **Node**. </li><br>
    <li><i>iarea</i> (double - Segment inlet area. </li><br>
    <li><i>oarea</i> (double - Segment outlet area. </li><br>
    <li><i>iflow</i> (double - Segment initial flow. </li><br>
    <li><i>material</i> (string) - Segment material. </li><br>
    <li><i>mltype</i> (string) - Minor loss type. </li><br>
    <li><i>angle</i> (double) - Branch angle. </li><br>
    <li><i>uid</i> (integer) - Upstream segment ID. </li><br>
    <li><i>bid</i> (integer) - Branch segment ID. </li><br>
    <li><i>bctype</i> (string) - Outlet boundary condition type. </li><br>
    <li><i>dname</i> (string) - Data Table Name for boundary condition. </li><br>
  </ul>
  
  Minor loss types
  <ul style="list-style-type:none;">
    <li>NONE - No pressure loss. </li><br>
  </ul>

  Outlet boundary condition types
  <ul style="list-style-type:none;">
    <li> FLOW - Time-varying outlet flow rate. </li><br>
    <li> NOBOUND - No outlet boundary condition; used for internal segment outlets. </li><br>
    <li> RCR - Boundary condition specified through an RCR circuit. </li><br>
    <li> RESISTANCE - Constant resistance in model units. </li><br>
  </ul>
</div>
<br>

Example  

```
  SEGMENT ARTERY 0 40.0 15 0 1 2.8 2.1 0.0 MAT1 NONE 0.0 0 0 FLOW INLETDATA
```

<!-- SOLVEROPTIONS -->

<br>
<a id="format_solver_options"> <h3> SOLVEROPTIONS </h3></a> 
The SOLVEROPTIONS statement specifies options needed by the finite element solver. 

Format
<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #000000;">
  SOLVEROPTIONS <i>timestep</i> 
    <i>savefreq</i>
    <i>maxsteps</i>
    <i>nquad</i>
    <i>dname</i>
    <i>bctype</i>
    <i>tol</i>
    <i>form</i>
    <i>stab</i>

  Arguments
  <ul style="list-style-type:none;">
    <li><i> timestep </i> (double) - Solver time step. </li><br>
    <li><i> savefreq </i> (integer) - Number of steps between saving results. </li><br>
    <li><i> maxsteps </i> (integer) - Maximum number of time steps. </li><br>
    <li><i> nquad </i> (integer) - Number of quadrature points for finite elements. </li><br>
    <li><i> dname </i> (string) - Name of data table for inlet boundary conditions. </li><br>
    <li><i> bctype </i> (string) - Inlet boundary condition type. </li><br>
    <li><i> tol </i> (double) - Convergence tolerance. </li><br>
    <li><i> form </i> (string) - Formulation type. </li><br>
    <li><i> stab </i> (string) - Stabilization. </li><br>
  </ul>

  Inlet boundary condition types
  <ul style="list-style-type:none;">
    <li> FLOW - Time-varying inflow rate. </li><br>
    <li> PRESSURE_WAVE -  Time varying inlet pressure. </li><br>
  </ul>

  Formulation types 
  <ul style="list-style-type:none;">
    <li> 0 - Advective formulation. </li><br>
    <li> 1 - Conservative formulation. </li><br>
  </ul>

 Stabilization options 
  <ul style="list-style-type:none;">
    <li> 0 - No stabilization. </li><br>
    <li> 1 - Use stabilization. </li><br>
  </ul>

</div>
<br>

Example

```
  SOLVEROPTIONS 0.01 10 1000 4 INLETDATA FLOW 1.0e-3 1 1  
```
  

