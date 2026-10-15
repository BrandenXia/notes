#import "@preview/tapestry:0.0.4": tapestry
#import "@preview/physica:0.9.8": super-T-as-transpose

#set text(costs: (orphan: 0%, widow: 0%))

#set page(
  numbering: "1",
)

#show: tapestry.with(
  author: "Branden Xia",
  title: "Calculus on Manifolds",
  year: "Summer 2026",
)

#show: super-T-as-transpose

= Functions on Euclidean Space

#include "sections/01-functions/01-norm-and-inner-product.typ"

#include "sections/01-functions/02-subsets.typ"

#include "sections/01-functions/03-functions-and-continuity.typ"

= Differentiation

#include "sections/02-differentiation/01-basic-definitions.typ"

#include "sections/02-differentiation/02-basic-theorems.typ"

#include "sections/02-differentiation/03-partial-derivatives.typ"
