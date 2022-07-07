### Viscosity models

Currently, **svFSI** supports three viscosity models: Newtonian, Carreau-Yasuda and Casson <a href="#ref-2">[2]</a>.

<figure>
  <img class="svImg svImgSm" src="documentation/svfsi/fluid/imgs/non-newtonian.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >Non-Newtonian viscosity model<a href="#ref-1">[1]</a>.</figcaption>
</figure>

Carreau-Yassuda model is defined as

$$\eta=\eta\_\infty + (\eta\_0 - \eta\_\infty) \left[ 1 + \left( \lambda\dot(\gamma)^a \right) \right]^{\frac{n-1}{a}}$$

Here:
<ul>
    <li>$\eta\_\infty$: limiting high shear-rateviscosity;</li>
    <li>$\eta\_0$: limiting low shear-rate viscosity;</li>
    <li>$\lambda$: shear-rate tensor multiplier;</li>
    <li>$\dot{\gamma}$: shear rate;</li>
    <li>$a$: shear-rate tensor exponent;</li>
    <li>$n$: power-law index.</li>
</ul> 

Casson model is defined as

$$\eta=\frac{1}{\dot{\gamma}}\left[ k\_0 ( c ) + k\_1 ( c )\sqrt{\dot{\gamma}} \right]^2$$

Here, $k\_0 ( c )$ and $k\_1 ( c )$ are functions of the hematocrit $c$. 