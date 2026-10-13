#let is_shitty = false
#let when_shitty(content) = if is_shitty { content } else {}
#let when_not_shitty(content) = if not is_shitty { content } else {}

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

#show link: it => {
  if type(it.dest) == str {
    underline(text(fill: blue, it))
  } else {
    it
  }
}

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
  numbering: when_not_shitty("1"),
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

// Calculate the statement number at a given location.
#let statement-number(loc) = {
  let prefix = counter(heading).display(at: loc)
  let suffix = statement-counter.display("1", at: loc)
  prefix + suffix
}

// Custom reference handling.
#show ref: it => {
  let el = it.element

  if (
    it.form == "normal" and el != none and el.func() == figure and el.kind == "statement"
  ) {
    let loc = el.location()
    let name = if it.supplement == auto {
      el.supplement
    } else {
      it.supplement
    }

    link(loc, strong[#name #statement-number(loc)])
  } else {
    it
  }
}

// Render statement figures without figure styling.
#show figure.where(kind: "statement"): it => align(left, it.body)
#show figure.where(kind: "statement"): set block(breakable: true)

#let statement(name: "Statement", body) = {
  figure(
    block(breakable: true)[
      #statement-counter.step()
      #context {
        let number = statement-number(here())
        [*#name #number.* #h(0.5em) #body]
      }
    ],
    kind: "statement",
    supplement: name,
    outlined: false,
  )
}

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

#let exercises(body) = context {
  let last-heading-level = {
    let past-headings = query(selector(heading).before(here()))

    if past-headings.len() > 0 {
      past-headings.last().level
    } else {
      0
    }
  }
  set enum(indent: 0.8em, numbering: "I.")
  [
    #heading(
      level: last-heading-level + 1,
      numbering: none,
      outlined: false,
      "Exercises",
    )
    #body
  ]
}

#outline()

= Preface

As revealed in title, this is meant to be a collections of all the terrible practices I've seen in Analysis textbooks. This is greatly inspired by the article "如何糟糕地写数学分析讲义" @how-to-write-analysis and you might find quite a few overlap with it. Meanwhile, this is a product of myself getting bored over a random long weekend. Therefore, it's simply meant for having fun and don't take it seriously.

Actually, a control `is_shitty` is provided in the source code to make this even more terrible. This control exists so that I don't have to eat my own shit when writing in the future. If you want to see a better version, set `is_shitty = true` and recompile the source code.

With that been said, I believe that there are plenty of Analysis materials much more shitty than this without being intentionally shitty. I would be glad to accept any contribution that makes this even more terrible. Feel free to submit a PR on #link("https://github.com/BrandenXia/notes/blob/main/random-items/possibly-worst-analysis-intro.typ")[GitHub].

= Convergence, Limit, and Continuity

== Filters

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

  $ S subset.eq F and 0 < abs(X) < oo ==> exists a in F, forall b in S, a <= b $

  #proof[
    Suppose we have $a, b, d in F$, consider the following process:

    + $a, b in F ==> exists c in F, c <= a and c <= b$
    + $c, d in F ==> exists e in F, e <= a and e <= b$
    Applying the process inductively produce a lower bound for any finite subset.
  ]
]

#definition[
  Given a poset $(P, <=)$, a filter $F$ is said to be _proper_ if it is not the whole set $P$:

  $ F "is proper" <==> exists a in P, a in.not F $
]

#definition[
  Given a poset $(P, <=)$ and an element $p in P$, the _principal filter_ generated by $p$, denoted by $dot(p)$, is defined as:

  $ dot(p) = {x in P : a <= x} $
]

#definition[
  Given a set $X$, instantiating the definition of filter to the poset $(cal(P)(X), subset.eq)$ gives us the definition of a _filter $cal(F)$ on $X$_. In addition, we also require $cal(F)$ to be proper, i.e. $emptyset in.not cal(F)$.
]

== Convergence in Topological Spaces

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

#when_not_shitty[
  #remark[
    To see how this definition is useful, consider a sequence ${x_n}_(n in NN)$ on $X$ and its eventuality filter $cal(F)$:

    $ cal(F)_{x_n} = {A subset.eq X : exists N in NN, forall n >= N, x_n in A} $

    The reader can easily verify this is actually a filter. This naturally leads to the definition of convergence for a sequence:

    $ x_n -> x <==> cal(F)_{x_n} -> x $
  ] <eventually-filter-convergence>
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

  The definition of such $cal(F)^*_a$ is left as an exercise for the reader. #when_not_shitty[(Hint: try $cal(F)^*_a = {A subset.eq X : exists U in cal(N)(a), U \\ {a} subset.eq A}$.)]
] <remark-construct-point-filter>

#exercises[
  #when_not_shitty[
    + Show that the eventuality filter $cal(F)_{x_n}$ in @eventually-filter-convergence is indeed a filter.
  ]

  + Provide a definition for $cal(F)^*_a$ in @remark-construct-point-filter and show that it is indeed a filter.
]

== Convergence Space

#let Lim = $op("Lim")$

At this point, we won't continue to discuss further concepts of convergence in topological space. Instead, I'd rather turn back to consider the structure of convergence itself. This motives the definition of convergence space.

#definition[
  A convergence space is a set $S$ equipped with a convergence relation $cal(C) subset.eq cal(F)S times S$, where $cal(F)S$ is the collections of proper filters on $S$:

  $ cal(F)S = {cal(F) in cal(P)(cal(P)(S)) : cal(F) "is a filter"} $

  We can define the limit operator $Lim_cal(C) : cal(F)S -> cal(P)(S)$ induced by the relation:

  $ Lim_cal(C)(cal(F)) ={x in S : (cal(F), x) in cal(C)} $

  and convergence of a filter $cal(F)$ to a point $x$ is:

  $ cal(F) op(->)_S x <==> x in Lim_cal(C)(cal(F)) $

  Meanwhile, the following axioms need to be satisfied:
  + $forall x in S, x in Lim_cal(C)(dot({x}))$
  + $forall cal(F), cal(G) in cal(F)S, cal(F) subset.eq cal(G) ==> Lim_cal(C)(cal(F)) subset.eq Lim_cal(C)(cal(G))$
  + $forall cal(F) in cal(F)S, forall x in S, x in Lim_cal(C)(cal(F)) ==> x in Lim_cal(C)(cal(F) inter dot({x}))$
]

#exercises[
  + Given a convergence space $(S, cal(C))$. Show that $cal(P)(S)$ converges to every point.

  + Show that topological spaces where convergence is defined by neighborhood filters are convergence spaces.

  + For a metric space $(X, d)$, we can lift it to a topological space through the metric topology, which also make it a convergence space where convergence is defined by neighborhood filters. Define $lambda_X : cal(F)X -> X -> [0, oo]$:
    $ lambda_X (cal(F))(x) = sup_(A in cal(F)) inf_(a in A) d(x, a) $
    Show that
    $ cal(F) op(->)_X x <==> lambda_X (cal(F))(x) = 0 $
]

== Continuity

#definition[
  Let $(X, cal(C)_X)$ and $(Y, cal(C)_Y)$ be convergence spaces. We say that a function $f: X -> Y$ is continuous if and only if

  $ forall cal(F) in cal(F)S, f(Lim_cal(C)_X (cal(F))) subset.eq Lim_cal(C)_Y (f_*(cal(F))) $

  Or equivalently:

  $ cal(F) op(->)_X x ==> f_*(cal(F)) op(->)_Y f(x) $
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
