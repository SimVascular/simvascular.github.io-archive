### Creating the solid model for the structural domain

In this step, we will import the fluid geometry into Meshmixer and utilize Meshmixer's "Extrude" feature to create the wall geometry on top of the fluid. The resulting structural geometry resembles a "shell" that surrounds the fluid domain. We will also be using many of the geometry altering features within Meshmixer to smooth the structural geometry. Extrusions in Meshmixer often create intersecting elements and rough patches of geometry that are not suitable for meshing. These must be cleaned up in Meshmixer before meshing in SimVascular.

1.  Import the .stl file for the fluid domain into Meshmixer

    When you open Meshmixer, you should see a button called ``Import'' that appears near the middle of the screen with a plus sign (+). Click this and select the fluid domain .stl that you created in the last step. After importing, you should see your fluid domain model appear in the main window as shown below.

    <figure>
      <img class="svImg svImgLg" src="documentation/svfsi/fsi/imgs/opening_meshmixer.png"  style="width:100%;height:auto;max-width: 30vw;"
      <figcaption class="svCaption" >Opening Meshmixer and importing a fluid model.</figcaption>
    </figure>

    At this point, we are going to want to smooth all bifurcations and sharp angles in the fluid model. If we do not do this, extruding out the elements in these sections will cause the extruded elements to run into each other and intersect, which will cause problems when attempting to mesh. Ideally, we would like to turn all these sharp corners into rounded fillets, as if you rolled a ball of clay into the sharp corners.

    We will cover three main ways to smooth a model in Meshmixer: sculpting, local remeshing, and local smoothing. These all work well for smoothing a model, and your usage of them will depend on your personal preference and what works best with the models you are working with. We will first cover each of these tools in detail to discuss how to use them, then we will outline a general procedure that uses these tools that can be applied to most bifurcations. But keep in mind that a different combination of these tools might work better for you and your models.

    A couple notes to keep in mind before modifying the geometry of your fluid geometry. If you do not like a particular change that you just applied, you can undo it using Ctrl + Z. You can adjust the center of rotation of the camera by hovering your cursor over a part of your model and hitting C. This is useful when working on specific parts of the model, and the camera rotation center is way off. Also be sure to not modify the geometry around the caps as much as possible. The cap geometry must be maintained in order to get a proper wall mesh around them.

    a.  Sculpting in Meshmixer

    <figure>
      <img class="svImg svImgLg" src="documentation/svfsi/fsi/imgs/sculpting_figure.png" style="width:100%;height:auto;max-width: 30vw;">
      <figcaption class="svCaption" >Using the sculpting tool in Meshmixer.</figcaption>
    </figure>

    Sculpting is the most dynamic of the smoothing tools we will cover in this tutorial, and provides immediate feedback on the reshaped geometry. It allows users to point at a particular region of their geometry, and remodels it according to the currently selected sculpting brush. This is usually very convenient to do some quick touch ups to a small region that you noticed looks off. To activate the sculpting tool, selecting the "Sculpt" button from the left-hand menu, which has a chisel icon. You should see the sculpting options menu appear on the left hand side of the screen, which in the left most figure above. At the top you should see a slider that goes between "Volume" and "Surface", which you should switch to "Surface" for this tutorial. After selecting "Surface" and moving your cursor over your geometry, you should notice a circle appear where your cursor is, and the circle should hug the surface of your geometry. If you left-click, the sculpting tool will remodel your geometry inside the circle according to your selected brush and parameters.

    Below that is a button for  "Brushes", which allows you to select the sculpting shape that you would like to apply. You are of course free to experiment with the other brushes, but we have found the "BubbleSmooth" brush to work the best for smoothing sharp junctions in cardiovascular models. Below in the Properties window, you should see sliders for "Strength" and "Size", two important parameters. Strength will determine how aggressively the sculpting tool will remodel your geometry, with higher numbers meaning more aggressive. When using the tool for the first time, we recommend using a low value of Strength, like 10, to see how it works. The Size parameter sets the radius of the sculpting circle. For smoothing the area between bifurcations, we recommend setting the Size such that the diameter of the sculpting circle is roughly the size of the space of the bifurcation.

    b.  Local remeshing in Meshmixer

    <figure>
      <img class="svImg svImgLg" src="documentation/svfsi/fsi/imgs/using_remeshing.png" style="width:100%;height:auto;max-width: 30vw;">
      <figcaption class="svCaption" >Using the remeshing tool in Meshmixer.</figcaption>
    </figure>

    Local remeshing will reconfigure the triangle elements in a given region such that the triangles are all have roughly equal size, shape, and aspect ratio.These triangles will generally be higher quality than the initial discretization that comes out of SimVascular, especially at the bifurcations.To remesh a region, we first have to "Select" it. Click on the "Select" button from the left hand menu, which should change your cursor into a selection tool that you can left-click on your model to start selecting regions. Before we do, it is useful to change the select type and size to be convenient for your model. The "Sphere Brush" will allow you to select all the cells inside a sphere, while the "Unwrap Brush" will select cells in a flat circle that hugs your surface. The "Size" parameter changes the size of the sphere or unwrap brush and should be set to a value that is convenient for the region you are remeshing. Once you have selected a brush and size, left-click on the regions in your model you want to remesh, like all the elements around a bifurcation, for example. After all the elements have been selected, hit R on your keyboard to initiate remeshing. Alternatively, you can click the "Remesh" button that appears from the "Edit..." menu after you have selected a region.

    For larger sized regions, it might a few seconds to a few minutes to remesh. After the initial remeshing is complete, the remeshing properties menu should appear on the left hand side of the screen that will allow you to select various properties. Two convenient properties to set are the remeshing type, and the density/edge size. The first drop down menu in the remeshing properties menu allows you to select the remeshing type, of which "Adaptive Density" and "Target Edge Length" are common selections. Setting the mode to "Adaptive Density" will cause the remeshing edge size to be selected adaptively based on local geometrical features. The amount of elements triangles packed into the remeshing can be adjusted by adjusting the "Density" slider, which higher densities resulting in a higher number of elements. More elements typically results in a more faithful representation of your geometry, at an added cost of requiring more memory. Setting the mode to "Target Edge Length" will allow users to adjust the number of elements based on the maximum Edge Length slider. Smaller edge lengths will result in more elements.

    Once you get a remesh you are satisfied with, click the ``Accept'' button at the bottom of the remeshing properties. This will commit your remesh to the model and take you back to the selection tool with your current region still selected.

    c.  Local Smoothing in Meshmixer

    <figure>
      <img class="svImg svImgLg" src="documentation/svfsi/fsi/imgs/using_smoothing.png" style="width:100%;height:auto;max-width: 30vw;">
      <figcaption class="svCaption" >Using the smoothing tool in Meshmixer.</figcaption>
    </figure>

    Local smoothing will attempt to smooth over any rough bumps or sharp corners automatically. This is usually useful to perform after remeshing a region to make sure the resulting remesh is smooth. Smoothing is achieved via the "Select" tool, just like remeshing. After selecting the region, press Ctrl + F to smooth the region. Alternatively, you can click "Deform..." then "Smooth" from the Select menu.

    After the initial smoothing is complete, the smoothing properties menu will appear. Most of the time, the default settings for the smooth will provide adequate smoothing, though you are of course free to experiment and explore.

