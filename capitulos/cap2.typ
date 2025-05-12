#import "../abnt_udc.typ": todo

= Fundamentação Teórica

O desenvolvimento deste trabalho será feito em quatro etapas cronológicas a fim de isolar os requisitos de cada uma. As etapas são descritas a seguir:

- Capítulo 3 - Design da Linguagem: A partir da fundamentação teórica, serão discutidas as decisões de design para a criação de uma linguagem de programação orientada a ECS. Isso incluirá a definição de requisitos, escolha de sintaxe, características da linguagem e como ela será projetada para facilitar o uso do padrão ECS. Será levado em consideração, principalmente, a flexibilidade e expressividade da linguagem;
- Capítulo 4 - Implementação do Protótipo: Dado o design da linguagem, será detalhado o processo de desenvolvimento do protótipo do interpretador. Serão discutidos os desafios enfrentados durante a implementação, incluindo a abstração do padrão ECS na linguagem, a construção do interpretador, e as decisões técnicas relacionadas à performance e ao suporte ao padrão ECS;
- Capítulo 5 - Análise de Resultados: Após a implementação, o protótipo do interpretador será avaliado de forma quantitativa, focando em determinar sua flexibilidade e expressividade. Adicionalmente, o tempo de execução será analisado de forma quantitativa com outras linguagens de programação;
- Capítulo 6 - Conclusão e Direções Futuras: Por fim, serão apresentadas as conclusões sobre o desenvolvimento do protótipo, discutindo suas contribuições para o campo de ECS e suas limitações. Também serão sugeridas possíveis direções para trabalhos futuros, como a expansão da linguagem e rotas diferentes que poderiam ter sido tomadas.

Dada a descrição das etapas de desenvolvimento, o próximo passo é detalhar os fundamentos e as tecnologias que serão utilizadas para a criação do protótipo. O foco está no padrão arquitetural Entity Component System (ECS), o qual será abstraído pela linguagem desenvolvida.

== Fundamentos

=== Padrão de Projeto de Software

#todo("Explicar Singleton.")

=== Paradigma de Programação

#todo("Explicar POO e funcional.")

=== Design Orientado a Dados

#todo("Explicar structure of arrays and array of structures.")

===	Entity Component System

Entity Component System (ECS) é um padrão arquitetural que oferece alta flexibilidade, modularidade e desempenho. Ele surgiu na área de desenvolvimento de jogos, onde a necessidade de otimização e atualizações frequentes no código são comuns, mas sua aplicação pode ser estendida a outras áreas de desenvolvimento de software #todo("Referencia.").

O padrão ECS segue o modelo de design orientado a dados, que prioriza a separação de dados e lógica, trazendo assim suas vantagens, como o aumento de desempenho e modularidade #todo("Referencia."). Dado isso, o padrão ECS é composto de três elementos principais #todo("Referencia."):

==== Os Três Elementos Fundamentais do ECS

O padrão ECS é separado em três elementos fundamentais: entidades, componentes e sistemas. Cada um desses elementos desempenha um papel específico:

- Entidades: identificadores únicos que representam os vários conceitos de uma aplicação. Sozinhas, as entidades não contêm dados nem funcionalidade;
- Componentes: estruturas de dados que armazenam informações específicas. Uma entidade pode ter múltiplos componentes diferentes, definindo suas características;
- Sistemas: funções responsáveis por processar sobre entidades com um determinado conjunto de componentes — processo denominado querying.

#figure(image("../imagens/diagrama_ecs.png", height: 35%), caption: "Relação entre entidades, componentes e sistemas no padrão ECS.") <diagrama_ecs>

Como a @diagrama_ecs ilustra, o estado da aplicação é dado por um conjunto de entidades, cada uma com seus respectivos componentes. Os sistemas são responsáveis pela transformação do estado da aplicação, processando as entidades que possuem os componentes necessários para a execução do sistema.

Em termos de código, o padrão ECS pode ser representado sem nenhum construto especializado, mapeando entidades para números únicos, componentes para _structs_ e sistemas para funções:

