#import "@preview/equate:0.3.1": equate
#import "@preview/physica:0.9.5": *

#let title = "Relativistic Electrodynamics"

#set document(
  title: title,
  author: ("Branden Xia", "Shawn Xu"),
)

#set text(font: "New Computer Modern", size: 12pt)

#set page(
  paper: "us-letter",
  margin: (x: 0.85in, y: 1.2in),
  header-ascent: 37%,
  header: [
    #set text(size: 12pt)
    _ #title _
    #h(1fr)
    2025-2026
    #line(length: 100%)
  ],
  numbering: "- 1 -",
)

#set heading(numbering: "1.")
#show heading: set block(above: 1.75em, below: 1em)

#set math.equation(
  numbering: "(1)",
  supplement: "Eq.",
)
#show: equate.with(
  number-mode: "label",
)

= Introduction

== Incentives behind Relativistic Electrodynamics

You might have tried to play with electric and magnetic fields under different reference frames, and found that Maxwell's equations don't seem compatible with classical Galilean transforms.

For instance, consider a rested point charge $q$. It's electric field can be easily calculated using Gauss's law, and is given by:

$ vb(E)(vb(r)) = 1/(4 pi epsilon_0) q / norm(vb(r))^2 hat(r) $

and there's no magnetic field.

However, consider another reference frame moving at a constant velocity $vb(v) = v hat(x)$. Under classical mechanics, the electric field remains the same, but we also have a magnetic field given by Ampère's law:

$ vb(B)(vb(r)) = mu_0 / (4 pi) ( q vb(v) times hat(r) ) / norm(vb(r))^2 $

Obviously, if we place a test charge in this field, it will experience different forces in the two reference frames, which isn't physically reasonable as we shouldn't cause different physical phenomena by just changing our perspective.

Therefore, we are motivated to consider electrodynamics under a new perspective, and that's where special relativity comes in.

== Recap of Special Relativity

Recall that we follow two important postulates in special relativity:

+ Laws of physics are same under every inertial reference frame.
+ Speed of light in vacuum remains constant.

Through a series of thought experiments, we can derive the Lorentz transforms, which relate coordinates of events under different inertial reference frames.

Before listing all the equations, let's first establish some notations. We will use $cal(S)$ to denote a reference frame, and the coordinates of an event in this reference frame will be denoted by $vb(x) = (t, x, y, z)$. Accordingly, in another reference frame $cal(S)'$, the coordinates of the same event will be denoted by $vb(x') = (t', x', y', z')$.

Suppose $cal(S)'$ is moving at a constant velocity $vb(v) = v hat(x)$ relative to $cal(S)$. We will define the Lorentz factor $gamma$ as:

$ gamma equiv 1 / sqrt(1 - v^2 \/ c^2) $

Then, we can express the Lorentz transforms as:

- $t' & = gamma ( t - v x \/ c^2 )$
- $x' & = gamma ( x - v t )$
- $y' & = y$
- $z' & = z$

Now, consider a particle moving at a velocity $vb(u) = (u_x, u_y, u_z)$ in $cal(S)$. We can derive the velocity transforms as:

$ vb(u)' = (vb(v) - vb(u)) / (1 - ( vb(v) dot vb(u) ) \/ c^2) $ <einstein-velocity-addition>

This is known as Einstein's velocity addition formula, and it ensures that the resulting velocity never exceeds the speed of light.

= Magnetism as a Relativistic Phenomenon

#figure(
  image("figure-1.svg", width: 80%),
  caption: [A moving charge $q$ and line charges with linear charge density under the rested reference frame $cal(S)$, red arrows indicate the magnetic field generated.],
) <example-reference-frame-S>

Let's consider a simple setup: suppose there's a line of charge with linear charge density $lambda$, moving along the $x$-axis at a constant velocity $v hat(x)$. Meanwhile, there's another line of charge with linear charge density $-lambda$ on the exact same line, but moving towards the opposite direction with same speed $v$. Near the line of charge, there's a point charge $q$ moving at velocity $u hat(x)$.

Let's call the reference frame where we described the above setup $cal(S)$. @example-reference-frame-S shows the setup under this reference frame.

