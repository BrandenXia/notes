#import "@preview/polylux:0.4.0": *
#import "@preview/equate:0.3.1": equate

#set text(font: "New Computer Modern", size: 25pt)

#set page(paper: "presentation-16-9")

#set heading(numbering: "1.")
#show heading: set block(above: 1.75em, below: 1em)

#set math.equation(
  numbering: "(1)",
  supplement: "Eq."
)
#show: equate.with(
  number-mode: "label",
)

#let statement(body, tag: "Statement") = {
  v(8pt)
  set block(above: 0.8em, below: 0.5em)
  [
    #text(
      weight: "bold",
    )[_ #tag._]
    #body
  ]
  v(8pt)
}

#let definition(body) = statement(body, tag: "Definition")
#let theorem(body) = statement(body, tag: "Theorem")
#let lemma(body) = statement(body, tag: "Lemma")
#let proof(body) = {
  block[
    #statement(body, tag: "Proof")
    #place(bottom + right, $qed$)
  ]
}

#let matrix(..args) = $mat(..args)$
#let mat(sym) = $upright(bold(sym))$
#let adj = $op("adj")$

#let vec(sym) = $bold(sym)$

#slide[
  #set align(horizon)
  #text(size: 34pt, weight: "bold")[
    Inverse of Matrix & Cramer's Rule
  ]

  Leo Che, Maija Lematta, Kamran Mohamedy, Branden Xia

  Nov 3, 2025
]

#slide[
  = Inverse of Matrix
  In this section, we're going to prove a way to determine whether a matrix is invertible without calculating its inverse. We are also going to derive an explicit formula for the inverse of a matrix.
]

#slide[
  == Basic Definitions

  #definition[
    The matrix minor of a $n times n$ matrix $mat(A)$ is a $(n-1) times (n-1)$ matrix that remove the $i$th row and $j$th column of the matrix $mat(A)$, denoted as $mat(M)_(i j)$. <matrix-minor>
  ]

  #definition[
    The determinant of a $n times n$ matrix $mat(A)$ is defined as:
    #set math.cases(gap: 1em)
    $ det mat(A) := cases(
      display( sum_(j=1)^n (-1)^(1+j) mat(A)_(1j) det mat(M_(1 j)) ) quad & "if" n >= 1,
      mat(A)_(11) &"if" n = 1,
    ) $
  ]
]

#slide[
  == Cofactor Matrix

  #definition[
    For a $n times n$ matrix $mat(A)$, a cofactor matrix $mat(C)$ is a $n times n$ matrix, each entry defined as:
    $ mat(C)_(i j) = (-1)^(i+j) dot det mat(M)_(i j) $ <cofactor-matrix>
  ]

  With cofactors defined, determinant also be written as:
  $ det mat(A) = sum_(j=1)^n mat(A)_(i j) dot mat(C)_(i j) quad "for any" 1 <= i <= n $ <determinant-cofactor>
]

#slide[
  == Properties of Cofactor Matrix

  The transpose of the cofactor matrix can be expressed as:
  $ mat(C)^upright(T)_(i j) = (-1)^(i+j) dot det mat(M)_(j i) $

  We calls this the *adjugate matrix* of $mat(A)$, denoted as $adj(mat(A))$.
]

#slide[
  Before proving the next part, we'll first prove a lemma:
  #lemma[
    If a $n times n$ matrix $mat(A)$ has two identical rows, then $det mat(A) = 0$.
  ]
  #proof[
    Recall the property of determinant that exchanging two rows of $mat(A)$ reverse $det mat(A)$ to $-det mat(A)$. If $mat(A)$ has two identical rows, exchanging them won't change the matrix, which means $det mat(A) = -det mat(A)$. Therefore, $det mat(A) = 0$.
  ]
]

