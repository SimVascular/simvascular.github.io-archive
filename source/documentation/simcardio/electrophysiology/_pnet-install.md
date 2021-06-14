## Plugin Installation ##

The installer for the Purkinje plugin can be found on the <a href="https://simtk.org/projects/simvascular/">Simtk</a> website. The installer installs the shared libraries, the setup.sh script and a Python script in, <br/>

<code> <font color="black"> /usr/local/sv/svplugins/<strong>SVDATE</strong>/Purkinje-Plugin/<strong>PLUGINDATE</strong> </font> </code>

Make sure that the SVDATE matches with the date of the installed SimVascular application. If there is a mismatch, you may rename the SVDATE folder to match with the installed SimVascular application. The setup.sh script sets the SV_CUSTOM_PLUGINS and SV_PLUGIN_PATH environment variables. The SV_CUSTOM_PLUGINS environment variable defines the name of the plugin (e.g. org_sv_gui_qt_purkinjenetwork) and the SV_PLUGIN_PATH environment variable defines the location of the plugin shared library (e.g. liborg_sv_gui_qt_purkinjenetwork.so).

If successfully installed, the Purkinje Network tool icon automatically shows up on the main toolbar when the SimVascular application is launched.