- Under this reference frame, the two electric fields produced by the two line charges cancel each other out, leaving a net electric field $vb(E) = vb(0)$.
- Due to the motion of line charges, a current $vb(I)$ is generated, given by:
  $ vb(I) = 2 lambda v hat(x) $
  and the magnetic field $vb(B)$ produced by this current is given by:
  $
    vb(B)(vb(r)) = (mu_0 vb(I) times hat(r)) / (2 pi norm(vb(r))) = (mu_0 lambda v) / (pi norm(vb(r))) (hat(x) times hat(r))
  $

Therefore, the point charge $q$ experiences a magnetic force given by:

$ vb(F)_vb(B) = q vb(u) times vb(B) = - (mu_0 lambda v q u) / (pi norm(vb(r))) hat(r) $ <magnetic-force-S>

#figure(
  image("figure-2.svg", width: 80%),
  caption: [The same setup under the reference frame $cal(S)'$, where the point charge $q$ is at rest, blue arrows indicate the electric field generated.],
) <example-reference-frame-S-prime>

Now, Consider this setup from another reference frame $cal(S)'$, which is moving along the $x$-axis at a constant velocity $u hat(x)$ relative to $cal(S)$. Thus, the point charge $q$ is at rest under this reference frame, and the two line charges are moving at:

$ v'_plus.minus = (v minus.plus u) / (1 minus.plus v u \/ c^2) $

as given by @einstein-velocity-addition.

This tells us that $v'_+ > v'_-$ in $cal(S)'$, which accordingly causes the linear charge density to be different under $cal(S)'$, which can be calculated using the Lorentz contraction as:

$
  lambda'_plus.minus = plus.minus gamma_plus.minus lambda_0 quad "where" gamma_plus.minus equiv 1 / sqrt(1 - v'_plus.minus^2 \/ c^2)
$

It's worth noting here that $lambda_0 != lambda$ since the linear charges are already moving at speed $v$ under $cal(S)$, and thus we have:

$ lambda = gamma lambda_0 quad "where" gamma equiv 1 / sqrt(1 - v^2 \/ c^2) $

Notice that we can simplify $gamma_plus.minus$:

$
  gamma_plus.minus = 1 / sqrt(1 - v'_plus.minus^2 \/ c^2) &= [1 - c^(-2) ( (v minus.plus u) / (1 minus.plus v u \/ c^2) )^2]^(-1/2) \
  &= [1 - c^2 ( (v minus.plus u) / (c^2 minus.plus v u) )^2]^(-1/2) \
  &= [( (c^2 minus.plus v u)^2 - c^2 (v minus.plus u)^2 ) / (c^2 minus.plus v u)^2 ]^(-1/2) \
  &= (c^2 minus.plus v u) / sqrt((c^2 minus.plus v u)^2 - c^2 (v minus.plus u)^2) \
$

#rect(inset: 10pt)[
  $
    & quad(c^2 minus.plus v u)^2 - c^2 (v minus.plus u)^2 \
    & = ( c^4 + (v u)^2 minus.plus 2 v u c^2 ) - (c^2 v^2 plus c^2 u^2 minus.plus 2 v u c^2) \
    & = c^4 - c^2 v^2 - c^2 u^2 + (v u)^2 \
    & = (c^2 minus v^2) (c^2 minus u^2)
  $
]

$
  quad quad quad quad quad quad & = (c^2 minus.plus v u) / sqrt((c^2 minus v^2) (c^2 minus u^2)) \
                                & = (1 minus.plus v u \/ c^2) / (c^(-1) sqrt(c^2 minus v^2) c^(-1) sqrt(c^2 minus u^2)) \
                                & = 1 / sqrt(1 - v^2 \/ c^2) (1 minus.plus v u \/ c^2) / sqrt(1 - u^2 \/ c^2) \
                                & = gamma (1 minus.plus v u \/ c^2) / sqrt(1 - u^2 \/ c^2) \
$

Therefore, the total linear charge density under $cal(S)'$ is given by:

$
  lambda'_"total" = lambda_0 (gamma_+ - gamma_-) = gamma lambda_0 (- 2 v u \/ c^2) / sqrt(1 - u^2 \/ c^2) = (-2 lambda v u) / (c^2 sqrt(1 - u^2 \/ c^2))
$

From Gauss's Law, the electric field produced by the line charges is given by:

$ vb(E')(vb(r)) = lambda'_"total" / (2 pi epsilon_0 norm(vb(r))) hat(r) $

and the electric force experienced by the point charge $q$ is given by:

$
  vb(F)'_vb(E) = q vb(E) = (-2 lambda q v u) / (c^2 sqrt(1 - u^2 \/ c^2)) hat(r) / (2 pi epsilon_0 norm(vb(r))) = - 1 / sqrt(1 - u^2 \/ c^2) (lambda q v u) / (pi norm(vb(r)) epsilon_0 c^2) hat(r)
$ <electric-force-S-prime>

Now, we can compare this to the magnetic force $vb(F)_vb(B)$ under the reference frame $cal(S)$.

Recall that $vb(F)_vb(B)$ is given by @magnetic-force-S. We can transform $vb(F)_vb(B)$ under $cal(S)$ to $cal(S)'$ using the Lorentz transforms:

$
  vb(F') = gamma_u vb(F)_vb(B) = - 1 / sqrt(1 - u^2 \/ c^2) (mu_0 lambda q v u) / (pi norm(vb(r))) hat(r)
$

This still differs from @electric-force-S-prime. However, consider the fact that $mu_0 epsilon_0 c^2 = 1$, we can rewrite the above equation as:

$
  vb(F') & = - 1 / sqrt(1 - u^2 \/ c^2) ((epsilon_0 c^2)^(-1) lambda q v u) / (pi norm(vb(r))) hat(r) \
         & = - 1 / sqrt(1 - u^2 \/ c^2) (lambda q v u) / (pi norm(vb(r)) epsilon_0 c^2) hat(r)
$

which is exactly the same as @electric-force-S-prime. Therefore, we can conclude that the magnetic force $vb(F)_vb(B)$ under $cal(S)$ is exactly the same as the electric force $vb(F)'_vb(E)$ under $cal(S)'$.

= Transformation of Electromagnetic Fields

After examining a specific example to see how magnetism can be explained as a relativistic phenomenon, we would like to derive the general transformation rules for electromagnetic fields under different reference frames.

For this purpose, we can start by considering a system with two parallel, uniformly charged capacitor, respectively with charge density $sigma_0$ and $-sigma_0$, both at rest under the reference frame $cal(S)_0$. This configuration is shown in @uniformly-charged-capacitor-S0.

#figure(
  image("figure-3.svg", width: 60%),
  caption: [Two parallel, uniformly charged capacitor under the reference frame $cal(S)_0$. Blue arrows indicate the electric field generated.],
) <uniformly-charged-capacitor-S0>

Since the two plates are at rest under $cal(S)_0$, the electric field under $cal(S)_0$ generated by the capacitor is given by:

$ vb(E)_0 = sigma_0 / epsilon_0 hat(z) $

Now, consider another reference frame $cal(S)$, which is moving at a constant velocity $vb(v)_0 = v_0 hat(x)$ relative to $cal(S)_0$.

#figure(
  image("figure-4.svg", width: 60%),
  caption: [The same setup under the reference frame $cal(S)$.],
) <uniformly-charged-capacitor-S>

In this reference frame, the density of charges on the plates changes due to the Lorentz contraction (since length is contracted), and is given by:

$ sigma = gamma_0 sigma_0 quad "where" gamma_0 equiv 1 / sqrt(1 - v_0^2 \/ c^2) $

The electric field under $cal(S)$ is given by:

$ vb(E) = sigma / epsilon_0 hat(z) = gamma_0 sigma_0 / epsilon_0 hat(z) = gamma_0 vb(E)_0 $ <electric-field-S>

This gives us the rule for transformation of electric fields under different reference frames:

#rect(inset: 10pt)[
  Given an electric field $vb(E)_0$ in a reference frame $cal(S)_0$ without magnetic field, the electric field $vb(E)$ in another reference frame $cal(S)$ moving at a constant velocity $vb(v)$ relative to $cal(S)_0$ is:

  $
    vb(E)^(perp vb(v)) = gamma_0 vb(E)^(perp vb(v))_0 quad "and" vb(E)^(parallel vb(v)) = vb(E)^(parallel vb(v))_0
  $ <electric-field-transform>

  where $vb(E)^(perp vb(v))$ and $vb(E)^(parallel vb(v))$ are the components of $vb(E)$ perpendicular and parallel to $vb(v)$.
]

Nevertheless, this isn't the end of the story. We would also like to know about how magnetic fields transform under different reference frames.

