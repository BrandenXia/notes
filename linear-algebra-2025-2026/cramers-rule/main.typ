#import "@preview/equate:0.3.1": equate

#let title = [Inverse of Matrix & Crammer's Rule]
#set document(
  title: title,
  author: "Branden Xia"
)

#set text(font: "New Computer Modern", size: 13pt)

#set page(
  paper: "us-letter",
  margin: (x: 0.85in, y: 1.2in),
  header-ascent: 37%,
  header: [
    #set text(size: 12pt)
    _ #title _
    #h(1fr)
    Linear Algebra 2025-2026
    #line(length: 100%)
  ],
  numbering: "- 1 -",
)

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
    #place(bottom + right, dy: -0.6em, $qed$)
  ]
}

#let matrix(..args) = $mat(..args)$
#let mat(sym) = $upright(bold(sym))$
#let adj = $op("adj")$

#let vec(sym) = $bold(sym)$

= Inverse of Matrix

In this section, we're going to prove a way to determine whether a matrix is invertible without calculating its inverse. We are also going to derive an explicit formula for the inverse of a matrix.

== Basic Definitions

Recall definitions of determinant and matrix minors:

#definition[
  The matrix minor of a $n times n$ matrix $mat(A)$ is a $(n-1) times (n-1)$ matrix that remove the $i$th row and $j$th column of the matrix $mat(A)$, denoted as $mat(M)_(i j)$. <matrix-minor>
]

In this paper, whenever it's not ambiguous, I'll  directly use $mat(M)$ to denote the matrix minor of a matrix. When there's possible ambiguity, I'll use $mat(M)_mat(A)$ for minor of $mat(A)$.

It's worth noting that since matrix minors are constructed by removing a row and a column, the following stands true:

#theorem[
  For every matrix minor $mat(M)_(mat(A), i j)$ of a $n times n$ matrix $mat(A)$, it's always possible to construct a $n times n$ matrix $mat(B)$ so that it has the same matrix minor $mat(M)_(mat(B), i j) = mat(M)_(mat(A), i j)$.
]

This theorem is quite trivial so we won't prove it here.

#definition[
  The determinant of a $n times n$ matrix $mat(A)$ is defined as:
  #set math.cases(gap: 1em)
  $ det mat(A) := cases(
    display( sum_(j=1)^n (-1)^(1+j) mat(A)_(1j) det mat(M_(1 j)) ) quad & "if" n >= 1,
    mat(A)_(11) &"if" n = 1,
  ) $
]

== Cofactor Matrix

We can begin with the concept of a *cofactor matrix*:

#definition[
  For a $n times n$ matrix $mat(A)$, a cofactor matrix $mat(C)$ is a $n times n$ matrix, each entry defined as:
  $ mat(C)_(i j) = (-1)^(i+j) dot det mat(M)_(i j) $ <cofactor-matrix>
]

With cofactors defined, determinant also be written as:
$ det mat(A) = sum_(j=1)^n mat(A)_(i j) dot mat(C)_(i j) quad "for any" 1 <= i <= n $ <determinant-cofactor>

== Properties of Cofactor Matrix

To proceed, we can first prove some useful properties of the cofactor matrix.

It's easy to see that the transpose of the cofactor matrix can be expressed as:
$ mat(C)^upright(T)_(i j) = (-1)^(i+j) dot det mat(M)_(j i) $

This is also known as the *adjugate matrix* of $mat(A)$, denoted as $adj(mat(A))$.

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

  1. If $i = j$, the entry is simply $det(mat(A))$:
  $
    (mat(A) mat(C)^upright(T))_(i i) &= sum_(k=1)^n mat(A)_(i k) dot mat(C)^upright(T)_(k i) \
    &= sum_(k=1)^n mat(A)_(i k) dot mat(C)_(i k) &quad "(by def. of transpose)" \
    &= det(mat(A)) &quad #[(by @determinant-cofactor)] \
  $

  Before proving the next part, we'll first prove a lemma:

  #rect(inset: (x: 10pt))[
    #lemma[
      If a $n times n$ matrix $mat(A)$ has two identical rows, then $det mat(A) = 0$.
    ]
    #proof[
      Recall the property of determinant that exchanging two rows of $mat(A)$ reverse $det mat(A)$ to $-det mat(A)$. If $mat(A)$ has two identical rows, exchanging them won't change the matrix, which means $det mat(A) = -det mat(A)$. Therefore, $det mat(A) = 0$.
    ]
  ] <lemma-identical-rows>

  Now, with the lemma proven, we can continue with the second case:

  2. If $i != j$, we want to show that the entry is $0$:

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

  Since the $j$th row of $mat(B)$ is same as $i$th row of $mat(A)$, $(mat(A) mat(C)^upright(T))_(i j)$ can be written as:
  $
    (mat(A) mat(C)^upright(T))_(i j) &= sum_(k=1)^n mat(A)_(i k) dot mat(C)^upright(T)_(k j) \
    &= sum_(k=1)^n mat(A)_(i k) dot (-1)^(k+j) dot det mat(M)_(j k) \
    &= sum_(k=1)^n mat(B)_(j k) dot (-1)^(k+j) dot det mat(M)_(j k) \
    &= sum_(k=1)^n mat(B)_(j k) dot mat(C)^upright(T)_(k j) \
    &= sum_(k=1)^n mat(B)_(j k) dot mat(C)_(j k) \
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


