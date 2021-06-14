## Obtain svFSI ##

The source code of **svFSI** is publicly released through <a href="https://github.com/SimVascular/svFSI">
GitHub</a>, and many new features are introduced frequently. Users are encouraged to download the most recent version and test it on their problems. **svFSI** is built through a CMake system and a short build guide is provided <a href="https://github.com/SimVascular/svFSI/blob/master/README.md"> here</a>. In addition to the source code, pre-built binary files are also available through <a href="https://simtk.org/frs/?group_id=188#">SimTK</a>. Here users can download **svFSI** binary for Ubuntu or MacOS.

The **svFSI** executable (either built from source or downloaded from SimTK) is not packaged into each SimVascular release, so users have to manually add its path to **SimVascular** GUI. The location is under <code>Window</code> -> <code>Preference</code> -> <code>svFSI Simulation</code>.

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/mechanics/images/path_to_binary.png">
  <figcaption class="svCaption" >Set up path to **svFSI** solver in SimVascular.</figcaption>
</figure>
