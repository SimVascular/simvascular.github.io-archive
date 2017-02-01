## Solid Modeling (PolyData) ##

In the Segmentation section, it was shown how to create individual 2-D segmentations along a particular vessel path. It is worthwhile to reinforce at this point the distinction between visualizing geometry and utilizing geometry for numerical simulation. If you were to graphically display all the segmentations that you created in the previous exercise, your mind may “connect the dots” and create a 3-D mental image of the geometry. However, we need to create a 3-D solid model that the computer can understand.

Fortunately for us, an ordered relationship between some of the curves is known. That is, for each path we have an ordered set of curves defining the geometry for the given vessel. These sets are the groups that we have used to organize the segmentations. All of the segmentations are associated with one and only one vessel. This motivates a two-stage process to create a solid model. First, a “lofted” solid is created for each branch. This results in a collection of solid branches. Second, a boolean addition (union) is performed of the individual branches. The result is then a single bounded solid region representing the blood flow domain.

The PolyData software combines the created set of groups an ordered Boolean Addition. Each group of segmentations respresents a vessel and these are placed in a ordered list. The first of these ordered groups of segmentations is lofted with the second and each subsequent group is lofted to this growing union until the model is complete.

**Preparing for Modeling:**

Before creating a solid from your groups, it is important to inspect the groups you have created, using loft preview in SV 2D Segmentation. A good set of groups:

1. Has been created from smooth, overlapping paths: a jagged or bumpy path can lead to segmentations with greatly differing angles making it difficult to combine them in a Boolean Addition. A path that is too short may cause a gap resulting in some segmentations not being joined at all

2. Has reasonably spaced segmentations: too many segmentations can result in a jagged solid or many ridges and could cause problems when attempting to mesh. There should be enough to get the general shape and curves of the vessel, with segmentations denser around curves and more spread out when the shape is essentially a straight cylinder.

3. Has smooth transistions between groups: two vessels being joined should share a common space. The first segmentation on a branch vessel should be completely contained by the solid model to be created by the main vessel. For example, the first segmentation for right iliac should be contained completely by the aorta. If not, a ledge could be created, complicating future steps.