#slide[
  Let's prove another theorem:
  #theorem[
    For a $n times n$ matrix $mat(A)$, the following holds:
    $ mat(A) adj(mat(A)) = det mat(A) dot mat(I) $
  ]

  #proof[
    Consider each entry of the matrix multiplication:
    $
      (mat(A) adj(mat(A)))_(i j) = (mat(A) mat(C)^upright(T))_(i j) = sum_(k=1)^n mat(A)_(i k) dot mat(C)^upright(T)_(k j)
    $

    Here, we can split the problem into two cases:
    \
    \
    \

    1. If $i = j$:
    $
      (mat(A) mat(C)^upright(T))_(i i) &= sum_(k=1)^n mat(A)_(i k) dot mat(C)^upright(T)_(k i) \
      &= sum_(k=1)^n mat(A)_(i k) dot mat(C)_(i k) &quad "(by def. of transpose)" \
      &= det(mat(A)) &quad #[(by @determinant-cofactor)] \
    $
    \
    \
    \
    \

    2. If $i != j$:

    Consider another $n times n$ matrix $mat(B)$ defined as:
    $
      mat(B)_(p q) := cases(
        mat(A)_(p q) &quad "if" p != j,
        mat(A)_(i q) &quad "if" p = j,
      )
    $
    which is basically replacing the $j$th row of $mat(A)$ with its $i$th row.

    Since it has the same entries as $mat(A)$ everywhere except at the $j$th row, we have:
    $ mat(M)_mat(B) = mat(M) $

    $
      (mat(A) mat(C)^upright(T))_(i j) &= sum_(k=1)^n mat(A)_(i k) dot mat(C)^upright(T)_(k j) \
      &= sum_(k=1)^n mat(A)_(i k) dot (-1)^(k+j) dot det mat(M)_(j k) \
      &= sum_(k=1)^n mat(B)_(j k) dot (-1)^(k+j) dot det mat(M)_(j k) \
      &= sum_(k=1)^n mat(B)_(j k) dot mat(C)^upright(T)_(k j) \
      &= det(mat(B))
    $

    However, by the lemma we proved, since $i$th and $j$th row of $mat(B)$ are the same, we have $det mat(B) = 0$, which means:
    $ (mat(A) mat(C)^upright(T))_(i j) = 0 $

    Now, we have proved that for both cases, which means:
    $
      (mat(A) adj(mat(A)))_(i j) &= cases(
        det mat(A) &quad "if" i = j,
        0 &quad "if" i != j,
      ) \
      &= det mat(A) dot mat(I)_(i j)
    $

    Therefore,
    $ mat(A) adj(mat(A)) = det mat(A) dot mat(I) $
  ]
]

#slide[
  == Existence of Inverse Matrix with Determinant

  #theorem[
    for a $n times n$ matrix $mat(A)$, the following relation holds:
    $ det mat(A) != 0 quad <==> quad exists A^(-1) $
  ]
]

#slide[
  #proof[
    Since the theorem is both way, we first prove the forward direction:
    
    1. Assume $det mat(A)!= 0$, prove $mat(A)^(-1)$ exists:
    
    $
      mat(A) adj(mat(A)) &= det mat(A) dot mat(I) &quad "(from previous theorem)" \
      mat(I) &= mat(A) (1/(det mat(A))) adj(mat(A)) &quad "(since" det mat(A) != 0 ")" \
      mat(A)^(-1) &= 1/(det mat(A)) dot adj(mat(A))
    $
    \
    \
    2. Assume $mat(A)^(-1)$ exists, prove $det(mat(A)) != 0$:

    $
      mat(A) mat(A)^(-1) &= mat(I) \
      det(mat(A) mat(A)^(-1)) &= det mat(I) \
      det mat(A) dot det mat(A)^(-1) &= 1 &quad "(property of determinant)" \
    $

    Since $det(mat(A))$ multiple by some other number is $1$, it must be non-zero. Therefore, we have:
    $ det mat(A) != 0 $
  ]
]

#slide[
  = Cramer's Rule

  #theorem[
    (Cramer's Rule) If $det mat(A) != 0$, given a linear system $mat(A) vec(x) = vec(b)$,
    $
      x_j = ( det mat(B_j) )/ ( det mat(A) )
      quad "where" (mat(B_j))_(i k) = cases(
        A_(i k) &quad "if" k != j,
        vec(b)_i &quad "if" k = j,
      )
    $
    gives the unique solution $bold(x)$ to the linear system.
  ]
]

#slide[
  #proof[
    Since $det mat(A) != 0$, we know that $mat(A)^(-1)$ exists, and is given by:
    $ mat(A)^(-1) &= 1/(det mat(A)) dot adj(mat(A)) $
    \
    Therefore, the solution to the linear system is:
    $
      vec(x) &= mat(A)^(-1) vec(b) = 1/(det mat(A)) dot adj(mat(A)) vec(b) \
      x_j &= ( (j "th row of " adj(mat(A))) dot vec(b) ) / (det mat(A))
    $

    Notice the similarity of this equation with the equation in Cramer's Rule. Our target is to prove that:
    $ (j"th row of " adj(mat(A))) dot vec(b) = det mat(B_j) $ <cramer-goal>

    \
    \
    We can start by considering equivalence form of vector dot product. It's quite obvious that $vec(a) dot vec(b) = vec(a)^upright(T) vec(b)$.
    Therefore, we have:

    $
      #[lhs of @cramer-goal] &= (j"th row of " adj(mat(A)))^upright(T) vec(b) \ &= (j"th column of" mat(C) ) dot vec(b)
    $

    Next, consider the other side with cofactor formula of determinant along the $j$th column. Since $mat(B_j)$ only replaced the $j$th column of $mat(A)$, its cofactor matrix remains the same.
    $
      #[lhs of @cramer-goal] &= det mat(B_j) \
      &= sum_(i=1)^n (mat(B_j))_(i j) mat(C)_(i j) \
      &= sum_(i=1)^n b_i dot mat(C)_(i j) &quad "(by def. of" mat(B_j) ")" \
      &= (j"th column of" mat(C) ) dot vec(b)
    $

    Thus, we have $"lhs" = "rhs"$. Cramer's rule is proved.
  ]
]
