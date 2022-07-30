## Background
This folder contains information on how to generate fiber orientations for patient-specific meshes. We use a rule-based method for assigning myocardial fiber orientation.

To generate fibers, we need the following:
<ol>
  <li>A solid .vtu mesh corresponding to myocardium</li>
  <li>Surface meshes corresponding to endocardial and epicardial surfaces. We will generate fibers for both single and biventricular models</li>
  <li>Surface meshes corresponding to the apex and base of the heart</li>
</ol>

We will then run four heat simulations, A, B, C, and D.