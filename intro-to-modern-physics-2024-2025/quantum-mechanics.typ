#import "@preview/tapestry:0.0.3": *

#show: tapestry.with(
  title: "Intro to Modern Physics",
  year: "2024-2025",
)

#set text(
  font: "libertinus serif"
)

#import "@preview/physica:0.9.5" : expval

= Schrödinger Equation

Quantum state of an object is defined by “wave function”: $psi (va(x), t)$

$
  - hbar^2 / (2m) grad^2 psi + v(va(x)) psi = i hbar pdv(psi, t)
$

= Postulates of QM

+ The state of a QM system is completely specified by the wave function, $psi (va(x), t)$. $psi$ has the property that

  $
    integral_(-oo)^oo dd(x) psi^* psi = 1
  $

+ To every observable in QM, there is a corresponding Hermitian operator:

  #table(
    columns: (1fr, 1fr, 1fr),
    align: center + horizon,
    table.header[*Observable*][*Operator*][*Operation*],
    $x$, $hat(x)$, $ x dot psi(x, t) $,
    $p$, $p$, $ - i hbar dot pdv(,x) psi(x, t) $,
    $E$, $hat(H)$, $ [1 / (2m) hat(p)^2 + V(x)] psi $,
    $V(x)$, $hat(V)(x)$, $ V(x) psi $
  )

+ Any measurement of the observable $hat(A)$, we only ever observe the eigenvalues, $a$, that satisfy

  $ hat(A) psi = a psi $

  The values of dynamical variables are quantized.

+ If the system is in a state described by $psi$, then the average/expected value of the observable corresponding to $hat(A)$ is:

  $ expval(A) = integral_(-oo)^oo dd(x) psi^* hat(A) psi $

+ The wave function evolves in time according to the time-dependent Schrödinger Equation:

  $ hat(H) psi = i hbar pdv(psi, t) (i hbar pdv(, t) tilde E) $

+ Pauli Exclusion Principle: electrons can’t occupy the same space

= Deriving Schrödinger Equation of One Dimension

The electric field must obey wave equation:

$ E(x, t) = E_0 e^(i (k x - omega t)) "satisfy" pdv(E, x, 2) = 1 / c^2 pdv(E, t, 2) $

Since:

$ pdv(E, x, 2) = - E_0 k^2 e^(i(k x - omega t)) "and" pdv(E, t, 2) = - E_0 omega^2 e^(i(k x - omega t)) $

The relationship between $k$ and $omega$ is:

$ k^2 = omega^2 / c^2 $

Given:

$ E = hbar omega "and" p = hbar k $

By substitution, we have:

$ E = E_0 e^(i / hbar (p x - E t)) $

Applying the wave equation, we get:

$
  (pdv(, x, 2) - 1 / c^2 pdv(, t, 2)) E &= 0 \ 
  - E_0 p^2 / hbar^2 e^(i / hbar (p x - E t)) + E_0 E^2 / (hbar^2 c^2) e^(i / hbar (p x - E t)) &= 0 \
  -E_0 / hbar^2 e^(i / hbar (p x - E t)) (E^2 / c^2 - p^2) &= 0 \
  E^2 / c^2 - p^2 &= 0 \
  E^2 &= p^2 c^2
$

When modify wave equation to account for massive, relativistic objects, we have Klein-Gordon equation:

$ (pdv(, x, 2) - 1 / c^2 pdv(, t, 2) - (m^2 c^2) / hbar^2) psi = 0 $

Plugging in electric field and swap $E -> psi$:

$
  (pdv(, x, 2) - 1 / c^2 pdv(, t, 2) - (m^2 c^2) / hbar^2) (psi_0 e^(i / hbar (p x - E t))) &= 0 \
  - p^2 / hbar^2 psi + E^2 / (hbar^2 c^2) psi - (m^2 c^2) / hbar^2 psi &= 0 \
  p^2c^2 + m^2 c^4 &= E^2
$

which is the relativistic energy-momentum relation.

Consider the non-relativistic limit $p^2 << m^2 c^2$:

$
  psi &= psi_0 exp(i / hbar [p x - (p^2 c^2 + m^2 c^4)^(1 / 2) t]) \
  &= psi_0 exp(i / hbar [p x - m c^2 ( (p^2 c^2) / (m^2 c^4) + 1 )^(1/2) t]) \
  &approx psi_0 exp(i / hbar [p x - m c^2 ( 1 / 2 (p^2 c^2) / (m^2 c^4) + 1) t]) "using" (1 + x)^n approx 1 + n x \
  &= psi_0 exp(i / hbar [ p x - (p^2 / (2m) + m c^2) t ]) \
  &= psi_0 exp(- i / hbar m c^2 t) exp(i / hbar (p x - cal(T) t)) \
  &"where" cal(T) = p^2 / (2m) "(classical kinetic energy)"
