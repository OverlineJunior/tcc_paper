=== Chumsky

Chumsky é uma biblioteca de análise sintática para Rust. Ela é baseada no conceito de _parser combinators_ #footnote[Um _parser combinator_ consiste na combinação de parsers mais simples para criar parsers mais complexos, assim como é de costume compor uma função maior de funções menores.], e permite que a definição de _parsers_ seja feita de forma declarativa. Seu escopo abrange tanto gramáticas livres de contexto quanto gramáticas sensíveis ao contexto.

De acordo com a classificação do _benchmark_ da biblioteca e seus competidores, localizada no repositório oficial, Chusmky pode ser a biblioteca de análise sintática mais rápida para Rust:

#figure(
    table(
        columns: 3,
        inset: 10pt,
        align: horizon,
        table.header([Classificação], [Biblioteca], [Tempo de Execução]),
        [1],
        [chumsky (check-only)],
        [140.77 µs],
        [2],
        [winnow],
        [178.91 µs],
        [3],
        [chusmky],
        [210.43 µs],
        [4],
        [sn],
        [237.94 µs],
        [5],
        [serde_json],
        [477.41 µs],
        [6],
        [nom],
        [526.52 µs],
        [7],
        [pest],
        [1.9706 ms],
        [8],
        [pom],
        [13.730 ms],
    ),
    caption: [Classificação do _benchmark_ da biblioteca Chumsky e competidores.]
)
@chumsky
