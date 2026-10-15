#import "../../common.typ": *

== Partial Derivatives

#problem[2-17][
  Find the partial derivatives of the following functions:
  + $f(x, y, z) = x^y$
  + $f(x, y, z) = z$
  + $f(x, y) = sin(x sin y)$
  + $f(x, y, z) = sin(x sin(y sin z))$
  + $f(x, y, z) = x^y^z$
  + $f(x, y, z) = x^(y+z)$
  + $f(x, y, z) = (x + y)^z$
  + $f(x, y) = sin(x y)$
  + $f(x, y) = [sin(x y)]^(cos 3)$

  #solution[
    #set enum(indent: 0pt)

    + $D_1 f(x, y, z) = y x^(y - 1)$

      $D_2 f(x, y, z) = ln x dot x^y$

      $D_3 f(x, y, z) = 0$

    + $D_1 f(x, y, z) = 0$

      $D_2 f(x, y, z) = 0$

      $D_3 f(x, y, z) = 1$

    + $D_1 f(x, y) = cos(x sin y) sin y$

      $D_2 f(x, y) = x cos(x sin y) cos y$

    + $D_1 f(x, y, z) = cos(x sin(y sin z)) sin(y sin z)$

      $D_2 f(x, y, z) = x cos(x sin(y sin z)) cos(y sin z) sin z$

      $D_3 f(x, y, z) = x y cos(x sin(y sin z)) cos(y sin z) cos z$

    + $D_1 f(x, y, z) = y^z x^(y^z - 1)$

      $D_2 f(x, y, z) = z ln x dot x^y^z y^(z - 1)$

      $D_3 f(x, y, z) = ln x ln y dot x^y^z y^z$

    + $D_1 f(x, y, z) = (y + z) x^(y + z - 1)$

      $D_2 f(x, y, z) = ln x dot x^(y + z)$

      $D_3 f(x, y, z) = ln x dot x^(y + z)$

    + $D_1 f(x, y, z) = z (x + y)^(z - 1)$

      $D_2 f(x, y, z) = z (x + y)^(z - 1)$

      $D_3 f(x, y, z) = ln(x + y) dot (x + y)^z$

    + $D_1 f(x, y) = y cos(x y)$

      $D_2 f(x, y) = x cos(x y)$

    + $D_1 f(x, y) = cos 3 dot y [sin(x y)]^(cos 3 - 1) cos(x y)$

      $D_2 f(x, y) = cos 3 dot x [sin(x y)]^(cos 3 - 1) cos(x y)$
  ]
]

#problem[2-18][
  Find the partial derivatives of the following functions (where $g: RR -> RR$ is continuous):

  + $f(x, y) = integral_a^(x + y) g$

  + $f(x, y) = integral_y^x g$

  + $f(x, y) = integral_a^(x y) g$

  + $f(x, y) = integral_a^(( integral_b^y g )) g$

  #solution[
    #set enum(indent: 0pt)

    + $D_1 f(x, y) = g(x + y)$

      $D_2 f(x, y) = g(x + y)$

    + $D_1 f(x, y) = g(x)$

      $D_2 f(x, y) = - g(y)$

    + $D_1 f(x, y) = y g(x y)$

      $D_2 f(x, y) = x g(x y)$

    + $D_1 f(x, y) = 0$

      $D_2 f(x, y) = g(integral_b^y g) dot g(y)$
  ]
]

#problem[2-19][
  If $f(x, y) = x^x^x^x^y + (log x)(arctan(arctan(arctan(sin(cos x y) - log(x + y)))))$ find $D_2 f(1, y)$.

  #solution[
    $ D_2 f(1, y) = ln 1 dot (dots.c) + ln 1 dot (dots.c) = 0 $
  ]
]

