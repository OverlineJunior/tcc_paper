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
    #set block(below: 1em, above: 1.5em)

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

  #body
]

#let capa(autor, titulo, local, data) = [
  #set text(size: 16pt, weight: "bold")
  #set align(center)

  #upper("Centro Universitário Dinâmica das Cataratas\nCurso de Bacharelado em Ciência da Computação")
  #v(6em)
  #autor
  #v(5em)
  #box(height: 10em)[#titulo]
  #v(13em)

  #set text(size: 12pt)

  #upper(local) \
  #data
  #pagebreak()
]

#let folha_de_rosto(autor, titulo, local, data) = [
  
]
