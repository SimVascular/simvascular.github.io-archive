## Mesh Motion 

Once meshes have been registered the displacement of each mesh vertex over the whole cardiac cycle can be computed. 
The series of registered meshes are interpolated using cubic splines to obtain mesh displacements with a temporal resolution 
suitable for simulations. 

The 
<a href="https://github.com/SimVascular/SimVascular/blob/master/Python/site-packages/sv_auto_lv_modeling/modeling/elastix_main.py">
interpolation.py </a> script is used to interpolate meshes and compute the mesh motion. It writes out a <b>.dat</b> file for each 
boundary face that can used in svFSI to set up the displacement boundary conditions

<pre><code class='language-shell' lang='shell'>
    # Generate motion.dat File for svFSI
    data_path=/path/to/data
    sv_python_dir=/usr/local/bin
    script_dir=SimVascular/Python/site-packages/sv_auto_lv_modeling

    # Phase ID should be the same as the one used in volume_mesh.sh
    phase_id=0
    p_id=WS01

    # Path to the registered surface meshes
    input_dir=$data_path/04-SurfReg/$p_id

    # Path to the outputted volumetric meshes
    output_dir=$data_path/05-VolMesh/$p_id

    # Number of interpolations between adjacent phases
    num=99

    # Number of cardiac cycles
    cyc=1

    # Cycle duration in seconds
    period=1.25

    # Write boundary conditions for FSI simulations
    python $script_dir/modeling/svfsi/interpolation.py \
        --input_dir $input_dir \
        --output_dir $output_dir \
        --num_interpolation $num \
        --num_cycle $cyc \
        --duration $period \
        --phase $phase_id
</code></pre>

<p><br><br><br><br></p>

