* Settings *

Documentation         Ações da funcionalidade de fechamento de pedido

* Keywords *
Go Checkout

  Click       text=Fechar pedido

  ${element}        Set Variable        css=.page-header

  Wait For Elements State       ${element}        visible       10
  Get Text                      ${element}        contains      Finalize o seu pedido

Fill Data Costumer
  [Arguments]       ${costumer}

  Fill Text       css=input[placeholder="Nome"]             ${costumer["name"]}
  Fill Text       css=input[placeholder="E-mail"]           ${costumer["email"]}
  Fill Text       css=input[placeholder^="Confirmação"]     ${costumer["email"]}
  Fill Text       css=input[placeholder="Endereço"]         ${costumer["address"]}
  Fill Text       css=input[placeholder="Número"]           ${costumer["number"]}

Select Payment Option
  [Arguments]         ${payment}

  IF            "${payment}" == "Dinheiro"

    Click         xpath=(//mt-radio//label)[1]//div

  ELSE IF       "${payment}" == "Cartão de Débito"

    Click         xpath=(//mt-radio//label)[2]//div

  ELSE IF       "${payment}" == "Cartão de Refeição"

    Click         xpath=(//mt-radio//label)[3]//div

  ELSE

    Fail         Incorrect payment type

  END

Pay Order
  Click         text=Concluir Pedido


Order Should Be Completed
  Wait For Elements State       css=p >> text=Seu pedido foi recebido pelo restaurante.        visible        10