2.  Extrude the fluid domain

    After the fluid domain surface has been sufficiently smoothed at all sharp corners and bifurcations, we are now ready to extrude out the wall surface.

      a. Select all (e.g. by choosing select and then hit Ctrl+a / Cmd+a)
      b. Choose Edit > Extrude

      <figure>
          <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/MM_fig_Extrude1.png" style="width:100%;height:auto;max-width: 30vw;">
      </figure>

      c. Choose your offset and the offset direction "normal". This will extrude the wall in normal direction by your given offset. The offset will correspond to the thickness of the vessel wall. Typically, the thickness of the vessel wall is determined by the size of the vessels you are modeling. This information can often be found in the literature, but in the absence of such data, setting the thickness to 10% of the mean vessel diameter is a reasonable first approximation. If you prefer to have a variable thickness along the vessel, simply restrict your selection to the region you want to extrude by a given thickness. If you like the offset, hit "Accept".

      <figure>
          <img class="svImg svImgSm" src="documentation/svfsi/fsi/imgs/MM_fig_Extrude2.png">
      </figure>

      d. If you do a plane cut of your model now it should look something like this:

      <figure>
          <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/MM_fig_Extrude_Planecut1.png" style="width:100%;height:auto;max-width: 30vw;">
      </figure>

      In green you can see the surface of the fluid, and in purple the extruded surface.

3.  Clean up the extruded surface

    Even though we cleaned up the surface prior to extrusion, the extrusion will undoubtedly produce more intersecting, small, and poor quality elements. Use the sculpting, remeshing, and smoothing tools like we did earlier to clean up the model at the sharp corners and bifurcations again. One note when using the remeshing and smoothing tools: since there will be an interior fluid mesh along with the exterior surface mesh, it is important to select both when using the "Select" tool. In this scenario, it is often best to use the "Sphere Brush" when using the "Select" tool to get all the interior elements as well.

    We will now outline a general recipe for extruding a fluid geometry to produce a structural geometry using the tools we just described. This is not the only way to do this, and if your geometry contains many complex features you will probably have to iterate several times to get an adequate structural geometry that can be used for FSI simulations.

  - After loading in the .stl for the fluid geometry, smooth the geometry at all the bifurcations by:
    - Use the "Sphere Brush" in the Select tool with a large enough size to select the entire region around a bifurcation.
    - Press "R" to remesh the region, select an appropriate edge size that captures the geometry well, then Accept.
    - While the region is still selected, Smooth it using Ctrl + F.
    - Use the "Sculpt" tool to further clean up the bifurcation to make it as smooth as possible.
    - Repeat for all other bifurcations.
  - Extrude your model. Press Ctrl + A and extrude to use a uniform thickness or select individual parts of your model and extrude separately for variable thickness.
  - Smooth the post-extruded bifurcations using the same procedure as before.
    - Use the "Sphere Brush" in the Select tool with a large enough size to select the entire region around a bifurcation.
    - Press "R" to remesh the region, select an appropriate edge size that captures the geometry well, then Accept.
    - While the region is still selected, Smooth it using Ctrl + F.
    - Use the "Sculpt" tool to further clean up the bifurcation to make it as smooth as possible.
    - Repeat for all other bifurcations.

    Below is an example of how a bifurcation looks before and after applying the above smoothing procedure. This example did not require much manual sculpting. But some bifurcations that produce sharp corners might require additional sculpting to ensure a smooth surface.

    <figure>
      <img class="svImg svImgLg" src="documentation/svfsi/fsi/imgs/model_treatment_process.png" style="width:100%;height:auto;max-width: 30vw;">
      <figcaption class="svCaption" >Smoothing bifurcations.</figcaption>
    </figure>

    The solid model for the structural domain is finished. Export it as an stl file.

    <figure>
      <img class="svImg svImgSm" src="documentation/svfsi/fsi/imgs/SV_Export_as_stl1.png" style="width:100%;height:auto;max-width: 30vw;">
    </figure>
