###Putting It All Together

Before we continue on to the next section, we will need accurate segmentations down the length of our aortic path.

Use the level set method to make 2D segmentations of the vessel wall and combine this with the techniques described in [Section: Modifying Contours](#modelingModifyingContours). You may find it difficult to use only the level set method in the iliac branch vessel, so you may want to fit circles to create these contours.

When you are finished, you can check out your segmentations by viewing them with the point cloud turned on:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/putting_together/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>
