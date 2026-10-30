#import "../../common.typ": *

#import "@preview/alchemist:0.2.0": *

= Lec 18: Shapes of Molecules 2

*VSEPR* (Valence-Shell Electron Pair Repulsion) is used to determine molecular shape.

- Each group of valence electrons around a central atom is located as far as possible from the other, to minimize repulsion.
- A "group" of electrons is any number of electrons that occupies a localized region around a atom.
- A single bond, double bond, triple bond, lone pair, or single electron all count as a "group" of electrons.
- Only electron groups around the *central* atom affect shape; electrons on atoms other than the central atom do not.

== How to Find Molecular Shape?

+ Draw the Lewis Stricture
+ Count the number of electron groups around the central atom
+ Arrange the electron groups
+ Think about bond angles

*Electron group geometry*: all electron groups count

*Molecular geometry*: lone pairs don't count

#justify-between(
  skeletize({
    fragment("H")
    single(angle: 1)
    fragment("O", lewis: (
      lewis-double(angle: 45),
      lewis-double(angle: 135),
    ))
    single(angle: -1)
    fragment("H")
  }),
  skeletize({
    fragment("H")
    single(angle: -2)
    fragment("C")
    branch({
      single(angle: -3.5)
      fragment("H")
    })
    branch({
      cram-filled-left(angle: -1.5)
      fragment("H")
    })
    branch({
      cram-dashed-left(angle: -0.5)
      fragment("H")
    })
  }),
)

#[
  #show figure.caption: it => it.body
  #let skeletize_with_label(body, label: "") = figure(
    skeletize(body),
    caption: label,
  )
  #let C = fragment("A")
  #let O = fragment("X")

  #align(center)[#table(
      columns: 4,
      align: center + horizon,
      [#ce[e-] group\ arrangement \ (\# of groups)],
      [
        #skeletize_with_label(label: "Linear", {
          single()
          C
          single()
        })
      ],
      [
        #skeletize_with_label(label: "Trigonal planar", {
          single(angle: -2)
          C
          branch({ single(angle: -0.75) })
          branch({ single(angle: 4.75) })
        })
      ],
      [
        #skeletize_with_label(label: "Tetrahedral", {
          single(angle: -2)
          C
          branch({ single(angle: -3.5) })
          branch({ cram-filled-left(angle: -1.5) })
          branch({ cram-dashed-left(angle: -0.5) })
        })
      ],

      [Molecular shape \ (class)],
      [
        #skeletize_with_label(label: "Linear", {
          O
          single()
          C
          single()
          O
        })
      ],
      [
        #skeletize_with_label(label: "Trigonal planar", {
          O
          single(angle: -2)
          C
          branch({
            single(angle: -0.75)
            O
          })
          branch({
            single(angle: 4.75)
            O
          })
        })
        #skeletize_with_label(label: "V shaped / bent", {
          fragment("A", lewis: (
            lewis-double(angle: 90),
          ))
          branch({
            single(angle: -0.75)
            O
          })
          branch({
            single(angle: 4.75)
            O
          })
        })
      ],
      [
        #skeletize_with_label(label: "Tetrahedral", {
          O
          single(angle: -2)
          C
          branch({
            single(angle: -3.5)
            O
          })
          branch({
            cram-filled-left(angle: -1.5)
            O
          })
          branch({
            cram-dashed-left(angle: -0.5)
            O
          })
        })
        #skeletize_with_label(label: "Trigonal primadal", {
          fragment("A", lewis: (
            lewis-double(angle: 90),
          ))
          branch({
            single(angle: -3.5)
            O
          })
          branch({
            cram-filled-left(angle: -1.5)
            O
          })
          branch({
            cram-dashed-left(angle: -0.5)
            O
          })
        })
        #skeletize_with_label(label: "V shaped / bent", {
          fragment("A", lewis: (
            lewis-double(angle: 90),
            lewis-double(angle: 0),
          ))
          branch({
            single(angle: -3.5)
            O
          })
          branch({
            cram-filled-left(angle: -1.5)
            O
          })
        })
      ],

      [Bond angle], [$180 degree$], [$120 degree quad < 120 degree$], [$109.5 degree quad < 109.5 degree$],
    )
  ]

  #justify-between(
    rect(skeletize_with_label(label: [Trigonal\ bipyramidal], {
      single(angle: -2)
      fragment("A")
      branch({ cram-dashed-left(angle: 3.5) })
      branch({ cram-filled-left(angle: 4.75) })
      branch({ single(angle: -2) })
      branch({ single() })
    })),
    rect(skeletize_with_label(label: [Octahedral], {
      single(angle: -2)
      fragment("A")
      branch({ cram-dashed-left(angle: 3.5) })
      branch({ cram-filled-left(angle: 4.75) })
      branch({ single(angle: -2) })
      branch({ cram-filled-left(angle: -0.75) })
      branch({ cram-dashed-left(angle: 1) })
    })),
  )
]

VSEPR theory can also be applied to molecules with more than one "central" atom.

== Factors Affecting Bond Angles

*Non-bonding (Lone) Pairs*: A lone pair repels bonding pairs more strongly than bonding pairs repel each other. This decreases the angle between the bonding pairs.

*Double Bonds*: A double bond has greater electron density than a single bond and repels the single bond electrons more than they repel each other.

#justify-between(
  skeletize({
    fragment("H")
    single(angle: -0.5)
    fragment("C")
    branch({
      cram-dashed-left(angle: -2.5)
      fragment("H")
    })
    branch({
      cram-filled-left(angle: -1.5)
      fragment("H")
    })
    single(angle: 0.5)
    fragment("C")
    branch({
      double(angle: 2)
      fragment("O", lewis: (
        lewis-double(angle: 0),
        lewis-double(angle: 180),
      ))
    })
    single(angle: -0.5)
    fragment("O", lewis: (
      lewis-double(angle: -45),
      lewis-double(angle: -135),
    ))
    single(angle: 0.5)
    fragment("H")
  }),
)
