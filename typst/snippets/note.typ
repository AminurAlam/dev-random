// #import "snippets/note.typ": *
// #show: template.with("Title")

#let template(title, depth: 2, body) = {
  show table: set block(breakable: false)
  show raw: set block(breakable: false)
  show par: it => block(breakable: false, it)

  set page(margin: 25pt)
  set par(justify: false)
  set text(1.35em)
  set math.mat(delim: "[")

  if title != none {
    v(20pt)
    set align(center)
    text(2em, strong(title))
  }

  outline(depth: depth)

  body
}

#let horizontalrule = line(length: 100%)

#let st = $sin theta$
#let ct = $cos theta$
#let dx = $Delta x$
#let dy = $Delta y$

#let sumin = $sum_(i=1)^n$
#let argmax = $limits("argmax")_(w)$
#let argmin = $limits("argmin")_(w)$

// https://sitandr.github.io/typst-examples-book/book/typstonomicon/try_catch.html
#let img(path, ..args) = context {
  let path-label = label(path)
  let first-time = query((context {}).func()).len() == 0
  if first-time or query(path-label).len() > 0 {
    [#image(path, ..args)#path-label]
  } else {
    let w = args.at("width", default: 50%)
    if w == auto { w = 100% }
    rect(
      stroke: 1pt,
      width: w,
      height: args.at("height", default: 25%),
      align(center + horizon, args.at("alt", default: "404 not found")),
    )
  }
}
