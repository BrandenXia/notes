#import "../../common.typ": *

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
            )^T
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

    + Let $G_1 = g(sin(x sin(y sin z)))$, $G_2 = g(x^y)$
    $
        & f'(x, y, z) \
      = & vec(
            & G_1 dot cos(x sin(y sin z)) sin(y sin z) - G_2 dot y x^(y - 1),
            & G_1 dot x dot cos(x sin(y sin z)) dot cos(y sin z) sin z - G_2 dot ln x dot x^y,
            & G_1 dot x y dot cos(x sin(y sin z)) dot cos(y sin z) cos z
          )^T
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

  #proof[
    First, since that $f$ is bilinear, we have that

    $ f(h, k) = f(sum_(i=1)^n h^i e_i, sum_(j=1)^m k^j u_j) = sum_(i=1)^n sum_(j=1)^m h^i k^j f(e_i, u_j) $

    Taking the norm gives

    $ abs(sum_(i=1)^n sum_(j=1)^m h^i k^j f(e_i, u_j)) <= sum_(i=1)^n sum_(j=1)^m abs(h^i k^j)abs(f(e_i, u_j)) $

    Now define

    $ M = max_(1 <= i <= n, 1 <= j <= m) abs(f(e_i, u_j)) $

    We have that

    $ "RHS" <= sum_(i=1)^n sum_(j=1)^m abs(h)abs(k)M <= n m M dot abs(h)abs(k) $

    Since $n m M$ is a constant, we can factor it out of the limit:

    $ lim_((h, k) -> 0) abs(f(h, k)) / abs((h, k)) = n m M dot lim_((h, k) -> 0) (abs(h)abs(k)) / abs((h, k)) $

    For the limit above, we have

    $ abs(h)abs(k) <= abs(h)^2 + abs(k)^2 $

    as part of the QM-AM-GM-HM inequality, which gives

    $ ( abs(h)abs(k) ) / abs((h, k)) <= sqrt(h^2 + k^2) $

    The limit of RHS converges to $0$, and thus proves the desired result.

    The second part is equivalent to proving that

    $ lim_((h, k) -> 0) abs(f(a + h, b + k) - f(a, b) - f(a, k) - f(h, b)) / abs((h, k)) = 0 $

    To prove this, consider that

    $
      f(a + h, b + k) & = f(a, b + k) + f(h, b + k) \
                      & = f(a, b) + f(a, k) + f(h, b) + f(h, k)
    $

    Substituting this into the limit produces the limit in part one. Therefore, we complete the proof of part two.

    The third part is basically showing that the product function is bilinear. This is true as multiplication and addition form a ring on the reals.
  ]
]

#problem[2-13][
  #let IP = $"IP"$

  Define $IP: RR^n times RR^n -> RR$ by $IP(x, y) = iprod(x, y)$.

  + Find $D(IP)(a, b)$ and $(IP)'(a, b)$.

  + If $f, g: RR -> RR^n$ are differentiable and $h: RR -> RR$ is defined by $h(t) = iprod(f(t), g(t))$, show that
    $ h'(a) = iprod(f'(a)^T, g(a)) + iprod(f(a), g'(a)^T) $

  + If $f: RR -> RR^n$ is differentiable and $abs(f(t)) = 1$ for all $t$, show that $iprod(f'(t)^T, f(t)) = 0$.

  + Exhibit a differentiable function $f: RR -> RR$ such that the function $abs(f)$ defined by $abs(f)(t) = abs(f(t))$ is not differentiable.

  #proof[
    Since inner product is bilinear, it satisfies all the property mentioned in the problem above. Therefore, we have that

    $
      D(IP)(a, b)(x, y) & = iprod(a, y) + iprod(x, b) \
            (IP)'(a, b) & = (b^T, a^T)
    $

    Notice that $h = IP compose (f, g)$, by the chain rule, we have

    $
      h'(t) & = IP'(f(t), g(t)) (f'(t), g'(t))^T \
            & = iprod((g(t)^T, f(t)^T), (f'(t)^T, g'(t)^T)) \
            & = iprod(f'(t)^T, g(t)) + iprod(f(t), g'(t)^T)
    $

    In the third part, $abs(f(t)) = 1$ tells us that $f$ is either $1$ or $-1$. However, since $f$ is differentiable, it has to be continuous. This means that it's either constantly $1$ or constantly $-1$. Thus, $f' = 0$ everywhere, and the inner product would also be $0$.

    The fourth part asks for a function that's differentiable whereas its absolute value is not differentiable. $f(t) = t$ would already satisfy the condition as it's not differentiable at $0$.
  ]
]