```rs
// Componentes podem ser representados através de simples structs.
struct Position { x: f32, y: f32 }

struct Velocity { dx: f32, dy: f32 }

// Sistemas podem ser representados como funções que processam todas as
// entidades e seus respectivos componentes.
fn apply_velocity(
    entities: &[usize],
    positions: &mut [Position],
    velocities: &[Velocity]
) {
    for &entity in entities {
        positions[entity].x += velocities[entity].dx;
        positions[entity].y += velocities[entity].dy;
    }
}

fn main() {
    // Entidades podem ser representadas como números únicos.
    let entities = [0, 1];

    // Cada componente é armazenado em um vetor separado, onde o índice
    // representa a entidade e o valor representa seu componente.
    let mut positions = [
        Position { x: 0.0, y: 0.0 }, // Entidade 0.
        Position { x: 1.0, y: 1.0 }, // Entidade 1.
    ];

    let velocities = [
        Velocity { dx: 1.0, dy: 1.0 }, // Entidade 0.
        Velocity { dx: 2.0, dy: 2.0 }, // Entidade 1.
    ];

    // No padrão ECS, é muito comum que os sistemas sejam executados repetidamente.
    loop {
        apply_velocity(&entities, &mut positions, &velocities);
    }
}
```

É importante ressaltar que o exemplo acima, por mais que seja funcional e siga o design orientado a dados, ainda é uma simplificação da implementação de um padrão ECS incompleto. Na prática, o armazenamento dos dados é feito através de estruturas de dados mais complexas, que permitem que entidades escolham quais componentes possuem, que sistemas sejam executados automaticamente, além de outras funcionalidades principais do padrão ECS.

==== Extensões do ECS

Adicionalmente, o padrão ECS costuma ser combinado com alguns outros elementos a fim de tornar o desenvolvimento mais prático:

- Estado da Aplicação: estrutura de dados global. A fim de evitar a criação de entidades que atuam como _singletons_, aplicações estruturadas com ECS costumam possuir um estado global para armazenar dados que não se repetem;
- Agendador: função ou objeto com a finalidade de agendar a ordem e frequência de execução de todos os sistemas, resolvendo dependência entre sistemas e tornando o ciclo de atualização da aplicação mais previsível;
- Depurador: interface responsável por ajudar o desenvolvedor a encontrar e resolver bugs na aplicação. No contexto de ECS, o depurador pode examinar as entidades e seus respectivos componentes, além de listar os sistemas em execução e permitir o controle sobre eles.

===	Interpretador Tree-Walking

Interpretador tree-walking é um tipo de interpretador que pula algumas etapas finais a fim de manter a simplicidade. Por isso, ele será ideal para a implementação do protótipo do projeto.
De forma mais detalhada, tal interpretador costuma iniciar a execução da aplicação logo após a geração da árvore sintática abstrata (AST), pulando a geração de código intermediário e otimizações relacionadas. A simplicidade que este tipo de interpretador traz também vem com a desvantagem de ter um menor desempenho, porém, isso se mostra irrelevante para a implementação do protótipo deste projeto.
A seguir estão as principais etapas que um interpretador tree-walking costuma implementar a fim de executar o código de uma aplicação:

+ Análise Léxica: transforma o código fonte em uma lista de tokens, que são estruturas de dados com a finalidade de armazenar informações sobre cada palavra da gramática da linguagem;
+ Análise Sintática: transforma a lista de tokens gerada pela análise léxica em uma árvore sintática abstrata (AST), que é uma árvore ordenada com a finalidade de representar a hierarquia estrutural do código de acordo com as regras gramaticais da linguagem;
+ Interpretação: percorre a AST gerada pela análise sintática, reduzindo expressões, atualizando o estado do programa e executando funções. Um interpretador mais completo adiaria esta etapa, antes fazendo a análise semântica, geração de código intermediário, entre outras etapas @craftinginterpreters.

=== _Tracer Bullet_

==	Tecnologias

===	Rust

A linguagem de programação utilizada para o desenvolvimento do interpretador será Rust. A motivação por trás da escolha se dá pelos seguintes fatos:

- Possui um sistema de tipagem forte — o uso de enum e match é especialmente útil na definição dos tokens e na construção da AST;
- O tratamento de erros é explícito, indicando com clareza quais partes do código precisam ser tratadas adequadamente. Todas as fases de um interpretador estão sujeitas a erros, e por isso, tratá-los do jeito mais claro possível é benéfico para o estudo do código;
- Possui alto desempenho, muitas vezes comparado ao de C. Desempenho é importante não só para ECS em si, mas também para qualquer interpretador, minimizando o tempo que o desenvolvedor espera pela execução de seu código @rustbook.

===	Cargo

#todo("Explicar o que é e como funciona.")

O uso de bibliotecas que ajudam no desenvolvimento de interpretadores será proibido, assim cada processo de desenvolvimento do interpretador é estudado a fundo. Porém, algumas bibliotecas de uso geral serão utilizadas:

- thiserror: reduz o boilerplate na definição de erros gerados pelo interpretador com o uso de macros @thiserror.

#pagebreak()
