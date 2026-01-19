#import "@preview/polylux:0.4.0": *
#import "@preview/lovelace:0.3.0": *

#set text(size: 25pt)
#show heading: set block(above: 1.75em, below: 1em)

#set page(paper: "presentation-16-9")
#show figure: set text(size: 20pt)

#slide[
  #set align(horizon)
  #set text(30pt)
  #show heading: set text(size: 40pt)
  = Arbitrary Precision Arithmetic

  Branden Xia \ Jan 21, 2026
]

#slide[
  == Why?
  Builtin integers in most programming languages have fixed sizes (e.g. `short`, `int`, `long` in C and C++; `i32`, `i64` in Rust). This is since hardware has finite memory.

  However, since there's only a finite number of possible combinations of bits in these fixed-size integers, they can only represent a limited range of values.

  #align(center)[
    #figure(
      table(
        columns: range(4).map(it => auto),
        `0x00`, `0x00`, `0x00`, `0x43`,
      ),
      caption: [An typical 32-bit (4 bytes) integer in memory (little endian)],
    )
  ]
]

#slide[ == What about in Python? ]

#slide[
  == What about in Python?

  Python use floating point numbers for all the numbers beyond the fixed size, but, again, since it has finite precision, it can only represent a limited number of digits accurately.

  #figure(
    image("python-numbers.png", width: 90%),
    caption: [Demonstration of Python's number representation limits],
  )
]

#slide[ == Solution? ]

#slide[
  == Solution: Dynamic-sized Numbers

  The solution is intuitive: if precision of fixed-size numbers is limited, let's just increase its size dynamically if currently given memory storage is not enough.

  \

  #align(center)[
    #figure(
      [
        #show table: set block(above: 0.5em, below: 0.5em)
        #table(
          columns: range(4).map(it => auto),
          `0xFF`, `0xFF`, `0xFF`, `0xFF`,
        )
        $arrow.b$
        #table(
          columns: range(5).map(it => auto),
          `0x01`, `0x00`, `0x00`, `0x00`, `0x00`,
        )
      ],
      caption: [Dynamically increase storage size after overflow],
    )
  ]
]

#slide[ == How to represent a number? ]

#slide[
  #let num = 2417

  == How to represent a number?

  When we write a number like "#num", we normally assume it's under base 10, which means:

  $ #num _10 = 2 dot 10^3 + 4 dot 10^2 + 1 dot 10^1 + 7 dot 10^0 $

  We can do the same thing in computer by storing each digit as a number. A dynamically-sized number would just be an array of integers.
]

#slide[
  == Base?
  Base 10 is what we normally work with, but is it efficient?
]

#slide[
  == Base?

  What will type of each element in the array be?

  Consider the smallest unit of memory that we can directly manipulate in computer: a byte.

  $
    1 "byte" & = 8 "bits" \
         2^8 & = 16
  $

  $
       "base 10 waste" & : 1 - log_16 10 approx 16.95% \
    "base" 2^8 "waste" & : 1 - log_16 16 approx 0%
  $
]

#slide[
  #set align(horizon + center)
  == Arithmetic
]

#slide[
  == Addition
  Addition works similarly as the vertical addition we do on paper. However, there's still some optimization we can do.

  #align(center)[
    #show math.equation: set text(size: 35pt)

    #figure(
      image("./vertical-addition.svg"),
      caption: [Vertical addition @team_2026],
    )
  ]
]

#slide[
  == Addition (Naive)

  #pseudocode-list[
    + *for* $i$ from $1$ to $max("length"(a), "length"(b)) - 1$ *do*
      + $a[i] <- a[i] + b[i]$
      + *if* $a[i] >= "base"$ *do*
        + $a[i] <- a[i] - "base"$
        + $a[i + 1] <- a[i + 1] + 1$
  ]
]

#slide[
  == Addition (Naive)

  #pseudocode-list[
    + *for* $i$ from $1$ to $max("length"(a), "length"(b)) - 1$ *do*
      + $a[i] <- a[i] + b[i]$
      + *if* $a[i] >= "base"$ *do* $quad$ #text(red)[$<-$ branch here]
        + $a[i] <- a[i] - "base"$
        + $a[i + 1] <- a[i + 1] + 1$
  ]
]

