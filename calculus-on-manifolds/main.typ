#import "@preview/tapestry:0.0.4": *
#import "@preview/physica:0.9.8": iprod, rot2mat

#set text(costs: (orphan: 0%, widow: 0%))

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

== Norm and Inner Product

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
    Since the function $x |-> x^2$ is increasing, it suffices to prove that $abs(x)^2 <= (sum_(i=1)^n abs(x^i))^2$. We have:

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
    Notice that it suffices to prove that $abs(x - y)^2 <= (abs(x) + abs(y))^2$. We have:

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
    It suffices to prove that $(abs(x) - abs(y))^2 <= abs(x - y)^2$, which is given by:

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

    The third part asks about all the angle preserving linear transformations. They are always compositions of rotation, reflection, and scaling. This can be proven by writing $T = c Q$, where $c > 0$ is the scaling factor and $Q$ is an orthogonal matrix.
  ]
]

#problem[1-9][
  If $0 <= theta < pi$, let $T: RR^2 -> RR^2$ have the matrix
  $ mat(&cos theta, sin theta; -&sin theta, cos theta) $
  Show that $T$ is angle preserving, and if $x != 0$, $angle(x, T x) = theta$.

  #proof[
    Notice that $T$ is a rotation matrix with angle $-theta$, which is:

    $ rot2mat(-&theta) = mat(&cos theta, sin theta; -&sin theta, cos theta) = T $

    Therefore, it's obviously angle preserving, and the angle between $x$ and $T x$ is exactly $theta$.
  ]
]

#problem[1-10][
  If $T: RR^m -> RR^n$ is a linear transformation, show that there is a number $M$ such that $abs(T(h)) <= M abs(h)$ for $h in RR^m$.

  #proof[
    Consider ${e_i}_(i=1)^m$, the set of standard basis in $RR^m$. Define $M$ as:

    $ M = max_(1<=i<=m) abs(T(e_i)) $

    Now we'd like to show that the inequality holds for all $h$. Note that $h$ can always be written as $h = sum_(i=1)^m h^i e_i$. Therefore, we have:

    $
      abs(T(h)) = abs(T(sum_(i=1)^m h^i e_i)) & = abs(sum_(i=1)^m h^i T(e_i)) & <= M abs(sum_(i=1)^m h^i e_i) = M abs(h)
    $
  ]
]

#problem[1-11][
  If $x, y in RR^n$ and $z, w in RR^m$, show that $iprod((x, z), (y, w)) = iprod(x, y) + iprod(z, w)$ and $abs((x, z)) = sqrt(abs(x)^2 + abs(z)^2)$.

  #proof[
    $ iprod((x, z), (y, w)) = sum_(i=1)^n x^i y^i + sum_(i=1)^m z^i w^i = iprod(x, y) + iprod(z, w) $
    and
    $ abs((x, z)) = sqrt(sum_(i=0)^n x^i + sum_(i=0)^m z^i) = sqrt(abs(x)^2 + abs(z)^2) $
  ]
]

#problem[1-12][
  Let $(RR^n)^*$ denote the dual space of the vector space $RR^n$. If $x in RR^n$, define $phi_x in (RR^n)^*$ by $phi_x (y) = iprod(x, y)$. Define $T: RR^n -> (RR^n)^*$ by $T(x) = phi_x$. Show that $T$ is a one-to-one linear transformation and conclude that every $phi in (RR^n)^*$ is $phi_x$ for a unique $x in RR^n$.

  #proof[
    First, we can see that $T$ is linear due to bilinearity of inner product:

    $ T(alpha x + beta y) = phi_(alpha x + beta y) = alpha phi_x + beta phi_y = alpha T(x)+ beta T(y) $

    For the sake of contradiction, suppose there exists $x, y in RR^n$ so that $x != y$ and $T(x) = T(y)$. By definition, we have $phi_x = phi_y$, which is that $phi_x (z) = phi_y (z)$ for all $z in RR^n$. Thus, we have:

    $ forall z in RR^n, iprod(x, z) = iprod(y, z) $

    By choosing $z = e_i$, we can easily obtain that $x^i = y^i$ for all $1 <= i <= n$. This is equivalent to $x =y$, which contradict with our assumption. Thus, $T$ is one-to-one.
  ]
]

