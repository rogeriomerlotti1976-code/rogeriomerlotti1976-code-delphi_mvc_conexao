# RMSYS

Projeto de estudo em **Delphi/VCL** com foco na prática de **arquitetura MVC**, **padrões de projeto** e **programação orientada a interfaces**, usando como caso de uso uma rotina de **conexão com banco de dados agnóstica de provedor** e o fluxo de **login/autenticação de usuário**.

Não é um sistema de gestão pronto para produção — o "RMSYS" (tela de boas-vindas, menu principal) é o pretexto para exercitar a arquitetura por trás dele.

## Objetivo

O foco deste repositório **não é a funcionalidade de negócio**, e sim a estrutura de código por trás dela. Os pontos praticados são:

- **MVC** aplicado a uma aplicação desktop Delphi (VCL), com separação clara entre `View`, `Controller` e `Model`.
- **Programação orientada a interfaces** — praticamente toda comunicação entre camadas acontece via `interface`, não por classes concretas, permitindo trocar a implementação sem alterar quem a consome.
- **Rotina de conexão agnóstica de banco** — a camada de Model foi desenhada para permitir trocar o **driver de acesso a dados** (FireDAC / dbExpress) e o **banco de dados** (SQLite / MySQL / Firebird) apenas alterando um arquivo de configuração, sem tocar no restante da aplicação.
- **Fluxo de login/autenticação** como estudo de caso ponta a ponta: da tela (`View.Login`) até a query no banco (`DAO`), passando por `Controller`, `Model` e tratamento de exceptions de negócio.

## Padrões de projeto utilizados

| Padrão | Onde aparece | Para quê |
|---|---|---|
| **Factory Method** | `Model.Conexao.Factory`, `Model.Query.Factory`, `Model.Usuario.Factory` | Centraliza a criação das implementações concretas (`TModelConexaoFireDac`, `TModelConexaoDBExpress`, etc.), devolvendo sempre uma `interface`. |
| **Singleton** | `TModelConexaoFireDac.New` / `TModelConexaoDBExpress.New` (`class var FInstance`) | Garante uma única instância de conexão ativa por tipo de driver durante a execução da aplicação. |
| **Strategy** | `Enum.Conexao` (`TTipoConexao`, `TTipoBanco`) + `iConexao` / `iQuery` | O `Controller.Conexao` escolhe em tempo de execução qual implementação de acesso a dados usar (FireDAC ou dbExpress) através da mesma interface. |
| **DAO (Data Access Object)** | `Model.Usuario.DAO` / `Model.Usuario.DAO.Interfaces` | Isola o SQL e o acesso a dados do usuário do restante da regra de negócio. |
| **Fluent Interface / Builder-like** | `Model.Entity.Usuario` (`iEntityUsuario`), `Model.Conexao.Configuracao` (`iConfiguracoesConexao`) | Setters encadeáveis (`.Login(...).Senha(...)`) que retornam a própria interface (`Result := Self`), deixando a construção de objetos mais legível. |
| **Facade** | `Sistema.Bootstrap` (`TSistemaBootstrap.Execute`) | Ponto único de entrada que orquestra a exibição do login e, se autenticado, a abertura da tela principal — o `.dpr` não conhece esse detalhe. |
| **Custom Exceptions** | `Sistema.Exceptions` | Exceptions de negócio nomeadas (`ELoginInvalido`, `EUsuarioInativo`, `ETentativasEsgotadas`, `EDadosLoginVazios`) em vez de `Exception` genérica, permitindo tratamento diferenciado por tipo na `View`. |

## Arquitetura / estrutura de pastas

```
RMSYS/
├── Controller/                  Camada de Controller (orquestra Model ↔ View)
│   ├── Controller.Conexao.pas
│   ├── Controller.Usuario.pas
│   └── Interfaces/
├── Model/                       Camada de Model (regra de negócio e acesso a dados)
│   ├── DAO/                     Acesso a dados (queries) por entidade
│   ├── Entity/                  Entidades com interface fluente
│   ├── Factory/                 Fábricas de conexão, query e usuário
│   ├── Interfaces/
│   ├── Model.Conexao.*.pas      Conexão (config, enums, constantes, FireDAC, dbExpress)
│   ├── Model.Query.*.pas        Execução de queries (FireDAC, dbExpress)
│   └── Model.Usuario.*.pas      Regra de negócio de usuário e autenticação
├── View/                        Camada de View (telas VCL)
│   ├── View.Login.pas/.dfm
│   └── View.Principal.pas/.dfm
├── Enum/                        Enumeradores compartilhados (tipo de conexão/banco)
├── Sistema/                     Bootstrap da aplicação e exceptions de negócio
└── RMSYS.dpr                    Ponto de entrada
```

