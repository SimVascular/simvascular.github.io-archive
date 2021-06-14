## Network Control Parameters ##

The Purkinje network is generated using a Python script. The inputs to the script include a triangular surface, the network starting point, a second point defining the direction of the first network branch, and the parameters used to control the shape, density and spread of the network <a href="#ref-2">[2]</a>. These parameters are described below:

<ul>
    <li>Starting point - initial node of the network.</li>
    <li>Second point - defines the direction along which the network's initial branch will grow.</li>
    <li>Number of branch generations - denotes the maximum number of network branches generated from the initial node.</li>
    <li>Average branch length - the length of each branch is calculated from a random normal distribution with a mean length, $L$ and a variance, $0.4 L^2$.</li>
    <li>Branch angle - the angle between direction of the previous branch and a new branch.</li>
    <li>Repulsive parameter - regulates the branch curvature (higher value leads to greater repulsion between the branches).</li>
    <li>Branch segment length - an approximate length of the segments that compose one branch.</li>
</ul>