Since there's no moving charge in $cal(S)_0$, there's no magnetic field induced. It would be helpful to start from a system with some initial magnetic field to see its rule of transform. Notice that $cal(S)$ will be a good starting point since the charges are now moving, which becomes a current and can induce a magnetic field.

The magnetic field in $cal(S)$ can easily calculated through Ampère's Law, and is given by:

$ vb(B) = -mu_0 sigma v_0 hat(y) $ <magnetic-field-S>

Now, let's consider a third reference frame $overline(cal(S))$ that is moving at a constant velocity $vb(v) = v hat(x)$ relative to $cal(S)$. Under this reference frame, the magnetic field is transformed but still exists, as well as the electric field.

Similarly, the velocity of this system relative to $cal(S)_0$ can obtained by @einstein-velocity-addition:

$ overline(vb(v)) = (v_0 + v) / (1 + v_0 v \/ c^2) hat(x) $

and the Lorentz gamma factor can be as well calculated:

$ overline(gamma) = 1 / sqrt(1 - overline(v)^2 \/ c^2) $

We can also get the charge density in $overline(cal(S))$:

$ overline(sigma) = overline(gamma) sigma_0 $

Those together give us the electric field $overline(vb(E))$ and magnetic field $overline(vb(B))$ in this reference frame:

$
  overline(vb(E)) = overline(gamma) vb(E)_0 = ( overline(gamma) / gamma_0 ) sigma / (epsilon_0) hat(z) quad "and" quad overline(vb(B)) = -mu_0 overline(sigma) overline(v) hat(y) = - ( overline(gamma) / gamma_0 ) mu_0 sigma overline(v) hat(y)
$

We can simplify their common coefficient:

$
  overline(gamma) / gamma_0 = sqrt(1 - v_0^2 \/ c^2) / sqrt(1 - overline(v)^2 \/ c^2) = sqrt((1 - v_0^2 \/ c^2) / (1 - c^(-2) (v_0 + v)^2 / (1 + v_0 v \/ c^2)^2)) = sqrt((c^2 - v_0^2) / (c^2 - (v_0 + v)^2 / (1 + v_0 v \/ c^2)^2))
$

#rect(inset: 10pt)[
  $
    c^2 - (v_0 + v)^2 / (1 + v_0 v \/ c^2)^2 & = (( c^2 + v_0 v ) (1 + v_0 v \/ c^2) - (v_0 + v)^2) / (1 + v_0 v \/ c^2)^2 \
    & = (c^2 + cancel(2 v_0 v) + (v_0 v)^2 \/ c^2 - v_0^2 - v^2 - cancel(2 v_0 v)) / (1 + v_0 v \/ c^2)^2 \
    & = (( c^2 - v_0^2 ) + v^2 \/ c^2 (v_0^2 - c^2)) / (1 + v_0 v \/ c^2)^2 \
    & = ((c^2 - v_0)(1 - v^2 \/ c^2)) / (1 + v_0 v \/ c^2)^2
  $
]

$
  = sqrt(( cancel((c^2 - v_0^2)) (1 + v_0 v \/ c^2)^2 ) / ( cancel((c^2 - v_0^2)) (1 - v^2 \/ c^2) )) = (1 + v_0 v \/ c^2) / sqrt(1 - v^2 \/ c^2) = gamma (1 + ( v_0 v ) / c^2)
$

where

$ gamma equiv 1 / sqrt(1 - v^2 \/ c^2) $

Now, we can write $overline(vb(E))$ and $overline(vb(B))$ in terms of $vb(E)$ and $vb(B)$ given by @electric-field-S and @magnetic-field-S:

$
  overline(E)_z = gamma (1 + ( v_0 v ) / c^2) sigma / epsilon_0 = gamma (E_y + v (sigma v_0) / (c^2 epsilon)) = gamma (E_z - v B_y)
$

$overline(vb(B))$ is a little more complicated:

$
  overline(B)_y &= - gamma (1 + ( v_0 v ) / c^2) mu_0 sigma overline(v) = - gamma mu_0 sigma (1 + ( v_0 v ) / c^2) ( (v_0 + v) / (1 + v_0 v \/ c^2) ) \
  &= - gamma mu_0 sigma ( (v_0 + v) / (1 + v_0 v \/ c^2) + (v_0 v) / c^2 (v_0 + v) / (1 + v_0 v \/ c^2) )
