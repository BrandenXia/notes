#import "@preview/equate:0.3.1": equate
#import "@preview/physica:0.9.8": *

#let title = [Integration by Substitution with multiple variables]
#set document(
  title: title,
  author: "Branden Xia",
)

#set text(font: "New Computer Modern", size: 13pt)

#set page(
  paper: "us-letter",
  margin: (x: 0.85in, y: 1.2in),
  header-ascent: 37%,
  header: [
    #set text(size: 12pt)
    _ #title _
    #h(1fr)
    Linear Algebra 2025-2026
    #line(length: 100%)
  ],
  numbering: "1",
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

#let statement(body, tag: "Statement") = {
  v(8pt)
  set block(above: 0.8em, below: 0.5em)
  [
    #text(
      weight: "bold",
    )[_ #tag._]
    #body
  ]
  v(8pt)
}

#let definition(body) = statement(body, tag: "Definition")
#let theorem(body) = statement(body, tag: "Theorem")
#let lemma(body) = statement(body, tag: "Lemma")
#let proof(body) = {
  block[
    #statement(body, tag: "Proof")
    #place(bottom + right, dy: -0.6em, $qed$)
  ]
}

#outline()

= Introduction

Integration by substitution is frequently used in integrations to simplify the integrand and make the integral easier to evaluate. Typical examples are trig-substitution and the Gaussian integral. In this project, I'll first explore an example in 2D, and then generalize it to $n$-dimensions. After that, I'll try to explore some applications of this formula when working on integrals.

= Notations and Definitions

Before diving into the main content, let's clarify some notations and definitions that will be used throughout this project.

== Partial Derivative

Partial derivative is defined as the derivative of a multi-variable function with respect to one variable while keeping the other variables constant.

$
  pdv(f, x_i)(vb(x)_0) = lim_(h -> 0) frac(f(vb(x)_0 + h dot vb(e)_i) - f(vb(x)_0), h)
$

== Jacobian

The Jacobian matrix is a matrix of all first-order partial derivatives of a vector-valued function.

Given a function $vb(f): bb(R)^m -> bb(R)^n$, its Jacobian an $n times m$ matrix:

$
  bold(upright(J)_f) = mat(
    delim: "[",
    pdv(f_1, x_1), pdv(f_1, x_2), dots.c, pdv(f_1, x_m);
    pdv(f_2, x_1), pdv(f_2, x_2), dots.c, pdv(f_2, x_m);
    dots.v, dots.v, dots.down, dots.v;
    pdv(f_n, x_1), pdv(f_n, x_2), ..., pdv(f_n, x_m)
  )
$

== Integral over $n$-dimensional Region

An integral over an n-dimensional region can be defined as the limit of Riemann sums:

$
  integral_D f(vb(x)) dd(vb(x)) = lim_(max V_i -> 0) sum_i f(vb(x)_i) dot V_i
$

== $C^1$ Transformation

A $C^1$ transformation is defined by a function $vb(phi): U -> bb(R)^n$ where $U$ is an open set in $bb(R)^n$ with the following properties:

+ The function $vb(phi)$ is continuously differentiable on $U$, which means all first-order partial derivatives of $vb(phi)$ exist and are continuous on $U$.

+ The function $vb(phi)$ is injective on $U$, which means for any two distinct points $vb(u)_1, vb(u)_2$ in $U$, we have $vb(phi)(vb(u)_1) != vb(phi)(vb(u)_2)$.

== Clairaut's Theorem <clairaut>

#theorem[(Clairaut's Theorem)
  Given a function $f: bb(R)^n -> bb(R)$ who has continuous second-order partial derivatives, we have:

  $
    pdv(, x_i, x_j) f(vb(x)) = pdv(, x_j, x_i) f(vb(x))
  $
]

== Existence of Potential Function <existence-of-potential-function>

#theorem[
  Given two functions $P, Q: U -> bb(R)$ where $U$ is an open set in   $bb(R)^n$. If they satisfy the condition:

  $ pdv(Q, x) = pdv(P, y) $

  Then there exists a function $f: U -> bb(R)$ such that:

  $ pdv(f, x) = P "and" pdv(f, y) = Q $

  This can be derived from Clairaut's Theorem (@clairaut).
]

= Deriving the Formula

Before working on the general case, let's consider some cases in lower dimensions.

== Example: 2D Coordinate Transformation

Consider three points: $(u_0, v_0)$, $(u_0 + difference(u), v_0)$, and $(u_0, v_0 + difference(v))$. They can define a rectangle on the $u v$-plane. Their volume can be represented by two vectors:

$ vb(u) = vec(difference(u), 0) "and" vb(v) = vec(0, difference(v)) $

Their volume is product of the lengths of the two vectors:

$
  V_(u v) = difference(u) dot difference(v)
$

