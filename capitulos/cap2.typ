= Fundamentação Teórica

O desenvolvimento deste trabalho será feito em quatro etapas cronológicas a fim de isolar os requisitos de cada uma. As etapas são descritas a seguir:

- Capítulo 3 - Design da Linguagem: A partir da fundamentação teórica, serão discutidas as decisões de design para a criação de uma linguagem de programação orientada a ECS. Isso incluirá a definição de requisitos, escolha de sintaxe, características da linguagem e como ela será projetada para facilitar o uso do padrão ECS. Será levado em consideração, principalmente, a flexibilidade e expressividade da linguagem;
- Capítulo 4 - Implementação do Protótipo: Dado o design da linguagem, será detalhado o processo de desenvolvimento do protótipo do interpretador. Serão discutidos os desafios enfrentados durante a implementação, incluindo a abstração do padrão ECS na linguagem, a construção do interpretador, e as decisões técnicas relacionadas à performance e ao suporte ao padrão ECS;
- Capítulo 5 - Análise de Resultados: Após a implementação, o protótipo do interpretador será avaliado de forma quantitativa, focando em determinar sua flexibilidade e expressividade. Adicionalmente, o tempo de execução será analisado de forma quantitativa com outras linguagens de programação;
- Capítulo 6 - Conclusão e Direções Futuras: Por fim, serão apresentadas as conclusões sobre o desenvolvimento do protótipo, discutindo suas contribuições para o campo de ECS e suas limitações. Também serão sugeridas possíveis direções para trabalhos futuros, como a expansão da linguagem e rotas diferentes que poderiam ter sido tomadas.

Dada a descrição das etapas de desenvolvimento, o próximo passo é detalhar os fundamentos e as tecnologias que serão utilizadas para a criação do protótipo. O foco está no padrão arquitetural Entity Component System (ECS), o qual será abstraído pela linguagem desenvolvida.

== Fundamentos

===	Entity Component System

Entity Component System (ECS) é um padrão arquitetural que surgiu na área de desenvolvimento de jogos, cuja natureza exige alto desempenho e flexibilidade. Por mais que o padrão continue sendo majoritariamente aplicado em jogos, sua utilidade expande para qualquer aplicação que dependa dos mesmos requisitos: alto desempenho e flexibilidade.
O padrão ECS é composto de três elementos principais:

- Entidades: identificadores únicos que representam os vários conceitos de uma aplicação. Sozinhas, as entidades não contêm dados nem funcionalidade;
- Componentes: estruturas de dados que armazenam informações específicas. Uma entidade pode ter múltiplos componentes diferentes, definindo suas características;
- Sistemas: funções responsáveis por processar sobre entidades com um determinado conjunto de componentes — processo denominado querying (Bevy Foundation, 2020; Mertens, 2019).

Adicionalmente, o padrão ECS costuma ser combinado com alguns outros elementos a fim de tornar o desenvolvimento mais prático:

- Estado da Aplicação: estrutura de dados global. A fim de evitar a criação de entidades que atuam como singletons, aplicações estruturadas com ECS costumam possuir um estado global para armazenar dados que não se repetem;
- Agendador: função ou objeto com a finalidade de agendar a ordem e frequência de execução de todos os sistemas, resolvendo dependência entre sistemas e tornando o ciclo de atualização da aplicação mais previsível;
- Depurador: interface responsável por ajudar o desenvolvedor a encontrar e resolver bugs na aplicação. No contexto de ECS, o depurador pode examinar as entidades e seus respectivos componentes, além de listar os sistemas em execução e permitir o controle sobre eles.

===	Interpretador Tree-Walking

Interpretador tree-walking é um tipo de interpretador que pula algumas etapas finais a fim de manter a simplicidade. Por isso, ele será ideal para a implementação do protótipo do projeto.
De forma mais detalhada, tal interpretador costuma iniciar a execução da aplicação logo após a geração da árvore sintática abstrata (AST), pulando a geração de código intermediário e otimizações relacionadas. A simplicidade que este tipo de interpretador traz também vem com a desvantagem de ter um menor desempenho, porém, isso se mostra irrelevante para a implementação do protótipo deste projeto.
A seguir estão as principais etapas que um interpretador tree-walking costuma implementar a fim de executar o código de uma aplicação:

+ Análise Léxica: transforma o código fonte em uma lista de tokens, que são estruturas de dados com a finalidade de armazenar informações sobre cada palavra da gramática da linguagem;
+ Análise Sintática: transforma a lista de tokens gerada pela análise léxica em uma árvore sintática abstrata (AST), que é uma árvore ordenada com a finalidade de representar a hierarquia estrutural do código de acordo com as regras gramaticais da linguagem;
+ Interpretação: percorre a AST gerada pela análise sintática, reduzindo expressões, atualizando o estado do programa e executando funções. Um interpretador mais completo adiaria esta etapa, antes fazendo a análise semântica, geração de código intermediário, entre outras etapas (Nystrom, 2021).

==	Tecnologias

===	Linguagem de Programação

A linguagem de programação utilizada para o desenvolvimento do interpretador será Rust. A motivação por trás da escolha se dá pelos seguintes fatos:

- Possui um sistema de tipagem forte — o uso de enum e match é especialmente útil na definição dos tokens e na construção da AST;
- O tratamento de erros é explícito, indicando com clareza quais partes do código precisam ser tratadas adequadamente. Todas as fases de um interpretador estão sujeitas a erros, e por isso, tratá-los do jeito mais claro possível é benéfico para o estudo do código;
- Possui alto desempenho, muitas vezes comparado ao de C. Desempenho é importante não só para ECS em si, mas também para qualquer interpretador, minimizando o tempo que o desenvolvedor espera pela execução de seu código (Klabnik et al, 2018).

===	Bibliotecas

O uso de bibliotecas que ajudam no desenvolvimento de interpretadores será proibido, assim cada processo de desenvolvimento do interpretador é estudado a fundo. Porém, algumas bibliotecas de uso geral serão utilizadas:

- thiserror: reduz o boilerplate na definição de erros gerados pelo interpretador com o uso de macros.

#pagebreak()
