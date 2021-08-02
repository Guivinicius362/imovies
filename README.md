# imovies

Projeto com fim de demonstração de arquitetura.
## O App

<img src="screenshots/ss1.png?raw=true" width="250"> <img src="screenshots/ss2.png?raw=true" width="250"> <img src="screenshots/ss3.png?raw=true" width="250">
## Arquitetura:

    Para esse projeto acabei optando por utilizar do padrão Business Logic Component (BLoC) como meu gerenciamento de estado. O padrão BLoC usa a Programação reativa para lidar com o fluxo de dados em um aplicativo.

    já na parte de organização minha ideia foi seguir alguns conceitos da Clean architeture adequando ao Flutter.

    Basicamente esse app contém 3 principais pasta com cada uma tendo sua devida função.

<img src="screenshots/arq.png?raw=true" width="500">

## Design System:

    O modulo Design System é o responsavel por conter tudo relacionado a layout que é comum e reutilizado em todo o app. Em um aplicativo de grande escala o ideal seria jogar o design system para um package separado podendo  ser um mono repo ou um submodulo isso vai do feeling do desenvolvedor

## infrastructure:

    O modulo Infrastructure é o responsavel por conter tudo relacionado a Service, injeção de dependecia, modelos e extensões, a ideia é que mesmo mudando o gerenciador de estado do app a parte de infraestrutura não seja afetada possibilitando assim uma implementação menos dolorasa se em algum momento o desenvolvedor resolver trocar o RxDart por algo como Riverpod ou o provider.

    Em um fluxo convencional :  

    O Service é responsavel por fazer chamadas para um serviço backend e retornar a resposta.

    O Repository é o responsavel por tratar a resposta que o service ira retornar e fazer o parse dela para um modelo que possa ser utilizado no seu gerenciador de estado

## Presentation:

    O modulo Presentation é o responsavel por conter tudo relacionado a UI, rotas e gerenciamento de estado, a ideia é que ele tenha uma feature que seria uma pasta e dentro dela iram conter 3 principais pastas que seriam :

    A pasta de Constants é a responsavel por não deixar nenhum texto na tela para quando precisar trocar algum texto ser facil de achar, quase que a mesma ideia do string no Android porém é uma String por feature isso acaba deixando essas classes mais enxutadas 

    A pasta de Pages é a responsavel por separar as telas de uma feature e dentro dela contém a pasta de tela junto com a tela e o seu respectivo BLoC

    A pasta de Widgets é a responsavel por armazenar os widgets especificos daquele fluxo, geralmente widgets especificos que não serão reutilizado em outras features.

    um ponto de evolução pensando em escalabilidade do app pode ser separar essas features por package ao inves de pastas.

    Em um fluxo convencional : 

    O BLoC é o responsavel por pegar os dados tratados do repository e criar/atualizar a stream pertencente aquela chamada

    A Page é a responsavel por consumir as streams e quando necessario renderizar os Widgets responsavel pela exibição daqueles dados

## Testes:

    Nesse projeto acabei optando por seguir o padrão Robot conhecido principalmente no Android e como nomenclatura dos testes o padrão given_when_then

    Acho que o principal beneficio dessa arquitetura com get_it + RxDart é que eu consigo testar todas as minhas layers sem muito trabalho.
    
    Para testar o service é só mockar o http.client.

    Para testar o repository é só mockar o service.

    Para testar o BLoC é só mockar o repository.

    Para testar a Page é só mockar o BLoC.

    Outro ponto, nessa arquitetura se vc quiser vc pode testar o BLoC integrado com a tela, só mockar o repository e dai vc meio que tem um teste de integração.

## Libs:

    Um dos principais pontos pelo qual eu escolhi as libs que eu escolhi é pq eu não gosto muito da ideia das libs gerando codigo pq prende muito se app a aquela lib

    get_it: eu particularmente gosto do get_it pq ele é simples e não gera codigo.

    rxdart: acabei optando pelo RxDart mais pela familaridade mesmo mas acho que se eu fosse seguir para algo mais "Moderno" eu iria de riverpod.

    http: http né.

    shimmer: shimmer pra tentar deixar o app um pouco mais bonito.

    google_fonts: eu tava sem ideia para a font do app então utilizei essa lib para ter opções.

    mocktail: antigamente eu utilizava o mockito porém começou a ter geração de codigo e pra evitar isso eu acabei achando o mocktail que é relativamente nova mas é inspirado no mockito, mas talvez em um cenario de produção eu acabasse optando pelo mockito pela estabilidade.     

## Considerações finais:

    Nesse projeto eu acabei não fazendo muitas features complexas pq eu preferi fazer uma base bem feita com algumas abstrações de complexidade para ser um app mais atrativo para quem esta começando no flutter e sem nenhuma visão de Rx, por isso eu acabei abstraindo o Publish Subject e o StreamBuilder, eu sei que provavelmente para features mais complexas como um google maps ou coisas assim eu teria que quebrar esse padrão das abstrações que eu fiz mas acho que a grande maioria dos casos essas abstrações serão uteis.

    Agradeço a paciencia e o tempo para ler até o fim <3    