#problem[2-20][
  Find the partial derivatives of $f$ in terms of the derivatives of $g$ and $h$ if

  + $f(x, y) = g(x)h(y)$

  + $f(x, y) = g(x)^h(y)$

  + $f(x, y) = g(x)$

  + $f(x, y) = g(y)$

  + $f(x, y) = g(x + y)$

  #solution[
    #set enum(indent: 0pt)

    + $D_1 f(x, y) = g'(x) h(y)$

      $D_2 f(x, y) = g(x) h'(y)$

    + $D_1 f(x, y) = h(y) g(x)^(h(y) - 1) g'(x)$

      $D_2 f(x, y) = ln g(x) dot g(x)^h(y) h'(y)$

    + $D_1 f(x, y) = g'(x)$

      $D_2 f(x, y) = 0$

    + $D_1 f(x, y) = 0$

      $D_2 f(x, y) = g'(y)$

    + $D_1 f(x, y) = g'(x + y)$

      $D_2 f(x, y) = g'(x + y)$
  ]
]

#problem[2-21][
  Let $g_1, g_2: RR^2 -> RR$ be continuous. Define $f: RR^2 -> RR$ by

  $ f(x, y) = integral_0^x g_1(t, 0) dd(t) + integral_0^y g_2(x, t) dd(t) $

  + Show that $D_2 f(x, y) = g_2(x, y)$.
  + How should $f$ be defined so that $D_1 f(x, y) = g_1(x, y)$?
  + Find a function $f: RR^2 -> RR$ such that $D_1 f(x, y) = x$, $D_2 f(x, y) = y$. Find one such that $D_1 f(x, y) = y$ and $D_2 f(x, y) = x$.

  #solution[
    Since the only part of $f$ with respect to $y$ is the second part, by the fundamental theorem of calculus, we have

    $ D_2 f(x, y) = pdv(, y) integral_0^y g_2(x, t) dd(t) = g_2(x, y) $

    Mimic the structure in the second term in the first term will satisfy condition in the second part.

    $ f(x, y) = integral_0^x g_1(t, y) dd(t) + integral_0^y g_2(0, t) dd(t) $

    The two function that satisfy the condition in the third part are

    $ f(x, y) & = (x^2 + y^2) / 2 quad "and" quad f(x, y) & = x y $
  ]
]

#problem[2-22][
  If $f: RR^2 -> RR$ and $D_2 f = 0$, show that $f$ is independent of the second variable. If $D_1 f = D_2 f = 0$, show that $f$ is constant.

  #proof[
    Fix $x in RR$. Define $g(y) = f(x, y)$. There is $g'(y) = D_2 f(x, y) = 0$. By Mean Value Theorem, for any $y_1, y_2 in RR$, $y_1 < y_2$, there is

    $ (g(y_2) - g(y_1)) / (y_2 - y_1) = g'(y) = 0 $

    Therefore, $f(x, y_1) = f(x, y_2)$ for any $y_1 != y_2$, and the value must be equal whenever $y_1 = y_2$, which proves that $f$ is independent of the second variable.

    To prove the second part, we can follow the similar step to prove that $f$ is independent of the first variable. Then, assuming $f(x_0, y_0) = C$ at some arbitrary point, we get $f = C$ everywhere.
  ]
]

#problem[2-23][
  Let $A = {(x, y) in RR^2 : x < 0, "or" x >= 0 "and" y != 0}$.

  + If $f: A -> RR$ and $D_1 f = D_2 f = 0$, show that $f$ is constant.

  + Find a function $f: A -> RR$ such that $D_2 f = 0$ but $f$ is not independent of the second variable.

  #proof[
    Given two arbitrary points $(x_1, y_1), (x_2, y_2) in A$. There exists $x'$ where $x_1 <= x'$ and $x' > 0$. Define $L: RR^2 times RR^2 -> {A subset RR^2}$

    $ L((a_x, a_y), (b_x, b_y)) = {(x, y) in RR^2 : (x - a_x) / (a_x - b_x) = (y - a_y) / (a_y - b_y)} $

    Notice that $f$ is constant along $L(a, b)$ as long as $L(a, b) inter {(x, y) : x < 0 "and" y = 0} = emptyset$. Therefore, we have

    $ f(x_1, y_1) = f(x', y_1) = f(x', y_2) = f(x_2, y_2) $

    because $L$ connecting those points are always on domain of $f$. Since the two points are arbitrary, $f$ is constant.

    For the second part, consider the function $f: A -> RR$ defined by

    $
      f(x, y) = cases(
        e^(1 \/ x) quad & x < 0 "and" y > 0,
        0 quad & "otherwise"
      )
    $

    This function is differentiable everywhere on its domain, and $D_2 f = 0$, but $f(-1, -1) != f(-1, 1)$.
  ]
]

