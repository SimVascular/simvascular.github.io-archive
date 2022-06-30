### Material models

Below is the list of available material constitutive models in **svFSI** :

<table class="table table-bordered">
  <caption>Volumetric constitutive models for the struct/ustruct equations</caption>
  <thead>
  <tr>
    <th>Volumetric Model</th>
    <th>Input Keyword</th>
  </tr>
  </thead>
  <tr>
    <td>Quadratic model</td>
    <td> "quad", "Quad", "quadratic", "Quadratic" </td>
  </tr>
  <tr>
    <td>Simo-Taylor91 model<a href="#ref-5">[5]</a></td>
    <td>"ST91", "Simo-Taylor91"</td>
  </tr>
  <tr>
    <td>Miehe94 model<a href="#ref-6">[6]</a></td>
    <td>"M94", "Miehe94"</td>
  </tr>
</table>

<table class="table table-bordered">
  <caption>Isochoric constitutive models for the struct/ustruct equations</caption>
  <thead>
  <tr>
    <th>Isochoric Model</th>
    <th>Input Keyword</th>
  </tr>
  </thead>
    <tr>
      <td>Saint Venant-Kirchhoff$^\dagger$ </td>
      <td>"stVK", "stVenantKirchhoff" </td>
    </tr>
    <tr>
      <td>modified Saint Venant-Kirchhoff$^\dagger$</td>
      <td>"m-stVK", "modified-stVK",  "modified-stVenantKirchhoff" </td>
    </tr>
    <tr>
      <td>Neo-Hookean model </td>
      <td>"nHK", "nHK91", "neoHookean", "neoHookeanSimo91" </td>
    </tr>
    <tr>
      <td>Mooney-Rivlin model </td>
      <td>"MR", "Mooney-Rivlin" </td>
    </tr>
    <tr>
      <td>Holzapfel-Gasser-Ogden model <a href="#ref-7">[7]</a> </td>
      <td> "HGO" </td>
    </tr>
    <tr>
      <td>Guccione model <a href="#ref-8">[8]</a> </td>
      <td> "Guccione", "Gucci" </td>
    </tr>
    <tr>
      <td>Holzapfel-Ogden model <a href="#ref-9">[9]</a></td>
      <td> "HO", "Holzapfel" </td>
    </tr>
</table>
$^\dagger$ These models are not available for ustruct.
