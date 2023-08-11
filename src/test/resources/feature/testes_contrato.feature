# language: pt
# encoding: UTF-8

Funcionalidade: Valida a estrutura dos contrato das apis

  Cenario: Realiza a consulta corretamente com todos os componentes e garante a estrutura correta do contrato da api
  Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
  E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
  Quando acessar a url componentes informando os parametros ""
  Entao devera retornar os status "200"
  E devera validar que o contrato da api esta correto com "componentes-api"

  Cenario: Realiza a consulta sem possuir nenhuma permissão e garante a estrutura do contrato da api com erro 400 esteja correta
    Dado que seja resgatado o token do cliente "conta_cartao"
    E a request informe os headers contendo o token com as permissoes "" e a versao ""
    Quando acessar a url componentes informando os parametros ""
    Entao devera retornar os status "400"
    E devera validar que o contrato da api esta correto com "componentes-api-erro-400"

  Cenario: Realiza a consulta corretamente com apenas as permissoes do cliente do tipo conta_cartao de componentes e garante a estrutura correta do contrato da api
    Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
    E a request informe os headers contendo o token com as permissoes "CC#CD" e a versao ""
    Quando acessar a url componentes informando os parametros ""
    Entao devera retornar os status "200"
    E devera validar que o contrato da api esta correto com "componentes-api"

  Cenario: Realiza a alteração dos cards apos isso valida se a estrutura da api de componentes foi mantida
    Dado que seja resgatado o token do cliente do app "conta_cartao"
    E seja definido os headers para api organizacao de cards com a versao ""
    Quando realizar a postagem com o corpo da requisição os valores na seguinte ordem:
    """
      {
      "componentePai": "home-list-card",
      "componentes": [
          {
              "nome": "home-card-meucartao",
              "visivel": true
          },
          {
              "nome": "home-card-minha-conta",
              "visivel": true
          }
      ]
      }
      """
    Entao devera retornar os status "200" em organização
    E ao consultar a api componentes no home-list-card do cliente com as permissoes "CC#CD" e a versao "", devera vir na mesma ordem
    E retornara a visibilidade do componentes de acordo com o que foi enviado
    E devera validar que o contrato da api reorganizar esta correto com "componentes-api"