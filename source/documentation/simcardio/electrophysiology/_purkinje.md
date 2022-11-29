# Purkinje Network Plugin Tutorial


The electrical activity in the heart tissue triggers muscle contraction and pumps blood into the systemic circulation. Under normal conditions, the electrical signal originates at the sinoatrial node located in the right atrium and reaches the atrioventricular node, which is the only electrical joint between the atria and the ventricles. <a href="#ref-1">[1]</a> The bundle of His connects the atrioventricular node to a fast conducting network of fibers, called the Purkinje network, located beneath the inner-most layer of the heart wall. Purkinje cells are larger than the cardiomyocytes and conduct the excitation wave faster than any other cell on the heart tissue. <a href="#ref-1">[1]</a> The network not only synchronizes contraction between the left and the right ventricles but also allows the trajectory to follow a sequence beginning at the ventricular apex, spreading through the free-wall and eventually to the basal plane. Modeling the Purkinje network in cardiac electrophysiology simulations is therefore essential to achieve a realistic activation pattern and tissue contraction.

SimVascular provides a <strong>Purkinje plugin</strong> that can be used to generate Purkinje network on arbitrary patient-specific cardiac models. Our Purkinje plugin uses a fractal-tree-based method to generate the network <a href="#ref-2">[2]</a> and provides a simple interface to adjust the parameters that control the network density and coverage. The Purkinje mesh is then exported in vtu format compatible with <strong>SimVascular/svFSI</strong> for the ensuing electrophysiology simulations.

In the following sections, we describe steps to download and install the Purkinje plugin, provide a workflow for creating Purkinje network using the plugin.