Consider a $C^1$ transformation from the $u v$-plane to the $x y$-plane:

$
  vb(T)(u, v) = lr(chevron.l x(u, v), y(u, v) chevron.r)
$

The two vectors on the $x y$-plane corresponding to the two vectors on the $u v$-plane are given by linear approximations:

$
  vb(T)(u_0 + difference(u), v_0) - vb(T)(u_0, v_0) approx pdv(vb(T), u)(u_0, v_0) dot difference(u) \
  vb(T)(u_0, v_0 + difference(v)) - vb(T)(u_0, v_0) approx pdv(vb(T), v)(u_0, v_0) dot difference(v)
$

Therefore, the volume on the $x y$-plane is given by the determinant of the matrix formed by these two vectors:

$
  V_(x y) approx abs(
    det mat(
      delim: "[",
      pdv(x, u)(u_0, v_0) dot difference(u), pdv(x, v)(u_0, v_0) dot difference(v);
      pdv(y, u)(u_0, v_0) dot difference(u), pdv(y, v)(u_0, v_0) dot difference(v)
    )
  ) approx abs(det bold(upright(J)_T)) dot difference(u) difference(v)
$

where $bold(upright(J)_T)$ is the Jacobian matrix of the transformation $vb(T)$.

Now, consider a double integral on the $x y$-plane:

$
  integral_D f(x, y) dd(A) & = lim_(max V_(x y) -> 0) sum_i f(x_i, y_i) dot V_(x y)_i \
  & = lim_(difference(u) -> 0) lim_(difference(v) -> 0) sum_i f(x(u_i, v_i), y(u_i, v_i)) dot abs(det bold(upright(J)_T)(u_i, v_i)) dot difference(u) difference(v) \
  & = integral_D' f(x(u, v), y(u, v)) dot abs(det bold(upright(J)_T)(u, v)) dd(u, v) \
$

where $D'$ is the region on the $u v$-plane that corresponds to the region $D$ on the $x y$-plane under the transformation $vb(T)$.

== General Case

#theorem[
  (Change of variable) Let $vb(phi): U -> bb(R)^n$ be a $C^1$ transformation where $U$ is an open set in $bb(R)^n$, $f: bb(R)^n -> bb(R)$ be a continuous function, we have:
  $
    integral_(vb(phi)(U)) f(vb(v)) dd(vb(v)) = integral_U f(phi(vb(u))) dot abs(det bold(upright(J)_phi)(vb(u))) dd(vb(u))
  $
]

The proof of this theorem follows the same idea as the 2D case, and can be proven similarly.

= Application: Simplifying Integral

Now let's apply the formula derived above to derive some interesting results.

Given a function $f: bb(R) -> bb(R)$, whose anti-derivative $F$ is known, and another function $g: bb(R)^n -> bb(R)$, whose invertible with respect to at least one variable $u_j$. Let $D$ be an open set in $bb(R)^n$. Consider the following integral:

$ integral_D ( f compose g )(vb(v)) dd(vb(v)) $

