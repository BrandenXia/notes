#import "@preview/equate:0.3.1": equate
#import "@preview/physica:0.9.5" : *

#set document(
  title: "Quantum Harmonic Oscillator",
  author: "Branden Xia"
)

#set text(font: "New Computer Modern", size: 13pt)

#set page(
  paper: "us-letter",
  margin: (x: 0.85in, y: 1.2in),
  header-ascent: 37%,
  header: [
    #set text(size: 12pt)
    _Quantum Harmonic Oscillator_
    #h(1fr)
    2024-2025
    #line(length: 100%)
  ],
  numbering: "- 1 -",
)

#set heading(numbering: "1.")
#show heading: set block(above: 1.75em, below: 1em)

#set math.equation(
  numbering: "(1)",
  supplement: "Eq."
)
#show: equate.with(
  number-mode: "label",
)

Quantum harmonic oscillator is a system in Quantum Mechanics similar to the harmonic oscillation, given by $m dv(x, t) = -k x$, in Classical Mechanics.

= Why do we need to study quantum harmonic oscillator?

Although there's no perfect harmonic oscillator in the real world, when considering a second order Taylor Series expansion of the potential energy to approximate the potential energy of a system, we can see that the potential energy of a system can be approximated by a harmonic oscillator.

= Analytic Method

== Setup of the Problem

In Classical Mechanics, the potential energy of a harmonic oscillator is given by:

$ V(x) = 1/2 k x^2 $

By plugging this into the Schrödinger Equation, we have:

$ - hbar / (2m) pdv(Psi, x, 2) + 1 / 2 k x^2 = i hbar pdv(Psi, t) $ <SE>

Since we know that general solutions to the Schrödinger Equation can be written as the linear combination of separable states, we have:

$
  Psi(x,t) &= sum_(n = 1)^oo c_n psi_n (x) exp(- i E_n t / hbar) \
  Psi(x,0) &= sum_(n = 1)^oo c_n psi_n (x)
$

Our goal is to find $psi_n (x)$ that satisfies the time-independent Schrödinger Equation:

$ - hbar^2 / (2m) dv(psi, x, 2) + 1/2 k x^2  psi &= E psi $ <TISE>

== Solving the differential equation

In order to solve @TISE, we first consider the Hermite differential equation:

$ y'' - 2 x y' + 2 n y = 0 $ <Hermite>

The solution to @Hermite can be derived through series expansion, and is given by:

$ H_n (x) = n! sum_(j = 0)^M ((-1)^j (2x)^(n-2j))/(j! (n-2j)!) quad "where" M = cases( n / 2 "if" n "is even" \ (n+1) / 2 "if" n "is odd" ) $ <HermitePolynomial>

For @Hermite to take a similar form as @TISE, we can consider the substitution $y = exp(x^2 / 2) phi$. By making this substitution, we obtain:

$
  y' &= exp(x^2 / 2) (x phi + phi') \
  y'' &= x exp(x^2 / 2) (x phi + phi') + exp(x^2 / 2) (phi + x phi' + phi'') \
  &= exp(x^2 / 2) [ (1+x^2) phi + 2 x phi' + phi'' ]
$

Plugging those into @Hermite, we have:

$
  exp(x^2 / 2) [ (1+x^2) phi + 2 x phi' + phi'' - 2x (x phi + phi') + 2n phi ] &= 0 \
  exp(x^2 / 2) [ phi'' + (2n + 1 -x^2) phi ] &= 0 \
$
$
  phi'' + (2n + 1 -x^2) phi &= 0
$ <HermiteDifferentialEquationWithSubstitution>

Here, we can already see the similar second derivative, constant term, and $x^2$ term taking place in the differential equation.

Since we have $phi = exp(-x^2 / 2) y$, using @HermitePolynomial, we know that the solution to previous differential equation is:

$ phi_n (x) = exp(- x^2 / 2) H_n (x) $ <HermiteFunction>

