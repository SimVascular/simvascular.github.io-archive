### Precompiled installer

If you intent to use the stable version, we provide a precompiled installer on <a href="https://simtk.org/projects/simvascular#">SimTK</a> website. We currently support Ubuntu and MacOS. It is recommended to install **svFSI** alongside <strong>SimVascular</strong> to take advantage of the established modeling pipeline.

The **svFSI** executable (either built from source or downloaded from SimTK) is not packaged into each SimVascular release, so users have to manually add its path through **SimVascular** GUI. The configuration is under <code>Window</code> -> <code>Preference</code> -> <code>svFSI Simulation</code>.

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/main/imgs/path_to_binary.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >Set up path to svFSI solver in SimVascular.</figcaption>
</figure>