#problem[2-24][
  Define $f: RR^2 -> RR$ by

  $
    f(x, y) = cases(
      x y (x^2 - y^2) / (x^2 + y^2) quad & (x, y) != 0,
      0 quad & (x, y) = 0
    )
  $

  + Show that $D_2 f(x, 0) = x$ for all $x$ and $D_1 f(0, y) = -y$ for all $y$.

  + Show that $D_(1, 2) f(0, 0) != D_(2, 1) f(0, 0)$.

  #proof[
    It suffices to prove that

    $ L = lim_(h -> 0) (f(x, h) - f(x, 0)) / h = x $

    If $x = 0$, then $L$ obviously converges to $0$. Thus, suppose $x != 0$, we have

    $
      L = lim_(h -> 0) (x h (x^2 - h^2)) / ((x^2 + h^2) h) = x lim_(h -> 0) (x^2 - h^2) / (x^2 + h^2) = x
    $

    The other limit can be proven similarly

    $ lim_(h -> 0) (f(h, y) - f(0, y)) / h = (h y (h^2 - y^2)) / (h (h^2 + y^2)) = -y $

    Then, the second derivatives at $(0, 0)$ can be computed as

    $
      D_(1, 2) f(0, 0) = lim_(h -> 0) (D_1 f(0, h) - D_1 f(0, 0)) / h = lim_(h -> 0) (-h - 0) / h = -1
    $

    $ D_(2, 1) f(0, 0) = lim_(h -> 0) (D_2 f(h, 0) - D_2 f(0, 0)) / h = (h - 0) / h = 1 $

    Therefore, $D_(1, 2) f(0, 0) != D_(2, 1) f(0, 0)$.
  ]
]

#problem[2-25][
  Define $f: RR -> RR$ by

  $
    f(x) = cases(
      e^(-x^(-2)) quad & x != 0,
      0 quad & x = 0
    )
  $

  Show that $f$ is a $C^oo$ function, and $f^((i))(0) = 0$ for all $i$.

  #proof[
    First, consider the $n$th derivative of $f$ where $x != 0$. We can prove that it always takes the form

    $ f^((n))(x) = P_n (x^(-1)) e^(-x^(-2)) $

    where $P_n$ is a polynomial through induction. The base case is trivial. Suppose it holds for $n = k$, then for $n = k + 1$

    $
      f^((k + 1)) & = P_n '(x^(-1)) dot (- x^(-2)) e^(-x^(-2)) - P_n (x^(-1)) dot 2x^(-3) e^(-x^(-2)) \
                  & = (P_n '(x^(-1)) dot (- x^(-2)) - P_n (x^(-1)) dot 2x^(-3)) e^(-x^(-2)) \
                  & = P_(n + 1)(x^(-1)) e^(-x^(-2))
    $

    This completes the induction. Then, we can apply induction to prove that $f^((n))(0) = 0$. The base case holds by definition. Suppose $f^((n))(0) = 0$, the $( n + 1 )$th derivative is given by the limit

    $ f^((n + 1))(0) = lim_(h -> 0) ( f^((n))(h) ) / h = lim_(h -> 0) ( P_(n + 1)(x^(-1)) e^(-x^(-2)) ) / h $

    Substituting $t = 1 \/ h$ gives:

    $ lim_(t -> oo) (P_(n + 1)(t)) / (h e^t^2) $

    Both numerator and denominator diverges to infinity, but we know that exponential function diverges way faster than polynomial. Therefore, the limit goes to $0$, which completes the induction. Since the $n$th derivative of $f$ is defined everywhere for all $n$, $f$ is a $C^oo$ function.
  ]
]

