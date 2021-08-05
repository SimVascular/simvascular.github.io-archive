## Volumetric Meshing 

###Using SimVascular Python Shell

The volumetric meshing script 
<a href="https://github.com/SimVascular/SimVascular/tree/master/Python/site-packages/sv_auto_lv_modeling/modeling/volume_mesh_main.py"> 
volume\_mesh\_main.py </a> is used to generate a finite element mesh.

<pre><code class='language-shell' lang='shell'>
    # Path to SimVascular executable
    data_path=/path/to/data
    sv_python_dir=/usr/local/bin
    script_dir=SimVascular/Python/site-packages/sv_auto_lv_modeling
    p_id=WS01

    # Path to the surface meshes
    input_dir=$data_path/04-SurfReg/$p_id

    # Path to the outputted volume meshes
    output_dir=$data_path/05-VolMesh/$p_id
    volume_mesh_script=$script_dir/modeling/volume_mesh_main.py

    # Volumetric Meshing using SimVascular
    ${sv_python_dir}/simvascular --python \
        -- ${volume_mesh_script} \
        --input_dir $input_dir \
        --output_dir $output_dir \
        --phase 0 \ # the phase id in $input_dir to generate a volumetric mesh
        --edge_size 3.5
</code></pre>


###Using the SimVascular Python Console

Within the Python plugin, we can use the <strong>Text Editor</strong> mode and enter the following lines to create a Python script.

<pre><code class='language-python' lang='python'>
    from sv_auto_lv_modeling.auto_lv import VolumeMesh
    data_path='/path/to/data'
    vol = VolumeMesh()
    vol.set_output_directory (data_path+'/05-VolMesh/WS01')
    vol.set_max_edge_size (3.5)
    vol.set_surface_model_filename (data_path+'/04-SurfReg/WS01/WS01_0.vti.vtp')
    vol.generate_volume_mesh()
</code></pre>


