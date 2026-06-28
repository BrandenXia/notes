#import "@preview/tapestry:0.0.4": *
#import "@preview/physica:0.9.8": iprod

#set page(
  numbering: "1",
)

#show: tapestry.with(
  author: "Branden Xia",
  title: "Calculus on Manifolds",
  year: "Summer 2026",
)

#let titled(body, name, label) = [
  *#name #label.*
  #block(inset: (left: 1em, bottom: 0.5em))[
    #body
  ]
]
#let theorem(label, body) = titled(body, "Theorem", label)
#let problem(label, body) = {
  set enum(numbering: "(a)", indent: 1em)
  titled(body, "Problem", label)
}

#let proof(body) = block({
  set enum(numbering: "1.", indent: 0.5em)
  [_Proof._ ]
  h(0.5em)
  body
  box(width: 0pt)
  h(1fr)
  sym.wj
  sym.space.nobreak
  $qed$
})
#let solution(body) = block({
  [_Solution._ ]
  h(0.5em)
  body
})

= Functions on Euclidean Space

#theorem[1-1 (1)][
  If $x in RR^n$, $abs(x) >= 0$, and $abs(x) = 0$ iff $x = 0$.

  #proof[
    $abs(x) = sqrt(sum_(i=1)^n (x^i)^2)$. We know that $sqrt(x) >= 0$ for all $x >= 0$, which proves the first part. For the second part, if $abs(x) = 0$, then $sum_(i=0)^n (x^i)^2 = 0$. Since each term in the sum is non-negative, each term must be zero. Therefore, $x^i = 0$ for all $i$, which implies $x = 0$. The other direction is trivial.
  ]
]

#theorem[1-2 (3)][
  If $x in RR^n$, $iprod(x, x) >= 0$, and $iprod(x, x) = 0$ iff $x = 0$.
  (positive definiteness)

  #proof[
    $ iprod(x, x) = sum_(i=1)^n (x^i)^2 = abs(x)^2 >= 0 quad "by" bold("Theorem 1-1 (1)") $

    The proof of the second part can be done in the same way.
  ]
]

#theorem[1-2 (4)][
  If $x in RR^n$, $abs(x) = sqrt(iprod(x, x))$.

  #proof[
    $ abs(x) = sqrt(sum_(i=1)^n (x^i)^2) = sqrt(iprod(x, x)) $
  ]
]

#problem[1-1][
  Prove that $abs(x) <= sum_(i=1)^n abs(x^i)$.

  #proof[
    Since the function $x |-> x^2$ is increasing, it suffice to prove that $abs(x)^2 <= (sum_(i=1)^n abs(x^i))^2$. We have:

    $
      abs(x)^2 = sum_(i=1)^n (x^i)^2 <= sum_(i=1)^n (x^i)^2 + 2 sum_(1 <= i < j <= n) abs(x^i) abs(x^j) = (sum_(i=1)^n abs(x^i))^2
    $
  ]
]

#problem[1-2][
  When does equality hold in *Theorem 1-1 (3)*, which states that $abs(x + y) <= abs(x) + abs(y)$ where $x, y in RR^n$?

  #solution[
    The equality holds only when there exists $c in RR$ so that $c >= 0$ and $x = c y$.
  ]

  #proof[
    It's easy to show that the equality holds given the condition. For the other direction, we have:

    $ abs(x + y)^2 = sum_(i=1)^n (x^i + y^i)^2 = sum_(i=1)^n (x^i)^2 + 2 sum_(i=1)^n x^i y^i + sum_(i=1)^n (y^i)^2 $
    and
    $ (abs(x) + abs(y))^2 = sum_(i=1)^n (x^i)^2 + 2abs(x)abs(y) + sum_(i=1)^n (y^i)^2 $

    Since we know that they are equal, we can conclude that:
    $ abs(x)abs(y) = sum_(i=1)^n x^i y^i $

    Recall that *Theorem 1-1 (2)* said that $abs(x)abs(y) = abs(sum_(i=1)^n x^i y^i)$ iff $x$ and $y$ are linearly dependent. However, we don't have the absolute value on RHS. Notice that LHS is always non-negative. Therefore, R'S also needs to be non-negative. This only holds when $x^i$ and $y^i$ have the same sign. When they are linearly dependent and have the same sign, we can conclude that $x = c y$ for some $c >= 0$.
  ]
]