#problem[2-26][
  Let
  $
    f(x) = cases(
      e^(-(x - 1)^(-2)) dot e^(-(x + 1)^(-2)) quad & x in (-1, 1),
      0 quad & x in.not (-1, 1)
    )
  $

  + Show that $f: RR -> RR$ is a $C^oo$ function which is positive on $(-1, 1)$ and $0$ elsewhere.

  + Show that there's a $C^oo$ function $g: RR -> [0, 1]$ such that $g(x) = 0$ for $x <= 0$ and $g(x) = 1$ for $x >= epsilon$.

  + If $a in RR^n$, define $g: RR^n -> RR$ by

    $ g(x) = f([x^1 - a^1] \/ epsilon) dot ... dot f([x^n - a^n] \/ epsilon) $

    Show that $g$ is a $C^oo$ function which is positive on

    $ (a^1 - epsilon, a^1 + epsilon) times dots.c times (a^n - epsilon, a^n + epsilon) $

    and zero elsewhere.

  + If $A subset RR^n$ is open and $C subset A$ is compact, show that there is a non-negative $C^oo$ function $f: A -> RR$ such that $f(x) > 0$ for $x in C$ and $f = 0$ outside of some closed set contained in $A$.

  + Show that we can choose such an $f$ so that $f: A -> [0, 1]$ and $f(x) = 1$ for $x in C$.

  #proof[
    In *Problem 2-25*, we've shown that $h(x) = e^(-x^(-2))$ is a $C^oo$ function. Notice that $f(x) = h(x-1) h(x+1)$. Since it is a product of $C^oo$ function, it's also $C^oo$. Meanwhile, $h(x) > 0$ for all $x in RR$, which is enough to show that $f(x) > 0$ for $x in (-1, 1)$ and $f(x) = 0$ elsewhere by definition.

    Now, to prove the second part. Consider the following function:
    $
      g(x) = cases(
        0 quad & x <= 0,
        1 - e^2 f(x \/ epsilon) quad & 0 < x < epsilon,
        1 quad & x >= epsilon
      )
    $
    To show that this is $C^oo$, it suffices to show that this is differentiable at $0$ and $epsilon$. For $x = 0$, we have:
    $ g'(0) = lim_(x -> 0) (g(x) - g(0)) / x = lim_(x -> 0) g(x) / x $
    The left-hand limit is obviously $0$. The right-hand limit is:
    $
      lim_(x -> 0^+) g(x) / x & = lim_(x -> 0^+) (1 - e^2 f(x \/ epsilon)) / x \
                              & = - e^2 / epsilon lim_(x -> 0^+) ( f(x \/ epsilon) - f(0) ) / (x \/ epsilon) \
                              & = -e^2 / epsilon f'(0)
    $
    From the previous problem, we can easily show that $f'(0) = 0$, which completes the proof that $g'(0) = 0$.

    Now, for $x = epsilon$, we have:
    $ g'(epsilon) = lim_(x -> epsilon) (f(x) - f(epsilon)) / (x - epsilon) $
    The proof is similar to the previous case, and we can show that $g'(epsilon) = 0$. Therefore, $g$ is a $C^oo$ function.

    Now, we can proceed to the third part. Notice that $g(x) = f([x^1 - a^1] \/ epsilon) dot ... dot f([x^n - a^n] \/ epsilon)$ is a product of $C^oo$ functions, which is also $C^oo$. Meanwhile, $g(x) > 0$ for $x in (a^1 - epsilon, a^1 + epsilon) times dots.c times (a^n - epsilon, a^n + epsilon)$ as proved in the first part and $g(x) = 0$ elsewhere by definition.

    Part four is essentially an application of the function defined in part three. Since $C$ is compact, we can cover it with a finite covering $cal(R)$ where each $R in cal(R)$ is a rectangle of the form $(a^1 - epsilon, a^1 + epsilon) times dots.c times (a^n - epsilon, a^n + epsilon)$ contained in $A$. Then, we can define $f(x) = sum_(R in cal(R)) g_R(x)$ where $g_R$ is the function defined in part three for each rectangle $R$. This function is non-negative, $C^oo$, and satisfies the required properties.

    Simply composing the function in part four with the function in part two gives the desired function in part five.
  ]
]

#problem[2-27][
  Define $g, h: {x in RR^2 : |x| <= 1} -> RR^3$ by
  $
    g(x, y) & = (x, y, sqrt(1 - x^2 - y^2)) \
    h(x, y) & = (x, y, -sqrt(1 - x^2 - y^2))
  $
  Show that the maximum of $f$ on ${x in RR^3 : |x| <= 1}$ is either the maximum of $f compose g$ or the maximum of $f compose h$ on ${x in RR^2 : |x| <= 1}$.

  #proof[
  ]
]