#rect[
  Note that we can safely assume $g$ is dependent on all dimensions, since, if there exists a dimension $j$ that $g$ is independent of, we can define $g': bb(R)^(n-1) -> bb(R)$ as following:

  $
    g'(vb(x)) = g(vb(x) + 0 dot vb(e_j)) "where" vb(x) in bb(R)^(n-1)
  $

  Similarly, the integral can be rewritten as:

  $
    integral_D (f compose g)(vb(v)) dd(vb(v)) & = integral_u_k dd(u_k) integral_(u_i, i != k) (f compose g)(sum_(i != k) v_i vb(e_i)) dd(u_i) \
    & = integral_u_k dd(u_k) integral_(D') (f compose g)(vb(v')) dd(vb(v')) \
  $
]

It might or might not be easy to evaluate this integral directly. However, let's consider a $C^1$ transformation $vb(phi): U -> D$ where $U$ is an open set in $bb(R)^n$, such that $vb(phi)(U) = D$. By the change of variable formula, we have:

$
  integral_D ( f compose g )(vb(v)) dd(vb(v)) = integral_U ( f compose g compose vb(phi) )(vb(u)) dot abs(det bold(upright(J)_vb(phi))(vb(u))) dd(vb(u))
$

Notice if we have a good choice of $vb(phi)$ with the following properties:

$
  cases(
    ( g compose vb(phi) )(vb(u)) = h(u_i),
    abs(det bold(upright(J)_vb(phi))(vb(u))) = h'(u_i),
  ) quad "where" h: bb(R) -> bb(R)
$

We can simplify the integral to:

$
  integral_U ( f compose g compose vb(phi) )(vb(u)) dot abs(det bold(upright(J)_vb(phi))(vb(u))) dd(vb(u)) & = integral_U ( f compose h )(u_i) dot h'(u_i) dd(vb(u)) \
  & = integral_(u_k, k != i) dd(u_k) integral_(u_i) ( f compose h )(u_i) dot h'(u_i) dd(u_i) \
  & = integral_(u_k, k != i) evaluated(F(h(u_i)))_("boundary of" u_i) dd(u_k) \
$

Now, we have reduced the problem to evaluating a single-variable integral. The only challenge left is to find a good $vb(phi)$ that satisfies the properties mentioned above.

Now, let's look at the properties of $vb(phi)$ carefully. Since $h(x_i)$ and $h'(x_i)$ is on the right hand side of the equations, we can rewrite the equations into a differential equation:

$
  abs(det bold(upright(J)_vb(phi))) = pdv(h, u_i) = pdv(, u_i) (g compose vb(phi))
$

At the first glance, this seems to be a complicated PDE. So let's add some more constraints:

$
  vb(phi)(vb(u)) = sum_(i != j) u_i vb(e_i) + psi(vb(u)) vb(e_j) "where" psi: U -> bb(R)
$

This means that the transformation only affects the $j$th dimension, while keeping other dimensions unchanged.

With this constraint, the Jacobian matrix becomes:

$
  bold(upright(J)_vb(phi)) = mat(
    delim: "[",
    1, 0, dots.c, 0;
    0, 1, dots.c, 0;
    dots.v, dots.v, dots.down, dots.v;
    pdv(psi, u_1), pdv(psi, u_2), dots.c, pdv(psi, u_n);
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.c, 1
  )
$

According to the properties of determinants, we have:

$
  det bold(upright(J)_vb(phi)) = pdv(psi, u_j)
$

Therefore, the PDE becomes:

$
  pdv(psi, u_j) = pdv(, u_i) (g compose vb(phi))
$

== 2D Case

Let's consider a specific example when $n = 2$, $i = 1$, and $j = 2$ to intuitively understand the solution.

Now, the PDE becomes:

$
  pdv(psi, u_2) & = pdv(, u_1) (g(u_1, psi(u_1, u_2))) \
  pdv(psi, u_2) & = pdv(g, x)(u_1, psi(u_1, u_2)) + pdv(g, y)(u_1, psi(u_1, u_2)) dot pdv(psi, u_1)
$

Its characteristic equations are given by:

$
  dd(u_2) / 1 = dd(u_1) / (- partial_y g(u_1, psi(u_1, u_2) ) ) = dd(psi) / (partial_x g(u_1, psi(u_1, u_2) ) )
$

Now we need a specific example of $g$. Consider the function:

$ g(x, y) = x^2 + y^2 $

Now, the characteristic equations become:

$
  dd(u_2) / 1 = dd(u_1) / (- 2 psi(u_1, u_2)) = dd(psi) / (2 u_1)
$

The second and third terms give us the following ODE:

$
  2 u_1 dd(u_1) = - 2 psi dd(psi)
$

Integrating both sides, we have:

$
  integral 2 u_1 dd(u_1) & = integral 2 psi dd(psi) \
           u_1^2 + psi^2 & = C_1
$

Similarly, we can obtain:

$ 2u_2 + arctan(u_1 / psi) = C_2 $

Thus, the solution of the PDE is given by:

$ G(u_1^2 + psi^2, 2u_2 + arctan(u_1 / psi)) = 0 $

where $G$ is an arbitrary function with continuous first-order partial derivatives.

Now, let $G(x, y) = x y$, this gives us:

$ (u_1^2 + psi^2) dot (2u_2 + arctan(u_1 / psi)) = 0 $

Notice that the first part in the product is always non-negative, and equals to zero only when both $u_1$ and $psi$ equal to zero. Therefore, assuming it's non-zero, we have:

$
  2u_2 + arctan(u_1 / psi) & = 0 \
         arctan(u_1 / psi) & = -2u_2 \
                 u_1 / psi & = -tan(2u_2) \
                       psi & = -u_1 cot(2u_2) \
         vb(phi)(u_1, u_2) & = lr(chevron.l u_1, -u_1 cot(2u_2) chevron.r)
$

To verify the solution, we can compute the determinant of its Jacobian:

$
  det bold(upright(J)_vb(phi)) (u_1, u_2) & = mdet(1, 0; -cot(2u_2), 2 u_1 csc^2(2 u_2)) = 2 u_1 csc^2(2 u_2)
$

And compute $g compose vb(phi)$:

$
  g compose vb(phi)(u_1, u_2) & = u_1^2 + (-u_1 cot(2u_2))^2 = u_1^2 csc^2(2u_2) \
$

Plugging them into the PDE, we have:

$ pdv(, u_1) (g compose vb(phi))(u_1, u_2) = 2 u_1 csc^2(2u_2) = det bold(upright(J)_vb(phi))(u_1, u_2) $

which confirms our solution.
