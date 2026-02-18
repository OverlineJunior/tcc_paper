#import "abnt_udc.typ": *
#import "@preview/codly:1.3.0": codly-init

#show: abnt_udc
#show: codly-init.with()

#let autor = "Francisco Sebastiany Junior"
#let orientador = [Prof. Me. Luciano S. Cardoso \ Supervisor de campo: Prof. Me. Luciano S. Cardoso]
#let titulo = "Engenharia de IA na Secretaria de Tecnologia, Inovação e Modernização Digital"
#let curso = "Ciência da Computação"
#let natureza = [Relatório de Estágio apresentado como requisito obrigatório da disciplina Estágio Supervisionado II do curso de #curso do Centro Universitário Dinâmica das Cataratas.]
#let local = "Foz do Iguaçu"
#let data = "2025"

#capa(autor, titulo, curso, local, data)

#folha_de_rosto(autor, orientador, titulo, natureza, local, data)

#outline(title: "Sumário")

= Introdução

== Contextualização e Justificativa

A inteligência artificial generativa tem transformado a maneira como as empresas lidam com automação e processamento de informações. No entanto, para que os modelos de linguagem sejam úteis em contextos específicos, é necessário utilizar técnicas que permitam o acesso a dados externos e a execução de tarefas de forma autônoma. Nesse contexto, o uso de agentes de IA e da técnica de _Retrieval Augmented Generation_ (RAG) é fundamental @lewis2020.

Este trabalho justifica-se pela necessidade que houve de explorar e validar ferramentas modernas de gerenciamento de IA, tanto _low-code_ quanto baseadas em código. O estudo prático dessas tecnologias permitiu identificar as melhores abordagens para a criação de agentes capazes de guardar memória e consultar bases de dados vetoriais, contribuindo para a inovação tecnológica no ambiente de trabalho.

== Informações do Estágio

- *Nome:* Prefeitura Municipal de Foz do Iguaçu @pmfi_home.

- *Endereço:* Praça Getúlio Vargas, n. 280, Centro, Foz do Iguaçu - PR.

- *Setor de Atuação:* Secretaria de Tecnologia, Inovação e Modernização Digital (STIM) @pmfi_stim.

- *Aspectos Históricos:* o município de Foz do Iguaçu foi fundado oficialmente em 10 de junho de 1914. A cidade é posicionada estrategicamente na fronteira e possui grandes fontes econômicas, como a usina de Itaipu. Atualmente, o turismo e a prestação de serviços, incluindo a gestão pública moderna, são as maiores fontes de economia da cidade @pmfi_historia.

- *Caracterização da Empresa:* instituição pública de grande porte com foco em inovação tecnológica, principalmente com relação à inteligência artificial e ao conceito de "Cidade Inteligente".

- *Ramos de Atuação:* Tecnologia e inovação digital no setor público municipal.

- *Abrangência de Atuação:* atua em toda a cidade de Foz do Iguaçu, atendendo cidadãos, turistas e empresas que utilizam os serviços municipais.

- *Inserção dos tipos de produtos/serviços no mercado:* provê serviços públicos digitais para desburocratização do acesso do cidadão, exemplificado pelo projeto "Cidade na Palma da Mão".

== Objetivo Geral

O objetivo geral foi desenvolver habilidades na criação de agentes de inteligência artificial utilizando diferentes plataformas e _frameworks_.

== Objetivos Específicos

Os objetivos específicos cumpridos foram:

- Estudar os conceitos fundamentais de agentes autônomos e estruturação de dados para IA;
- Desenvolver _workflows_ de automação utilizando a plataforma _N8N_ e _Docker_;
- Implementar agentes complexos com o _framework Agno_, utilizando memória persistente e bancos de dados vetoriais;
- Elaborar documentação técnica e material de apresentação utilizando a ferramenta _Typst_ para disseminação do conhecimento adquirido.

#pagebreak()

= Desenvolvimento

== Atividades

