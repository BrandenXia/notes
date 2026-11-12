#import "common.typ": *

#set page(
  numbering: "1",
)

#show: tapestry.with(
  title: "CHM11510",
  year: "Fall 2026",
)

#let justify-between(..items) = {
  grid(
    align: center + horizon,
    columns: range(items.len()).map(_ => 1fr),
    ..items
  )
}


#include "sections/01-fundamentals/01.typ"
#include "sections/01-fundamentals/02.typ"
#include "sections/01-fundamentals/03.typ"
#include "sections/01-fundamentals/04.typ"
#include "sections/01-fundamentals/05.typ"
#include "sections/01-fundamentals/06.typ"
#include "sections/02-thermochemistry/07.typ"
#include "sections/02-thermochemistry/08.typ"
#include "sections/02-thermochemistry/09.typ"
#include "sections/03-quantum-theory/10.typ"
#include "sections/03-quantum-theory/11.typ"
#include "sections/03-quantum-theory/12.typ"
#include "sections/03-quantum-theory/13.typ"
#include "sections/04-electron-configuration/14.typ"
#include "sections/05-chemical-bonding/15.typ"
#include "sections/05-chemical-bonding/16.typ"
#include "sections/06-shapes-of-molecules/17.typ"
#include "sections/06-shapes-of-molecules/18.typ"
#include "sections/06-shapes-of-molecules/19.typ"
#include "sections/07-intramolecular-forces/20.typ"
#include "sections/08-phase-changes/21.typ"
#include "sections/09-solid-state/22.typ"
