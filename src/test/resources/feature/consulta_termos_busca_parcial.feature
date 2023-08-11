  # language: pt
  # encoding: UTF-8

  Funcionalidade: consulta termos pela busca parcial

  Cenario: Realiza a busca do termo "pix" e é retornado os titulos e rotas relacionados ao termo informando
    Dado que seja resgatado o token do cliente "conta_cartao" do busca parcial
    E a request da busca parcial informe os headers contendo o termo "Pix" a pagina "0" o tamanho "4" e o token
    Quando acessar a url de busca parcial
    Entao devera retornar os status "200" em busca parcial
    E devera retornar uma lista os titulos: "Pix, Transferir, Pagar"
    E devera retornar uma lista com as rotas respectivamente: "payment_pix, qrcode, transactions"

  Cenario: Realiza a busca com termo que não faz parte dos termos de serviços da home "casa" e retorno "200" com lista vazia
    Dado que seja resgatado o token do cliente "conta_cartao" do busca parcial
    E a request da busca parcial informe os headers contendo o termo "casa" a pagina "0" o tamanho "4" e o token
    Quando acessar a url de busca parcial
    Entao devera retornar os status "200" em busca parcial
    E devera retornar uma lista os titulos: ""
    E devera retornar uma lista com as rotas respectivamente: ""

  Cenario: Realiza a busca com termo de apenas dois caracteres "ca" e retorno de status "400"
    Dado que seja resgatado o token do cliente "conta_financiamento" do busca parcial
    E a request da busca parcial informe os headers contendo o termo "ca" a pagina "0" o tamanho "4" e o token
    Quando acessar a url de busca parcial
    Entao devera retornar os status "400" em busca parcial

  Cenario: Realiza a busca com termo de apenas um caracter "c" e retorno de status "400"
    Dado que seja resgatado o token do cliente "conta_cartao" do busca parcial
    E a request da busca parcial informe os headers contendo o termo "c" a pagina "0" o tamanho "4" e o token
    Quando acessar a url de busca parcial
    Entao devera retornar os status "400" em busca parcial

  Cenario: Realiza a busca com termo vazio e retorno de status "400"
    Dado que seja resgatado o token do cliente "conta_cartao" do busca parcial
    E a request da busca parcial informe os headers contendo o termo "" a pagina "0" o tamanho "4" e o token
    Quando acessar a url de busca parcial
    Entao devera retornar os status "400" em busca parcial

  Cenario: Realiza a busca com tags html e retorna status "400"
    Dado que seja resgatado o token do cliente "conta_financiamento" do busca parcial
    E a request da busca parcial informe os headers contendo o termo "<h2>ola<h2>" a pagina "0" o tamanho "4" e o token
    Quando acessar a url de busca parcial
    Entao devera retornar os status "400" em busca parcial

  Cenario: Realiza a busca com caracteres especiais "Transferência" e retorna o status "200"
    Dado que seja resgatado o token do cliente "conta_cartao" do busca parcial
    E a request da busca parcial informe os headers contendo o termo "Transferência" a pagina "0" o tamanho "4" e o token
    Quando acessar a url de busca parcial
    Entao devera retornar os status "200" em busca parcial
    E devera retornar uma lista os titulos: "Pix, Transferir, Pagar"