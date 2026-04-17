#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

= difference b/w compiler and interpreter

= phases of compiler

#let blob(pos, label, tint: white, ..args) = node(
  pos,
  align(center, label),
  width: 40mm,
  stroke: 1pt,
  corner-radius: 5pt,
  ..args,
)

#figure(diagram(
  spacing: 5pt,
  cell-size: (80mm, 20mm),
  edge-stroke: 1pt,

  blob((0, 0), [], stroke: none),
  edge([character stream], "-|>"),
  blob((0, 1), [lexical analyzer]),
  edge([token streams], "-|>"),
  blob((0, 2), [syntax analyzer]),
  edge([syntax tree], "-|>"),
  blob((0, 3), [semantic analyzer]),
  edge([annotated tree], "-|>"),
  blob((0, 4), [intermediate code generator]),
  edge([IR], "-|>"),
  blob((0, 5), [code generator]),
  edge([target code], "-|>"),
  blob((0, 6), [machine dependent code optimizer]),
  edge([target code], "-|>"),
  blob((0, 7), [], stroke: none),

  blob((1, 4), [symbol table], height: 50pt),
))
