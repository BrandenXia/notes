#import "@preview/physica:0.9.8": *

$
  integral.triple_S x^2(-z) - y^2z dd(V) & = integral_0^(pi/2) integral_0^1 integral_0^sqrt(1-z^2) - r (z r^2 cos^2 theta + z r^2 sin^2 theta) space dd(r, z, theta) \
  & = integral_0^(pi/2) integral_0^1 integral_0^sqrt(1-z^2) - r (z r^2) space dd(r, z, theta) \
  & = -integral_0^(pi/2) integral_0^1 integral_0^sqrt(1-z^2) z r^3 space dd(r, z, theta) \
  & = -integral_0^(pi/2) integral_0^1 evaluated(1/4 z r^4)_(r=0)^sqrt(1-z^2) space dd(z, theta) \
  & = - 1/4 integral_0^(pi/2) integral_0^1 z (1-z^2)^2 space dd(z, theta) \
  & = - 1/4 integral_0^(pi/2) evaluated(-1/6 (1-z^2)^3)_(z=0)^1 space dd(theta) \
  & = 1/24 integral_0^(pi/2) -1 space dd(theta) \
  & = 1/24 dot -pi/2 \
  & = -pi/48
$
