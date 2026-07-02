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
#let corollary(label, body) = titled(body, "Corollary", label)
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

== Functions and Continuity

#theorem[1-8][
  If $A subset RR^n$, a function $f: A -> RR^m$ is continuous iff for every open set $U subset RR^m$ there is some open set $V subset RR^n$ such that $f^(-1)(U) = V inter A$.

  The theorem itself is an iff statement, but the only if direction is already proven in the book. Therefore, we'll only prove the converse.

  #proof[
    Let a point $a in A$ and an $epsilon > 0$ be given. The set $Y = {y in RR^m : abs(y - f(a)) < epsilon}$ is open. Therefore, there is some open $X subset RR^n$ so that $f^(-1)(Y) = X inter A$. Now, because $X$ is open, we can always find open rectangle $B$ so that $a in B subset X$. Let $delta = min_(x in partial B) abs(x - a)$. This $delta$ guarantees that $abs(f(x) - f(a)) < epsilon$ for all $abs(x - a) < delta$, which completes the proof of $f$ being continuous.
  ]
]

#theorem[1-10][
  The bounded function $f$ is continuous at $a$ iff $o(f, a) = 0$.

  Similarly, the only if direction is already proven in the book. Therefore, we'll only prove the converse.

  #proof[
    Let $a in A$ and $epsilon > 0$ be given. $o(f, a) = 0$ indicates that there is some $delta > 0$ with $M(a, f, delta) - m(a, f, delta) <= epsilon$. Note that $f(x)$ and $f(a)$ both lie in the interval $[m(a, f, delta), M(a, f, delta)]$. Thus, the maximum possible distance between $f(x)$ and $f(a)$ is controlled by the length of the interval:

    $ abs(f(x) - f(a)) <= M(a, f, delta) - m(a, f, delta) <= epsilon $

    This proves that $f$ is continuous at $a$.
  ]
]

#problem[1-23][
  If $f: A -> RR^m$ is continuous and $a in A$, show that $lim_(x -> a) f(x) = b$ iff $lim_(x -> a) f^i (x) = b^i$ for $i = 1, ..., m$.

  #proof[
    First, we assume $lim_(x -> a) f(x) = b$ and try to prove that each component converges to the corresponding component of $b$.

    Let $epsilon > 0$ be given and fix $1 <= i <= m$. There is some $delta$ so that $abs(f(x) - b) <= epsilon$ for all $x$ with $abs(x - a) <= delta$. For all $x$ with $abs(x - a) < delta$, We have:

    $ abs(f^i (x) - b^i) <= sqrt(sum_(j=0)^n abs(f^j (x) - b^j)^2) <= abs(f(x) - b) <= epsilon $

    This proves that $lim_(x -> a) f^i (x) = b^i$ for all $1 <= i <= m$.

    Now, suppose that $lim_(x -> a) f^i (x) = b^i$ for all $1 <= i <= m$. Let $epsilon > 0$ be given. For each $1 <= i <= m$, there is some $delta_i > 0$ so that $abs(f^i (x) - b^i) <= epsilon \/ sqrt(m)$ for all $x$ with $abs(x - a) < delta_i$. Let $delta = min_(1 <= i <= m) delta_i$. Then, we have:

    $ abs(f(x) - b) = sqrt(sum_(i=1)^m abs(f^i (x) - b^i)^2) <= sqrt(sum_(i=1)^m epsilon^2 / m) = epsilon $

    This proves that $f(x)$ converges to $b$ at $x = a$.
  ]
]

#problem[1-24][
  Prove that $f: A -> RR^m$ is continuous at $a$ iff each $f^i$ is.

  #proof[
    Simply applying the conclusion of the previous problem to the definition of continuity proves this statement:

    $ lim_(x -> a) f(x) = f(a) quad <=> quad lim_(x -> a) f^i (x) = (f(a))^i = f^i (a) $
  ]
]

