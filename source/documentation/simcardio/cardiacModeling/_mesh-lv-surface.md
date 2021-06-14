## Construct LV Surface Meshes with Tagged Boundary Faces ##

###Using SimVascular Python Shell

<ul>
    <li>Similarly, we can use SimVascular&#39;s Python Shell to run the prediction script. The SimVascular Python Shell can be invoked from the terminal according to the following instruction: <a href='http://simvascular.github.io/docsPythonInterface.html#python_shell' target='_blank' class='url'>http://simvascular.github.io/docsPythonInterface.html#python_shell</a>. The surface generation script <code>surface_main.py</code> can be found here in SimVascular&#39;s source code: Python/site-packages/sv_auto_lv_modeling/modeling/surface_main.py
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
    </li>
</ul>


###Using SimVascular Python Console

<ul>
    <li>We can also use the Python console in SimVascular GUI to run the prediction script. Within the Python plugin, we can use the <strong>Text Editor</strong> mode and enter the following lines to create a Python script.
        <pre><code class='language-python' lang='python'>from auto_lv.auto_lv import Modeling
            data_path='/path/to/data'
            surf = Modeling()
            surf.set_segmentation_directory(data_path+'/02-Segmnts/WS01')
            surf.set_output_directory (data_path+'/03-Surfaces/WS01')
            surf.set_max_edge_size (3.5)
            surf.generate_lv_modes ()
        </code></pre>
    </li>
</ul>

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/cardiacModeling/images/surface.png">
  <figcaption class="svCaption" >Automatically created LV meshes at diastole and systole.</figcaption>
</figure>