== Existence of Inverse Matrix with Determinant

#theorem[
  for a $n times n$ matrix $mat(A)$, the following relation holds:
  $ det mat(A) != 0 quad <==> quad exists A^(-1) $
]

With the theorem we proved above, it's quite easy to prove this:

#proof[
  Since the theorem is both way, we first prove the forward direction:
  
  1. Assume $det mat(A)!= 0$, prove $mat(A)^(-1)$ exists:
  
  $
    mat(A) adj(mat(A)) &= det mat(A) dot mat(I) &quad "(from previous theorem)" \
    mat(I) &= mat(A) (1/(det mat(A))) adj(mat(A)) &quad "(since" det mat(A) != 0 ")" \
    mat(A)^(-1) &= 1/(det mat(A)) dot adj(mat(A))
  $

  2. Assume $mat(A)^(-1)$ exists, prove $det(mat(A)) != 0$:

  $
    mat(A) mat(A)^(-1) &= mat(I) \
    det(mat(A) mat(A)^(-1)) &= det mat(I) \
    det mat(A) dot det mat(A)^(-1) &= 1 &quad "(property of determinant)" \
  $

  Since $det(mat(A))$ multiple by some other number is $1$, it must be non-zero. Therefore, we have:
  $ det mat(A) != 0 $
]

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

== An Alternative Approach

Another quite intuitive proof was provided on the textbook. It felt neat to me so I'm also going to share it here.

#let col(sym) = {
  rotate(90deg)[$#[#line()] #[#rotate(-90deg)[#sym]] #[#line()]$]
}

#proof[
  Since we know that $mat(A) vec(x) = vec(b)$, let's consider the multiplication of which two matrix would produce $mat(B_j)$.

  We know that $mat(A)mat(I) = mat(A)$, and matrix multiplication can be considered as taking each column of the right matrix and applying the left matrix to it, which means:
  #block[
    #set line(angle: 90deg)
    $
      mat(A) mat(I) = matrix(
        #line(), #line(), #line(), , #line();;
        vec(v_1), vec(v_2), vec(v_3), ..., vec(v_n);
        #line(), #line(), #line(), , #line()
      ) quad "where" vec(v_k) "are cols of" mat(A)
    $
  ]

  If we replace one column of $mat(I)$ with $vec(x)$, call it $mat(X_j)$, the resulting matrix would be $mat(B_j)$ since we know that applying $mat(A)$ send $vec(x)$ to $vec(b)$:
  #block[
    #set line(angle: 90deg)
    $
      mat(A) mat(X_j) = matrix(
        #line(), #line(), #line(), , #line(),  , #line();;
        vec(v_1), vec(v_2), vec(v_3), ..., vec(x), ..., vec(v_n);
        #line(), #line(), #line(), , #line(),  , #line()
      ) = mat(B_j)
    $
  ]

  With the property of determinant, take determinant on both sides gives:
  
  $
    det(mat(A) mat(X_j)) &= det(mat(B_j)) \
    det mat(A) dot det mat(X_j) &= det mat(B_j) \
  $

  Since the matrix minor after removing the $j$th column of $mat(X_j)$ was just the identity matrix, its determinant $det mat(X_j) = vec(x)_j$:
  $
    det mat(A) dot vec(x)_j &= det mat(B_j) \
     vec(x)_j &= (det mat(B_j)) / (det mat(A) ) \
  $
]
