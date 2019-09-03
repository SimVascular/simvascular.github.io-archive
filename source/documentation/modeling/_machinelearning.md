###Automatic Machine Learning Segmentation

SimVascular has recently added the capability to automatically generate segmentations using pretrained convolutional neural networks.

####Multi path segmentation
With SimVascular's machine learning segmentation it is possible to compute segmentations at multiple path points for multiple paths simultaneously.

To use multi path segmentation:

	Click the multi path tab within the segmentation window.
	Select the paths you want to segment (or click *select all paths* to select all paths)
	In the **Interval** input box enter the interval at which you want segmentations to be computed (e.g. once every 10 path points)
	In the **Fourier Modes** input box, enter the number of fourier modes you want to use to smooth the segmentations, a lower number means more smoothing.
	Click the segment button and wait for the segmentations to be computed (roughly one second per segmentation).

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/ml_multi.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

####Single path segmentation

To create a segmentation using machine learning for a single path point (interactively):

	Click the button "NN" (this stands for Neural Network)
	An options tab will appear, which means the method is activated for interaction.
	Enter the values you want for the options.
	Click on the NN button again and the segmentation will be computed.
	To compute segmentations for other locations simply change the reslice slider and click the NN button again.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/ml_single.png">
  <figcaption class="svCaption" ></figcaption>
</figure>
