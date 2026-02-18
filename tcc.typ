#import "abnt_udc.typ": *
#import "@preview/codly:1.3.0": codly-init

#show: abnt_udc
#show: codly-init.with()

#let autor = "Francisco Sebastiany Junior"
#let orientador = "Prof. Me. Luciano S. Cardoso"
#let titulo = "Implementação de um Protótipo de Interpretador para uma Linguagem de Programação Orientada ao Entity Component System"
#let curso = "Ciência da Computação"
#let natureza = [Trabalho de Conclusão de Curso apresentado como requisito obrigatório para obtenção do título de Bacharel em #curso do Centro Universitário Dinâmica das Cataratas.]
#let local = "Foz do Iguaçu"
#let data = "2025"

#capa(autor, titulo, curso, local, data)

#folha_de_rosto(autor, orientador, titulo, natureza, local, data)

#outline(title: "Lista de Figuras", target: figure.where(kind: image))

#outline(title: "Lista de Tabelas e Quadros", target: figure.where(kind: table))

#outline(title: "Lista de Códigos", target: figure.where(kind: raw))

#sumario()

= .........\_

\_

----------------------------------------

= ...\_

== \_

----------------------------------------

\_

\_

----------------------------------------

\_

= .........\_

----------------------------------------

== .......\_

\_

----------------------------------------

== ..\_

=== \_

#include "capitulos/introducao.typ"

#include "capitulos/fundamentacao.typ"

#include "capitulos/metodologia.typ"

#bibliography(
	"refs.yml",
	title: "Referências",
	style: "associacao-brasileira-de-normas-tecnicas"
)
