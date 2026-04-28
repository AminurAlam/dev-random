// #import "snippets/frontpage.typ": starter, index
// #starter([])
// #index

#let starter(heading) = {
  set align(center)
  let year = datetime.today().year()

  v(12%)
  line(length: 100%, stroke: 1.6pt)
  v(-6pt)
  line(length: 100%, stroke: 0.4pt)
  text(weight: "bold", 2.5em)[#upper[#heading]]
  line(length: 100%, stroke: 0.4pt)
  v(-6pt)
  line(length: 100%, stroke: 1.6pt)

  v(23%)
  align(left)[
    #for (key, value) in (
      "SUBMITTED BY": "Aminur Alam",
      "ROLL NO": "ROLL123",
      "SEMESTER": [n#super("th")],
      "DEPARTMENT": "DEPT",
      "COURSE": "CORS",
    ) [#text(1.2em)[#key:] #h(10pt) #text(1.8em)[#value] \ #v(2pt) ]
  ]

  align(bottom)[#text(1.4em)[INSTITUTE #{ year }-#{ year - 1999 }]]

  pagebreak()
}

#let index = [
  #set page(margin: (x: 50pt, y: 70pt))

  #show table.cell.where(y: 0): it => {
    set text(1.6em)
    set align(center)
    strong(it)
  }

  #table(
    columns: (8%, 64%, 14%, 14%),
    rows: (5%, 95%),
    align: horizon,
    [No.], [Topic], [Date], [Sign],
  )
]