#problem[1-13][
  If $x, y in RR^n$, then $x$ and $y$ are called *perpendicular* (or *orthogonal*) if $iprod(x, y) = 0$. If $x$ and $y$ are perpendicular, prove that $abs(x + y)^2 = abs(x)^2 + abs(y)^2$.

  #proof[
    $
      abs(x + y)^2 & = sum_(i=1)^n (x^i + y^i)^2 \
                   & = sum_(i=1)^n (x^i)^2 + sum_(i=1)^n (y^i)^2 + 2 sum_(i=1)^n x^i y^i \
                   & = abs(x)^2 + abs(y)^2 + 2 iprod(x, y) \
                   & = abs(x)^2 + abs(y)^2
    $
  ]
]

== Subsets of Euclidean Space

#problem[1-14][
  Prove that the union of any (even infinite) number of open sets is open. Prove that the intersection of two (and hence finitely many) open sets is open. Give a counterexample for infinitely many open sets.

  #proof[
    Consider the union of open sets $O$ defined by $O = union.big O_i$, where each $O_i$ is open. To prove $O$ is open, it suffices to show that an open rectangle $A$ exists for each $x in O$ so that $x in A subset O$. Since $O$ is the union of $O_i$, there exists at least one $O_i$ for each $x in O$ so that $x in O_i$. Since we know that $O_i$ is open, some $A$ exists so that $x in A subset O_i subset O$. Therefore, $O$ is open.

    Now, to prove that the intersection of two open sets is open, consider $O = O_1 inter O_2$. A given point $x in O$ is contained by both $O_1$ and $O_2$. Thus, since both sets are open, there exists open rectangles $A_1$ and $A_2$ so that $x in A_1 subset O_1$ and $x in A_2 in O_2$. Define $A = A_1 inter A_2$. While $A$ is still an open rectangle, we have $x in A subset O_1 inter O_2 = O$. Therefore, the intersection of two open sets is open.

    A counterexample for the intersection of infinitely many open sets is $A = inter.big_(i = 1)^oo A_n$ where $A_n = (0, 1 + 1 \/ n)$. $A = (0, 1]$, which is not open.
  ]
]

#problem[1-15][
  Prove that $O = {x in RR^n : abs(x - a) < r}$ is open.

  #proof[
    Let a point $x in O$ be given. Define $d = abs(x - a)$ and $s = r - d$. We have an open cube $A = {y in RR^n : sum_(i=1)^n abs(y^i - x^i) < s}$, and we can see that $x in A subset {y in RR^n : abs(y - x) < s} subset O$. Therefore, $O$ is open.
  ]
]

#problem[1-16][
  Find the interior, exterior, and boundary of the sets
  $
    X = {x in RR^n : abs(x) <= 1} \
    Y = {x in RR^n : abs(x) = 1} \
    Z = {x in RR^n : x^i in QQ} \
  $

  #solution[
    $X$ is a closed ball, so we have $"int"(X) = {x in RR^n : abs(x) < 1}$, $"ext"(X) = RR^n - X$, $partial X = Y$.

    $Y$ is a sphere, so we have $"int"(Y) = emptyset$, $"ext"(Y) = RR^n - Y$, $partial Y = Y$.

    For $Z$, we have $"int"(Z) = emptyset$, $"ext"(Z) = emptyset$, $partial Z = RR^n$.
  ]
]

#problem[1-17][
  Construct a set $A subset [0, 1] times [0, 1]$ such that $A$ contains at most one point on each horizontal and vertical line but $partial A = [0, 1] times [0,1]$.

  #solution[
    let ${x}$ denote taking the fraction part of $x$. Define:

    $ A = {({sqrt(2) n}, {sqrt(3) n}) : n in NN^+} $

    We can see that $A$ contains at most one point on each horizontal and vertical line. Meanwhile, we can see that $partial A = [0, 1] times [0, 1]$.

    It's quite hard to rigorously prove the statement above without external theorem. However, Kronecker's Theorem in two dimensions says that the sequence of fraction parts $({n alpha}, {n beta})$ is dense in $[0, 1] times [0, 1]$ iff $1, alpha, beta$ are linearly independent over $QQ$. This works for $sqrt(2)$ and $sqrt(3)$. Knowing that this set is dense in $[0, 1] times [0, 1]$, we can establish that there's always some point in the set that will be inside the open rectangle with $x in B$.
  ]
]

