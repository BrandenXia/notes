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

= Circuits I - Ohm's Law

$ abs(Delta V) = I R $

- $abs(Delta V)$ - voltage
- $I$ - current, charge / time
- $R$ - resistance

$
  abs(Delta V) = E l \
  E = abs(Delta V) / l \
  v_D = a tau = F / m dot tau = (E e ) / m dot tau = (abs(Delta V) e) / (l m) tau \
$

Let $v_T$ be the thermal velocity of electrons, and $lambda$ be the "mean free path" - average distance objects travel before colliding, we have:

$
  tau & = lambda / v_T \
  v_D & = (abs(Delta V) e) / (l m) lambda / v_T
$

The current $I$ is given by product of number of charges and $v_D$ for each charge:

$
  I & = n dot v_D \
    & = N A dot e dot (abs(Delta V) e) / (l m) lambda / v_T \
    & = abs(Delta V) ((e^2 N lambda) / (m v_T)) A / l
$

Comparing to Ohm's law, we can identify the resistance:

$
  abs(Delta V) = I R \
  R = (m v_T) / (e^2 N lambda) l / A
$

Usually, we write the resistance in terms of area, length, and conductivity $sigma$:

$
  R = l / (sigma A)
$

Therefore, we can have $sigma$ defined as:

$
  sigma = (e^2 N lambda) / (m v_T)
$

As a result from Thermodynamics, we have:

$
  1 / 2 m v_T^2 & = 3 / 2 k_B T \
            v_T & = sqrt((3 k_B T) / m) \
              R & = sqrt(3 k_B T m) / (e^2 N lambda) l / A
$

which shows that the absolute temperature $T$ must be $0$ for the material to be superconducting.

== Vocab Terms

- Circuit: a closed loop consisting of circuit elements
- Circuit element: anything that adds or removes energy from the circuit
- Current: moving electric charge, $I = dv(q, t)$, measured in Amperes (A)
- Wires: equipotential surfaces connecting circuit elements
- Series circuit: only 1 path for charge to flow
- Parallel circuit: multiple paths for charge to flow

== Circuit Rules

+ Need $Delta V$ for charge to flow
+ Need a path for charge to flow
+ Around any closed loop, $Delta V = 0$ (Kirchhoff's loop rule, energy conservation)
+ At any junction, $I_"in" = I_"out"$ (Kirchhoff's junction rule, charge conservation)
+ Across any resistor, $Delta V = I R$ (Ohm's law)

= Circuit Analysis

Goal: Predict $Delta V$ across and $I$ through resistors.

$->$ Crucial step: Can we "simplify" our model of a circuit?

For resistors in series:

$ R_"eq" = sum_n R_n $

For resistors in parallel:

$ 1/R_"eq" = sum_n 1/R_n $

= Capacitors

- Capacitors are circuit elements that stores energy in electric fields by letting charges accumulate on closely spaced plates.
- Definition:
  $ C = Q / V $
  where $Q$ is charge stored on plates and $V$ is potential difference across plates.

  Measured in Farads ($F$): $1 F = 1 C / V$.
- Capacitors in series:
  $ 1/C_"eq" = sum_n = 1/C_n $
- Capacitors in parallel:
  $ C_"eq" = sum_n C_n $

= Time Dependence in Capacitors

$
              Q(t) & = C V(t) \
  I(t) := dv(Q, t) & equiv dot(Q) = C dv(V, t)
$

This gives the analogous of Ohm's law for capacitors:

#rect[
  $ I = C dv(V, t) $
]

We can also get the inverse relationship:

$
            I(t) & = C dv(V, t) \
           dd(V) & = 1/C I(t) dd(t) \
  integral dd(V) & = integral 1/C I(t) dd(t) \
     V(t) - V(0) & = 1/C integral I(t) dd(t)
$

This gives the relationship between voltage and current for a capacitor:

#rect[
  $ V(t) & = V(0) + 1/C integral I(t) dd(t) $
]

= RC Circuits

How do we analyze circuits?

+ Combine resistors and capacitors into equivalent resistors and capacitors
+ Use KLR and KJR to write equations for $Delta V$ and $I$
+ Use $I-V$ relationships to turn these into diff. eq.s or algebraic eq.s
+ Do the math

== Charging a Capacitor

What do we expect to happen as time passes?

$
  Q(t) ":" "at" t = 0 "," Q & = 0 \
  limits("lim")_(t -> oo) Q & = Q_"max" \
$
$
  I(t) ":" "at" t = 0 "," I & = I_"max" \
  limits("lim")_(t -> oo) I & = 0 \
$
$
  V_R (t) ":" "at" t = 0 "," V_R & = 0 \
     limits("lim")_(t -> oo) V_R & = 0 \
$
$
  V_C (t) ":" "at" t = 0 "," V_C & = 0 \
     limits("lim")_(t -> oo) V_C & = Delta V_B = V_"max"
$

We have the equation:

$
           Delta V_B - V_R - V_C & = 0 \
         Delta V_B - I R - Q / C & = 0 \
  Delta V_B - R dv(Q, t) - Q / C & = 0 \
$

After solving the diff. eq.s, we get:

$ Q(t) = Delta V_B C (1 - e^(-t / (R C))) $

We let $tau = R C$ the "time constant" of the circuit, and let $Q_"max" = Delta V_B C$, which gives:

$ Q(t) = Q_"max" (1 - e^(-t \/ tau)) $

Consequently, we have:

$ I(t) = dv(Q, t) = Q_"max" / tau e^(-t \/ tau) = (Delta V C) / (R C) e^(-t \/ tau) = (Delta V) / R e^(-t \/ tau) $

$ I(0) = I_0 = (Delta V_B) / R $

and similarly:

$
  V_R (t) & = I(t) R = I_0 R e^(-t \/ tau) = Delta V_B e^(-t \/ tau) \
  V_C (t) & = V(0) + 1/C integral_0^t dd(t') I(t') \
          & = Delta V_B (1 - e^(-t \/ tau))
$

== Discharging a Capacitor

$
  Q(t) ":" "at" t = 0 "," Q & = Q_"max" \
  limits("lim")_(t -> oo) Q & = 0 \
$

$
  I(t) ":" "at" t = 0 "," I & = I_"max" \
  limits("lim")_(t -> oo) I & = 0 \
$

$
  V_R (t) ":" "at" t = 0 "," V_R & = V_"max" \
     limits("lim")_(t -> oo) V_R & = 0 \
$

$
  V_C (t) ":" "at" t = 0 "," V_C & = V_"max" \
     limits("lim")_(t -> oo) V_C & = 0 \
$