#problem[1-25][
  Prove that a linear transformation $T : RR^n -> RR^m$ is continuous.

  #proof[
    According to *Problem 1-10*, there exists some $M$ so that $abs(T(h)) <= M abs(h)$ for all $h in RR^n$. Let $a in RR^n$ and $epsilon > 0$ be given. Let $delta = epsilon \/ M$. Then, for $abs(x - a) <= delta$, we have:

    $ abs(T(x) - T(a)) = abs(T(x - a)) <= M abs(x - a) <= M delta = epsilon $
  ]
]

#problem[1-26][
  Let $A = {(x, y) in RR^2 : x > 0 "and" 0 < y < x^2}$.

  + Show that every straight line through $(0, 0)$ contains an interval around $(0, 0)$ which is in $RR^2 - A$.

  + Define $f : RR^2 -> RR$ by $f(x) = 0$ if $x in.not A$ and $f(x) = 1$ if $x in A$. For $h in RR^2$ define $g_h: RR -> RR$ by $g_h (t) = f(t h)$. Show that each $g_h$ is continuous at $0$, but $f$ is not continuous at $(0, 0)$.

  #proof[
    Every straight line through $(0, 0)$ can be defined as $L = {(x, y) in RR^2 : y = a x}$. For every $x in (0, a)$, we have $(x, a x) in L$ and $y^2 = a x > x^2$ since $x < a$. The part of $L$ in this interval can be defined as $L' = {(x, y) in L : x in (0, a)}$, where $L' subset RR^2 - A$.

    Let $epsilon > 0$ be given and fix $h in RR^2$. Define $delta = abs(h_2 \/ h_1^2)$. For all $abs(t) <= delta$:

    $ abs(g_h (t) - g_h (0)) = abs(f(t h) - 0) <= abs(f(h_2 / h_1, h_2^2 / h_1^2) - 0) = 0 < epsilon $

    This proves that $g_h$ is continuous at $0$. However, $f$ is not continuous at $(0, 0)$ since for any $delta > 0$, we can find some $(x, y) in A$ so that $abs((x, y) - (0, 0)) <= delta$. For instance, $(sqrt(delta), sqrt(delta))$ is always in the neighborhood of $(0, 0)$ and in $A$. Therefore, $f$ is not continuous at $(0, 0)$.
  ]
]

#problem[1-27][
  Prove that ${x in RR^n : abs(x - a) < r}$ is open by considering the function $f : RR^n -> RR$ with $f(x) = abs(x - a)$.

  #proof[
    First, we can prove that $f$ is continuous. Let $epsilon > 0$ and $x in RR^n$ be given. Let $delta = epsilon$. For $abs(y - x) < delta$, we have:

    $ abs(f(x) - f(y)) = abs(abs(x - a) - abs(y - a)) <= abs(x - y) = epsilon $

    Note that the inequality is proven in *Problem 1-4*. We've proven that $f$ is continuous. Now, consider the set $O = {x in RR^n : abs(x - a) < r} = f^(-1)((0, r))$. Since $(0, r)$ is open and $f$ is continuous, we have that $O$ is open as well.
  ]
]

#problem[1-28][
  If $A subset RR^n$ is not closed, show that there is a continuous function $f: A -> RR$ which is unbounded.

  #proof[
    Suppose $a in RR^n - A$ and $a in.not "int"(RR^n - A)$. An $f$ defined by $f(x) = abs(x - a)^(-1)$ would obviously be bounded. The only problem would be proving that such $a$ exists. Since $A$ is not closed, $RR^n - A$ is not open. Therefore, there exists some $a in RR^n - A$ so that $a in.not "int"(RR^n - A)$.
  ]
]

#problem[1-29][
  If $A$ is compact, prove that every continuous function $f : A -> RR$ takes on a maximum and minimum value.

  #proof[
    This is quite trivial since $f(A)$ is guaranteed to be compact by *Theorem 1-9* due to $A$ being compact. Thus, $f(A)$ is bounded by *Corollary 1-7*. Therefore, $f$ takes on a maximum and minimum value.
  ]
]

