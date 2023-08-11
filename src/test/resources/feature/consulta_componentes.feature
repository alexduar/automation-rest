# language: pt
# encoding: UTF-8

  Funcionalidade: consulta de componentes da home

    Cenario:Realiza a consulta filtrando a funcionalidade ofertas de produtos e não aparece das demais funcionalidades
      Dado que seja resgatado o token do cliente "conta_cartao"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
      Quando acessar a url componentes informando os parametros "funcionalidade: OFERTA_OUTROS_PRODUTOS_HOME_CONTA_PF"
      Entao devera retornar os status "200"
      E devera retornar os "NOME_MODULO_COMPONENTE" os componentes "home-list-widget"
      E nao devera retornar os "NOME_MODULO_COMPONENTE" os componentes "home-list-card, home-widget-comeceporaqui"

    Cenario:Realiza a consulta filtrando a funcionalidade acesso rapido e não aparece das demais funcionalidades
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
      Quando acessar a url componentes informando os parametros "funcionalidade: COMECE_POR_AQUI_HOME_CONTA_PF"
      Entao devera retornar os status "200"
      E devera retornar os "NOME_MODULO_COMPONENTE" os componentes "home-widget-comeceporaqui"
      E nao devera retornar os "NOME_MODULO_COMPONENTE" os componentes "home-list-card, home-list-widget"

    Cenario:Realiza a consulta filtrando a funcionalidade home cards e não aparece das demais funcionalidades
      Dado que seja resgatado o token do cliente "conta_cartao"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
      Quando acessar a url componentes informando os parametros "funcionalidade: CARROUSEL_CARDS_HOME_CONTA_PF"
      Entao devera retornar os status "200"
      E devera retornar os "NOME_MODULO_COMPONENTE" os componentes "home-list-card"
      E nao devera retornar os "NOME_MODULO_COMPONENTE" os componentes "home-list-widget, home-widget-comeceporaqui"

    Cenario:Realiza a consulta completa de todos os componentes da funcionalidade de comece por aqui
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
      Quando acessar a url componentes informando os parametros "funcionalidade: COMECE_POR_AQUI_HOME_CONTA_PF"
      Entao devera retornar os status "200"
      E devera retornar os "NOME_COMPONENTE" os componentes "home-widget-comeceporaqui-atalhos-pix, home-widget-comeceporaqui-atalhos-open-finance, home-widget-comeceporaqui-atalhos-pagar, home-widget-comeceporaqui-atalhos-trazer-salario, home-widget-comeceporaqui-atalhos-debito"
      E nao devera retornar os "NOME_COMPONENTE" os componentes "home-card-minha-conta, home-card-meucartao, home-card-financiamento, home-card-investimentos, home-widget-credito, home-widget-investimento"

    Cenario:Realiza a consulta completa de todos os componentes da funcionalidade de oferta de produtos
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
      Quando acessar a url componentes informando os parametros "funcionalidade: OFERTA_OUTROS_PRODUTOS_HOME_CONTA_PF"
      Entao devera retornar os status "200"
      E devera retornar os "NOME_COMPONENTE" os componentes "home-widget-credito, home-widget-investimento"
      E nao devera retornar os "NOME_COMPONENTE" os componentes "home-widget-comeceporaqui-atalhos-pix, home-widget-comeceporaqui-atalhos-guardar-dinheiro, home-widget-comeceporaqui-atalhos-pagar, home-widget-comeceporaqui-atalhos-trazer-salario, home-widget-comeceporaqui-atalhos-debito, home-card-minha-conta, home-card-meucartao, home-card-financiamento, home-card-investimentos"

    Cenario:Realiza a consulta completa de todos os componentes das funcionalidades
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
      Quando acessar a url componentes informando os parametros "modulo: HOME_CONTA_PF"
      Entao devera retornar os status "200"
      E devera retornar os "NOME_COMPONENTE" os componentes "home-card-minha-conta, home-card-meucartao, home-card-financiamento, home-card-investimentos, home-widget-credito, home-widget-investimento, home-widget-comeceporaqui-atalhos-pix, home-widget-comeceporaqui-atalhos-open-finance, home-widget-comeceporaqui-atalhos-pagar, home-widget-comeceporaqui-atalhos-trazer-salario, home-widget-comeceporaqui-atalhos-debito"

    Cenario: Realiza a consulta filtrando permissões apenas para cc e busca componente home-card-cartao
      Dado que seja resgatado o token do cliente "conta_cartao"
      E a request informe os headers contendo o token com as permissoes "CC" e a versao ""
      Quando acessar a url componentes informando os parametros "componentes: home-card-meucartao"
      Entao devera retornar os status "200"
      E devera retornar os "NOME_COMPONENTE" os componentes "home-card-meucartao"
      E nao devera retornar os "NOME_COMPONENTE" os componentes "home-card-financiamento, home-card-investimentos"

  Cenario: Realiza a consulta filtrando permissões apenas para cd#fiv e busca componente home-card-meucartao
    Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
    E a request informe os headers contendo o token com as permissoes "CD#FIV" e a versao ""
    Quando acessar a url componentes informando os parametros "componente: home-card-meucartao"
    Entao devera retornar os status "404"

  Cenario: Realiza a consulta filtrando permissões apenas para CC#FIV e busca componente home-card-minha-conta devera retornar erro
    Dado que seja resgatado o token do cliente "conta_cartao"
    E a request informe os headers contendo o token com as permissoes "CC#FIV" e a versao ""
    Quando acessar a url componentes informando os parametros "componente: home-card-minha-conta"
    Entao devera retornar os status "404"

  Cenario: Realiza a consulta filtrando permissões apenas para cc#cd e busca modulo fiv devera retornar erro
    Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
    E a request informe os headers contendo o token com as permissoes "CC#CD" e a versao ""
    Quando acessar a url componentes informando os parametros "componente: home-card-financiamento"
    Entao devera retornar os status "404"

  Cenario: Realiza a consulta filtrando permissões apenas para cc e busca modulo cd#fiv devera retornar erro
      Dado que seja resgatado o token do cliente "conta_cartao"
      E a request informe os headers contendo o token com as permissoes "CC" e a versao ""
      Quando acessar a url componentes informando os parametros "componente: home-card-financiamento, componente: minha-conta"
      Entao devera retornar os status "404"

  Cenario: Realiza a consulta filtrando permissões apenas para cd e busca modulo cc#fiv devera retornar erro
    Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
    E a request informe os headers contendo o token com as permissoes "CD" e a versao ""
    Quando acessar a url componentes informando os parametros "componente: home-card-meucartao"
    Entao devera retornar os status "404"

    Cenario: Realiza a consulta filtrando a busca componente com nome incorreto devera retornar erro
    Dado que seja resgatado o token do cliente "conta_cartao"
    E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
    Quando acessar a url componentes informando os parametros "componente: home-card-meucartaos"
    Entao devera retornar os status "404"

    Cenario: Realiza a consulta sem permissões devera retornar erro
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      E a request informe os headers contendo o token com as permissoes "" e a versao ""
      Quando acessar a url componentes informando os parametros ""
      Entao devera retornar os status "400"

    Cenario: Realiza a consulta com permissões recebendo html retorna erro
      Dado que seja resgatado o token do cliente "conta_cartao"
      E a request informe os headers contendo o token com as permissoes "<html></html>" e a versao ""
      Quando acessar a url componentes informando os parametros ""
      Entao devera retornar os status "400"

    Cenario: Realiza a consulta com permissões recebendo caracteres especiais retorna erro
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      E a request informe os headers contendo o token com as permissoes "@@#$$" e a versao ""
      Quando acessar a url componentes informando os parametros ""
      Entao devera retornar os status "400"

    Cenario: Realiza a consulta com valor de caracteres de permissões recebendo apenas uma letra retorna erro
      Dado que seja resgatado o token do cliente "conta_cartao"
      E a request informe os headers contendo o token com as permissoes "C" e a versao ""
      Quando acessar a url componentes informando os parametros ""
      Entao devera retornar os status "400"

    Cenario: Realiza a consulta com permissões inexistentes retorna erro
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      E a request informe os headers contendo o token com as permissoes "XX#TT" e a versao ""
      Quando acessar a url componentes informando os parametros ""
      Entao devera retornar os status "200"

    Cenario: Realiza a consulta e garante o retorno de todas configurações de acesso rapido
      Dado que seja resgatado o token do cliente "conta_cartao"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
      Quando acessar a url componentes informando os parametros ""
      Entao devera retornar os status "200"
      E devera retornar os "ID_CONFIGURACOES" os componentes "comeceporaqui-atalho-pagar, comeceporaqui-atalho-trazer-salario, comeceporaqui-atalho-debito, comeceporaqui-atalho-open-finance, comeceporaqui-atalho-pix"

    Cenario: Realiza a consulta e garante o retorno de todos os titulos dos componentes do carrosel de cards
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
      Quando acessar a url componentes informando os parametros "funcionalidade: CARROUSEL_CARDS_HOME_CONTA_PF"
      Entao devera retornar os status "200"
      E devera retornar os "TITULO_COMPONENTE" os componentes "Minha conta, Guardar dinheiro, Meus cartões, Meus veículos"

    Cenario: Realiza a consulta e garante o retorno de todos os titulos de todos componentes principais da home
      Dado que seja resgatado o token do cliente "conta_cartao"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
      Quando acessar a url componentes informando os parametros ""
      Entao devera retornar os status "200"
      E devera retornar os "TITULO_COMPONENTE" os componentes "Minha conta, Guardar dinheiro, Meus cartões, Meus veículos, Pagar contas, Trazer meu salário, Débito automático, Open Finance, Pix"

    @testeVersionamento
    Cenario: Retornar apenas componentes cuja versao seja menor ou igual a versao mais informada do APP
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      Quando a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao "1.49.0"
      E acessar a url componentes informando os parametros ""
      Entao devera retornar os status "200"
      E devera retornar os "NOME_COMPONENTE" os componentes "home-widget-portabilidade"

    @testeVersionamento
    Cenario: Não retornará componentes cuja desativação seja maior ou igual a versao informada
      Dado que seja resgatado o token do cliente "conta_cartao"
      Quando a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao "1.48.0"
      E acessar a url componentes informando os parametros ""
      Entao devera retornar os status "200"
      E nao devera retornar os "NOME_COMPONENTE" os componentes "home-widget-portabilidade"

    @testeVersionamento
    Cenario: Retornar erro quando a versao informado nao der match com o regex na primeira posição \d{1,3}\.\d{1,3}\.\d{1,3}
      Dado que seja resgatado o token do cliente "conta_cartao"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao "1234.0.0"
      Quando  acessar a url componentes informando os parametros ""
      Entao devera retornar os status "400"

    @testeVersionamento
    Cenario: Retornar erro quando a versao informado nao der match com o regex na segunda posição \d{1,3}\.\d{1,3}\.\d{1,3}
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao "1.1234.0"
      Quando acessar a url componentes informando os parametros ""
      Entao devera retornar os status "400"

    @testeVersionamento
    Cenario: Retornar erro quando a versao informado nao der match com o regex na terceira posição \d{1,3}\.\d{1,3}\.\d{1,3}
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      E a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao "1.00.1234"
      Quando acessar a url componentes informando os parametros ""
      Entao devera retornar os status "400"

    @testeVersionamento
    Cenario: Realiza a consulta com sucesso sem informar a versao
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      Quando a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao ""
      E acessar a url componentes informando os parametros ""
      Entao devera retornar os status "200"

    @testeVersionamento
    Cenario: Realizar consulta com valores html retorna erro
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      Quando a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao "<html></html>"
      E acessar a url componentes informando os parametros ""
      Entao devera retornar os status "400"

    @testeVersionamento
    Cenario: Realizar consulta com caracteres especiais retorna erro
      Dado que seja resgatado o token do cliente "conta_cartao_financiamento"
      Quando a request informe os headers contendo o token com as permissoes "CC#CD#FIV" e a versao "$$.$$.$$"
      E acessar a url componentes informando os parametros ""
      Entao devera retornar os status "400"