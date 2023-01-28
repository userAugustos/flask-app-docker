
# Docker
### Como era feito antes?

- **Hardware**: o Hardware onde vamos executar aquele SO, que vai compartilhar hardware para nossas virtual machines
- **Hypervisor**: Um vizualizador (um SO que vai estar diretamente no hardware) onde podemos criar outros sistemas
- **Vitural Machine**: Um programa que pode simular um ambiente computacional, capaz por exemplo, de executar sistemas opracionais
- **Operating System**: Normalment um linux onde vamos executar o que precisamos/rodar nessa aplicação
- **Aplicação**


### Como é com um container?

- **Hardware**
- **Operating System**
- **Container Engine**: Nossa engine para criar, alterar, deletar etc... nos containers, no nosso caso, *docker*
- **Containers**: Então temos nossos containers em si, que serão pedaços isolados de operação logica que compartilham o mesmo kernel e engine.

**Vantagens:** 
- Otimização de recursos (hardware)
- Empacotamento da aplicação (espaço lógico isolado)
- Imutabilidade
- Maior facilidade no deploy


### Arquitetura Docker

**Docker Client**: ****Nossa CLI, onde executamos comandos e interagimos com o docker:
 - docker ps
 - docker pull
 - docker run

**Docker Host**
Nosso serviço em si, com o que nossa CLI se comunica, podemos nos comunicar com o docker daemon na nossa maquina, ou podemos configurar nossa cli, pra conversar com um docker daemon em outro lugar, como na aws, ou na vpn da empresa e etc.

**Registry**
Nossa store de imagens docker, o servidor onde ficam as imagens docker já registradas, ex:
*dockerhub*.

### Processo de criação de um container

- **Docker file**: Arquivo com comandos para criação e execução de uma imagem, com os comandos que estarão nele: from, run, copy etc... Nosso serviço docker vai criar a imagem. [Docker File Docs](https://docs.docker.com/engine/reference/builder/)
E aqui vem a magica docker, onde a partir de uma imagem, através do sistema de camadas do docker, podemos ter vários containers.

*como assim sistema de camadas?*:
	No docker pense que para cada instrução na criação de uma imagem, temos uma camada, que extende e começa a partir da ultima, então:
	- From imagem X
	- Run X+=y
	- Copy y into AB
	Então esses comandos acontecem ao final e extendem seu anterior, a mesma coisa para imagens e containers.
	**Quando criamos um container com base em uma imagem, ele se torna apenas uma "camada" que extende e funciona a partir daquela imagem**. Ele é um objeto agora separado, feito com base naquela imagem; Assim, independente do que acontece nele, podemso criar "infinitos" containers a partir daquela imagem.

Então, do docker file podemos criar uma image, e a partir dessa imagem, podemos criar um container.


**Escrevendo nosso docker file**

Para começar, precisamos de uma imagem base, onde se baseará nossa imagem ou virá nosso container:
	pra isso usamos o comando **FROM**
Então, pensamos na aplicação python que estamos usando aqui, iriamos querer de base, uma imagem com python3, pip que é o que usamos pra rodar esse código, então podemos ir ao docker hub (o registry publico do docker) e procurar por uma.

#### Veja o dockerfile nesse projeto

Então após aqueles passos para criar nossa imagem, podemos buildar a imagem e cria-la de fato:
	docker build <nome da imagem> <caminho para o dockerfile>

E então rodar nossa imagem:
	docker run -d -P <nome da imagem>
	
	- flag -d vai fazer o docker rodar em background, sem ela, rodaria no nosso terminal, exibindo logs e dados do container.
	- flag -P vai mapear a porta do docker host para a porta que expomos no docker files

pra entender as opções do docker run, veja: [docker run](https://docs.docker.com/engine/reference/run/)