#problem[1-30][
  Let $f: [a, b] -> RR$ be an increasing function. If $x_1, ..., x_n in [a, b]$ are distinct, show that $sum_(i=1)^n o(f, x_i) < f(b) - f(a)$.

  #proof[
    Intuitively, the total oscillation of an increasing function is bounded by the difference between the maximum and minimum value of the function.

    Since each $x_i$ is distinct, we can reorder them into ${x'_i}_(i=1)^n$ so that $x'_i < x'_(i + 1)$ is true for all $x'_i$. Since the sum of oscillation is finite, reordering the sum would change the result. Now we can choose a sequence ${t_i}_(i=0)^n$ so that it partitions the interval and each interval have $x'_i in [t_(i - 1), t_i]$. Note that $t_0 = a$ and $t_n = b$. Consider $o(f, x'_i)$ in $1 <= i <= n$:

    $ o(f, x'_i) = lim_(delta -> 0) [M(x'_i, f, delta) - m(x'_i, f, delta)] $

    To prove that $o(f, x'_i) <= f(t_i) - f(t_(i - 1))$, we can show that $M(x'_i, f, delta) - m(x'_i, f, delta) <= f(t_i) - f(t_(i - 1))$ for any $delta > 0$. This is true because $f$ is increasing. Thus, we have:

    $ sum_(i=1)^n o(f, x_i) = sum_(i=1)^n o(f, x'_i) <= sum_(i=1)^n f(t_i) - f(t_(i - 1)) = f(b) - f(a) $
  ]
]

= Differentiation

== Basic Definitions

#problem[2-1][
  Prove that if $f : RR^n -> RR^m$ is differentiable at $a$, then it's continuous at $a$.

  #proof[
    Let $a in RR^n$ and $epsilon > 0$ be given. By definition, we have some linear transformation $lambda(h)$ with:

    $ lim_(h -> 0) abs(f(a + h) - f(a) - lambda(h)) / abs(h) = 0 $

    Therefore,

    $
      lim_(h -> 0) abs(f(a + h) - f(a) - lambda(h)) = lim_(h -> 0) abs(f(a + h) - f(a) - lambda(h)) / abs(h) dot abs(h) = 0
    $

    Recall that in *Problem 1-10*, there's some $M$ with $lambda(h) <= M abs(h)$:

    $ lim_(h -> 0) lambda(h) = M lim_(h -> 0) abs(h) = 0 $

    Finally, we have:

    $
      lim_(x -> a) abs(f(x) - f(a)) & = lim_(h -> 0) abs(f(a + h) - f(a)) \
                                    & = lim_(h -> 0) abs(f(a + h) - f(a) - lambda(h)) \
                                    & = 0
    $
  ]
]

#problem[2-2][
  A function $f: RR^2 -> RR$ is independent of the second variable if for each $x in RR$ we have $f(x, y_1) = f(x, y_2)$ for all $y_1, y_2 in RR$. Show that $f$ is independent of the second variable iff there is a function $g: RR -> RR$ such that $f(x, y) = g(x)$. What is $f'(a, b)$ in terms of $g'$?

  #proof[
    First, suppose that $f$ is independent of the second variable. We can always define $g(x) = f(x, y_0)$ where $y_0 in RR$. Obviously, $f(x, y) = f(x, y_0) = g(x)$.

    Then, suppose that such $g(x)$ exists. We have $f(x, y_1) = g(x) = f(x, y_2)$ for all $y_1, y_2 in RR$. Therefore, $f$ is independent of the second variable.

    Moreover, we have $f'(a, b) = (g'(a), 0)$ since $f$ is independent of the second variable.
  ]
]

