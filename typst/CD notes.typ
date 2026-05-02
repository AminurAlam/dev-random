#import "snippets/note.typ": *
#show: template.with("Compiler Design")

#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#pagebreak()

= DIFFERENCE
== compiler and interpreter [TODO]

#table(
  columns: 2,
  [COMPILER], [INTERPRETER],
  [more processing], [less processing],
  [faster], [slower],
  [writing compiler is hard], [easier to write],
  [CPU is interpreting], [SW is interpreting],
  [less secure], [more secure],
  [IR is low level], [IR is HLL],
  [not portable], [portable],

  [The compiler saves the Machine Language in form of Machine Code on disks],
  [The Interpreter does not save the Machine Language],

  [The compiler generates an output in the form of executable],
  [The interpreter does not generate any output],

  [Any change in the source program after the compilation requires recompiling the
    entire code],
  [Any change in the source program during the translation does not require
    retranslation of the entire code],

  [Errors are displayed in Compiler after Compiling together at the current time],
  [Errors are displayed in every single line],

  [The compiler can see code upfront], [The Interpreter works line by line],

  [does not require source code for later execution],
  [requires source code for later execution],

  [Execution takes place after compilation], [Execution happens on every line],

  [takes a large amount of time for analyzing the source code],
  [takes less time for analyzing the source code],

  [CPU utilization is more], [CPU utilization is less],

  [C, C++, C\#], [Python, Ruby, Perl, MATLAB],
)

#pagebreak()

= PHASES OF COMPILER

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

#pagebreak()

= LEX

structure
- declerations
- translation rules
- auxiliary procedures

#pagebreak()

= PARSER

== Types
- universal parsers
- top down (left to right, leftmost derivation)
  - backtracking
  - predictive / non-backtracking
    - recursive decent
    - LL
- bottom up (left to right, rightmost derivation)
  - LR (0|1)
    - simple LR
    - canonical LR
    - look ahead LR
  - Operator precedence

== check if LL

1. / case 1: no null present

#let Fi = "Fi"

$S -> a | b | c$

if $epsilon in Fi(a) inter Fi(b) inter Fi(c) "then it is LL"$

if $epsilon in.not Fi(a) inter Fi(b) inter Fi(c) "then it is NOT LL"$

2. / case 2: null present

$S -> a | b | epsilon$

if $epsilon in Fi(a) inter Fi(b) inter Fi(S) "then it is LL"$

if $epsilon in.not Fi(a) inter Fi(b) inter Fi(S) "then it is NOT LL"$

#pagebreak()

= SYNTAX ANALYSIS

== Error

- Missing parenthesis
- extraneous-insertion error
- replacement errors
- transcription error
- insertion error

== Recovery
- / panic mode: discards inputs from beginning to hopefully remove error
- / exhaustive error recovery: examine every possibility then deciding appropriate
    recovery
- / systematic methods:
  - suspend normal parsing
  - try changing input buffer or stack contents
  - resume parsing from the new configuration
