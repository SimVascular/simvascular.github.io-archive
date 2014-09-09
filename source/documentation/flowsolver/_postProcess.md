### POSTPROCESSING: SIMVASCULAR/POSTSOLVER

### Generating the *.vis and *.vtu files in SimVascular 

In order to generate the visualization files (*.vis) and (*.vtu) files, you need to launch again Simvascular in the folder containing the restart files you want to post-process. Go to the “Simulations->Solver to Vis Files” tab, and enter the following parameters: 

- In the “Start” box, enter the initial restart file number (0)
- In the “Stop” box, enter the final restart file number (75)
- In the “in prefix” box, enter the desired name for the vis-files. You should use something meaningful. 

For this example, we can use steady-cylinder 

In the “out prefix” box, enter the desired name for the vtu-files. You should use something meaningful. For this example, we can use steady-cylinder

Click on the “traction” box, since for this problem we calculated the wall shear stress.

Ignore the entries in the menu “Additional Displacement Fields” (we did not run a deformable wall analysis).

Click on the button “both” of the “Convert files” menu to generate both the *.vis and the *.vtu files.

This generates the desired set of *.vis and *.vtu files.
The *.vis files can be read directly back into SimVascular and you can generate jpegs and movies of your analysis. But in general, we prefer to use the software ParaView with the paraview files to do the visualization work. It is a very complete scientific visualization tool, that you can download for free from
http://www.paraview.org/New/index.html 

In this tutorial, we are using the version 2.6.

In the following section, we will show you the basis of how to use Paraview with a set of results corresponding to a patient-specific model under exercise conditions.

### Visualizing the results in ParaView

To visualize the time dependent results we use ParaView. The following steps can be used to visualize the results:

1. Launch ParaView by clicking on the ParaView desktop icon window will appear
2. Select “File > Open Data”. The “Open ParaView File” window should appear. Double-click on the folder X:\testuser\CFD-files\visualization, and then on the
folder AAA-Patient20-Exercise. Select the first file of the data series patient20exercisevtu-3020.vtu.
3. Click on the green button Accept. 
4. The solid model will show up on the screen:
5. Click on the “Timesteps” button.
6. When the “Select Files for Time Series” window appears, then click Add All to add the rest of the solution files corresponding to other times of the cardiac cycle. Then click Close. Click on the green button Accept. You should now have 25 solution files (Time steps (0) to (25))
7. Your simulation contains information about three different fields: pressure, velocity and traction (wall shear stress).
8. At this point, you can interact with the model by rotating it using the rotation or translation buttons. Move/rotate the model until you find a good view.


### Visualizing the Pressure results

9. The default color map of the model is showing the pressure results in dynes/cm2. Let’s transform the pressure scale to mmHg (1 mmHg = 1333.2 dyn/cm2). To do this, use the calculator tool
10. In the calculator menu, choose pressure in the “scalars” drop-down menu 
11. Divide “pressure” by the conversion factor 1333.2 
12. Enter a meaningful name in the “Results Array Name” box (for example, Pressure in mmHg)
13. Click on the green button Accept.
14. A new entity with the name of Calc0 appears in the “Selection Window” area. Note that the original set of files patient20exercisevtu-3020.vtu is now hidden.
15. Now, let’s show the scale and colormap of this new pressure field. For that, click on the Display tab and then on the Edit Color Map button
16. Set the min and max values for the pressure colormap to 85 and 140 mmHg. 
17. Click on the visibility box of the Scalar Color Bar menu.
18. A pressure color map will appear next to the model.
19. Go to View > Keyframe animation.
20. Enter the appropriate number of fames: 25.
21. In the tracks menu, in the Source button, select the name of the series patient20exercisevtu-3020.vtu.
22. Under the Property button, select Filename.
23. Click on the Add KeyFrame button.
24. Now you can play all the frames of the solution. To do that, click on the loop button.
25. And then click on play. It will take a while for the computer to store the information of all the frames in memory. Once this is done, the animation will play
faster.

### Visualizing the Velocity results

26. Click on View > Source
27. Hide the Calc0 data and make the patient20exercisevtu-3220.vtu data visible again.
29. Now, click on patient20exercisevtu-3220.vtu to activate this data (highlighted)
30. In the Color by button, select Point velocity
31. Most of the model looks blue because the velocity of the wall is zero due to the rigid wall assumption used in this model. In order to visualize not just the surface velocity (that hides the velocities in the lumen due), we need to use a Volume Render visualization technique. To do this, we must calculate the scalar quantity representing the magnitude of the velocity.
32. Click on the calculator tool button.
33. In the calculator box, type mag(velocity)
34. In the “Results Array Name” box, type Velocity Magnitude (cm/s) 
35. Click on the green button Accept.
36. A new entity with the name of Calc1 appears in the “Selection Window” area. Note that the other entities Calc0 and the original set of files patient20exercisevtu-3020.vtu are now hidden.
37. Now, let’s show the scale and colormap of the Velocity field in Calc1. For that, click on the Display tab and then on the Edit Color Map button.
38. Set the range of the velocity from 0 to 75 cm/s.
39. Click on the visibility box of the Scalar Color Bar menu.
40. A velocity magnitude color map will appear next to the model.
41. Click on the Back button.
42. In the Display Style box, change the Representation from Surface to Volume Render.
43. Notice the differences in the visualization style. Now you can actually see the velocity magnitude in the entire volume and not just the surface.
44. We need to play with the opacity and the scale of the color map of the volume render to improve the quality of the visualization. Click on the Edit Volume
Appearance button. We need to define the limits of the Opacity Mapping and Scalar Color Mapping.
45. In the Scalar Color Mapping, click on the line to define the upper limit of the mapping You have defined a new point (2) in the color scale mapping.
46. Double-click on this point to assign the red color to the highest value of the velocity scale. Click on the OK button.
47. Now, set the saturation value of this point to 75 (cm/s) 
48. You can now modify the opacity map function is you want.. In the opacity map, the higher velocities (red) are more opaque than the lower velocities.
49. Set the lower limit of the opacity mapping so that is different from zero (make it around 0.2)
50. Go to View > Keyframe animation
51. Since the amount of data required to visualize the volume render of this model through a complete cardiac cycle is too large for the computer memory, you need
to unclick the Cache Geometry and Record All properties buttons.
52. Now we can record a movie of the by clicking on the animation icon.
53. Choose the avi option in the Save as type drop-down menu.
54. Enter a file name for the movie. For example, VolumeRender. Click on the Save button.
55. Click OK in the next window that shows the different video compression options.
56. This process will take a couple of minutes. The movie has been saved to C:\Program Files\ParaView 2.6\bin.
57. You can navigate there and double-click on the file to view the movie.
58. Note how complex the velocity field is in the aneurysm region. In this patient, we are studying the potential possible effects of moderate exercise. The elevated wall shear stress (which is hypothesized to be an athero-protective factor) can also be visualized using the traction vector field of the dataset. 

GOAL of this section: to examine complex flow patterns in a pathologic situation. In this example, simulated exercise conditions are used to understand the way  wall shear stress patterns change under these.