#problem[2-3][
  Define when a function $f: RR^2 -> RR$ is independent of the first variable and find $f'(a, b)$ for such $f$. Which functions are independent of the first variable and the second variable?

  #solution[
    A function is independent of the first variable if for each $y in RR$ we have $f(x_1, y) = f(x_2, y)$ for all $x_1, x_2 in RR$, and a function $f$ is only independent of both variable iff it have $f'(x, y) = (0, 0)$.
  ]

  #proof[
    For such function, we have:

    $ lim_((h, k) -> (0, 0)) abs(f(a + h, b + k) - f(a, b) - lambda(h, k)) / abs((h, k)) = 0 $

    Define $g(y) = f(x_0, y)$ and $lambda(h, k) = g'(a) dot h$. This gives:

    $
      lim_((h, k) -> (0, 0)) abs(f(a + h, b + k) - f(a, b) - lambda(h, k)) / abs((h, k)) \
      #h(8em) = lim_((h, k) -> (0, 0)) abs(g(a + h) - g(a) - g'(a) dot h) / abs((h, k))
    $

    RHS is guaranteed to be $0$ by definition of $g'$ and the fact that $abs(h) <= abs((h, k))$. Thus, we have that $f'(a, b) = (0, g'(b))$.

    The conclusion about functions independent of both variables can be derived from the conclusion of this and previous problem.
  ]
]

#problem[2-4][
  Let $g$ be a continuous real-valued function on the unit circle ${x in RR^2 : abs(x) = 1}$ such that $g(0, 1) = g(1, 0) = 0$ and $g(-x) = -g(x)$. Define $f : RR^2 -> RR$ by

  $
    f(x) = cases(
      display(abs(x) dot g(x / abs(x)) & quad x != 0),
      0 & quad x = 0
    )
  $

  + If $x in RR^2$ and $h : RR -> RR$ is defined by $h(t) = f(t x)$, show that $h$ is differentiable.

  + Show that $f$ is not differentiable at $(0, 0)$ unless $g = 0$.

  #proof[
    If $x = 0$, $h(t)$ is simply 0 everywhere and thus obviously differentiable. So we'll assume that $x != 0$. To show that $h$ is differentiable, considering the following:

    $ h(t) = f(t x) = abs(t x) dot g(x / abs(x)) = abs(t)f(x) = t dot f(x) $

    Since $h$ is simply a linear function, it's differentiable everywhere.

    To prove that $f$ is not differentiable at $(0, 0)$ unless $g = 0$, computing the partial derivatives gives:

    $
      pdv(f, x)(0, 0) = lim_(t -> 0) (f(t, 0) - f(0, 0)) / t = g(1, 0) = 0 \
      pdv(f, y)(0, 0) = lim_(s -> 0) (f(0, s) - f(0, 0)) / s = g(0, 1) = 0
    $

    This shows that $lambda(s, t) = 0$, which is:

    $ lim_((s, t) -> (0, 0)) f(s, t) / abs((s, t)) = 0 = lim_((s, t) -> (0, 0)) g(((s, t)) / abs((s, t))) $

    However, on any straight path to the origin, we have that:

    $ g(((alpha s, alpha t)) / abs((alpha s, alpha t))) = g(((s, t)) / abs((s, t))) $

    Therefore, for this limit to exists, $g$ have to be $0$ everywhere.
  ]
]

#problem[2-5][
  Let $f: RR^2 -> RR$ be defined by

  $
    f(x, y) = cases(
      display((x abs(y)) / sqrt(x^2 + y^2) & quad (x, y) != 0),
      0 & quad (x, y) = 0
    )
  $

  Show that $f$ is a function of the kind considered in *Problem 2-4*, and that $f$ is not differentiable at $(0, 0)$.

  #proof[
    Let $g(x, y) = (x abs(y)) / (x^2 + y^2)$. It's not hard to verify $g$ is continuous on the unit circle, $g(0, 1) = g(1, 0) = 0$, and $g(-x) = -g(x)$. Therefore, $f$ is a function of the kind considered in *Problem 2-4*. By the conclusion of *Problem 2-4*, we have that $f$ is not differentiable at $(0, 0)$.
  ]
]

