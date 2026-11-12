#import "../../common.typ": *

#import "@preview/alchemist:0.2.0": *

= Shapes of Molecules 1

*Lewis structures* - structural formulas showing atoms, bonding electrons, and unshared electrons

Guideline:
- #ce[H] atoms form 1 bond
- #ce[O] atoms form 2 bonds
- #ce[N] atoms form 3 bonds
- #ce[C] atoms form 4 bonds
- Surrounding #ce[F], #ce[Cl], #ce[Br], #ce[I] atoms form 1 bond

== Exceptions to the Octet Rule

+ Molecules with *Electron-Defficient Atoms*
  - #ce[B] and #ce[Be] are commonly electron-deficient.

  #justify-between(
    skeletize({
      fragment("Cl", lewis: (
        lewis-double(angle: 90),
        lewis-double(angle: 180),
        lewis-double(angle: -90),
      ))
      single()
      fragment("Be")
      single()
      fragment("Cl", lewis: (
        lewis-double(angle: 90),
        lewis-double(angle: 0),
        lewis-double(angle: -90),
      ))
    }),
    skeletize({
      fragment("F", lewis: (
        lewis-double(angle: 90),
        lewis-double(angle: 180),
        lewis-double(angle: 0),
      ))
      single(angle: -2)
      fragment("B")
      branch({
        single(angle: 4.5)
        fragment("F", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: 180),
          lewis-double(angle: -90),
        ))
      })
      branch({
        single(angle: -0.5)
        fragment("F", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: 0),
          lewis-double(angle: -90),
        ))
      })
    }),
  )

+ Odd-Electron Species
  - A molecule with an odd number of electrons is called a free *radical*

  #justify-between(
    skeletize({
      fragment("O", lewis: (
        lewis-double(angle: 135),
        lewis-double(angle: 215),
        lewis-double(angle: -45),
      ))
      single(angle: 1)
      fragment("N", lewis: (
        lewis-single(angle: 90, offset: "center"),
      ))
      double(angle: -1)
      fragment("O", lewis: (
        lewis-double(angle: 45),
        lewis-double(angle: 215),
      ))

      operator(math.stretch(sym.arrow.r.l, size: 2em))

      fragment("O", lewis: (
        lewis-single(angle: 135, offset: "center"),
        lewis-double(angle: 215),
        lewis-double(angle: -45),
      ))
      single(angle: 1)
      fragment("N", lewis: (
        lewis-double(angle: 90),
      ))
      double(angle: -1)
      fragment("O", lewis: (
        lewis-double(angle: 45),
        lewis-double(angle: 215),
      ))
    }),
  )

+ Expanded Valence Shells
  - An expanded valence shell is only possible for nonmetals from period 3 or higher because there elements have available *empty d orbitals that can be filled with electrons*

  #justify-between(
    skeletize({
      fragment("S")
      branch({
        single(angle: 2)
        fragment("F", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: 180),
          lewis-double(angle: 0),
        ))
      })
      branch({
        single(angle: 0.75)
        fragment("F", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: 0),
          lewis-double(angle: -90),
        ))
      })
      branch({
        single(angle: -0.75)
        fragment("F", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: 0),
          lewis-double(angle: -90),
        ))
      })
      branch({
        single(angle: -2)
        fragment("F", lewis: (
          lewis-double(angle: 0),
          lewis-double(angle: -90),
          lewis-double(angle: -180),
        ))
      })
      branch({
        single(angle: -3.25)
        fragment("F", lewis: (
          lewis-double(angle: -90),
          lewis-double(angle: -180),
          lewis-double(angle: 90),
        ))
      })
      branch({
        single(angle: -4.75)
        fragment("F", lewis: (
          lewis-double(angle: -90),
          lewis-double(angle: -180),
          lewis-double(angle: 90),
        ))
      })
    }),
    skeletize({
      fragment("H")
      single()
      fragment("O", lewis: (
        lewis-double(angle: 90),
        lewis-double(angle: -90),
      ))
      single()
      fragment("P")
      branch({
        double(angle: 2)
        fragment("O", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: 0),
        ))
      })
      branch({
        single()
        fragment("O", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: -90),
        ))
        single()
        fragment("H")
      })
      branch({
        single(angle: -2)
        fragment("O", lewis: (
          lewis-double(angle: 0),
          lewis-double(angle: 180),
        ))
        single(angle: -2)
        fragment("H")
      })
    }),
  )