$

$
  & = - gamma mu_0 sigma ( (v_0 + v) / (1 + (v_0 v) / c^2) + (v_0 + v) / (c^2 / (v_0 v) + 1) ) \
  & = - gamma mu_0 sigma ( (v_0 + v) cancel(( 1 + (v_0 v) / c^2 + 1 + c^2 / (v_0 v) )) ) / cancel((1 + (v_0 v) / c^2) (1 + c^2 / (v_0 v))) \
  & = - gamma mu_0 sigma (v_0 + v) \
  & = gamma (B_y - sigma / ( epsilon_0 c^2 ) v ) \
  & = gamma (B_y - v / c^2 E_z ) \
$

This gives us the rules for transforming $hat(y)$ component of magnetic fields and $hat(z)$ component of electric fields:

$ overline(E)_z = gamma (E_z - v B_y) quad "and" quad overline(B)_y = gamma (B_y - v / c^2 E_z) $

We can also derive the rules for other components by aligning the capacitor in different directions. Suppose we align the capacitors parallel to the $x z$ plane. This generates an electric field along $hat(y)$ direction, and a magnetic field along $hat(z)$ direction in $cal(S)$:

$ vb(E) = sigma / epsilon_0 hat(y) quad "and" quad vb(B) = mu_0 sigma v_0 hat(z) $

The transformed fields are similar, where we just need to replace $hat(z)$ with $hat(y)$ and $hat(y)$ with $-hat(z)$:

$ overline(E)_y = gamma (E_y + v B_z) quad "and" quad overline(B)_z = gamma (B_z + v / c^2 E_y) $

@electric-field-transform already tells us about the $hat(x)$ component of electric fields would be left unchanged:

$ overline(E)_x = E_x $

However, the magnetic fields in this case cancel out each other, producing a net magnetic field of 0. Therefore, we have to consider another setup to show the transformation for $B_x$.

Consider a solenoid where its axis is parallel to $hat(x)$ direction. As we already know, the magnetic field inside the solenoid is given by:

$ vb(B) = mu_0 n I hat(x) $

where $n$ is the number of loops per unit length and $I$ is the current in the solenoid.

Now, in $overline(cal(S))$, the current changes due to time dilation:

$ overline(I) = dv(Q, overline(t)) = 1 / gamma dv(Q, t) = 1 / gamma I $

Meanwhile, the number of loops per unit length also changes due to the length contraction:

$ overline(n) = dv(N, overline(l)) = gamma dv(N, l) = gamma n $

Those together show that the $hat(x)$ component of magnetic field in $overline(cal(S))$ is left unchanged:

$ overline(B)_x = mu_0 overline(n) overline(I) = mu_0 n I = B_x $

We now have the complete rules for electromagnetic fields under different reference frames:

#rect(inset: 10pt)[
  Given a reference frame $overline(cal(S))$ moving relative to another reference frame $cal(S)$ at a constant velocity $v hat(x)$, the electromagnetic fields in $overline(cal(S))$ can be calculated from the electromagnetic fields in $cal(S)$ as:

  $
    overline(E)_x & = E_x quad                 && overline(B)_x && = B_x \
    overline(E)_y & = gamma (E_y + v B_z) quad && overline(B)_z && = gamma (B_z + v / c^2 E_y) \
    overline(E)_z & = gamma (E_z - v B_y) quad && overline(B)_y && = gamma (B_y - v / c^2 E_z)
  $

  where

  $ gamma equiv 1 / sqrt(1 - v^2 \/ c^2) quad "is the Lorentz gamma factor" $
]

= Appendix: Mathematica Code for Figures

== @example-reference-frame-S

