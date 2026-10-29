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
)

VSEPR theory can be applied to molecules with more than one "central" atom.

== Factors Affecting Bond Angles

*Non-bonding (Lone) Pairs*: A lone pair repels bonding pairs more strongly than bonding pairs repel each other. This decreases the angle between the bonding pairs.

*Double Bonds*: A double bond has greater electron density than a single bond and repels the single bond electrons more than they repel each other.
