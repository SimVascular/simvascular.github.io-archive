## Creating a Solid Model with PolyData ##


In the previous section, it was shown how to create a solid model using Parasolid software. The PolyData software combines the created set of groups differently than Parasolid, through an ordered Boolean Addition. Each group of segmentations respresents a vessel and these are placed in a ordered list. The first of these ordered groups of segmentations is lofted with the second and each subsequent group is lofted to this growing union until the model is complete.

**Preparing for Modeling:**

Before creating a solid from your groups, it is important to inspect the groups you have created. To view your groups, navigate to the 2D Segmentation tab, highlight the groups you wish to view and click Display Groups in the Visualization Menu to the right. A good set of groups:

1. Has been created from smooth, overlapping paths: a jagged or bumpy path can lead to segmentations with greatly differing angles making it difficult to combine them in a Boolean Addition. A path that is too short may cause a gap resulting in some segmentations not being joined at all

2. Has reasonably spaced segmentations: too many segmentations can result in a jagged solid or many ridges and could cause problems when attempting to mesh. There should be enough to get the general shape and curves of the vessel, with segmentations denser around curves and more spread out when the shape is essentially a straight cylinder.

3. Has smooth transistions between groups: two vessels being joined should share a common space. The first segmentation on a branch vessel should be completely contained by the solid model to be created by the main vessel. For example, the first segmentation for right iliac should be contained completely by the aorta. If not, a ledge could be created, complicating future steps.

<font color="red">**HELPFUL HINT:** </font> **Some Useful Keyboard Shortcuts:**

	Hover the cursor over the Display Window and press the following:
		w - view the model as a wire mesh
		s - view the model as a solid
		e - view the edges of the triangulated mesh on the solid model:
	Hover over the desired area and press:
		p - to “pick” or select the model, highlighting it yellow for a better visualization
		c - to “choose” and highlight a cell to be modified or deleted