#problem[2-6][
  Let $f: RR^2 -> RR$ be defined by $f(x, y) = sqrt(abs(x y))$. Show that $f$ is not differentiable at $(0, 0)$.

  #proof[
    It suffices to show that there's no linear transformation $lambda(h, k)$ so that

    $ lim_((h, k) -> (0, 0)) abs(sqrt(abs(h k)) - lambda(h, k)) / abs((h, k)) = 0 $

    Since $lambda(h, k)$ is linear, it must takes the form of $lambda(h, k) = a h + b k$. Therefore, we have:

    $ lim_((h, k) -> (0, 0)) abs(sqrt(abs(h k)) - a h - b k) / abs((h, k)) $

    Suppose that such limit exists, then given $epsilon > 0$ there exists some $delta > 0$ so that for all $abs((h, k)) < delta$, we have:

    $ abs(sqrt(abs(h k)) - a h - b k) / sqrt(h^2 +k^2) <= epsilon $

    However, we can choose $h = k$ so that $abs((h, k)) = sqrt(2) abs(h) < delta$. Then, we have:

    $ abs(sqrt(abs(h^2)) - a h - b h) / (sqrt(2) abs(h)) = abs(1 - a - b) / sqrt(2) $

    Clearly, that this cannot be controlled by the choice of $delta$ and would fail for small enough $epsilon$. Therefore, $f$ is not differentiable at $(0, 0)$.
  ]
]

#problem[2-7][
  Let $f: RR^n -> RR$ be a function such that $abs(f(x)) <= abs(x)^2$. Show that $f$ is differentiable at $0$.

  #proof[
    Consider the definition of differentiability at $0$ and let $lambda(h) = 0$:

    $ lim_(h -> 0) abs(f(h) - f(0) - lambda(h)) / abs(h) <= lim_(h -> 0) abs(h)^2 / abs(h) = 0 $

    Since the expression inside the limit is non-negative, the limit exists and $f$ is differentiable at $0$.
  ]
]

#problem[2-8][
  Let $f: RR -> RR^2$. Prove that $f$ is differentiable at $a in RR$ iff $f^1$ and $f^2$ are, and that in this case

  $ f'(a) = vec((f^1)'(a), (f^2)'(a)) $

  #proof[
    Suppose that $f$ is differentiable at $a$. Then, there exists some linear transformation $lambda(h)$ so that

    $ lim_(h -> 0) abs(f(a + h) - f(a) - lambda(h)) / abs(h) = 0 $

    For $i = 1, 2$, there is

    $ abs(f^i (a + h) - f^i (a) - lambda^i (h)) / abs(h) <= abs(f(a + h) - f(a) - lambda(h)) / abs(h) $

    Therefore, $f^1$ and $f^2$ are differentiable at $a$. Now, suppose that $f^1$ and $f^2$ are differentiable at $a$. Given $epsilon > 0$, we have that

    $ abs(f^i (a + h) - f^i (a) - lambda^i (h)) / abs(h) <= epsilon / 2 $

    for $abs(h) <= delta_i$. Let $delta = min(delta_1, delta_2)$, there is

    $
         & abs(f(a + h) - f(a) - lambda(h)) / abs(h) \
      <= & abs(f^i (a + h) - f^i (a) - lambda^i (h)) / abs(h) + abs(f^i (a + h) - f^i (a) - lambda^i (h)) / abs(h) \
      <= & epsilon
    $

    This proves that $f$ is differentiable. Since we already know that $(f^1)'$ and $(f^2)'$ are unique, this also shows that components of $f'$ are the derivatives of the components of $f$.
  ]
]

