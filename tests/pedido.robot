* Settings *

Resource      ${EXECDIR}/resources/base.robot

Test Setup        Start Session
Test Teardown     Take Screenshot

* Test Cases *
Deve realizar um novo pedido

  ${order_json}       get JSON      order.json

  Go To restaurants
  Choose Restaurant       ${order_json}

  FOR     ${product}      IN        @{order_json["products"]}
    Add To Cart                     ${product["name"]}
    Should Add To Cart              ${product["name"]}
  END

  Go Checkout

* Keywords *
Go Checkout

  Click       text=Fechar pedido

  ${element}        Set Variable        css=.page.header

  Wait For Elements State       ${element}        visible       10
  Get Text                      ${element}        contains      Finalize o seu pedido

Fill Data Costumer
  [Arguments]       ${costumer}

  Fill Text       css=input[placeholder="Nome"]             ${customer["name"]}
  Fill Text       css=input[placeholder="E-mail"]           ${costumer["email"]}
  Fill Text       css=input[placeholder^="Confirmação"]     ${costumer["email"]}