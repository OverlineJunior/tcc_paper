#import "../../../abnt_udc.typ": todo

=== Padrão de Design de Software

Um padrão de design de software (do inglês, _software design pattern_) é uma solução reutilizável para um determinado problema recorrente no design de software. Esses padrões são descrições gerais de como resolver tais problemas, e não implementações específicas.

De acordo com o site didático Refactoring Guru de #cite(<refactoringguru>, form: "author"), os padrões podem ser classificados em três categorias:

- Padrões Criacionais: tratam da criação de objetos, focando em como instanciá-los de forma a resolver problemas específicos. Abrange padrões como _Singleton_, _Builder_ e _Prototype_;

- Padrões Estruturais: tratam da composição de objetos em uma estrutura maior, além de como eles interagem entre si. Abrange padrões como _Adapter_, _Decorator_ e _Facade_;

- Padrões Comportamentais: tratam de algoritmos e a atribuição de responsabilidades entre objetos. Abrange padrões como _Observer_, _Strategy_ e _Visitor_.

É importante notar como o autor explica os vários padrões usando o paradigma de programação orientado a objetos — por mais que esse seja o caso, nem todos os padrões de design são exclusivos a esse paradigma. Um exemplo é o padrão _Observer_, cujo conceito é de grande importância para o paradigma de programação reativa functional (do inglês, _functional reactive programming_) #todo("Adicionar referencia. Dica: https://en.wikipedia.org/wiki/Functional_reactive_programming").

=== Padrão de Arquitetura de Software

Um padrão de arquitetura de software (do inglês, _software architecture pattern_), assim como um padrão de design de software, é uma solução reutilizável para um problema recorrente, só que dessa vez na arquitetura de software. Enquanto um padrão de design foca em resolver problemas mais específicos no código, um padrão de arquitetura foca em resolver problemas mais amplos, como a organização de toda a aplicação e a interação entre seus diversos componentes @fundsoftwarearchitecture.

Pode-se dizer que um dos maiores exemplos de padrão arquitetural é o _Model-View-Controller_ (MVC), que separa a aplicação em três componentes distintos a fim de isolar as várias responsabilidades da aplicação. Porém, neste projeto, será utilizado outro padrão arquitetural: o _Entity Component System_.
