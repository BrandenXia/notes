#import "@preview/physica:0.9.7": *

$
  z = e^(x^3 y^2), quad x = 5/ u^2 + 7 / (u v^3) - 3v^3, quad y = 5 u^2 v^2 - 8 / v^3 - 3
$

#let pdvzx = $3x^2 y^2 dot e^(x^3 y^2)$
#let pdvzy = $2x^3 y dot e^(x^3 y^2)$
#let pdvxu = $-10 / u^3 - 7 / (u^2 v^3)$
#let pdvxv = $-21 / (u v^4) - 9 v^2$
#let pdvyu = $10 u v^2$
#let pdvyv = $10 u^2 v + 24 / v^4$

$
  pdv(z, x) & = pdvzx wide && pdv(z, y) = pdvzy \
  pdv(x, u) & = pdvxu wide && pdv(x, v) = pdvxv \
  pdv(y, u) & = pdvyu wide && pdv(y, v) = pdvyv \
$

$
  pdv(z, u) & = pdv(z, x) * pdv(x, u) + pdv(z, y) * pdv(y, u) \
            & = pdvzx (pdvxu) + pdvzy pdvyu \
  pdv(z, v) & = pdv(z, x) * pdv(x, v) + pdv(z, y) * pdv(y, v) \
            & = pdvzx (pdvxv) + pdvzy pdvyv \
$
