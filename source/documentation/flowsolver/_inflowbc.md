## Inlet Boundary Condition Specification

Let's first create a simple file to provide inlet flow rates before seting inlet boundary condition. Your problem may have more that one inflow wave form file. In this case, we only have a single flow file (called steady.flow). We put the file in a subfolder "flow-files" under the project folder in the disk.

The format of the **steady.flow** file is as follows:

~~~
# Time (sec) Flow (cc/sec)
0 -100.0
1 -100.0
~~~

The first line is a comment line that you don’t need to include, but it helps to remember what units you used in the analysis. Then, two columns of numbers follow. The first column contains time values, and the second column flow values.

**WARNING**: please note that flow coming **into** the model (forward flow) will have a negative sign, (like in the example considered here), whereas flow coming **out of** the model (backflow) will be positive. A good way to remember that is that in the case of forward flow, the vector that gives you the direction of the flow and the normal to the face of the model point in opposite directions, and therefore their dot product will be negative.

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/negativeflow.png">
  <figcaption class="svCaption" >Cylinder with negative inflow</figcaption>
</figure>

On the other hand, in a situation of back flow,  the numerical value in the \*.flow file with be positive. 

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/positiveflow.png">
  <figcaption class="svCaption" >Cylinder with positive inflow</figcaption>
</figure>

In this problem, since we are running a steady case, our physical time goes from 0.0 to 1.0 seconds, and the flow is constant with a value of 100.0 cc/sec.

**HINT**: it is very important that you are absolutely sure about the physical dimensions of your model: every unit (length, time, flow, density, etc.) in your analysis must be dimensionally consistent. You can easily check the size of your model in [Paraview](http://www.paraview.org/) before importing it into **SimVascular**.

In this case, our cylinder has a radius $r=2.0$ cm and length $L=30$ cm.

Let's start setting inlet boundary condition.

	Go to "Inlet and Outlet BCs"
	All the faces of type "cap" are already listed in the table
	Double click the row for the face "inflow"
	A dialog pops up and also the face is highlighted in the 3D-view window.
	In the dialog:
		BC Type: Prescribed Velocities
		Analytic Shape: parabolic
		Point Number: 2
		Fourier Modes: 1
		Click the tool button "..." to select the file "steady.flow" we just created as above
		Period: (filled automatically based on the data from the file)
		Click "OK"
		
	
<figure>
  <img class="svImg svImgSm" src="documentation/flowsolver/imgs/inletbcdialog.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**Help Hints:** </font> Please make use you specify face types when you create the corresponding model;otherwise, the cap faces won't appear.

- **Point Number**: This is the number of _temporal_ data points that you want to have in one cycle. This is not necessarily the number of time points in the \*.flow file. In this case, they match (2 in both cases), but this is because this is a very simple example using steady flow and two time points is all we need to characterize a constant flow. In general, your \*.flow file will have in the order of $20$ data points over the cardiac cycle (that’s about how many points you will be able to reconstruct using **PC-MRI**, for example), and your interpolated data from it will have on the order of $100$-$200$ points. Whatever is enough to have a smooth representation of the inflow wave mapping to velocity vectors at the inlet face.

- **Fourier Modes**: Fourier smoothing allows to smooth your inlet flow curve and to make sure that you have a periodic function in the specified interval. 

**WARNING**: Be careful with this! **SimVascular** is doing a Fourier Series approximation of the data that you provide in the \*.flow file. Since in this case, our data is constant flow, we only need one Fourier mode to capture this appropriately. For pulsatile flow problems, we will need more Fourier Modes to accurately represent the \*.flow data (usually, $10$ Fourier modes is enough for a pulsatile problem).

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/inflowbc.png">
  <figcaption class="svCaption" > </figcaption>
</figure>

