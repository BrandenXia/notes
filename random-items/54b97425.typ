#import "@preview/physica:0.9.7": *

$
  f(x, y) = -2x^2 + 8x + 2y^2 + 4y - 9 quad {0 <= x <= 3, -1 <= y <= 3}
$

$
  cases(
    f_x = - & 4 x + 8 && = 0,
    f_y = & 4 y + 4 && = 0
  )
  quad ==> quad
  cases(x = 2, y = -1)
$

Check bounds:
$
   f(0, y) &                            && = 2y^2 + 4y - 9 quad   && "(min)" \
   f(2, y) & = -8 + 16 + 2y^2 + 4y - 9  && = 2y^2 + 4y - 1 quad   && "(max)" \
   f(3, y) & = -18 + 24 + 2y^2 + 4y - 9 && = 2y^2 + 4y - 3 \
  f(x, -1) & = -2x^2 + 8x + 2 - 4 - 9   && = -2x^2 + 8x - 11 quad && "(min)" \
   f(x, 3) & = -2x^2 + 8x + 18 + 12 - 9 && = -2x^2 + 8x + 21 quad && "(max)" \
$

Therefore,

$
   f(2, 3) & = 29 "(absolute max)" \
  f(0, -1) & = -11 "(absolute min)" \
$
