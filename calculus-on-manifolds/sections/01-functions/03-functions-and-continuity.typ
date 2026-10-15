#import "../../common.typ": *

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