== Properties of $phi_n (x)$

We can now verify some properties of @HermiteFunction to prove that it can be a solution to the time-independent Schrödinger equation.

+ Mutually Orthogonal
  $
    integral_(-oo)^oo dd(x) phi_n (x) phi_m (x) = integral_(-oo)^oo H_n (x) H_m (x) exp(-x^2) dd(x)
  $

  Since Hermite polynomials are orthogonal with respect to $exp(-x^2)$, we have:
  
  $ integral_(-oo)^oo H_n (x) H_m (x) exp(-x^2) dd(x) = 0 $

+ Normalizable

  $
  integral_(-oo)^oo dd(x) phi_n^2 (x) &= integral_(-oo)^oo dd(x) H_n^2 (x) exp(-x^2) \
  &= 2^n n! sqrt(pi)
  $

== Back to time-independent Schrödinger equation

Going back to @TISE. Let $omega := sqrt(k / m)$, which means $k = m omega^2$, we obtain:

$ - hbar^2 / (2m) dv(psi, x, 2) + 1/2 m omega^2 x^2 psi - E psi = 0 $ <TISEWithSubstitution>

Let $s := sqrt((m omega) / hbar) x$, then $x = sqrt(hbar / (m omega))s$ and $dd(x) = sqrt(hbar / (m omega)) dd(s)$

By Chain Rule for second derivative, we have:

$ dv(psi, x, 2) = dv(,x)(dv(psi, x)) = dd(,) / (sqrt(hbar / (m omega)) dd(s)) (dd(psi) / (sqrt(hbar / (m omega)) dd(s))) = (m omega) / hbar dv(psi, s, 2) $

Then, we can plug this into @TISEWithSubstitution:

$
  - hbar^2 / (2m) (m omega) / hbar dv(psi, s, 2) + 1/2 m omega^2 hbar / (m omega) s^2 psi - E psi &= 0 \
  - (hbar omega)/ 2 dv(psi, s, 2) + 1/2 hbar omega s^2 psi - E psi &= 0 \
  dv(psi, s, 2) - s^2 psi + (2 E) / (hbar omega) psi &= 0
$
$
  dv(psi, s, 2) + ((2E) / (hbar omega) - s^2) psi &= 0
$ <TISEWithSubstitution2>

As we verified already, @HermiteFunction is a solution to @HermiteDifferentialEquationWithSubstitution and satisfies the properties of solution to the time-independent Schrödinger equation.

Notice that the only difference between @TISEWithSubstitution2 and @HermiteDifferentialEquationWithSubstitution is the $(2E) / (hbar omega)$ and $(2n + 1)$ term. Therefore, we can consider:

$ E = E_n = hbar omega (n + 1/2) quad "where" n in bb(N) $

Which allows @TISEWithSubstitution2 to take the same form as @HermiteDifferentialEquationWithSubstitution.

Putting all the substitutions together into @HermiteFunction, we have:

$
  psi_n (x) = A_n phi_n (s)  &= A_n exp(- s^2 / 2) H_n (s) \
  &= A_n exp(- (m omega) / (2 hbar) x^2) H_n (sqrt( (m omega) / hbar ) x)
$

To solve for $A_n$, we normalize $psi_n (x)$:

$
  integral_(-oo)^oo dd(x) abs(psi_n (x))^2 &= integral_(-oo)^oo dd(x) |A_n|^2 H_n^2 (sqrt( (m omega) / hbar ) x) exp(- (m omega) / hbar x^2) \
  1 &= abs(A_n)^2 sqrt( (m omega) / (hbar pi) ) 2^n n! \
  abs(A_n)^2 &= sqrt( (hbar pi) / (m omega) ) 2^(-n) / n! \
  abs(A_n) &= sqrt(2^(-n) / n!) ((hbar pi) / (m omega))^(1/4)
$

