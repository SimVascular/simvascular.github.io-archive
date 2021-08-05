## Segmenting Image Data ##

###Segmenting using the SimVascular Python shell

3D CT or MR image volumes can be segmented within the SimVascular
<a href='http://simvascular.github.io/docsPythonInterface.html#python_shell'> Python Shell </a> using the
<a href="https://github.com/SimVascular/SimVascular/blob/master/Python/site-packages/sv_auto_lv_modeling/segmentation/prediction.py">
prediction.py </a> Python script. For example

<pre><code class='language-shell' lang='shell'>
    data_path=/path/to/data
    sv_python_dir=/usr/local/bin
    script_dir=SimVascular/Python/site-packages/sv_auto_lv_modeling

    patient_id=WS01
    image_dir=$data_path/01-Images
    output_dir=$data_path/02-Segmnts
    weight_dir=$data_path/Weights

    ${sv_python_dir}/simvascular --python -- $script_dir/segmentation/prediction.py \
        --pid $patient_id \
        --image $image_dir \
        --output $output_dir \
        --model $weight_dir \
        --view  0 1 2 \ # 0 for axial, 1 for coronal, 2 for sagittal
        --modality ct # ct or mr
</code></pre>


###Segmenting using the SimVascular GUI Python Console

Image segmentation can also be performed from within the SimVascular GUI
<a href='http://simvascular.github.io/docsPythonInterface.html#console'> Python console </a>.
Use the Python console <strong>Text Editor</strong> mode to enter the following Python commands 

<pre><code class='language-python' lang='python'>
    from auto_lv.auto_lv import Segmentation
    data_path='/path/to/data'
    seg = Segmentation()
    seg.set_modality('ct')
    seg.set_patient_id ('WS01')
    seg.set_image_directory (data_path+'/01-Images')
    seg.set_output_directory (data_path+'/02-Segmnts')
    seg.set_model_directory ([data_path+'/Weights'])
    seg.set_view ([2])
    seg.generate_segmentation()
</code></pre>

and execute them.


