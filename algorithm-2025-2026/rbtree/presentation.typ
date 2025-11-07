#import "@preview/polylux:0.4.0": *
#import "@preview/lovelace:0.3.0": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set text(size: 25pt)
#show heading: set block(above: 1.75em, below: 1em)

#set page(paper: "presentation-16-9")
#show figure: set text(size: 20pt)

#slide[
  #set align(horizon)
  #set text(30pt)
  #show heading: set text(size: 40pt)
  = Red Black Tree

  Branden Xia \ Nov 7, 2025
]

#slide[
  == Why?
  Consider the worse case scenario of BST insertion. If every new element $n_i$ is larger all previous elements $n_1, n_2, dots.c, n_( i-1 )$, then the tree will degenerate into a linked list with height $bb(O)(n)$.

  #let nodes = ("1", "2", "3", "4", "5")
  #let edges = ((0, 1), (1, 2), (2, 3), (3, 4))
  #let graph = diagram({
    for (i, n) in nodes.enumerate() {
      let θ = 90deg - i*360deg/nodes.len()
      node((i * 0.5, i * 0.4), n, stroke: 0.5pt, name: str(i))
    }
    for (u, v) in edges {
      edge(label(str(u)), label(str(v)), "-|>")
    }
  })
  #align(center)[
    #figure(graph, caption: [Degenerated BST])
  ]
]

#slide[
  == Solution: Balanced Tree
  To handle those relatively rare cases, we can maintain the height of the tree to be $bb(O)(log n)$ through applying certain operations called rotations according to some rules.

  This kind of tree is called a balanced tree. For heights of left and right subtrees of any node, $h_l$ and $h_r$, $abs(h_l - h_r) <= 1$.

  While there's many types of balanced trees, we will focus on Red Black Trees today.
]

#slide[
  == Red Black Tree Properties
  A valid Red Black Tree satisfies the following properties:

  + Every node is either red or black
  + Empty leave nodes are black
  + Direct children of a red node are black
  + On every path from the root to an empty leaf, the number of black nodes is the same
]

#slide[
  == Example
  #align(center)[
    #figure(
      image("rbtree-example.svg", width: 80%),
      caption: [An example of a valid Red Black Tree @oi-wiki-rbtree]
    )
  ]
]

#slide[
  == How to maintain those properties?
]

#slide[
  == How to maintain those properties?
  To maintain those properties, we use rotation operations.

  #align(center)[
    #figure(
      image("rbtree-rotate.svg", width: 60%),
      caption: [Left and right rotations @oi-wiki-rbtree]
    )
  ]
]

#slide[
  == Insertion: case \#1
  #align(center)[
    #figure(
      image("rbtree-insert-case1.svg", width: 20%),
      caption: [Insertion case \#1 @oi-wiki-rbtree]
    )
  ]
]

#slide[
  == Insertion: case \#2
  #align(center)[
    #figure(
      image("rbtree-insert-case2.svg", width: 20%),
      caption: [Insertion case \#2 @oi-wiki-rbtree]
    )
  ]
]

#slide[
  == Insertion: case \#3
  #align(center)[
    #figure(
      image("rbtree-insert-case3.svg", width: 15%),
      caption: [Insertion case \#3 @oi-wiki-rbtree]
    )
  ]
]

#slide[
  == Deletion
  Deletion is more complicated, but follows a similar idea. The several cases of deletion will be left as exercise.
]

#slide[
  #bibliography("ref.bib")
]
