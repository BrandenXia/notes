#import "../../common.typ": *

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

