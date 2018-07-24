###3-D Segmentation

Besides 2D segmentation, you can also use 3D segmetation, which is faster and better to capture the geometry of vessels, especially for aneurysms, junctions, region. etc. First, let's create a 3D segmentation (empty).

	Right click the data node "Segmentations" in the project "SVProject" in Data Manager
	Click "Create 3D Segmentation" in the popup menu
	Name: seg3d 

A new 3D segmentation "seg3d" is created under the data node "Segmentations" in Data Manager. Double click the 3D segmentation node "seg3d" and the tool "SV 3D Segmentation" shows up. The method used here is colliding fronts. You need place seed for using this method.

	Place a starting seed: move image slices using Image Navigator; move the cursor to a proper location in the 3D window:  press 's' to place
	Place an end seed: similary, but use: press 'e' to place

To create a 3D segmentation:

	Place a starting seed (in green) in the upper aorta
	Place a ending seed (in blue) in the bottom of left and right iliac artery, respectively. 
	Threshold Values: choose the lower value as 65 and the upper value as the maximum
	Click the button "Segment"

<figure>
  <img class="svImg svImgXl"  src="documentation/quickguide/imgs/3dsegmentation.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A 3D segmentation with two branches is created and shown in Display. 

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/3dsegmentation2.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Later we can create a PolyData model using this segmentation and smooth it to get a nice surface.

You can move or delete the seed and re-segment.

	Move Seed: move the cursor to the seed, press the left mouse button and drag the seed.
	Delete seed: move the cursor to the seed, press key "Delete"

