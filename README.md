# Mob2ConLabs API

![Tests & Linters](https://github.com/fabianoleittes/visitors-api/workflows/Tests%20&%20Linters/badge.svg?branch=main)


<h4 align="center"> 
	🚧  Mob2ConLabs API em construção 🚀 🚧
</h4>

<p align="center">
 <a href="#-sobre-o-projeto">Sobre</a> •
 <a href="#-funcionalidades">Funcionalidades</a> •
 <a href="#-como-executar-o-projeto">Como executar</a> • 
 <a href="#-tecnologias">Tecnologias</a>
 • 
 <a href="#-autor">Autor</a> • 
 <a href="#user-content--licença">Licença</a>
</p>


## 💻 Sobre o projeto

Mob2ConLabs - é um API Restful feita como teste para a vaga de backend na Mob2ConLabs.

---

## ⚙️ Funcionalidades

- [x] O administrador pode gerenciar Redes Varejistas (crud) para dar entrada em novos clientes.

- [x] O administrador pode pesquisar redes varejistas pelo nome para ter acesso as informações.

- [x] O administrador pode gerenciar visiantes (crud) de cada rede para que mais pessoas utilizem o sistema.

- [ ] O administrador pode enviar fotos dos visitantes para identificá-los.

- [x] O administrador pode pesquisar visitantes por nome para ter acesso as informações.

- [ ] Usuário da rede pode se deslogar no sistema.

- [x] Usuário da rede pode fazer login

- [x] Usuário da rede pode registrar entradas e saidas de visitantes.

- [x] Usuário externo, não autenticado, pode ver o número total de redes e seus visitantes.

---

## 🚀 Como executar o projeto

Este projeto é uma API Restful:
1. Backend

### Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[docker](https://docs.docker.com/install/) e [docker compose](https://docs.docker.com/compose/install/)
 
#### 🎲 Rodando a API (servidor)

```bash

# Clone este repositório
$ git clone https://github.com/fabianoleittes/visitors-api.git

# Acesse a pasta do projeto no terminal/cmd
$ cd visitors-api

# Instale as dependências
$ docker-compose run --rm api bundle install

# Execute a aplicação em modo de desenvolvimento
$ docker-compose run up

# O servidor inciará na porta:3000 - acesse http://api.dev.local:3000 


```
<p align="center">
  <a href="https://insomnia.rest/run/?label=Mob2ConLabs%20API&uri=https%3A%2F%2Fraw.githubusercontent.com%2Ffabianoleittes%2Fvisitors-api%2Freadme%2FInsomnia.json%3Ftoken%3DAACEGMEPFPUEI3IOGM4WMXC7QSNOO" target="_blank"><img src="https://insomnia.rest/images/run.svg" alt="Run in Insomnia"></a>
</p>

---

## 🛠 Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:

#### **API**  ([Ruby on Rails](https://rubyonrails.org/)  +  [PostgreSQL](https://www.postgresql.org/))

-   **[rspec](https://github.com/rspec/rspec-rails)**
-   **[Factory Bot](https://github.com/thoughtbot/factory_bot_rails)**
-   **[Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)**
-   **[JWT](https://github.com/jwt/ruby-jwt)**
-   **[ffaker](https://github.com/ffaker/ffaker)**
-   **[Rack Cors](https://github.com/cyu/rack-cors)**

> Veja o arquivo  [Gemfile](https://github.com/fabianoleittes/visitors-api/blob/main/Gemfile)

#### Utilitários

-   Conventional commits:  **[Commits](https://www.conventionalcommits.org/en/v1.0.0/)**
-   Teste de API:  **[Insomnia](https://insomnia.rest/)**

---

## Autor

<a href="https://fabianoleittes.me/">
 <img style="border-radius: 50%;" src="https://avatars3.githubusercontent.com/u/279344?v=4" width="100px;" alt=""/>
 <br />
 <sub><b>Fabiano Leite</b></sub></a>
 <br />

[![Twitter Badge](https://img.shields.io/badge/-@fabianoleittes-1ca0f1?style=flat-square&labelColor=1ca0f1&logo=twitter&logoColor=white&link=https://twitter.com/fabianoleittes)](https://twitter.com/fabianoleittes) [![Linkedin Badge](https://img.shields.io/badge/-Fabiano-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/fabianoleittes/)](https://www.linkedin.com/in/fabianoleittes/) 

---

## 📝 Licença

Este projeto esta sobe a licença [MIT](./LICENSE).

Feito com ❤️ por Fabiano Leite 👋🏽 [Entre em contato!](https://www.linkedin.com/in/fabianoleittes/)

---