$

$
  psi &= psi_0 exp(- i / hbar m c^2 t) phi \
  "where" phi &= exp(i / hbar (p x - cal(T) t)) \
$

$
  pdv(psi, t, 2) &= pdv(, t) pdv(psi, t) \
  &= pdv(, t) (- i / hbar m c^2 exp(- i / hbar m c^2 t) phi + exp(- i / hbar m c^2 t) pdv(phi, t)) \
  &= - (m^2 c^4) / hbar^2 exp(- i / hbar m c^2 t) phi - (2i) / hbar m c^2 exp(- i / hbar m c^2 t) pdv(phi, t) \
  &quad + exp(- i / hbar m c^2 t) pdv(phi, t, 2)
$

Plugging into the Klein-Gordon equation:

$
  pdv(psi, x, 2) + (m^2 c^2) / hbar^2 exp(- i / hbar m c^2 t) phi + (2i) / h m exp(- i / hbar m c^2 t) pdv(phi, t) \
  quad - 1 / c^2 exp(- i / hbar m c^2 t) pdv(phi, t, 2) - (m^2 c^2) / hbar^2 exp(- i / hbar m c^2 t) phi &= 0 \
  pdv(psi, x, 2) + (2i) / hbar m exp(- i / hbar m c^2 t) pdv(phi, t) - 1 / c^2 exp(- i / hbar m c^2 t) pdv(phi, t, 2) &= 0
$

Since the term with $c^(-n)$ is really small, we have:

$
  exp(- i / hbar m c^2 t) pdv(phi, x, 2) + (2i) / hbar m exp(- i / hbar m c^2 t) pdv(phi, t) &= 0 \
  pdv(phi, x, 2) &= - (2 m i) / hbar pdv(phi, t) \
  - hbar^2 / (2m) pdv(phi, x, 2) &= i hbar pdv(phi, t)
$

which is Schrödinger equation of one dimension.

= Probability

$ integral_a^b dd(x) abs(psi(x, t))^2 = "prob. of finding the particles in" [a, b] $

= Where was the particle before we measure it?

+ Realist position: position was near $c$ (Einstein's position)
  - QM is incomplete
+ Orthodox position / Copenhagen Interpretation - particle wasn’t anywhere (Bohr, most popular among physicists)
  - something peculiar about “measurement”
+ Agnostic position - dismiss the question as metaphysics

1960s: John Bell shows there’s an experimental difference between the realist and orthodox position

- Bell’s Theorem
- Orthodox position is experimentally confirmed

= Normalization

$psi$ is a solution to the Schrödinger equation.

$A psi$ will also be a solution, where $A in bb(C)$

Normalization is the process of fixing $A$ to have definite value:

$ abs(A)^2 integral_(-oo)^oo dd(x) psi^* psi = 1 $

= Momentum Operator

$
  expval(x) &= integral_(-oo)^oo dd(x) psi^* x psi \
  dv(expval(x), t) &= integral_(-oo)^oo dd(x) pdv(, t) (x psi^* psi) &= (i hbar) / m integral_(-oo)^oo dd(x) x pdv(, t)(psi^* dv(psi, x) + psi dv(psi^*, x)) \
  expval(v) &= - (i hbar) / m integral_(-oo)^oo dd(x) psi^* pdv(, x) psi \
  expval(p) &= - i hbar integral_(-oo)^oo dd(x) psi^* pdv(, x) psi \
$

If we can measure 2 observable at the same time meaning 1 doesn’t impact our ability to measure the other --- “compatible” observables

= Commutator of 2 Ops

$
  [hat(A), hat(B)] = hat(A) hat(B) - hat(B) hat(A) = cases(
    = 0 "obs. are compatible" \
    != 0 "obs. are incompatible"
  )
$

= Canonical Commutation Relation

$ [hat(x), hat(p)] = hat(x) hat(p) - hat(p) hat(x) = i hbar $

$ [hat(x), hat(x)^n] = 0, [hat(p), hat(p)^n] = 0, [E, t] != 0 $

= Heisenberg Uncertainty Principle

$ sigma_x sigma_p >= hbar / 2 $

= Generalized Uncertainty Principle

$ sigma_A^2 sigma_B^2 >= (1 / (2i) expval([hat(A), hat(B)]))^2 $
