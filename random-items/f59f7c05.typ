#import "@preview/physica:0.9.8": *

*4B*

$
  dv(V, theta) &= 1/(theta'(t)) dv(, t) X'(t) \
  &= 1/(theta'(t)) ( f(t) lr(chevron.l cos theta, sin theta chevron.r) + g(t) lr(chevron.l - sin theta, cos theta chevron.r) ) \
  &= f(t) / (theta'(t)) lr(chevron.l cos theta, sin theta chevron.r) \
  &= - (G M) / (r^2 theta') lr(chevron.l cos theta, sin theta chevron.r) \
  &= - (G M) / C lr(chevron.l cos theta, sin theta chevron.r) \
  integral dd(V) &= - (G M) / C integral lr(chevron.l cos theta, sin theta chevron.r) dd(theta) \
  V &= (G M) / C lr(chevron.l - sin theta, cos theta chevron.r) + lr(chevron.l c_1, c_2 chevron.r)
$

When $c_1, c_2 = 0$:

$
  r(t) theta'(t) & = (G M) / C \
      - C / r(t) & = (G M) / C \
            r(t) & = C^2 / (G M) quad "(constant)"
$

When $c_1, c_2 eq.not 0$:

$
  V &= X'(t) \
  (G M) / C lr(chevron.l - sin theta, cos theta chevron.r) + lr(chevron.l c_1, c_2 chevron.r) &= r theta' lr(chevron.l -sin theta, cos theta chevron.r) \
  (G M) / C lr(chevron.l - sin theta, cos theta chevron.r) + lr(chevron.l c_1, c_2 chevron.r) &= C / r lr(chevron.l -sin theta, cos theta chevron.r) \
  ((G M) / C lr(chevron.l - sin theta, cos theta chevron.r) + lr(chevron.l c_1, c_2 chevron.r)) dot lr(chevron.l -sin theta, cos theta chevron.r) &= C / r lr(chevron.l -sin theta, cos theta chevron.r) dot lr(chevron.l -sin theta, cos theta chevron.r) \
  (G M) / C - c_1 sin theta + c_2 cos theta &= C / r \
  (G M) / C^2 - c_1 / C sin theta + c_2 / C cos theta &= r^(-1) \
  C ( (G M) / C - c_1 sin theta + c_2 cos theta )^(-1) &= r \
$

#align(center)[
  #rect[
    $
      r = C ( (G M) / C - c_1 sin theta + c_2 cos theta )^(-1)
    $
  ]
]