#problem[2-9][
  Two functions $f, g: RR -> RR$ are equal up to $n$th order at $a$ if

  $ lim_(h -> 0) (f(a + h) - g(a + h)) / h^n = 0 $

  + Show that $f$ is differentiable at $a$ iff there is a function $g$ of the form $g(x) = a_0 + a_1 (x - a)$ such that $f$ and $g$ are equal up to first order at $a$.

  + If $f'(a), ..., f^((n))(a)$ exist, show that $f$ and the function $g$ defined by

    $ g(x) = sum_(i=0)^n (f^((i))(a)) / i! (x - a)^i $

    are equal up to $n$th order at $a$.

  #proof[
    The statement in (a) is not always true since there might be a removable discontinuity at $a$. We would also assume that $f$ is continuous at $a$ to avoid this problem.

    First, suppose that $f$ and $g$ are equal up to first order at $a$. We have

    $
      lim_(h -> 0) (f(a + h) - a_0 - a_1 h) / h & = 0 \
                    lim_(h -> 0) f(a + h) - a_0 & = 0 \
                          lim_(h -> 0) f(a + h) & = a_0
    $

    By continuity, we have $f(a) = a_0$. Therefore, there is

    $ lim_(h -> 0) (f(a + h) - f(a) - a_1 h) / h = 0 $

    which proves the differentiability of $f$ at $a$.

    Now assume that $f$ is differentiable at $a$. Let $g(x) = f(a) + f'(a) (x - a)$. Then, by definition, we have

    $ lim_(h -> 0) abs(f(a + h) - f(a) - f'(a)(x - a)) / abs(h) = 0 $

    Substituting in $g$ would show that $f$ and $g$ are equal up to first order at $a$.

    Now consider the limit:

    $
      & lim_(h -> 0) (f(a + h) - sum_(i=0)^n ( f^((i))(a) ) / i! h^i ) / h^n
    $

    Note that both denominator and numerator approaches $0$. Therefore, applying L'Hospital's rule on this limit $n - 1$ times would give us

    $
        & ( f^((n - 1))(a + h) - sum_(i=n-1)^n ( f^((i)) (a) ) / (i - n + 1)! h^(i - n + 1) ) / (n! h) \
      = & 1 / n! (f^((n - 1))(a + h) - f^((n-1))(a) - f^((n))(a) h) / h
    $

    The problem now becomes the exact same problem as (a) with $f^((n - 1))$ and $f^((n))$ instead of $f$ and $f'$. Therefore, we can apply the same argument to show that the limit is $0$, which proves that $f$ and $g$ are equal up to $n$th order at $a$.
  ]
]

== Basic Theorems

#corollary[2-4][
  If $f, g: RR^n -> RR$ are differentiable at $a$, then

  $
    & D(f + g)(a) = D f(a) + D g(a) \
    & D(f dot g)(a) = g(a) D f(a) + f(a) D g(a)
  $

  If, moreover, $g(a) != 0$, then

  $ D(f \/ g)(a) = (g(a) D f(a) - f(a) D g(a)) / [g(a)]^2 $

  The first equation is already proven in the book. We'll prove the others.

  #proof[
    $p(x, y) = x dot y$ is proved to be differentiable in *Theorem 2-3*. Since $f dot g = p compose (f, g)$, we have

    $
      D(f dot g)(a) & = D(p(f(a), g(a))) compose D(f, g)(a) \
                    & = (g(a) x + f(a) y) compose (D f(a), D g(a)) \
                    & = g(a) D f(a) + f(a) D g(a)
    $

    $f \/ g$ is a little more tricky. Let $h(x, y) = x \/ y$. Then, we want to prove that

    $ D h(a, b)(x, y) = (b x - a y) / b^2 $

    To start, let $lambda(x, y) = (b x - a y) \/ b^2$. Then,

    $ lim_((t, s) -> (0, 0)) abs(h(a + t, b + s) - h(a, b) - lambda(t, s)) / abs((t, s)) $

    With some algebra, we can simply the limit to

    $ abs(s) / abs((t, s)) abs(b t - a s) / abs(b^2 (b + s)) $

    The first term is bounded by $1$ and the second term approaches $0$ in the limit. Therefore, the limit is $0$ and $h$ is differentiable at $(a, b)$. Then, we can obtain the result with similar argument as the product rule.
  ]
]

