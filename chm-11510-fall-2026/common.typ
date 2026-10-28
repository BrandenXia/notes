#import "@preview/tapestry:0.0.4": *
#import "@preview/typsium:0.3.2": *
#import "@preview/physica:0.9.8": hbar

#let justify-between(..items) = {
  grid(
    align: center + horizon,
    columns: range(items.len()).map(_ => 1fr),
    ..items
  )
}
