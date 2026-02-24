#import "@preview/physica:0.9.7": *

Problem: If $z = f(x-y)$, use the chain rule to show that $pdv(z, x) + pdv(z, y) = 0$.

$
  & pdv(z, x) = pdv(f(x-y), x) = f'(x-y) dot pdv((x-y), x) = f'(x-y) \
  & pdv(z, y) = pdv(f(x-y), y) = f'(x-y) dot pdv((x-y), y) = -f'(x-y) \
  & pdv(z, x) + pdv(z, y) = f'(x-y) - f'(x-y) = 0
$