#slide[
  #show heading: set block(below: 0.7em) // avoid overflowing to next page
  == Addition (Branch-less)

  #pseudocode-list[
    + $i <- 1$, $"carry" <- 0$
    + *while* $i <= "length"(b)$ *do*
      + \/\/ hardware builtin overflow in practice (e.g. x86 ADD with carry)
      + $a[i] <- a[i] + b[i] + "carry"$
      + $"carry" <- a[i] div "base"$ (integer division)
    + *while* $i <= "length"(a)$ *do* \/\/ same as above
      + $a[i] <- a[i] + "carry"$
      + $"carry" <- a[i] div "base"$ (integer division)
  ]
]

#slide[
  == Subtraction

  #figure(
    image("./subtraction-borrow.png"),
    caption: [A single-digit subtraction with borrow],
  )
]

#slide[
  #figure(
    image("./subtraction-full.png"),
    caption: [Full multi-digit subtraction with borrow],
  )
]

#slide[
  == Multiplication (Naive)
  The naive way to do multiplication is similar to the vertical multiplication we do on paper.

  #pseudocode-list[
    + *for* $i$ from $0$ to $"length"(a) - 1$ *do*
      + $"carry" <- 0$
      + *for* $j$ from $0$ to $"length"(b) - 1$ *do*
        + $"tmp" <- a[i] dot b[j] + c[i + j] + "carry"$
        + $c[i + j] <- "tmp" mod "base"$
        + $"carry" <- "tmp" div "base"$
      + *while* $"carry" > 0$ *do*
        + $"tmp" <- c[i + "length"(b)] + "carry"$
        + $c[i + "length"(b)] <- "tmp" mod "base"$
        + $"carry" <- "tmp" div "base"$
  ]

  Obviously, this has a time complexity of $OO(n^2)$, which is not so efficient for really big numbers.
]

#slide[
  == Multiplication (Karatsuba)

  Consider two integers $x$ and $y$, both in base $b$, with $n$ digits (possibly with prefixed zero). Fix $m$ so that $0 < m < n$, we have:
  $
            x & = alpha_1 b^m + beta_1 \
            y & = alpha_2 b^m + beta_2 \
    x times y & = c_1 b^(2m) + c_2 b^m + c_3 \
  $

  Substituting the first two equations into the third, we have:
  $ ( alpha_1 b^m + beta_1 ) ( alpha_2 b^m + beta_2 ) = c_1 b^(2m) + c_2 b^m + c_3 $

  Expanding it gives:
  $
    cases(
      c_1 = alpha_1 alpha_2,
      c_2 = alpha_1 beta_2 + alpha_2 beta_1,
      c_3 = beta_1 beta_2
    )
  $

  Notice that:
  $ c_2 = (alpha_1 + alpha_2) (beta_1 + beta_2) - c_1 - c_3 $

  Therefore, we just need those three components (smaller problems) to solve the multiplication.

  Let's estimate the complexity of this algorithm:

  Let $m = ceil(n/2)$. Since $x$ and $y$ have length of $n$, we know that the multiplication $c_1$, $c_3$, and $(alpha_1 + alpha_2) (beta_1 + beta_2)$ all have length $<= m$.

  Therefore, complexity of one single recursion is:
  $ "rec": n => 3 "fix"(ceil(n/2)) + OO(n) $

  Since problem of length $n$ is converted to length $n/2$, number of recursions needed is $ceil(log_2 n)$.

  From bottom up, for the $k$th level, there will be $3^(ceil(log_2 n) - k)$ problems.

  Thus, the total complexity will be:
  $
    lim_(n -> oo) sum_(k=0)^(ceil(log_2 n)) 3^(ceil(log_2 n) - k) OO(2^k) & = lim_(n -> oo) 3^(log_2 n) sum_(k=0)^(log_2 n) 3^(-k) OO(2^k) \
    & = OO(lim_(n -> oo) 3^(log_2 n) sum_(k=0)^(log_2 n) 3^(-k) dot 2^k) \
    & ~ OO(3^(log_2 n) sum_(k=0)^oo (2/3)^k) \
  $

  $
    "prev" & = OO(3^(log_2 n) dot 3) \
           & ~ OO(3^(log_2 n)) \
           & = OO(n^(log_2 3))
  $
]

#slide[
  == Multiplication (FFT)
  For any number in base $b$, it can be considered as a polynomial where the variable is $b$. Therefore, we can optimize it with FFT to get a time complexity of $OO(n log n)$.
]

#slide[
  == Multiplication
  To get a general purpose multiplication, we can combine all three methods:
  + Naive way for smaller numbers since it's cache-line friendly
  + Karatsuba approach for average numbers
  + FFT for really big ($n > 10^10^5$) numbers
]

#slide[
  #bibliography("ref.bib")
]
