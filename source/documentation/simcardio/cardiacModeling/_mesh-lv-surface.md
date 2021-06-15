## Constructing LV Surface Meshes ##

### Using SimVascular Python Shell

The SimVascular
<a href='http://simvascular.github.io/docsPythonInterface.html#python_shell'> Python Shell </a>
can be used to run the 
<a href="https://github.com/SimVascular/SimVascular/tree/master/Python/site-packages/sv_auto_lv_modeling/modeling/surface_main.py"> 
surface_main.py </a> Python surface generation script using the following commands

<pre><code class='language-shell' lang='shell'>
  # Path to SimVascular executable
  data_path=/path/to/data
  sv_python_dir=/usr/local/bin
  script_dir=SimVascular/Python/site-packages/sv_auto_lv_modeling
  # Path to the segmentation results
  p_id=WS01
  input_dir=$data_path/02-Segmnts/$p_id
  # Path to the outputed surface meshes
  output_dir=$data_path/03-Surfaces/$p_id
  model_script=$script_dir/modeling/surface_main.py
  # Construct LV surface meshes with tagged boundary faces
  ${sv_python_dir}/simvascular --python \
      -- ${model_script} \
      --input_dir ${input_dir} \
      --output_dir ${output_dir} \
      --edge_size 3.5 # maximum edge size for the mesh
</code></pre>


###Using SimVascular Python Console

The SimVascular GUI <a href='http://simvascular.github.io/docsPythonInterface.html#console'> Python Console </a>
can be used for surface generation. Use the Python console <strong>Text Editor</strong> mode to enter the following Python commands 

<pre><code class='language-python' lang='python'>from sv_auto_lv_modeling.auto_lv import Modeling
    data_path='/path/to/data'
    surf = Modeling()
    surf.set_segmentation_directory(data_path+'/02-Segmnts/WS01')
    surf.set_output_directory (data_path+'/03-Surfaces/WS01')
    surf.set_max_edge_size (3.5)
    surf.generate_lv_modes ()
</code></pre>

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/cardiacModeling/images/surface.png">
  <figcaption class="svCaption" >Automatically created LV meshes at diastole and systole.</figcaption>
</figure>

