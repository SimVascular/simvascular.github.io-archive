<h2 id="tutorial_starting_simvascular"> Starting SimVascular </h2>

Once SimVascular has been <a href="https://github.com/SimVascular/SimVascular/wiki/wiki_for_users">Installed</a> it is started
by selecting the <img src="documentation/quickguide/tutorial/images/sv-start-icon.png" width="18" height="18"> icon from a 
platform's list of applications (Fig. 1). 

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/tutorial/images/sv-start.png">
  <figcaption class="svCaption"> Fig. 1 &nbsp Starting the SimVascular application. </figcaption>
</figure>

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
The SimVascular GUI may look slightly different on MacOS, Ubuntu and Windows platforms.
</div>

<br>
On Ubuntu and Windows a terminal is created for SimVascular to run in. Messages output from some SimVascular computations 
(e.g. meshing) are written to the terminal. On MacOS no terminal is created so no SimVascular output can be seen.

SimVascular can also be started from the command line in a terminal using the path to the installation directory. The path
includes the SimVascular build date <i>YYYY-MM-DD</i> on Ubuntu and Windows.

<table class="table table-bordered" style="width:100%">
  <caption> Starting SimVascular from the command line</caption>
  <tr>
    <th> Platform </th>
    <th> Command </th>
  </tr>

  <tr>
    <td> MacOS </td>
    <td> /Applications/SimVascular.app/Contents/Resources/simvascular </td>
  </tr>

  <tr>
    <td> Ubuntu </td>
    <td> /usr/local/sv/simvascular/YYYY-MM-DD/simvascular </td>
  </tr>

  <tr>
    <td> Windows (Power Shell) </td>
    <td> &"C:\Program Files\SimVascular\SimVascular\YYYY-MM-DD\sv.bat" </td>
  </tr>

</table>

