## Compute Mesh Motion from Registered Meshes ##

Once we have registered meshes, we can then compute the displacement on each mesh vertex over the whole cardiac cycle. As the temporal resolution of time-series image data is usually not high enough for CFD simulations, we can apply cubic spline interpolation to the registered meshes to obtain finer and smooth mesh displacements. We provide a Python script to interpolate the meshes, compute the mesh motion, and write out a <code>.dat</code> file for each boundary face that can used in svFSI to set up the displacement boundary conditions. The interpolation script <code>interpolation.py</code> can be found here in SimVascular&#39;s source code: Python/site-packages/sv_auto_lv_modeling/modeling/svfsi/interpolation.py.

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