$
  Psi(x, t) &= sqrt(2^(-n) / n!) ((hbar pi) / (m omega))^(1/4)
 exp(- (m omega) / (2 hbar) x^2) sum_(n=1)^oo c_n H_n (sqrt( (m omega) / hbar ) x) exp(- i E_n t / hbar) \
  &quad "where" E_n = hbar omega (n + 1/2) "and" omega = sqrt(k / m) \
  &quad "and" c_n = sqrt(2^(-n) / n!) ((hbar pi) / (m omega))^(1/4)
 integral_(-oo)^oo dd(x) Psi(x, 0) H_n (sqrt( (m omega) / hbar ) x) exp(- (m omega) / (2 hbar) x^2) \
$

= Algebraic Method

Recall that we already define $omega := sqrt(k / m)$, from @TISE we have

$ 1/(2m) [ (hbar / i dv(, x))^2 + (m omega x)^2 ] psi = E psi $ <TISESuggestive>

== Ladder Operators

Recall from Algebra 1, we have $u^2 + v^2 = (u + i v) (u - i v)$, we can consider:

$ a_plus.minus := 1 / sqrt(2m) (hbar / i dv(, x) plus.minus i m omega x) $

$
  a_- a_+ &= 1 / (2m) [(hbar / i dv(, x))^2 + (m omega x)^2] + 1/2 hbar omega \
  a_+ a_- &= 1 / (2m) [(hbar / i dv(, x))^2 + (m omega x)^2] - 1/2 hbar omega
$

Therefore, we can rewrite @TISESuggestive as:

$
  (a_- a_+ - 1/2 hbar omega) psi &= E psi \
  (a_+ a_- + 1/2 hbar omega) psi &= E psi
$ <TISELadderOperators>

== Properties of Ladder Operators

Now, we can consider $a_+ psi$ and $a_- psi$. Replacing $psi$ with $a_+ psi$ in @TISELadderOperators, we have:

$
  &quad (a_+ a_- + 1/2 hbar omega) (a_+ psi) \
  &= a_+ (a_- a_+ + 1/2 hbar omega) psi \
  &= a_+ (a_- a_+ -1/2 hbar omega + hbar omega) psi \
  &= a_+ [ (a_- a_+ - 1/2 hbar omega) psi + hbar omega psi ] \
  &= (E + hbar omega)(a_+ psi)
$

We can prove this for $a_- psi$ similarly that it gives energy $E-hbar omega$.

If we consider the state of energy of $psi$, applying the ladder operators is increasing and decreasing the energy of $psi$, like climbing up and down the ladder of energy. Therefore, $a_+$ is called the raising operator and $a_-$ is called the lowering operator.

By instinct, we know that energy can't decrease infinitely, which means that there must be a "ground state", where applying $a_-$ won't give us anything:

$ a_- psi_0 = 0 $

== Solving $psi_0$

Expanding $a_-$, we have:

$
  1 / sqrt(2m) (hbar / i dv(, x) - i m omega x) psi_0 &= 0 \
  hbar / i dv(psi_0, x) - i m omega x psi_0 &= 0 \
  dv(psi_0, x) + (m omega x) / hbar psi_0 &= 0 \
  integral dd(psi_0)/ psi_0 &= - integral (m omega x) / hbar dd(x) \
  ln(psi_0) &= - (m omega) / hbar x^2 / 2 + A_0 \
  psi_0 &= A exp(- (m omega) / (2 hbar) x^2 )
$

Putting this into @TISELadderOperators, we have:

$
  (a_+ a_- + 1/2 hbar omega) psi_0 &= E_0 psi_0 \
  a_+ (a_- psi_0) + 1/2 hbar omega psi_0 &= E_0 psi_0 \
  E_0 &= 1/2 hbar omega
$

To get the excited states, we can continue to apply the raising operator $a_+$:

$ psi_n = A_n (a_+)^n exp(- (m omega) / (2 hbar) x^2 ) $

The corresponding energy is:

$ E_n = (1/2 + n) hbar omega $
