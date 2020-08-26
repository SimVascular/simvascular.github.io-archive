## Python Console ##
The SimVascular **Python Console** is opened by selecting the 
<img src="documentation/python_interface/imgs/python-icon.png" width="20" height="20"> icon 
located at the far right end on the SimVascular tool bar. The **Python Console** has two panels. 
The right panel is used to execute commands by the Python interpreter. 

<figure>
  <img class="svImg svImgXl" src="documentation/python_interface/imgs/main-window-1.png" width="100" height="500">
  <figcaption class="svCaption" > Opening the SimVascular Python Console prints the version of the Python interpreter and is ready for keyboard input at 
                                  the Python <b>>>></b> prompt. 
</figure>
<br>


The left panel lists the currently defined Python attributes (variables). Importing a module adds that module name to the list of attributes. Importing 
all of the <b>sv</b> modules by typing <b>from sv import *</b> in the interpreter panel adds all of the modules defined by <b>sv</b> to the list of attributes
in the left panel.

<figure>
  <img class="svImg svImgMd" src="documentation/python_interface/imgs/console-atts.png" width="100" height="400">
  <figcaption class="svCaption"> Using the <b>from sv import *</b> command to list all of <b>sv</b> modules.
</figure>

<br>

The <b>Python Console</b> has two modes of operation: <b>Console</b> and <b>Text Editor</b>. The <b>Python Console</b> opens in <b>Console</b> mode 
that is used to interactively execute Python commands. The version of the Python interpreter embedded in the SimVascular application is printed 
and the Python **>>>** prompt is displayed meaning that the interpreter is ready for keyboard input. The <b>Console</b> and <b>Text Editor</b> 
buttons located at the bottom of the right panel are used to select the operational mode.

