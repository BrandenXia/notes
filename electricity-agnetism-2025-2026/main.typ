#import "@preview/tapestry:0.0.4": *

#set page(
  numbering: "1",
)

#show: tapestry.with(
  title: "Advance Physics: Electricity and Magnetism",
  year: "2025-2026",
)

= Textbook

- Fundamental of Physics, Halliday, Resnick, Walker
- Intro to Electrodynamics, Griffiths
- Electricity and Magnetism, Purcell and Morin

= Electrostatics I - Coulomb's Law

Object "participate" in electric forces when they have electric charge. The electric force between two point charges is given by Coulomb's law:

- electric charge can be $(+)$ or $(-)$
  - electric force can be attractive or repulsive

#align(center)[
  #table(
    columns: (auto, auto, auto),
    [0], [0], [none],
    [+], [+], [repel],
    [-], [-], [repel],
    [+], [-], [attract],
  )
]

== Coulomb's Law

$
  va(F) = 1 / (4 pi epsilon_0) ( q_1 q_2 ) / r^2 dot hat(r)
$

- $epsilon_0$ - "permittivity of free space"
  $quad approx 8.85 times 10^(-12) C^2 N^(-1) m^(-2)$
- $q$ - electric charge, $[q] = C$
- $r$ - the distance between the two charges
- $hat(r)$ - unit vector that points between charges

== The Principle of Superposition

This principle tells us the interaction between 2 charges is unaffected by the presence of any other charges.

$
  va(F)_("total", q) = sum_i va(F)_(q, q_i)
$

= Electrostatics II - The Electric Field

Imagine that N static charges $q_i$ that are fixed in space. We do have a "test charge" $Q$ that we are interested in. We could compute the force on a test charge.

$
  va(F) & = 1/(4 pi epsilon_0) sum_(i=1)^N (Q q_i) / r_i^2 hat(r_i) \
        & = Q sum_(i=1)^N 1/ (4 pi epsilon_0) (q_i) / r_i^2 hat(r_i)
$

We define the electric field $va(E)$ for discrete charges as the force per unit charge:

$
  va(E)(va(r)) = 1 / (4 pi epsilon_0) sum_(i=1)^N (q_i) / r_i^2 hat(r_i)
$

For continuous charge distributions, we can write the electric field as an integral:

$
  va(E)(va(r)) = 1 / (4 pi epsilon_0) integral dd(q) / r^2 hat(r)
$

- Along a line: $dd(q) = lambda dd(l)$
  - $lambda$ is the "linear charge density"
- Along a surface: $dd(q) = sigma dd(A)$
  - $sigma$ is the "surface charge density"
- Along a volume: $dd(q) = rho dd(V)$
  - $rho$ is the "volume charge density"

= Electrostatics III - Gauss's Law

- New concept - flux
  - flux is a measure of how much a vector field "flows" through a surface

Define the flux as:
$
  Phi := integral dd(va(A)) dot va(v)
$

Consider a closed surface, the net flux $equiv$ difference between the flux entering and leaving.

== Gauss's Law

$
  integral.surf dd(va(A)) dot va(E) = Q_"encl." / epsilon_0
$

- always true
  - only helpful for symmetric layouts - spherical, cylindrical, planar

= Electrostatics IV - Conductors & Insulators

- Conductors are materials where charges are free to flow
  The charges rearrange themselves in response to the presence of an external electric field. Inside a conductor, $va(E)_"net" = 0$.
- Insulators are materials where charges cannot flow freely.

= Electrostatics V - Electric Potential

Recall the work done by a force $W = integral dd(va(x)) dot F$

- conservative force $W$ is "path-independent" $=> integral.cont dd(va(x)) dot F = 0$
  - conservative force *conserves* energy

For conservative forces:

$ va(F) = - grad va(U) $

where $va(U)$ is the potential energy.

We're interested in forces on arbitrary charges, $q$, $va(F) = q va(E)$

We can write the electric field as the gradient of a scalar potential:

$ va(E) = - grad V $

where $V$ is the electric potential.

$ U_"elec" = q V $

+ $V$ is the potential energy per unit charge
  - it's the work needed per charge to move a test charge from a reference point (usually $infinity$) to a specific point in the field
  - unit $[v] = J / C equiv 1 "volt"$
+ The electric potential as a contour map of the electric field
  - We can define "equipotential surfaces" where the potential is constant
  - The electric field points perpendicular to these equipotential surfaces, pointing from high to low

Another nice property: the potential obeys the principle of superposition:

$ V_"net" = sum_i V_i $

== How do we compute the potential?

$
  V(va(r)) := - integral_O^va(r) dd(va(l)) dot va(E)(va(r)')
$

where $O$ is an agreed upon reference point where $V(O) = 0$. (Exception: doesn't work for infinite charge distributions)

If we don't know $va(E)$, but do know the charge distribution:

$
    "pt. charges": & V = 1 / (4 pi epsilon_0) sum_i q_i / norm(va(r)_i) \
  "charge distr.": & V = 1 / (4 pi epsilon_0) integral dd(q) / norm(va(r)) \
$

- line charge: $dd(q) = lambda dd(l)$
- surface charge: $dd(q) = sigma dd(A)$
- volume charge: $dd(q) = rho dd(tau)$
