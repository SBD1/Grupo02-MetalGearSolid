# Docker
## Instalando o Docker
```
$ curl -fsSL https://get.docker.com | bash
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
```
A primeira linha instala o docker, as outras duas adicionam seu usuario no grupo docker e da permissao de 'sudo' para o grupo. Reinicie a maquina para efetivar as alteracoes.

Existe um video falando sobre como instalar o docker, como criar Dockerfiles, o que sao volumes e networks, isto pode ser de seu interesse : 
[Tutorial Docker 2022.](https://www.youtube.com/watch?v=MeFyp4VnNx0&t=1796s&ab\_channel=LINUXtips)

## O docker neste projeto
Existem apenas 2 arquivos referentes ao docker no projeto. São estes: [docker-compose.yml](../docker-compose.yml) e [Dockerfile](../Dockerfile). O primeiro
define a interação entre os containers do banco de dados e do python3, sendo assim caso você tenha alguma dúvida sobre as configurações do BD considere lê-lo.
Ao passo que o Dockerfile define a imagem do python a ser usada e usa o requirements.txt, não se preocupe muito com este arquivo.

## Comandos úteis para o projeto

É recomendado que você esteja na **raiz do projeto** para executar os comandos.

- Constroi as imagens necessarias para a execucao do projeto.
```
$ docker compose build --no-cache 
```

- Levanta os containers do banco de dados e do python.
```
$ docker compose up -d 
```

- Lista os containers em execucao.
```
$ docker ps
```
ou
```
$ docker container ls
```

- **Entrando no container python para interagir com o projeto.**

```
$ docker exec -it id_container_obtido_com_o_comando_anterior /bin/bash
```

Com o ultimo comando vc está dentro do container, agora é só dar o python3 main.py . Para sair do container é só digitar "exit" ou dar um Ctrl + d.