```py
margin = 0.5;
length = 10;
extends = 3;
fieldRange = 3;
cylinderSize = 1;
Show[
 Graphics3D[{
   {Arrow[{{0, -length, margin}, {0, length + extends, margin}}]},
   {Thick, Dashing[{Medium, Medium}],
    Line[{{0, -length, margin}, {0, length, margin}}]},
   {Black,
    Text[Style["+\[Lambda]", Bold, 15,
      FontFamily -> "NewComputerModernMath"], {0, 0,
      cylinderSize + margin}]},
   {Black,
    Text[Style["v", Bold, 15,
      FontFamily -> "NewComputerModernMath"], {0, length + extends,
      cylinderSize + margin}]},
   {Arrow[{{0, length, -margin}, {0, -length - extends, -margin}}]},
   {Thick, Dashing[{Medium, Medium}],
    Line[{{0, -length, -margin}, {0, length, -margin}}]},
   {Black,
    Text[Style["-\[Lambda]", Bold, 15,
      FontFamily -> "NewComputerModernMath"], {0,
      0, -cylinderSize - margin}]},
   {Black,
    Text[Style["v", Bold, 15,
      FontFamily -> "NewComputerModernMath"], {0, -length -
       extends, -cylinderSize - margin}]},
   {Thick, Dashed, Line[{{0, -length, 0}, {0, length, 0}}]},
   {Opacity[.5],
    Cylinder[{{0, -length, 0}, {0, length, 0}}, cylinderSize]},
   {Thick, Arrow[{{0, 2, cylinderSize*2}, {0, 6, cylinderSize*2}}]},
   {Black,
    Text[Style["q", Bold, 15,
      FontFamily -> "NewComputerModernMath"], {0, 2,
      cylinderSize*2 + margin*1.5}]},
   {Black,
    Text[Style["u", Bold, 15,
      FontFamily -> "NewComputerModernMath"], {0, 6,
      cylinderSize*2 + margin*1.5}]},
   }],
 VectorPlot3D[
  1/(2 Pi*(x^2 + z^2)^(1/2))*{z, 0, -x},
  {x, y, z} \[Element]
   Cylinder[{{0, -length - extends, 0}, {0, length + extends, 0}},
    fieldRange],
  RegionBoundaryStyle -> None,
  VectorStyle -> {Red, Opacity[.3]},
  VectorColorFunction -> None,
  VectorMarkers -> "Arrow",
  VectorSizes -> Tiny
  ],
 Boxed -> False
 ]
```

== @example-reference-frame-S-prime

```py
margin = 0.5;
length = 10;
extends = 3;
fieldRange = 3;
cylinderSize = 1;
Show[
 Graphics3D[{
   {Arrow[{{0, -length, margin}, {0, length + extends, margin}}]},
   {Thick, Dashing[{Large, Large}],
    Line[{{0, -length, margin}, {0, length, margin}}]},
   {Black,
    Text[Style[
      "\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(+\), \('\)]\)", Bold,
      15, FontFamily -> "NewComputerModernMath"], {0, 0,
      cylinderSize + margin}]},
   {Black,
    Text[Style["\!\(\*SubsuperscriptBox[\(v\), \(+\), \('\)]\)", Bold,
       15, FontFamily -> "NewComputerModernMath"], {0,
      length + extends, cylinderSize + margin}]},
   {Arrow[{{0, length, -margin}, {0, -length - extends, -margin}}]},
   {Thick, Dashing[{Small, Small}],
    Line[{{0, -length, -margin}, {0, length, -margin}}]},
   {Black,
    Text[Style[
      "\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(-\), \('\)]\)", Bold,
      15, FontFamily -> "NewComputerModernMath"], {0,
      0, -cylinderSize - margin}]},
   {Black,
    Text[Style["\!\(\*SubsuperscriptBox[\(v\), \(-\), \('\)]\)", Bold,
       15, FontFamily -> "NewComputerModernMath"], {0, -length -
       extends, -cylinderSize - margin}]},
   {Thick, Dashed, Line[{{0, -length, 0}, {0, length, 0}}]},
   {Opacity[.5],
    Cylinder[{{0, -length, 0}, {0, length, 0}}, cylinderSize]},
   {Thick,
    Line[{{0, 2, cylinderSize*2}, {0, 2.01, cylinderSize*2}}]},
   {Black,
    Text[Style["q", Bold, 15,
      FontFamily -> "NewComputerModernMath"], {0, 2,
      cylinderSize*2 + margin*1.5}]}
   }],
 VectorPlot3D[
  -1/(2 Pi*(x^2 + z^2)^(1/2))*{x, 0, z},
  {x, y, z} \[Element]
   Cylinder[{{0, -length - extends, 0}, {0, length + extends, 0}},
    fieldRange],
  RegionBoundaryStyle -> None,
  VectorStyle -> {Blue, Opacity[.3]},
  VectorColorFunction -> None,
  VectorMarkers -> "Arrow",
  VectorSizes -> Tiny
  ],
 Boxed -> False
 ]
```

