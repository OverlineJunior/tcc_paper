#import "abnt_udc.typ": abnt_udc, capa, folha_de_rosto
#import "@preview/codly:1.3.0": codly-init

#show: abnt_udc
#show: codly-init.with()

#let autor = "Francisco Sebastiany Junior"
#let orientador = "Prof. Me. Luciano S. Cardoso"
#let titulo = "Design e Implementação de um Protótipo de Interpretador para uma Linguagem de Programação Orientada ao Entity Component System"
#let local = "Foz do Iguaçu, PR"
#let data = "2025"

#capa(autor, titulo, local, data)

#folha_de_rosto(autor, titulo, orientador, local, data)

#outline(title: "Sumário")

#include "capitulos/cap1.typ"
#include "capitulos/cap2.typ"

#bibliography(
	"refs.yml",
	title: "Referências",
	style: "associacao-brasileira-de-normas-tecnicas"
)