As atividades desenvolvidas durante o estágio seguiram uma ordem cronológica de complexidade, iniciando pela teoria e avançando para a prática em diferentes ferramentas.

A primeira etapa consistiu na ambientação e fundamentação teórica. Após a familiarização com o ambiente de trabalho e a equipe, iniciou-se o estudo sobre agentes de IA. Foi dada ênfase ao entendimento do que é _Retrieval Augmented Generation_ (RAG) @lewis2020 e como o uso de _Markdown_ facilita a interpretação de conteúdo por inteligências artificiais.

Na segunda etapa, o foco foi a prototipagem em _low-code_ e infraestrutura. Utilizou-se o _Docker_ para instalar e configurar o uso do _N8N_ @n8n localmente. Com o ambiente pronto, foram criados agentes na plataforma _N8N_ para aprendizado prático. Isso incluiu a criação de _chatbots_ simples e, posteriormente, _chatbots_ integrados com _RAG_ utilizando o _Pinecone_#footnote[Devido ao sistema de _proxy_ da empresa, agentes que precisavam se comunicar com APIs externas, como a do _Pinecone_, tiveram que ser feitos na nuvem ao invés de localmente.] como banco vetorial.

A terceira etapa marcou a transição para o desenvolvimento avançado via código. Utilizou-se _Python_ com o _framework_ de agentes de IA _Agno_ @agno para aprofundar o conhecimento na criação de agentes. Nesta fase, foram implementados _chatbots_ com funcionalidades mais complexas, como memória de conversação (para manter o contexto), técnicas de _chunking_ (divisão de textos em partes menores) e uso de bancos vetoriais locais, especificamente o _LanceDB_, devido a sua facilidade de integração.

Por fim, a quarta etapa se deu pela documentação e transferência de conhecimento. Foi produzida uma documentação técnica detalhada sobre o _Agno_ para introduzir a ferramenta e conceitos gerais de IA aos funcionários. Além disso, foi elaborada uma apresentação de slides sobre o _Agno_ para uso dos superiores. Ambos os materiais foram criados utilizando o _Typst_ @typst.

== Instrumentalização

O desenvolvimento foi realizado em computadores disponibilizados pela empresa, utilizando o _Windows 10_. A linguagem de programação principal utilizada foi _Python_.

Os softwares e bibliotecas fundamentais para a realização das tarefas foram:

- *_Docker_*: utilizado para a virtualização do ambiente e execução local do _N8N_;
- *_N8N_*: plataforma utilizada para aprendizado de automação de _workflows_ e lógica de agentes em ambiente visual @n8n;
- *_Agno_*: _framework_ principal utilizado para a criação e gerenciamento de agentes de IA @agno;
- *_Pinecone_*: banco de dados vetorial utilizado nas experiências iniciais com _N8N_;
- *_LanceDB_*: banco de dados utilizado para armazenamento e busca vetorial nas implementações com *_Agno_*;
- *_Typst_*: alternativa moderna ao _LaTeX_ utilizada para a criação da documentação técnica e dos slides de apresentação @typst.

#pagebreak()

= Conclusão

O estágio supervisionado ofereceu conhecimento prático nas tecnologias de inteligência artificial. Os objetivos propostos foram alcançados, permitindo não apenas o entendimento teórico sobre agentes e _RAG_, mas também a aplicação técnica desses conceitos.

A transição do uso de ferramentas _low-code_ como o _N8N_ para _frameworks_ de código como o _Agno_ foi essencial para compreender os diferentes níveis de complexidade na engenharia de IA. Os testes funcionais demonstraram que os agentes criados foram capazes de responder perguntas com base nos documentos fornecidos e manter a coerência via memória.

Além disso, a produção da documentação e da apresentação em _Typst_ cumpriu o papel de disseminar o conhecimento adquirido, entregando valor real para a empresa e facilitando o entendimento da tecnologia por outros funcionários da empresa.

#pagebreak()

#bibliography("estagio_refs.yaml", style: "associacao-brasileira-de-normas-tecnicas")
