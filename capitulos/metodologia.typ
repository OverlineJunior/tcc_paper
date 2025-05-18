#import "../abnt_udc.typ": todo

= Metodologia

O desenvolvimento deste trabalho será feito em quatro etapas cronológicas a fim de isolar os requisitos de cada uma. As etapas são descritas a seguir:

- Capítulo 3 - Design da Linguagem: A partir da fundamentação teórica, serão discutidas as decisões de design para a criação de uma linguagem de programação orientada a ECS. Isso incluirá a definição de requisitos, escolha de sintaxe, características da linguagem e como ela será projetada para facilitar o uso do padrão ECS. Será levado em consideração, principalmente, a flexibilidade e expressividade da linguagem;
- Capítulo 4 - Implementação do Protótipo: Dado o design da linguagem, será detalhado o processo de desenvolvimento do protótipo do interpretador. Serão discutidos os desafios enfrentados durante a implementação, incluindo a abstração do padrão ECS na linguagem, a construção do interpretador, e as decisões técnicas relacionadas à performance e ao suporte ao padrão ECS;
- Capítulo 5 - Análise de Resultados: Após a implementação, o protótipo do interpretador será avaliado de forma quantitativa, focando em determinar sua flexibilidade e expressividade. Adicionalmente, o tempo de execução será analisado de forma quantitativa com outras linguagens de programação;
- Capítulo 6 - Conclusão e Direções Futuras: Por fim, serão apresentadas as conclusões sobre o desenvolvimento do protótipo, discutindo suas contribuições para o campo de ECS e suas limitações. Também serão sugeridas possíveis direções para trabalhos futuros, como a expansão da linguagem e rotas diferentes que poderiam ter sido tomadas.

Dada a descrição das etapas de desenvolvimento, o próximo passo é detalhar os fundamentos e as tecnologias que serão utilizadas para a criação do protótipo. O foco está no padrão arquitetural Entity Component System (ECS), o qual será abstraído pela linguagem desenvolvida.

== Fundamentos

#include "metodologia/fundamentos/padrao_design.typ"

#include "metodologia/fundamentos/padrao_arquitetura.typ"

#include "metodologia/fundamentos/paradigma.typ"

#include "metodologia/fundamentos/design_dados.typ"

#include "metodologia/fundamentos/inversao_controle.typ"

#include "metodologia/fundamentos/ecs.typ"

#include "metodologia/fundamentos/interpretador.typ"

#include "metodologia/fundamentos/tracer_bullet.typ"

==	Tecnologias

#include "metodologia/tecnologias/rust.typ"

#include "metodologia/tecnologias/cargo.typ"

#include "metodologia/tecnologias/logos.typ"

#include "metodologia/tecnologias/chumsky.typ"

#include "metodologia/tecnologias/flecs.typ"

#include "metodologia/tecnologias/bevy.typ"

#pagebreak()
