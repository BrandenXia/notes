#let is_shitty = false

#let title = "(Possibly) Worst Introduction to Analysis"

#set document(
  title: title,
  author: "Branden Xia",
)


#set heading(
  numbering: "I.",
)

#set text(
  size: 13pt,
  font: ("libertinus serif", "Songti SC"),
)

#show heading: set text(
  size: 18pt,
)

#show heading.where(level: 1): set block(below: 0.8em)

#page[
  #set align(horizon + right)

  #text(size: 34pt)[
    *#title*
  ]

  #text(size: 20pt)[
    Branden Xia
  ]
]

#counter(page).update(1)
#set page(
  numbering: "1",
)

#show par: set text(
  size: 13pt,
)

#set enum(
  indent: 1em,
)


#let statement-counter = counter("statement")

// Reset on every heading, regardless of depth.
#show heading: it => {
  statement-counter.update(0)
  it
}

#let statement(name: "Theorem", body) = block[
  #statement-counter.step()
  #context {
    let prefix = counter(heading).display()
    let suffix = statement-counter.display("1")
    let number = prefix + suffix

    [*#name #number.* #h(0.5em) #body]
  }
]

#let definition(body) = statement(name: "Definition", body)
#let lemma(body) = statement(name: "Lemma", body)
#let proposition(body) = statement(name: "Proposition", body)
#let corollary(body) = statement(name: "Corollary", body)
#let remark(body) = statement(name: "Remark", body)
#let theorem(body) = statement(name: "Theorem", body)
#let example(body) = statement(name: "Example", body)

#let proof(body) = block(
  inset: (x: 0.8em),
)[
  _*Proof.*_ #h(0.5em) #body
]


#outline()

= Preface

As revealed in title, this is meant to be a collections of all the terrible practices I've seen in Analysis textbooks. This is greatly inspired by the article "如何糟糕地写数学分析讲义" @how-to-write-analysis and you might find quite a few overlap with it. Meanwhile, this is a product of myself getting bored over a random long weekend. Therefore, it's simply meant for having fun and don't take it seriously.

Actually, a control `is_shitty` is provided in the source code to make this even more terrible. If you want to see a better version, set `is_shitty = true` and recompile the source code.

= Convergence and Limit

#definition[
  Given a poset $(P, <=)$, a _filter_ $F subset.eq P$ is defined so that:
  + $F != emptyset$
  + $forall a in F and a <= b, b in F$
  + $forall a, b in F, exists c in F, c <= a and c <= b$
]

#remark[
  This definition of filter describes elements in $P$ that are sufficiently large on the partial order. While not immediately obvious, filters enjoy the following properties.
]

#theorem[
  Every finite subset of a filter $F$ has a lower bound in the filter.

  $ forall S subset.eq F and 0 < abs(X) < oo ==> exists a in F, forall b in S, a <= b $

  #proof[
    Suppose we have $a, b, d in F$, consider the following process:

    + $a, b in F ==> exists c in F, c <= a and c <= b$
    + $c, d in F ==> exists e in F, e <= a and e <= b$
    Applying the process inductively produce a lower bound for any finite subset.
  ]
]

#definition[
  Given a set $X$, instantiating the definition of filter to the poset $(cal(P)(X), subset.eq)$ gives us the definition of a _filter $cal(F)$ on $X$_. In addition, we also require $cal(F)$ to be proper, i.e. $emptyset in.not cal(F)$.
]

#definition[
  Let $(X, cal(T))$ be a topological space. For any point $x in X$, the neighborhood filter $cal(N)(x)$ is defined as:

  $ cal(N)(x) = {A subset.eq X : exists U in cal(T), x in U subset.eq A} $
]

#remark[
  We can show that a neighborhood filter is indeed a filter. Obviously, $emptyset in.not cal(N)(x)$ and $X in cal(N)(x)$. It suffices to show (1) $forall A in cal(N)(x) and A subset.eq B, B in cal(N)(x)$ and (2) $forall A, B in cal(N)(x), A inter B subset.eq A and C subset.eq B$. Notice that (1) is trivial once having $x in U subset.eq A subset.eq B$. To prove (2), we can obtain $x in U subset.eq A$ and $x in V subset.eq B$ by definition of neighborhood filter. Then, $x in U inter V subset.eq A inter B$ shows that $A inter B in cal(N)(x)$ since $U inter V in cal(T)$ by definition of topology. This completes the proof.
]

#definition[
  Let $(X, cal(T))$ be a topological space, and let $cal(F) subset.eq cal(P)(X)$ be a filter on $X$. We can define that $cal(F)$ converges to $x in X$ if and only if every neighborhood of $x$ belongs to $cal(F)$:

  $ cal(F) -> x <==> forall U in cal(N)(x), U in cal(F) $

  Or equivalently:

  $ cal(F) -> x <==> cal(F) supset.eq cal(N)(x) $
]

#if not is_shitty [
  #remark[
    To see how this definition is useful, consider a sequence ${x_n}_(n in NN)$ on $X$ and its eventuality filter $cal(F)$:

    $ cal(F)_{x_n} = {A subset.eq X : exists N in NN, forall n >= N, x_n in A} $

    The reader can easily verify this is actually a filter. This naturally leads to the definition of convergence for a sequence:

    $ x_n -> x <==> cal(F)_{x_n} -> x $
  ]
]

#definition[
  Given $f: X -> Y$ where $Y$ is a topological space, and let $cal(F)$ be a filter on $X$. We can define the image filter $f_*(cal(F))$:

  $ f_*(cal(F)) = {B subset.eq Y : f^(-1)(B) in cal(F)} $

  and define the limit of $f$ along $cal(F)$:

  $ lim_cal(F) f = y <==> f_*(cal(F)) -> y $
]

#remark[
  Similarly, given a point $a in X$, we can define a filter $cal(F)_a$ so that:

  $ lim_(x -> a) f(x) = y <==> lim_cal(F)_a f = y $

  The definition of such $cal(F)^*_a$ is left as an exercise for the reader. #if not is_shitty [(Hint: try $cal(F)^*_a = {A subset.eq X : exists U in cal(N)(a), U \\ {a} subset.eq A}$.)]
]

= References

#bibliography(
  title: none,
  bytes(
    "
@misc{how-to-write-analysis,
  title={如何糟糕地写数学分析讲义},
  author={Sinnaruil},
  year={2026},
  url={https://zhuanlan.zhihu.com/p/2018086143472727324}
}
  ",
  ),
)
