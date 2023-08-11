# language: pt
# encoding: UTF-8
Funcionalidade: Altera organizacao dos cards com a versao "" da home

  Cenario: Valida se cliente com todas permissões envia todos compontenes visiveis na seguinte ordem minha-conta, meucartao, financiamento e investimento e recebe na ordem correta
    Dado que seja resgatado o token do cliente do app "conta_cartao"
    E seja definido os headers para api organizacao de cards com a versao ""
    Quando realizar a postagem com o corpo da requisição os valores na seguinte ordem:
    """
    {
    "componentePai": "home-list-card",
    "componentes": [
        {
            "nome": "home-card-financiamento",
            "visivel": true
        },
        {
            "nome": "home-card-minha-conta",
            "visivel": true
        },
        {
            "nome": "home-card-investimentos",
            "visivel": true
        },
        {
            "nome": "home-card-meucartao",
            "visivel": true
        }
    ]
    }
    """
    E devera retornar os status "200" em organização
    Entao ao consultar a api componentes no home-list-card do cliente com as permissoes "CC#CD#FIV" e a versao "", devera vir na mesma ordem
    E retornara a visibilidade do componentes de acordo com o que foi enviado

  Cenario:  Valida se ao realizar uma consulta com todos componentes false, está retornando erro 400
    Dado que seja resgatado o token do cliente do app "conta_cartao_financiamento"
    E seja definido os headers para api organizacao de cards com a versao ""
    Quando realizar a postagem com o corpo da requisição os valores na seguinte ordem:
    """
    {
      "componentePai": "home-list-card",
      "componentes": [
          {
              "nome": "home-card-financiamento",
              "visivel": false
          },
          {
              "nome": "home-card-minha-conta",
              "visivel": false
          },
          {
              "nome": "home-card-investimentos",
              "visivel": false
          },
          {
              "nome": "home-card-meucartao",
              "visivel": false
          }
      ]
    }
    """
    Entao devera retornar os status "400" em organização

  Cenario: Valida se ao realizar tentar cadastrar a alteração do card minha-conta para false, retorna erro 400
    Dado que seja resgatado o token do cliente do app "conta_cartao_financiamento"
    E seja definido os headers para api organizacao de cards com a versao ""
    Quando realizar a postagem com o corpo da requisição os valores na seguinte ordem:
    """
      {
      "componentePai": "home-list-card",
      "componentes": [
          {
              "nome": "home-card-financiamento",
              "visivel": true
          },
          {
              "nome": "home-card-minha-conta",
              "visivel": false
          },
          {
              "nome": "home-card-investimentos",
              "visivel": true
          },
          {
              "nome": "home-card-meucartao",
              "visivel": true
          }
      ]
      }
    """
    Entao devera retornar os status "400" em organização

  Cenario: Validar se cliente com apenas as permissões CC#CD consegue alterar os cards com a versao "" de posição
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

  Cenario: Validar se cliente que possui apenas as permissões CC#CD quando envia meu-cartão como false, devera retornar erro 400
    Dado que seja resgatado o token do cliente do app "conta_cartao"
    E seja definido os headers para api organizacao de cards com a versao ""
    Quando realizar a postagem com o corpo da requisição os valores na seguinte ordem:
    """
      {
      "componentePai": "home-list-card",
      "componentes": [
          {
              "nome": "home-card-minha-conta",
              "visivel": true
          },
          {
              "nome": "home-card-meucartao",
              "visivel": false
          },
      ]
      }
      """
    E devera retornar os status "400" em organização

  Cenario: Validar se cliente que não possui permissão ao card-financiamento, quando enviar não enviar o card de financiamento no body, não irá alterar a visibilidade do mesmo
    Dado que seja resgatado o token do cliente do app "conta_cartao"
    E seja definido os headers para api organizacao de cards com a versao ""
    Quando realizar a postagem com o corpo da requisição os valores na seguinte ordem:
    """
    {
    "componentePai": "home-list-card",
    "componentes": [
        {
            "nome": "home-card-minha-conta",
            "visivel": true
        },
        {
            "nome": "home-card-investimentos",
            "visivel": true
        },
        {
            "nome": "home-card-meucartao",
            "visivel": true
        }
    ]
    }
    """
    E devera retornar os status "200" em organização
    Entao ao consultar a api componentes no home-list-card do cliente com as permissoes "CC#CD" e a versao "", devera vir na mesma ordem
    E retornara a visibilidade do componentes de acordo com o que foi enviado
    E o componente "home-card-financimento" sera o ultimo

  Cenario: Ao realizar uma alteração com apenas um elemento como true, sendo minha-conta deverá retornar erro 400
    Dado que seja resgatado o token do cliente do app "conta_cartao"
    E seja definido os headers para api organizacao de cards com a versao ""
    Quando realizar a postagem com o corpo da requisição os valores na seguinte ordem:
    """
    {
    "componentePai": "home-list-card",
    "componentes": [
        {
            "nome": "home-card-financiamento",
            "visivel": false
        },
        {
            "nome": "home-card-minha-conta",
            "visivel": true
        },
        {
            "nome": "home-card-investimentos",
            "visivel": false
        },
        {
            "nome": "home-card-meucartao",
            "visivel": false
        }
    ]
    }
    """
    Entao devera retornar os status "400" em organização

  Cenario: Ao realizar uma alteração com o cliente com conta e financiamento devera retornar 200 e alterar a ordem corretamente
    Dado que seja resgatado o token do cliente do app "conta_financiamento"
    E seja definido os headers para api organizacao de cards com a versao ""
    Quando realizar a postagem com o corpo da requisição os valores na seguinte ordem:
    """
    {
    "componentePai": "home-list-card",
    "componentes": [
        {
            "nome": "home-card-financiamento",
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
    E ao consultar a api componentes no home-list-card do cliente com as permissoes "CC#CD#FIV" e a versao "", devera vir na mesma ordem