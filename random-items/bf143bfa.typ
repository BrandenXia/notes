#import "@preview/physica:0.9.7": *

Problem: If $z = f(x-y)$, use the chain rule to show that $pdv(z, x) + pdv(z, y) = 0$.

$
  & pdv(z, x) = pdv(f(x-y), x) = dv(f, x)(x-y) dot pdv((x-y), x) = dv(f, x)(x-y) \
  & pdv(z, y) = pdv(f(x-y), y) = dv(f, y)(x-y) dot pdv((x-y), y) = -dv(f, y)(x-y) \
  & pdv(z, x) + pdv(z, y) = dv(f, x)(x-y) - dv(f, y)(x-y) = 0
$

$$
