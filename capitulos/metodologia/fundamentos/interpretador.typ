===	Interpretador Tree-Walking

Interpretador tree-walking é um tipo de interpretador que pula algumas etapas finais a fim de manter a simplicidade. Por isso, ele será ideal para a implementação do protótipo do projeto.
De forma mais detalhada, tal interpretador costuma iniciar a execução da aplicação logo após a geração da árvore sintática abstrata (AST), pulando a geração de código intermediário e otimizações relacionadas. A simplicidade que este tipo de interpretador traz também vem com a desvantagem de ter um menor desempenho, porém, isso se mostra irrelevante para a implementação do protótipo deste projeto.
A seguir estão as principais etapas que um interpretador tree-walking costuma implementar a fim de executar o código de uma aplicação:

+ Análise Léxica: transforma o código fonte em uma lista de tokens, que são estruturas de dados com a finalidade de armazenar informações sobre cada palavra da gramática da linguagem;
+ Análise Sintática: transforma a lista de tokens gerada pela análise léxica em uma árvore sintática abstrata (AST), que é uma árvore ordenada com a finalidade de representar a hierarquia estrutural do código de acordo com as regras gramaticais da linguagem;
+ Interpretação: percorre a AST gerada pela análise sintática, reduzindo expressões, atualizando o estado do programa e executando funções. Um interpretador mais completo adiaria esta etapa, antes fazendo a análise semântica, geração de código intermediário, entre outras etapas @craftinginterpreters.
