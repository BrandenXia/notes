#import "@preview/physica:0.9.8": *

$
  integral.cont_C vb(F) dot dd(vb(r)) quad "where" quad &vb(F) = lr(chevron.l -3 x^2 + 3 y z + 4z^2, -x^2 + 3 x z + 2y, 3 x y - y^2 chevron.r) \
  &vb(r)(s, t) = lr(chevron.l s, t, -3s - t + 5 chevron.r) space {0 <= s <= 2, 0 <= t <= 1}
$

$
  integral.cont_C vb(F) dot dd(s) & = integral.double_S curl vb(F) dot dd(vb(S)) \
  & = integral_0^1 integral_0^2 (curl vb(F))(vb(r)(s, t)) dot (pdv(vb(r), s) crossproduct pdv(vb(r), t)) space dd(s, t) \
  & = integral_0^1 integral_0^2 lr(chevron.l -2t, 8(-3s-t+5), -2s chevron.r) dot lr(chevron.l 3, 1, 1 chevron.r) space dd(s, t) \
  & = integral_0^1 integral_0^2 -6t - 24s - 8t + 40 - 2s space dd(s, t) \
  & = integral_0^1 integral_0^2 -14t - 26s + 40 space dd(s, t) \
  & = integral_0^1 evaluated(-14t s - 13s^2 +40s)_(s=0)^2 space dd(t) \
  & = integral_0^1 -28t - 52 + 80 space dd(t) \
  & = evaluated(-14t^2 - 28t)_(t=0)^1 \
  & = 42
$
