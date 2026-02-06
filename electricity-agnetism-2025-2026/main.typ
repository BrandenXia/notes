#import "@preview/tapestry:0.0.4": *

#show: tapestry.with(
  title: "Advance Physics: Electricity and Magnetism",
  year: "2024-2025",
)

= Textbook

- Fundamental of Physics, Halliday, Resnick, Walker
- Intro to Electrodynamics, Griffiths
- Electricity and Magnetism, Purcell and Morin

= Electrostatics 1 - Coulomb's Law

Object "participate" in electric forces when they have electric charge. The electric force between two point charges is given by Coulomb's law:

- electric charge can be $(+)$ or $(-)$
  - electric force can be attractive or repulsive

#align(center)[
  #table(
    columns: (auto, auto, auto),
    [0], [0], [none],
    [+], [+], [repel],
    [-], [-], [repel],
    [+], [-], [attract],
  )
]

== Coulomb's Law

$
  va(F) = 1 / (4 pi epsilon_0) ( q_1 q_2 ) / r^2 dot hat(r)
$

- $epsilon_0$ - "permittivity of free space"
  $quad approx 8.85 times 10^(-12) C^2 N^(-1) m^(-2)$
- $q$ - electric charge, $[q] = C$
- $r$ - the distance between the two charges
- $hat(r)$ - unit vector that points between charges

== The Principle of Superposition

This principle tells us the interaction between 2 charges is unaffected by the presence of any other charges.

$
  va(F)_("total", q) = sum_i va(F)_(q, q_i)
$