### Fluxo de dependências (MVC)

```
View  --->  Controller  --->  Model (Interfaces)  --->  Model (Implementação: FireDAC/dbExpress)
```

A `View` nunca conhece uma classe concreta do `Model` — ela conversa apenas com `iControllerUsuario` / `iControllerAutenticacaoUsuario`. O `Controller`, por sua vez, também depende de interfaces do `Model` (`iUsuario`, `iModelAutenticacaoUsuario`), obtidas via `Factory`. Isso é o que permite trocar SQLite por MySQL, ou FireDAC por dbExpress, sem alterar `Controller` nem `View`.

## Conexão com banco de dados agnóstica de provedor

O ponto central do estudo. A aplicação decide **em tempo de execução**, a partir de um arquivo `Config.ini`, qual banco e qual driver usar — sem recompilar nem alterar código de negócio.

**Arquivo de configuração** (`Config.ini`, na pasta do executável):

```ini
[CONEXAO]
BANCO=SQLite
DATABASE=C:\Bancos\SQLite\RMSYSDB.db

#######################################
#BANCO=MySQL
#SERVIDOR=localhost
#PORTA=3306
#DATABASE=RMSYSDB
#USERNAME=RMSYSDB
#PASSWORD=123456
#######################################
```

Bancos suportados pelo enum `TTipoBanco`: **SQLite**, **MySQL** e **Firebird**.
Drivers suportados pelo enum `TTipoConexao`: **FireDAC** (implementado e em uso) e **dbExpress** (implementado como alternativa, plugável pela mesma factory).

Para trocar o driver de acesso, basta apontar o `Controller.Conexao` para `tcFireDAC` ou `tcDBExpress` — as duas implementações seguem a mesma interface `iConexao` e `iQuery`.

## Fluxo de login

1. `Sistema.Bootstrap.Execute` abre `View.Login` como modal.
2. A `View` chama `FControllerUsuario.Autenticacao.Autenticar(login, senha)`.
3. `Controller.Usuario` monta uma `iEntityUsuario` (via `Model.Usuario.Factory`) e delega para `Model.Usuario.Autenticacao`.
4. `Model.Usuario.Autenticacao` valida os dados, busca o usuário via `iModelDAOUsuario.BuscarPorLogin`, controla o número de tentativas e lança a exception de negócio correspondente quando necessário (`ELoginInvalido`, `ETentativasEsgotadas`, `EUsuarioInativo`, `EDadosLoginVazios`).
5. A `View` trata cada exception adequadamente e, em caso de sucesso, retorna `mrOk`, permitindo que o `Bootstrap` abra a `View.Principal`.

> Observação: o hash de senha ainda **não** está implementado (a senha atual trafega e é comparada em texto puro) — está sinalizado como próximo passo diretamente no código (`Model.Usuario.Autenticacao`), propositalmente deixado assim para ser um exercício futuro.

## Tecnologias

- **Delphi / VCL** (aplicação desktop Windows)
- **FireDAC** — acesso a dados principal (SQLite e MySQL)
- **dbExpress** — implementação alternativa de acesso a dados, seguindo a mesma interface
- **SQLite**, **MySQL**, **Firebird** — bancos suportados pela camada de configuração

## Como executar

1. Abra `RMSYS.dproj` no Delphi (RAD Studio).
2. Ajuste o `Config.ini` (gerado ao lado do executável) com os dados do banco desejado.
3. Compile e execute — a tela de login é exibida antes da tela principal.

## Status / próximos passos

Este é um projeto em evolução contínua, usado para praticar arquitetura. Alguns pontos deixados intencionalmente como próximo passo:

- [ ] Hash de senha na autenticação (atualmente comparação em texto puro)
- [ ] Cobertura de testes unitários das camadas de `Model`/`Controller` (a orientação a interfaces já deixa o projeto preparado para mocks)
- [ ] Expandir o CRUD de usuário (`iModelUsuario` já prevê `Inserir`/`Atualizar`/`Excluir`, ainda não implementados)
- [ ] Completar a implementação via dbExpress como alternativa real ao FireDAC

## Licença

Projeto de estudo, sem licença de uso comercial definida.