#problem[1-3][
  Prove that $abs(x - y) <= abs(x) + abs(y)$. When does the equality hold?

  #proof[
    Notice that it suffice to prove that $abs(x - y)^2 <= (abs(x) + abs(y))^2$. We have:

    $
      abs(x - y)^2 & = sum_(i=1)^n (x^i - y^i)^2 \
                   & = sum_(i=1)^n (x^i)^2 + sum_(i=1)^n (y^i)^2 - 2 sum_(i=1)^n x^i y^i \
                   & <= sum_(i=1)^n (x^i)^2 + sum_(i=1)^n (y^i)^2 + 2 sum_(i=1)^n abs(x^i)abs(y^i) \
                   & = abs(x)^2 + abs(y)^2 + 2abs(x)abs(y) \
                   & = (abs(x) + abs(y))^2
    $
  ]

  Given the solution to previous problem, it's quite trivial that the equality holds only when there exists $c in RR$ so that $c <= 0$ and $x = c y$.
]

#problem[1-4][
  Prove that $abs(abs(x) - abs(y)) <= abs(x - y)$.

  #proof[
    It suffice to prove that $(abs(x) - abs(y))^2 <= abs(x - y)^2$, which is given by:

    $
      (abs(x) - abs(y))^2 & = abs(x)^2 + abs(y)^2 - 2abs(x)abs(y) \
                          & <= abs(x)^2 + abs(y)^2 - 2 sum_(i=1)^n x^i y^i \
                          & = abs(x - y)^2
    $
  ]
]

#problem[1-5][
  The quantity $abs(y - x)$ is called the *distance* between $x$ and $y$. Prove the interpret geometrically the "triangle inequality":
  $ abs(z - x) <= abs(z - y) + abs(y - x) $

  #proof[
    $
      abs(z - x) = abs(z - y + y - x) <= abs(z - y) + abs(y - x) quad "by" bold("Theorem 1-1 (3)")
    $
  ]

  Geometrically, this can be interpreted as the fact that the sum of lengths of any two sides of a triangle is greater than the length of the third side.
]

#problem[1-6][
  Let $f$ and $g$ be integrable on $[a, b]$.

  + Prove that
    $ abs(integral_a^b f dot g) <= (integral_a^b f^2)^(1\/2) dot (integral_a^b g^2)^(1\/2) $

  + If the equality holds, must $f = lambda g$ for some $lambda in RR$? What if $f$ and $g$ are continuous?

  + Show that *Theorem 1-1 (2)* is a special case of (a).

  #proof[
    We start by proving the first part. The problem can be split into two cases:

    + There exists some $lambda in RR$ so that:
      $ integral_a^b (f - lambda g)^2 = 0 $
      In this case, we would have:
      $
                                    integral_a^b (f^2 + lambda^2 g^2 - 2lambda f g) & = 0 \
        lambda^2 integral_a^b g^2 - 2lambda integral_a^b f dot g + integral_a^b f^2 & = 0
      $
      This is a quadratic equation in terms of lambda. This equation must have exactly one real root since it's non-negative everywhere. Since we know that the discriminant must be zero, we have:
      $
        4 (integral_a^b f dot g)^2 - 4 integral_a^b g^2 integral_a^b f^2 & = 0 \
        abs(integral_a^b f dot g) & = (integral_a^b f^2)^(1\/2) dot (integral_a^b g^2)^(1\/2)
      $

    + For all $lambda in RR$, we have:
      $ integral_a^b (f - lambda g)^2 > 0 $

      Similarly, we would have:
      $
        4 (integral_a^b f dot g)^2 - 4 integral_a^b g^2 integral_a^b f^2 & < 0 \
        abs(integral_a^b f dot g) & < (integral_a^b f^2)^(1\/2) dot (integral_a^b g^2)^(1\/2)
      $

    Now consider the second part. Consider $f = 1$ and $g = 0$. Clearly, both function are continuous on $[a, b]$. Meanwhile, the equality still holds. However, we cannot find any $lambda in RR$ so that $f = lambda g$. Therefore, the answer is no.

    For the third part, let's define $f_i = x^i$ and $g_i = y^i$ on $[i - 1, i]$, and both functions equal 0 elsewhere. Then, defined $f = sum_(i=1)^n f_i$ and $g = sum_(i=1)^n g_i$ Applying the first part, we have:

    $
      sum_(i=1)^n integral_(i-1)^i f_i dot g_i & <= (sum_(i=1)^n integral_(i-1)^i f_i^2)^(1\/2) dot (sum_(i=1)^n integral_(i-1)^i g_i^2)^(1\/2) \
      sum_(i=1)^n x^i y^i & <= (sum_(i=1)^n (x^i)^2)^(1\/2) dot (sum_(i=1)^n (y^i)^2)^(1\/2) \
      iprod(x, y) & <= abs(x)abs(y)
    $
    which completes the proof of the third part.
  ]
]

