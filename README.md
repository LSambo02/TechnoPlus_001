# Technoplus CRUD

Esta é um sistema de registo, recuperação, 
actualização e remoção de dados com objecto de estudo clientes de uma empresa!



## FRONTEND
### Flutter
O projecto está dividido em 4 pacotes:

### Controllers
Estão definidas as acções principais do sistema!
### Managers
Estão definidas as formas de gestão de estado dos dados.
### Models
Onde os objectios necessários estão modelados.
### Screens
Representam as telas principais da aplicação.
### Widgets
De modo a tornar o projecto mais fácil de mexer e possivelmente alterar, fazer manutenções, etc
é criado este pacote pra albergar os componentes que serão usados, permitindo ainda customizá-los
melhor e tornar o projecto mais limpo.

## BACKEND
### PHPxMySql
Este projecto segue o modelo básico de uma REST API, permitindo que por chamadas [http] sejam feitas
alterações na Base de dados.
Para que isso fosse possível, recorreu-se ao padrão PDO para manipulação dos dados.

### Config
Configuração da base de dados
### Models
Modelação dos objectos que representam as entidades por manipular
#### Actions
As funções a desempenhar


## 


TODO
- [x] Validação dos campos
- [x] Criar
- [x] Apagar
- [x] Ler
- [] Actualizar
- [] Logs
- [] Transações
- [] Habilitar CORS

#### CORS 
A comunicação com a api está condicionada por políticas de segurança do Flutter Web para 
comunicação com servers.
Headers, não se verificaram eficazes