== @uniformly-charged-capacitor-S0

```py
planeSideLength = 5;
planeHeight = 2;
margin = 0.5;
Show[
 Graphics3D[{
   {Black,
    Text[Style["+\!\(\*SubscriptBox[\(\[Sigma]\), \(0\)]\)", Bold, 15,
       FontFamily -> "NewComputerModernMath"], {planeSideLength +
       margin/2, planeSideLength + margin/2, 0}]},
   {Black,
    Text[Style["-\!\(\*SubscriptBox[\(\[Sigma]\), \(0\)]\)", Bold, 15,
       FontFamily -> "NewComputerModernMath"], {planeSideLength +
       margin/2, planeSideLength + margin/2, planeHeight}]}
   }],
 Plot3D[
  {0, planeHeight}, {x, 0, planeSideLength}, {y, 0, planeSideLength},
  PlotStyle -> {Opacity[.6]}
  ],
 VectorPlot3D[
  {0, 0, 2},
  {x, y, z} \[Element]
   Hexahedron[{{0, 0, margin}, {planeSideLength, 0,
      margin}, {planeSideLength, planeSideLength, margin}, {0,
      planeSideLength, margin}, {0, 0,
      planeHeight - margin}, {planeSideLength, 0,
      planeHeight - margin}, {planeSideLength, planeSideLength,
      planeHeight - margin}, {0, planeSideLength,
      planeHeight - margin}}],
  RegionBoundaryStyle -> None,
  VectorStyle -> {Blue, Opacity[.45]},
  VectorColorFunction -> None,
  VectorMarkers -> "Arrow",
  VectorSizes -> Small
  ],
 Boxed -> False
 ]
```

== @uniformly-charged-capacitor-S

```py
planeSideLength = 5;
planeSideLengthContracted = 3.5;
planeHeight = 2;
margin = 0.5;
region =
  Hexahedron[{{0, 0, margin}, {planeSideLengthContracted, 0,
     margin}, {planeSideLengthContracted, planeSideLength,
     margin}, {0, planeSideLength, margin}, {0, 0,
     planeHeight - margin}, {planeSideLengthContracted, 0,
     planeHeight - margin}, {planeSideLengthContracted,
     planeSideLength, planeHeight - margin}, {0, planeSideLength,
     planeHeight - margin}}];
Show[
 Graphics3D[{
   {Black,
    Text[Style["+\!\(\*SubscriptBox[\(\[Sigma]\), \(0\)]\)", Bold, 15,
       FontFamily ->
       "NewComputerModernMath"], {planeSideLengthContracted +
       margin/2, planeSideLength + margin/2, 0}]},
   {Black,
    Text[Style["-\!\(\*SubscriptBox[\(\[Sigma]\), \(0\)]\)", Bold, 15,
       FontFamily ->
       "NewComputerModernMath"], {planeSideLengthContracted +
       margin/2, planeSideLength + margin/2, planeHeight}]},
   {Thick,
    Arrow[{{planeSideLengthContracted, planeSideLength,
       planeHeight + margin}, {0, planeSideLength,
       planeHeight + margin}}]},
   {Black,
    Text[Style["\!\(\*SubscriptBox[\(v\), \(0\)]\)", Bold, 15,
      FontFamily ->
       "NewComputerModernMath"], {planeSideLengthContracted/2,
      planeSideLength, planeHeight + margin*1.5}]}
   }],
 Plot3D[
  {0, planeHeight}, {x, 0, planeSideLengthContracted}, {y, 0,
   planeSideLength},
  PlotStyle -> {Opacity[.6]}
  ],
 VectorPlot3D[
  {0, 0, 4},
  {x, y, z} \[Element]
   TransformedRegion[region, TranslationTransform[{-.08, -.08, 0}]],
  RegionBoundaryStyle -> None,
  VectorStyle -> {Blue, Opacity[.45]},
  VectorColorFunction -> None,
  VectorMarkers -> "Arrow",
  VectorSizes -> Small
  ],
 VectorPlot3D[
  {0, 2, 0},
  {x, y, z} \[Element] region,
  RegionBoundaryStyle -> None,
  VectorStyle -> {Red, Opacity[.45]},
  VectorColorFunction -> None,
  VectorMarkers -> "Arrow",
  VectorSizes -> Small
  ],
 Boxed -> False
 ]
```
