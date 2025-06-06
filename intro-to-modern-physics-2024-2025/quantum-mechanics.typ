#import "@preview/tapestry:0.0.4": *

#show: tapestry.with(
  title: "Intro to Modern Physics",
  year: "2024-2025",
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

  #apply-table[
    #table(
      columns: (1fr, 1fr, 1fr),
      table.header[Observable][Operator][Operation],
      $x$, $hat(x)$, $ x dot psi(x, t) $,
      $p$, $p$, $ - i hbar dot pdv(,x) psi(x, t) $,
      $E$, $hat(H)$, $ [1 / (2m) hat(p)^2 + V(x)] psi $,
      $V(x)$, $hat(V)(x)$, $ V(x) psi $
    )
  ]

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
+ Orthodox position / Copenhagen Interpretation - particle was not anywhere (Bohr, most popular among physicists)
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

If we can measure 2 observable at the same time meaning 1 does not impact our ability to measure the other --- “compatible” observables

== Commutator of 2 Ops

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

== Generalized Uncertainty Principle

$ sigma_A^2 sigma_B^2 >= (1 / (2i) expval([hat(A), hat(B)]))^2 $

= The Time Independent Schrödinger Equation

We find $Psi(va(x),t)$ by specifying a potential of $V(va(x))$ by solving the Schrödinger Equation:

How do we solve PDEs? Separation of variables.

$ Psi(x, t) = psi(x, t) dot phi(t) $

$
  pdv(Psi, t) = psi(x) dv(phi, t) quad pdv(Psi, x, 2) = dv(psi, x, 2) dot phi(t)
$

Substituting into the Schrödinger Equation:

$
  - hbar^2 / (2m) dv(psi, x, 2) psi + V(x) psi phi &=  i hbar psi dv(phi, t) \
  - hbar ^2 / (2m) dot 1 / psi + V(x) &= i hbar 1 / psi dv(phi, t) \
$

Can only be true if both sides are equal to a constant $E$:

$ - hbar^2 / (2m) 1 / psi(x) dot dv(psi, x, 2) + V(x) = E $

#rect[
  $ - hbar^2 / (2m) dv(psi, x, 2) + V(x) psi(x) &= E psi(x) $
]

which is the time-independent Schrödinger equation.

$
  i hbar dv(phi, t) &= E phi(t) quad "since" 1 / i = -i \
  dv(phi, t) &= - i E / hbar phi(t) arrow phi(t) = exp(- i E t / hbar)
$

General solutions to S.E take the form:

$
  Psi(x, t) = psi(x) exp(- i E t / hbar)
$

+ Separable solutions are "stationary states"
  $ abs(Psi(x, t))^2 = Psi^*(x,t) Psi(x,t) = abs(psi(x))^2 $
  $
    expval(hat(Q)(x, p)) &= integral_(-oo)^oo dd(x) Psi^*(x,t) hat(Q)(x, pdv(, x)) Psi(x,t) \
    &= integral_(-oo)^oo dd(x) psi^*(x) hat(Q) psi(x) \
  $
+ These are states of definite energy \
  in Q.M., the total energy is given by the "Hamiltonian": $H = p^2 / (2m) + V(x)$
  $ hat(H) = - hbar^2 / (2m) pdv(, x, 2) + V(x) arrow hat(H) psi(x) = E psi(x) $
  $
    expval(hat(H)) &= integral_(-oo)^oo dd(x) psi^*(x) (hat(H) psi(x)) \
    &= E integral_(-oo)^oo dd(x) psi^*(x) psi(x) = E \
    expval(hat(H)^2) &= integral_(-oo)^oo dd(x) psi^*(x) [ hat(H)(hat(H) psi(x)) ] = E^2 \
    sigma_hat(H)^2 &= expval(hat(H)^2) - expval(hat(H))^2 = 0
  $

+ We'll find that T.I.S.E permits an $oo$ number of solutions, each with a different energy $E_n$. \
  We can write the general solutions to the S.E for any potential V(x) as the "superposition" / linear combination of separable states.
  $ Psi(x, t) = sum_(n = 1)^oo c_n psi_n (x) exp( - i E_n t / hbar) $
  We'll find that the coefficients $c_n$ by looking at the boundary conditions.

= Infinite Square Well

$
  V(x) = cases(
    0 quad "if" 0 <= x <= a \
    oo quad "otherwise"
  )
$

T.I.S.E:

$ - hbar^2 / (2m) dv(psi, x, 2) + V(x) psi = E psi $

In the well:

$ - hbar / (2m) dv(psi, x, 2) = E psi $

Take $k := sqrt(2 m E) / hbar$, we have:

$ dv(psi, x, 2) = - k^2 psi => psi(x) = A sin(k x) + B cos(k x) $

Boundary conditions:

+ $psi$ is continuous
+ $dv(psi, x)$ is continuous

$ psi(x=0) = A sin(0) + B cos(0) = 0 => B = 0 $
$ psi(x=a) = A sin(k a) => sin(k a)  $

Distinct solutions:

$ k_n = (n pi) / a, n in bb(N) => k_n^2 = (2 m E_n) / hbar $

#rect[
  $ E_n = (n^2 pi^2 hbar^2) / (2 m a^2) $
  $ psi_n (x) = sqrt(2 / a) sin((n pi) / a x) $
]

$n = 1$: "ground state" \
$n != 1$: "excited states"

== Important properties of ${psi_n (x)}$

+ They're mutually orthogonal
  $ integral_0^a dd(x) psi_n^* (x) psi_m (x) = cases(
    0 quad "if" n != m \
    1 quad "if" n = m
  ) $
+ They're "complete":
  $ f(x) = sum_(n = 1)^oo c_n psi_n (x) = sqrt(2 / a) sum_(n = 1)^oo c_n sin( (n pi) / a x) $
  $ Psi(x, t) = sum_(n=1)^oo c_n psi_n (x) exp(- (i E_n t) / hbar) $
  $ integral dd(x) psi_m^* (x) Psi(x, 0) = sum_(n=1)^oo c_n integral dd(x) psi_m^* (x) psi_n (x) = sum_(n=1)^oo c_n delta_(m n) = c_m $
  $ "where" delta_(m n) = cases(
    0 quad "if" m != n \
    1 quad "if" m = n
  ) $
  For the infinite square well:
  $ Psi(x, t) = sqrt(2 / a) sum_(n=1)^oo c_n sin((n pi) / a x) exp( - (i n^2 pi^2 hbar t) / (2 m a^2) ) $
  $ c_n = integral dd(x) psi_n^* (x) Psi(x, 0) $

== Interpretation of $c_n$

$ abs(c_n)^2 = "probability that a measurement of the energy yields" E_n $

+
  $ sum_(n=1)^oo abs(c_n)^2 = 1 $
+
  $ expval(H) = sum_(n=1)^oo abs(c_n)^2 E_n quad "(expectation value of the energy)" $