#problem[2-10][
  Use the theorems of this section to find $f'$ for the following:
  + $f(x, y, z) = x^y$
  + $f(x, y, z) = (x^y, z)$
  + $f(x, y) = sin(x sin y)$
  + $f(x, y, z) = sin(x sin(y sin x))$
  + $f(x, y, z) = x^y^z$
  + $f(x, y, z) = x^(y+z)$
  + $f(x, y, z) = (x + y)^z$
  + $f(x, y) = sin(x y)$
  + $f(x, y) = [sin(x y)]^(cos 3)$
  + $f(x, y) = (sin(x y), sin(x sin y), x^y)$

  #solution[
    #set enum(indent: 0pt)

    + $f'(x, y, z) = (y dot x^(y - 1), ln x dot x^y, 0)$

    + $ f'(x, y, z) = mat(y dot x^(y - 1), ln x dot x^y, 0; 0, 0, 1) $

    + $f'(x, y) = (cos(x sin y) sin y, x cos(x sin y) cos y)$

    + $
          & f'(x, y, z) \
        = & vec(
              cos(x sin(y sin x))(sin(y sin x) + x y cos(y sin x)cos x),
              x y cos(x sin(y sin x))cos(y sin x) cos x
            )^upright(T)
      $

    + $f'(x, y, z) = (y^z dot x^(y^z - 1), z ln x dot x^y^z dot y^(z - 1), ln x ln y dot x^y^z dot y^z)$

    + $f'(x, y, z) = ((y + z) dot x^(y + z - 1), ln x dot x^(y + z), ln x dot x^(y + z))$

    + $f'(x, y, z) = (z (x + y)^(z - 1), z (x + y)^(z - 1), ln(x + y) dot (x + y)^z)$

    + $f'(x, y) = (y cos(x y), x cos (x y))$

    + $f'(x, y) = (cos 3 dot [sin(x y)]^(cos 3 - 1) dot y cos(x y), cos 3 dot [sin(x y)]^(cos 3 - 1) dot x cos(x y))$

    + $
        f'(x, y) = mat(
          y cos(x y), x cos (x y);
          cos(x sin y) sin y, x cos(x sin y) cos y;
          y dot x^(y - 1), ln x dot x^y
        )
      $
  ]
]

#problem[2-11][
  Find $f'$ for the following (where $g: RR -> RR$ is continuous):

  + $f(x, y) = integral_a^(x+y) g$

  + $f(x, y) = integral_a^(x dot y) g$

  + $f(x, y, z) = integral_(x^y)^sin(x sin(y sin z)) g$

  #solution[
    #set enum(indent: 0pt)

    + $f'(x, y) = (g(x + y), g(x + y))$

    + $f'(x, y) = (y dot g(x y), x dot g(x y))$

    + Let $G = g(sin(x sin(y sin z)))$
    $
        & f'(x, y, z) \
      = & vec(
            & G dot cos(x sin(y sin z)) sin(y sin z),
            & G dot x dot cos(x sin(y sin z)) dot cos(y sin z) sin z,
            & G dot x y dot cos(x sin(y sin z)) dot cos(y sin z) cos z
          )^upright(T)
    $
  ]
]

#problem[2-12][
  A function $f: RR^n times RR^m -> RR^p$ is *bilinear* if for $x, x_1, x_2 in RR^n$, $y, y_1, y_2 in RR^m$, and $a in RR$ we have

  $
          f(a x, y) & = a f(x, y) = f(x, a y) \
    f(x_1 + x_2, y) & = f(x_1, y) + f(x_2, y) \
    f(x, y_1 + y_2) & = f(x, y_1) + f(x, y_2)
  $

  + Prove that if $f$ is bilinear, then

    $ lim_((h, k) -> 0) abs(f(h, k)) / abs((h, k)) = 0 $

  + Prove that $D f(a, b)(x, y) = f(a, y) +f(x, b)$.

  + Show that the formula for $D p(a, b)$ in *Theorem 2-3* is a special case of (b).
]