#problem[2-14][
  Let $E_i, i = 1, ..., k$ be Euclidean spaces of various dimensions. A function $f: E_1 times dots.c times E_k -> RR^p$ is called *multilinear* if for each choice of $x_j in E_j != i$ the function $g: E_i -> RR^p$ defined by
  $ g(x) = f(x_1, ..., x_(i - 1), x, x_(i + 1), ..., x_k) $
  is a linear transformation.

  + If $f$ is multilinear and $i != j$, show that for $h = (h_1, ..., h_k)$, with $h_l in E_l$, we have
    $ lim_(h -> 0) abs(f(a_1, ..., h_i, ..., h_j, ..., a_k)) / abs(h) = 0 $

  + Prove that
    $ D f(a_1, ..., a_k)(x_1, ..., x_k) = sum_(i=1)^k f(a_1, ..., a_(i - 1), x_i, a_(i + 1), ..., a_k) $

  #proof[
    Since $g(x, y) = f(a_1, ..., x, ..., y, ..., a_k)$ is bilinear, we have that

    $ lim_(h -> 0) abs(g(h_i, h_j)) / abs((h_i, h_j)) = 0 $

    from *Problem 2-12*. Meanwhile, we know that

    $ abs((h_i, h_j)) <= abs(h) $

    which proves the limit converges to $0$.

    Now, the goal is to prove that

    $ lim_(h -> 0) abs(f(a + h) - f(a) - sum_(i=1)^k f(a_1, ... a_(i - 1), h_i, a_(i + 1), ..., a_k)) / abs(h) = 0 $

    Define

    $
      cal(I)_n & = {I : abs(I) = n, I subset NN inter [1, k]} \
           V_n & = {a - sum_(i in I) (a_i - h_i) e_i : I in cal(I)_n}
    $

    $f(a + h)$ can be expanded as:

    $
      f(a + h) & = f(a_1 + h_1, ..., a_k + h_k) \
               & = f(a) + sum_(v in V_1) f(v)
                 + sum_(n = 2)^k sum_(v in V_n) f(v)
    $

    All terms except the last one cancel out with existing parts of the limit. Thus, it suffices to show that for $2 <= n <= k, v in V_n$, there is

    $ lim_(h -> 0) abs(f(v)) / abs(h) = 0 $

    To prove this, fix $2 <= n <= k$ and $I in cal(I)_n$. Define $d_i = dim E_i$ and

    $ cal(J) = product_(i=1)^k NN inter [1, d_i] $

    It follows from the similar process as *Problem 2-12*:

    $ f(v) = sum_(J in cal(J)) ( product_(i in I) h_i^J_i ) f(a - sum_(i in I) (a_i e_i - e_i^J_i)) $

    To simplify, take its upper bound:

    $ M = max_(J in cal(J)) abs(f(a - sum_(i in I) (a_i e_i - e_i^J_i))) $

    Taking its norm gives

    $ abs(f(v)) <= M sum_(J in cal(J)) product_(i in I) abs(h_i^J_i) <= M sum_(J in cal(J)) product_(i in I) abs(h_i) $

    Since the product not with respect to $J$, we can factor out its dimension by defining $D = product_(i in I) d_i$:

    $ abs(f(v)) <= M D dot product_(i in I) abs(h_i) $

    From the inequality

    $ product_(i in I) abs(h_i) <= (1 / n sum_(i in I) abs(h_i)^2)^(n \/ 2) <= n^(- n \/ 2) abs(h)^n $

    Now, putting this back into the limit, we have

    $ lim_(h -> 0) abs(f(v)) / abs(h) <= n^(- n \/ 2) M D dot lim_(h -> 0) abs(h)^(n - 1) = 0 $

    Note that this holds whenever $n >= 2$, which is part of our assumption. Therefore, we have proven the desired result.
  ]
]

