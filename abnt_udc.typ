#let abnt_udc(body) = [
  #set page(
    paper: "a4",
    margin: (
      top: 3cm,
      bottom: 2cm,
      left: 3cm,
      right: 2cm,
    ),
  )

  #set heading(
    numbering: "1.1",
  )

  #show heading: it => [
    #set block(below: 1.5em, above: 1.5em)

    #if it.level == 1 [
      #set text(weight: "bold")
      #block(upper(it))
    ] else if it.level == 2 [
      #set text(weight: "bold")
      #block(it)
    ] else [
      #set text(weight: "regular")
      #block(it)
    ]
  ]

  #set text(
    font: "Arial",
    size: 12pt,
  )

  #set par(
    justify: true,
    first-line-indent:(amount: 1.25cm, all: true),
    leading: 1.5em,
  )

  #show outline: it => [
    #set outline(indent: 0pt)
    #show heading: set heading(outlined: false)
    #show heading: set align(center)

    #show heading: it => [
      #it
      #v(1em)
    ]

    #it

    #pagebreak()
  ]

  #show outline.entry: it => {
    set text(weight: "bold") if it.level <= 2

    if it.level == 1 {
      v(par.spacing, weak: true)
    }

    link(
      it.element.location(),
      it.indented(box(width: 2.5em, it.prefix()), it.inner()),
    )
  }

  #show bibliography: it => [
    #show heading: set align(center)

    #show heading: it => [
      #it
      #v(1em)
    ]

    #it
  ]

  #show figure.caption: it => [
    #let supplement = if it.supplement == [Figure] {
      [Figura]
    } else if it.supplement == [Listing] {
      [Código]
      // O query `figure.caption` ocorre para os resultados também, então é
      // preciso checar se o suplemento não é um deles para gerar o erro.
    } else if it.supplement != [Figura] and it.supplement != [Código] {
      panic("Tipo de figura `" + it.supplement + "` não suportado.")
    }
    #let count = context it.counter.display(it.numbering)
    #supplement #count#it.separator#it.body
  ]

  #set figure.caption(position: top, separator: [ — ])

  // Blocos de código podem atravessar páginas.
  #show figure.where(kind: raw): set block(breakable: true)

  #show raw: it => [
    #set text(font: "Cascadia Mono", ligatures: true)
    #it
  ]

  #body
]

#let capa(autor, titulo, local, data) = [
  #set par(justify: false)
  #set text(size: 15pt, weight: "bold")
  #set align(center)
  #set rect(width: 100%, height: 100%, stroke: none)

  #grid(
    columns: 1,
    rows: (5fr, 3.75fr, 10fr, 2fr),
    rect[#upper("Centro Universitário Dinâmica das Cataratas\nCurso de Bacharelado em Ciência da Computação")],
    rect[#autor],
    rect[#titulo],
    rect[#align(bottom)[#text(size: 12pt)[ #upper(local) \ #data]]],
  )

  #pagebreak()
]

#let folha_de_rosto(autor, titulo, orientador, local, data) = [
  #set par(justify: false)
  #set text(size: 15pt, weight: "bold")
  #set align(center)
  #set rect(width: 100%, height: 100%, stroke: none)

  #grid(
    columns: 1,
    rows: (5fr, 3.75fr, 10fr, 2fr),
    rect[#autor],
    rect[#titulo],
    grid(
      columns: (1fr, 1fr),
      rows: 1,
      [],
      rect[#align(horizon + left)[#text(size: 10pt)[Plano do Projeto da Disciplina de Projeto de Graduação I do Curso de Bacharelado em Ciência da Computação, apresentado à UDC como requisito parcial para obtenção do título de bacharel em Ciência da Computação. \ \ Orientador: #orientador]]],
    ),
    rect[#align(bottom)[#text(size: 12pt)[ #upper(local) \ #data]]],
  )

  #pagebreak()
]

#let todo(texto) = [
  #set text(weight: "bold", fill: red.darken(25%))
  TODO! #texto
]
