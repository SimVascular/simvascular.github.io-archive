## Input Requirements ##

The preferred input format of the image volumes is <b>.nii.gz</b>, <b>.nii</b> or <b>.vti</b> files. 
The segmentation method requires an image to have an identity orientation matrix. 

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
The VTK version used by SimVascular does not written a <b>.vti</b> file with an orientation matrix. Image <b>.vti</b> files
written by SimVascular must therefore be reoriented to have an identity orientation matrix when used for segmentation.
</div>

<br>
The directory containing the input image data should be organized as follows

<pre><code>image_dir
     |__ patient_id (optional)
         |__ image_volume0.vti
         |__ image_volume1.vti
         |__ image_volume2.vti
         |__ ...
</code></pre>

