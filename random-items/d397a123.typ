#import "@preview/physica:0.9.8": *

$
  limits(integral.double)_S (x-y) / sqrt(2z + 1) dd(s) "where" S: vb(r)(u, v) = lr(chevron.l u+v, u-v, u^2+v^2 chevron.r) {0 <= u <= 1, 0 <= v <= 2}
$

$ pdv(vb(r), u) = lr(chevron.l 1, 1, 2u chevron.r), quad pdv(vb(r), v) = lr(chevron.l 1, -1, 2v chevron.r) $

$
  limits(integral.double)_S (x-y) / sqrt(2z + 1) dd(s) & = limits(integral.double)_D ((u + v) - (u - v)) / sqrt(2 (u^2 + v^2) + 1) dot norm(pdv(vb(r), u) crossproduct pdv(vb(r), v)) dd(u, v) \
  & = limits(integral.double)_D ((u + v) - (u - v)) / sqrt(2 (u^2 + v^2) + 1) dot norm(lr(chevron.l 2u + 2v, 2u - 2v, -2 chevron.r)) dd(u, v) \
  & = limits(integral.double)_D ((u + v) - (u - v)) / sqrt(2 (u^2 + v^2) + 1) dot sqrt((2u + 2v)^2 + (2u - 2v)^2 + 4) dd(u, v) \
  & = limits(integral.double)_D ((u + v) - (u - v)) / sqrt(2 (u^2 + v^2) + 1) dot 2 sqrt(2(u^2 + v^2) + 1) dd(u, v) \
  & = limits(integral.double)_D 4v dd(u, v) \
  & = integral_0^2 integral_0^1 4v dd(u, v) \
  & = integral_0^2 4v dd(v) \
  & = evaluated(2v^2)_0^2 \
  & = 8
$