#problem[2-15][
  Regard an $n times n$ matrix as a point in the $n$-fold product $RR^n times dots.c times RR^n$ by considering each row as a member of $RR^n$.

  + Prove that $det: RR^n times dots.c times RR^n -> RR$ is differentiable and

    $ D(det)(a_1, ..., a_n)(x_1, ..., x_n) = sum_(i=1)^n det vec(a_1, dots.v, x_i, dots.v, a_n) $

  + If $a_(i j): RR -> RR$ are differentiable and $f(t) = det(a_(i j)(t))$, show that

    $
      f'(t) = sum_(j=1)^n det mat(
        a_(11)(t), dots.c, a_(1 n)(t);
        dots.v, , dots.v;
        a_(j 1) '(t), dots.c, a_(j n) '(t);
        dots.v, , dots.v;
        a_(n 1)(t), dots.c, a_(n n)(t)
      )
    $

  + If $det(a_(i j)(t)) != 0$ for all $t$ and $b_1, ..., b_n: RR -> RR$ are differentiable, let $s_1, ..., s_n: RR -> RR$ be the functions such that $s_1, ..., s_n$ are the solutions of the equation

    $ sum_(j=1)^n a_(j i)(t) s_j (t) = b_i (t) quad i = 1, ..., n $

    Show that $s_i$ is differentiable and find $s_i '(t)$.

  #proof[
    Notice that determinant is multilinear, applying the result from *Problem 2-14* is sufficient to prove the first part.

    The second part is simply chain rule. Since there is $f = det compose (a_(i j)(t))$, there is

    $ f'(t) & = det'(a_(i j)(t)) (a_(i j) '(t)) $

    Then matrix multiplication gives the desired result.

    For the third part, recall that applying matrix to a vector is equivalent to solving a system of equation $A x = b$, and an explicit formula for the solution is given by Cramer's rule:

    $ x_i = (det A_i) / (det A) quad "where" A_i = A "with" i"th column replaced by" b $

    Thus, the explicit formula for $s_i$ is

    $
      s_i (t) = 1 / det(a_(i j)(t)) det mat(
        a_(1 1)(t), dots.c, b_1(t), dots.c, a_(1 n)(t);
        dots.v, , dots.v, , dots.v;
        a_(n 1)(t), dots.c, b_n(t), dots.c, a_(n n)(t);
      )
    $

    Since $s_i (t)$ are compositions of differentiable functions, they are differentiable. To find $s_i '(t)$, we can apply the quotient rule and the result from part two to obtain

    $
      s_i '(t) & = 1 / (det (a_(i j)(t)))^2 (
                 det (a_(i j)(t)) sum_(j=1)^n det mat(
                   a_(1 1)(t), dots.c, b_1(t), dots.c, a_(1 n)(t);
                   dots.v, , dots.v, , dots.v;
                   a_(j 1) '(t), dots.c, b_j '(t), dots.c, a_(j n) '(t);
                   dots.v, , dots.v, , dots.v;
                   a_(n 1)(t), dots.c, b_n(t), dots.c, a_(n n)(t);
                 ) \
               & - det mat(
                   a_(1 1)(t), dots.c, b_1(t), dots.c, a_(1 n)(t);
                   dots.v, , dots.v, , dots.v;
                   a_(n 1)(t), dots.c, b_n(t), dots.c, a_(n n)(t);
                 ) sum_(j=1)^n det mat(
                   a_(11)(t), dots.c, a_(1 n)(t);
                   dots.v, , dots.v;
                   a_(j 1) '(t), dots.c, a_(j n) '(t);
                   dots.v, , dots.v;
                   a_(n 1)(t), dots.c, a_(n n)(t)
                 )
                 )
    $
  ]
]

#problem[2-16][
  Suppose $f: RR^n -> RR^n$ is differentiable and has a differentiable inverse $f^(-1): RR^n -> RR^n$. Show that $(f^(-1))'(a) = [f'(f^(-1)(a))]^(-1)$.

  #proof[
    There is $f compose f^(-1) = I x$. Taking derivative on both side gives:

    $
      f'(f^(-1)(x)) (f^(-1))'(x) & = I \
                    (f^(-1))'(x) & = [f'(f^(-1)(x))]^(-1)
    $

    which completes the proof.
  ]
]

