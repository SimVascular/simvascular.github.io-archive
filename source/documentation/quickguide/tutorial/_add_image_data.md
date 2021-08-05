<h2 id="tutorial_add_image_data"> Add Image Data </h2>

Image data is added to the <i>Project</i> using the <i>Data Manager</i> <i>Images</i> <i>Tool</i>.

<table class="table table-bordered" style="width:100%">
  <caption> Adding image data to a <i>Project</i> </caption>
  <tr>
    <th> GUI </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/add-image-1.png" width="512" height="360"> </td>
    <td> Select the <i>Images<i> <i>Tool</i> in the <i>Data Manager</i> with the right mouse button. 
         <br><br>
         Select the <b>Add/Replace image</b> menu option. 
         <br><br>
         <div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600"> 
         Only one image may be displayed in SimVascular. Adding another image will overwrite the current image. 
         </div>
    </td> 
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/add-image-2.png" width="512" height="360"> </td>
    <td> Select the I.002.dcm file from the <i>File Browser</i>. 
         <br><br>
         Press the <b>Open</b> <i>Button</i>. 
         <br><br>
         The series of DICOM files are read in. <br><br>
    </td> 
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/add-image-3.png" width="512" height="360"> </td>
    <td> Press the <b>Yes</b> <i>Button</i> in the <i>QuestionPopup</i> to store the image data as a VTK VTI file. 
    </td> 
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/add-image-4.png" width="512" height="360"> </td>
    <td> Press the <b>Yes</b> <i>Button</i> in the <i>QuestionPopup</i> to scale the image. <br><br>
    </td> 
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/add-image-5.png" width="512" height="360"> </td>
    <td> Press the <b>OK</b> <i>Button</i> to use the default 0.1 scaling factor. 
         <br><br>
         The image is scaled by 0.1. 
         <br><br>
         <div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
         SimVascular does not have any explicit units. However, the geometry created in the pipeline does depend on the
         image scale: a smaller scale creates smaller geometry. This is only important when performing simulations: the model 
         size must match the units used for certain simulation parameters and data (e.g. inlet flow rate). 
         </div>
    </td> 
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/add-image-6.png" width="512" height="360"> </td>
    <td> Enter <b>aorta</b> for the image name in the <b>Image Name:</b> <i>TextBox</i> <br><br>
         Press the <b>OK</b> <i>Button</i>.
    </td> 
  </tr>

  <tr>
    <td><img src="documentation/quickguide/tutorial/images/add-image-7.png" width="512" height="360"> </td>
    <td> The image is displayed in the standard four-window view layout. <br><br>
         Press the <img src="documentation/quickguide/gui/images/gui-save-icon.png" width="40" height="35"> 
         icon in the  <i>ToolBar</i> to save the <i>Project</i>. <br><br>
         The image volume is saved as a VTK VTI file named <b>aorta.vti</b> in the <i>Project's</i> <i>Images</i> directory.
    </td> 
  </tr>

</table>