#problem[1-18][
  If $A subset [0, 1]$ is the union of open intervals $(a_i, b_i)$ such that each rational number in $(0, 1)$ is contained in some $(a_i, b_i)$, show that $partial A = [0, 1] - A$.

  #proof[
    It suffices to show that (1) for all $x in A$, $x in.not partial A$ and (2) for all $x in [0, 1] - A$, $x in partial A$.

    To show (1), consider any rational number $r in QQ inter [0, 1]$. Obviously, $r in A$. Moreover, some open interval $(a_i, b_i) subset A$ exists so that $x in (a_i ,b_i)$. Therefore, $r in.not partial A$ by the definition of boundary.

    Now, consider some $x in [0, 1] - A$ and some open rectangle with $x in B$. Since $x in.not A$, it suffices to prove that there exists some point $y in B$ where $y in A$. Meanwhile, we know that there's some rational $r in B inter QQ$ since rationals are dense in $RR$. Thus, we complete the proof for (2).
  ]
]

#problem[1-19][
  If $A$ is a closed set that contains every rational number $r in [0, 1]$, show that $[0, 1] subset A$.

  #proof[
    For the sake of contradiction, suppose there exists $x in [0, 1]$ where $x in.not A$. Then, we have $x in RR - A$. Since $A$ is closed, $RR - A$ is open, and $RR - A inter (0, 1)$ is open as well. Thus, there exists some open interval $O subset RR - A inter (0, 1)$. Since rationals are dense in $RR$, there exists $r in O subset RR - A$. However, we also have that every rational $r in A$, which leads to a contradiction.
  ]
]

#problem[1-20][
  Prove the converse of *Corollary 1-7*: A compact subset of $RR^n$ is closed and bounded.

  #proof[
    Consider an open cover $cal(O)$ of a compact set $A$. Since $A$ is compact, there exists a finite subcollection of open sets $cal(O)'$ that covers $A$. Since $cal(O)'$ is finite, we can find a closed rectangle $R$ that contains all the open sets in $cal(O)'$. Therefore, $A subset R$, which proves that $A$ is bounded.

    Now we'd like to prove that $A$ is closed. It suffices to show that $RR^n - A$ is open. Consider any point $x in RR^n - A$. For any points $y in A$, define $d = abs(x - y) > 0$. Define $d_y = d \/ 2$ and $cal(B)_y = {z in RR^n : abs(z - y) < d \/ 2}$. The collections of $cal(B)_y$ for all $y$ forms a open cover of $A$. Therefore, there's a finite subcollection $cal(B)'_i$ that completely covers $A$. Now we have:

    $ d' = min_i d_i quad "and" quad U = {z in RR^n : sum_(i=1)^n abs(z^i - x^i) < d'} $

    $U$ is completely contained in $RR^n - A$, which proves that $RR^n - A$ is open.
  ]
]

#problem[1-21][
  #set enum(indent: 0pt)

  + If $A$ is closed and $x in.not A$, prove that there is a number $d > 0$ such that $abs(y - x) >= d$ for all $y in A$.

  + If $A$ is closed, $B$ is compact, and $A inter B = emptyset$, prove that there is $d > 0$ such that $abs(y - x) >= d$ for all $y in A$ and $x in B$.

  + Give a counterexample in $RR^2$ if $A$ and $B$ are closed but neither is compact.

  #proof[
    Since $A$ is closed, $RR^n - A$ is open. Since $x in RR^n - A$, there exists some open rectangle so that $x in R subset RR^n - A$. Let $d = min { abs(x - y) : y in partial R}$. Note that $d$ is guaranteed to be positive, and $abs(y - x) >= d$ for all $y in A$ since $R$ is disjoint from $A$. This completes the proof for the first part.

    In the second part, $A inter B = emptyset$ implies that every point $y in B$ have $y in.not A$, which, together with the conclusion of part one, completes the proof of part two.

    The implication of being closed but not compact in Euclidean space is that the set is not bounded. Therefore, consider:

    $ A = RR^2 quad "and" quad B = [0, oo) times [0, 1] $

    Both sets are closed, but neither is compact.
  ]
]

#problem[1-22][
  If $U$ is open and $C subset U$ is compact, show that there is a compact set $D$ such that $C subset "int"(D)$ and $D subset U$.

  #proof[
    We first define an estimation of the distance from $C$ to $U$:

    $ r = min_(x in C) inf { abs(x - y) : y in RR^n - U} $

    From the previous problem, we know that $r > 0$. Now we can define $D$:

    $ D = {x in RR^n : inf_(y in C) abs(x - y) <= r / 2 } $

    Obviously, $D$ is compact since it's bounded by $U$ and closed. $C subset "int"(D)$ since there's an open set $A = {x in RR^n : inf_(y in C) abs(x - y) < r / 2 } subset D$. So we have $C subset A subset "int"(D)$. Meanwhile, all points in $D$ is at least $r / 2$ away from $RR^n - U$, which implies that $D subset U$.
  ]
]
