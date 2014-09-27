##Visualizing Results

Launch ParaView.

	Open the file *steady.vtu* with ParaView.
	Click the button “Apply”

<figure>
<img class="userGuideFigure"  src="documentation/userguide/imgs/results/1.jpg" width="100%"> 
</figure>

The pressure result is displayed in the display window.  In order to visualize the velocities in the lumen, we need to use a volume render visualization technique.

To do this, we must calculate the scalar quantity representing the magnitude of the velocity. 

	Click the calculator tool button
	Result Array Name: vel mag (cm/s)
	Enter "mag(velocity_00500)" just above the calculator pane
	Click the button “Apply”
	Representation: Volume

<figure>
<img class="userGuideFigure"  src="documentation/userguide/imgs/results/2.jpg" width="100%"> 
</figure>

You should get a similar volume rendering result as the figure above. Click the button “Edit” to get different visual effects.