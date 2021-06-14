## Mesh Registration ##

We can simulate the LV flow over time by tracking the deformation of the heart from time-resolved imaging and imposes this motion to the fluidic domains inside the heart, which leads to a deforming-domain CFD problem. To be able to track the deformation of the generated LV mesh over time, we need to building point-corresponded LV meshes from segmentations at all time frames. We generate a surface mesh at one time frame and propagated to the others using the displacement field obtained from registering the corresponding segmentations.

We will need <a href='https://github.com/SuperElastix/SimpleElastix'>SimpleElastix</a> to perform the registration. One commit that is compatible with our code is  8244e0001f4137514b0f545f1e846910b3dd7769. The registration script <code>elastix_main.py</code> can be found here in SimVascular&#39;s source code: Python/site-packages/sv_auto_lv_modeling/modeling/elastix_main.py

<pre><code class='language-shell' lang='shell'>
    # Use SimpleElastix to register surface meshes
    data_path=/path/to/data
    sv_python_dir=/usr/local/bin
    script_dir=SimVascular/Python/site-packages/sv_auto_lv_modeling

    # Path to the ct/mr images or segmentation results
    p_id=WS01
    image_dir=$data_path/01-Images/$p_id
    mask_dir=$data_path/02-Segmnts/$p_id

    # Path to the unregistered surface mesh
    surface_dir=$data_path/03-Surfaces/$p_id

    # Path to the registered surface meshes
    output_dir=$data_path/04-SurfReg/$p_id

    # Phase ID of the surface mesh used as the registration source
    start_phase=0

    # Registration with SimpleElastix
    python $script_dir/modeling/elastix_main.py \
        --image_dir $mask_dir \
        --mask_dir $mask_dir \
        --output_dir $output_dir \
        --start_phase $start_phase \
        --surface_dir $surface_dir \
        --image_file_extension vti \
        --edge_size 3.5
</code></pre>

