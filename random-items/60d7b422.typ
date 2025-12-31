#import "@preview/physica:0.9.7": *

$
  arrow(r)(t) & = lr(chevron.l -t^2 + 3t - 1, && -2t^3 + 2t^2 + 3t + 1, && 2t - 4 && chevron.r) &&= lr(chevron.l -1, 1, -4 chevron.r) \
  arrow(v)(t) & = lr(chevron.l -2t + 3, && -6t^2 + 4t +3, && 2 && chevron.r) &&= lr(chevron.l 3, 3, 2 chevron.r) \
  arrow(a)(t) & = lr(chevron.l -2, && -12t + 4, && 0 && chevron.r) &&= lr(chevron.l -2, 4, 0 chevron.r) \
$

$
  arrow(a)_T (t) &= (arrow(v) dot arrow(a) ) / norm(arrow(v))^2 dot arrow(v) = 6 / 22 dot lr(chevron.l 3, 3, 2 chevron.r) = lr(chevron.l 9/11, 9/11, 6/11 chevron.r) \
  arrow(a)_N (t) &= arrow(a) - arrow(a)_T = lr(chevron.l -2, 4, 0 chevron.r) - lr(chevron.l 9/11, 9/11, 6/11 chevron.r) = lr(chevron.l -31/11, 35/11, -6/11 chevron.r)
$