General Rules for Drawing Lewis Structures:
+ Less electronegative atom is the central atom
+ Add A-group numbers, and add or subtract electrons for ions
+ Draw single bonds, and subtract 2#ce[e-] for each bond
+ Distribute #ce[e-] so that each atom has a total of 8#ce[e-] (2#ce[e-] for #ce[H])
+ If central atom still lacks octet, move #ce[e-] pair to make bonding #ce[e-] pair

== How to Determine Formal Charge

+ Look at the Periodic Table. In which group is the atom? Group number = number of valence electrons
+ Look at the molecule. How many lectrons does the atom of interest have "around itself"?
+ The difference in electrons gives the formal charge

$
  "Formal charge" & = "no. of valence" ce("e-") - "no. of unshared" ce("e-") \
                  & quad - 1/2 "no. of shared valence" ce("e-")
$

#justify-between(
  skeletize({
    fragment("O", lewis: (
      lewis-double(angle: 90),
      lewis-double(angle: 180),
    ))
    double(angle: 0.75)
    fragment("O", lewis: (
      lewis-double(angle: 90),
    ))
    single(angle: -0.75)
    fragment("O", lewis: (
      lewis-double(angle: 45),
      lewis-double(angle: -45),
      lewis-double(angle: -135),
    ))

    operator(math.stretch(sym.arrow.r.l, size: 2em))

    fragment("O", lewis: (
      lewis-double(angle: -45),
      lewis-double(angle: -135),
      lewis-double(angle: -225),
    ))
    single(angle: 0.75)
    fragment("O", lewis: (
      lewis-double(angle: 90),
    ))
    double(angle: -0.75)
    fragment("O", lewis: (
      lewis-double(angle: 45),
      lewis-double(angle: -45),
    ))
  }),
)

#justify-between(
  skeletize(config: (atom-sep: 2em), {
    parenthesis(
      l: "[",
      r: "]",
      tr: $-$,
      xoffset: .2,
      {
        fragment("N", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: 180),
          lewis-double(angle: -90),
        ))
        single()
        fragment("C")
        triple()
        fragment("O", lewis: (
          lewis-double(angle: 0),
        ))
      },
    )

    operator(math.stretch(sym.arrow.r.l, size: 2em))

    parenthesis(
      l: "[",
      r: "]",
      tr: $-$,
      xoffset: .2,
      {
        fragment("N", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: -90),
        ))
        double()
        fragment("C")
        double()
        fragment("O", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: -90),
        ))
      },
    )

    operator(math.stretch(sym.arrow.r.l, size: 2em))

    parenthesis(
      l: "[",
      r: "]",
      tr: $-$,
      xoffset: .2,
      {
        fragment("N", lewis: (
          lewis-double(angle: 180),
        ))
        triple()
        fragment("C")
        single()
        fragment("O", lewis: (
          lewis-double(angle: 90),
          lewis-double(angle: 0),
          lewis-double(angle: -90),
        ))
      },
    )
  }),
)

== Resonance Structures

Some molecule can have more than one valid Lewis structures. Such a species is best represented as a resonance hybrid.

A resonance hybrid has a single structure although it retains characteristics of its resonance forms.

#justify-between(
  skeletize({
    fragment("O", lewis: (
      lewis-double(angle: 180),
      lewis-double(angle: -90),
    ))
    double(angle: 0.75)
    fragment("O", lewis: (
      lewis-double(angle: 90),
    ))
    single(angle: -0.75)
    fragment("O", lewis: (
      lewis-double(angle: 45),
      lewis-double(angle: -45),
      lewis-double(angle: -135),
    ))
  }),
  skeletize({
    fragment("O", lewis: (
      lewis-double(angle: -45),
      lewis-double(angle: -135),
      lewis-double(angle: -225),
    ))
    single(angle: 0.75)
    fragment("O", lewis: (
      lewis-double(angle: 90),
    ))
    double(angle: -0.75)
    fragment("O", lewis: (
      lewis-double(angle: 0),
      lewis-double(angle: -90),
    ))
  }),
  skeletize({
    fragment("O", lewis: (
      lewis-double(angle: 180),
      lewis-double(angle: -90),
    ))
    double(
      angle: 0.75,
      stroke-right: (dash: "dashed"),
    )
    fragment("O", lewis: (
      lewis-double(angle: 90),
    ))
    double(
      angle: -0.75,
      stroke-right: (dash: "dashed"),
    )
    fragment("O", lewis: (
      lewis-double(angle: 0),
      lewis-double(angle: -90),
    ))
  }),
)

- Resonance forms with smaller formal charges are preferred.
- A negative formal charge should preferentially be placed on a more electronegative atom.
- The overall structure is a weighted average of the resonance forms. The more stable resonance form contributes more to the hybrid.
