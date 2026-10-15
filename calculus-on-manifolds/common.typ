#import "@preview/physica:0.9.8": iprod, rot2mat
#import "@preview/physica:0.9.5": dd, pdv

#let titled(body, name, label) = [
  *#name #label.*
  #block(inset: (left: 1em, bottom: 0.5em))[
    #body
  ]
]
#let theorem(label, body) = titled(body, "Theorem", label)
#let corollary(label, body) = titled(body, "Corollary", label)
#let problem(label, body) = {
  set enum(numbering: "(a)", indent: 1em)
  titled(body, "Problem", label)
}

#let proof(body) = block({
  set enum(numbering: "1.", indent: 0.5em)
  [_Proof._ ]
  h(0.5em)
  body
  box(width: 0pt)
  h(1fr)
  sym.wj
  sym.space.nobreak
  $qed$
})
#let solution(body) = block({
  [_Solution._ ]
  h(0.5em)
  body
})