#problem[1-7][
  A linear transformation $T: RR^n -> RR^n$ is *norm preserving* if $abs(T(x)) = abs(x)$, and *inner product preserving* if $iprod(T x, T y) = iprod(x, y)$.

  + Prove that $T$ is norm preserving iff $T$ is inner product preserving.

  + Prove that such a linear transformation $T$ is one-to-one and $T^(-1)$ is of the same sort.

  #proof[
    Simply consider the inner product $iprod(T x, T x)$ would prove that $T$ is norm preserving if $T$ is inner product preserving. The other direction is not as trivial, but can be easily proved by the polarization identity:

    $ iprod(x, y) = (abs(x + y)^2 - abs(x - y)^2) / 4 $

    This completes the proof of the first part.

    The second part can be proved by contradiction. Suppose there exists $x, y in RR^n$ so that $x != y$ and $T(x) = T(y)$. Then, we have:

    $ abs(T(x - y)) = abs(T(x) - T(y)) = 0 $

    However, since $T$ is norm preserving. We would also have:

    $ abs(x - y) = 0 $

    which implies that $x = y$, causing a contradiction.
  ]
]

#problem[1-8][
  If $x, y in RR^n$ are non-zero, the *angle* between $x$ and $y$, denoted $angle(x, y)$, is defined as $arccos(iprod(x, y) \/ (abs(x)abs(y)))$, which makes sense by *Theorem 1-1 (2)*. The linear transformation is *angle preserving* if $T$ is one-to-one and for $x, y != 0$ we have $angle(T x, T y) = angle(x, y)$.

  + Prove that if $T$ is norm preserving, then $T$ is angle preserving.

  + If there is a basis $x_1, ..., x_n$ of $RR^n$ and numbers $lambda_1, ..., lambda_n$ such that $T x_i = lambda_i x_i$, prove that $T$ is angle preserving iff all $abs(lambda_i)$ are equal.

  + What are all angle preserving $T: RR^n -> RR^n$?

  #proof[
    The first part can be easily proven by the definition of angle. For the second part, suppose there exists some $i, j$ so that $lambda_i != lambda_j$. Let $u = x_i + x_j$. We have:

    $
      angle(T u, T x_i) & = angle(lambda_i x_i + lambda_j x_j, lambda_i x_i) \
                        & = angle(x_i + lambda_j / lambda_i x_j, x_i) \
                        & != angle(x_i + x_j, x_i) = angle(u, x_i)
    $

    which proves that all $abs(lambda_i)$ are equal if $T$ is angle preserving. The other direction can be proven by decomposing vector into basis. Any vector $u$ can be written as $u = sum_(i=1)^n u^i x_i$. Then, we have:

    $ iprod(T u, T v) = lambda^2 iprod(u, v) $

    Therefore,

    $ angle(T u, T v) = (lambda^2 iprod(u, v)) / (lambda^2 abs(u) abs(v)) = angle(u, v) $

    which proves that the transformation is angle preserving.
  ]
]
