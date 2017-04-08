# Installation Instructions for Apple OS X #

1. Launch the downloaded package and agree to the terms of service.

2. Drag SimVascular into your Applications folder when this window opens.

	<figure>
	  <img class="svImg svImgXl"  src="documentation/installation/imgs/macDrag.png"> 
	  <figcaption class="svCaption" ></figcaption>
	</figure>

3. Launch SimVascular through your Applications folder or using the Terminal (see step 5).

4. (Optional) To run svSolver from the GUI, you will need to install mpich through MacPorts. MacPorts is available at <a href="https://www.macports.org/"target="blank"> macports.org</a>:

        sudo port install mpich-gcc46

5. (Optional) To install the SimvVascular command line tools run:

		sudo /Applications/SimVascular.app/Contents/Resources/setup-symlinks.sh