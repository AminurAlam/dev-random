= SYNTAX

- *bold*, _italic_, `raw!@#$%`
- enum
  + aaa
  + bbb
- / Term: meaning


= COMMON FUNCTIONS

#outline() // INDEX

#v(20pt)
#h(20pt)

#line(length: 100%, stroke: 1.6pt)
#heading(numbering: none)[Abstract Heading without numbering]
#upper[lowercase to uppercase text]
#figure(box(width: 7cm, height: 4cm, fill: orange), caption: [orange box])
#grid(
  columns: (auto, auto),
  rows: (auto, auto),
  align: center,
  inset: 10pt,
  stroke: black,
  [grid one], [grid two],
  [grid three], [grid four],
)
#pagebreak()

#columns()[
  Pros:
  - Fast and simple
  - Highly interpretable
  - Good baseline model when relationships are linear
  #colbreak()
  Cons:
  - Sensitive to outliers
  - Performs poorly under multicollinearity
  - Assumes linearity and constant variance
]

= SCRIPTING

// STYLING
#set terms(separator: ":  ")
#set align(left)
#set par(justify: false)
#set page(margin: 50pt, numbering: "1", columns: 1)
#set text(1.35em)

#show table: set block(breakable: false)
#show raw: set block(breakable: false)

// DEFINING
#let year = datetime.today().year()
#let func(a, b) = [swapped: #b, #a. in #year]

// LOOPS
#for (key, val) in (
  "foo": "bar",
  "marco": "polo",
  "something": "nothing",
) [#text(1.2em)[#key:] #h(10pt) #text(1.8em)[#val] \ #v(2pt) ]


= TABLE
#table(columns: 4)[No.][Topic][Date][Sign][][][][]
#table(
  columns: 10,
  inset: (x: 8pt, y: 7pt),
  [1.00], [1.00], [1.00], [0.99], [0.99], [1.00], [0.99], [0.93], [0.99], [0.78],
  [1.00], [1.00], [1.00], [0.99], [0.99], [0.99], [0.99], [0.95], [0.99], [0.81],
  [1.00], [1.00], [1.00], [1.00], [0.99], [1.00], [0.99], [0.93], [0.99], [0.78],
  [0.99], [0.99], [1.00], [1.00], [1.00], [1.00], [1.00], [0.94], [0.99], [0.77],
  [0.99], [0.99], [0.99], [1.00], [1.00], [1.00], [1.00], [0.93], [1.00], [0.75],
  [1.00], [0.99], [1.00], [1.00], [1.00], [1.00], [1.00], [0.93], [0.99], [0.76],
  [0.99], [0.99], [0.99], [1.00], [1.00], [1.00], [1.00], [0.93], [1.00], [0.75],
  [0.93], [0.95], [0.93], [0.94], [0.93], [0.93], [0.93], [1.00], [0.93], [0.93],
  [0.99], [0.99], [0.99], [0.99], [1.00], [0.99], [1.00], [0.93], [1.00], [0.75],
  [0.78], [0.81], [0.78], [0.77], [0.75], [0.76], [0.75], [0.93], [0.75], [1.00],
)
