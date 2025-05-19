#import "../../../abnt_udc.typ": figura_legendada

===	Interpretador Tree-Walking

Um interpretador é um programa que executa diretamente o código fonte de uma linguagem de programação, linha por linha. No caso deste projeto, será utilizada uma variante chamada de interpretador _tree-walking_, que pula algumas das etapas finais, resultando em maior simplicidade com menor desempenho @craftinginterpreters, o que combina com a proposta de implementação de um protótipo.

Um interpretador _tree-walking_ é dividido em três fases principais: análise léxica, análise sintática e interpretação. As etapas puladas são a de análise semântica#footnote([Por mais que a análise semântica tenha sua própria fase pulada, ela ainda é parcialmente implementada de forma implícita nas fases de análise sintática e interpretação @craftinginterpreters.]) e a de geração de representação intermediária, como mostra a figura a seguir:

#figura_legendada(
	[Mapa do território de um interpretador.],
	image("../../../imagens/mapa_interpretador.png", height: 35%),
	[Fonte: #cite(<craftinginterpreters>, form: "prose").],
)

Abaixo estão as definições de cada uma das três principais fases do interpretador _tree-walking_:

1. Análise léxica: primeira fase do processo de interpretação, onde as palavras do código fonte são transformadas em tokens, estruturas de dados que armazenam informações sobre cada palavra da gramática da linguagem @craftinginterpreters;

#figure(
	image("../../../imagens/analise_lexica.png", height: 25%),
)

2. Análise sintática: segunda fase do processo de interpretação, onde os tokens gerados na fase anterior são organizados em uma árvore sintática abstrata (do inglês, _abstract syntax tree_ — AST), que representa a hierarquia estrutural do código de acordo com as regras gramaticais da linguagem @craftinginterpreters;

#figure(
	image("../../../imagens/analise_sintatica.png", height: 33%),
)

3. Interpretação: última fase do processo de interpretação, onde a AST gerada na fase de análise sintática é percorrida e executada. Durante essa fase, o interpretador avalia expressões, atualiza o estado do programa e executa funções @craftinginterpreters.

#figure(
	image("../../../imagens/interpretacao.png", height: 28%),
)
