#import "@preview/physica:0.9.8": *

#set page(
  paper: "presentation-16-9",
)

#grid(
  columns: 2,
  gutter: 70pt,
  [
    Prove *Green's Identities*:

    $
      integral.surf_(partial W) f grad g dot hat(vb(n)) dd(S) = integral.triple_W ( f laplace g + grad f dot grad g ) dd(V)
    $
    and
    $
      integral.surf_(partial W) (f grad g - g grad f) dot hat(vb(n)) dd(S) = integral.triple_W (f laplace g - g laplace f) dd(V)
    $

    #linebreak()

    _Proof_:

    First, consider *Ostrogradsky's Theorem*:

    $
      integral.surf_(partial W) vb(F) dot hat(vb(n)) dd(S) = integral.triple_W div vb(F) dd(V)
    $

    Applying it to the LHS of the first identity (where $vb(F) = f grad g$), we have:

    $
      integral.surf_(partial W) f grad g dot hat(vb(n)) dd(S) & = integral.triple_W div (f grad g) dd(V) \
                                                              & = integral.triple_W ( f grad^2 g + grad f dot grad g ) dd(V) \
                                                              & = integral.triple_W ( f laplace g + grad f dot grad g ) dd(V)
    $

    which completes the proof of the first identity.
  ],

  [
    Now, we try to prove the second identity. Notice that we can split the LHS of the second identity into two parts:

    $
      integral.surf_(partial W) ( f grad g - g grad f ) dot hat(vb(n)) dd(S) = integral.surf_(partial W) ( f grad g dot hat(vb(n)) - g grad f dot hat(vb(n)) ) dd(S)
    $

    Next, we can simply apply the first identity to each of the two parts:

    $
      "RHS" & = integral.triple_W ( f laplace g + grad f dot grad g - g laplace f - grad g dot grad f ) dd(V) \
            & = integral.triple_W (f laplace g - g laplace f) dd(V)
    $

    which completes the proof of the second identity.


  ],
)
