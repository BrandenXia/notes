#import "../../common.typ": *

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

