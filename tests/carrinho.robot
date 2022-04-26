* Settings *

Resource      ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown     Take Screenshot

* Test Cases *
Deve adicionar um item ao carrinho

  &{restaurant}     Create Dictionary     name=STARBUGS COFFEE      desc=Nada melhor que um café pra te ajudar a resolver um bug.

  Go To restaurants

  Choose Restaurant     ${restaurant}

  Add To Cart     Starbugs 500 error

  Should Add To Cart      Starbugs 500 error

  Total Cart Should Be  15,60

* Keywords *
Choose Restaurant
  [Arguments]     ${restaurant}

  Click     text=${restaurant["name"]}      force=true

  Wait For Elements State       css=#detail       visible     10
  Get Text      css=#detail     contains      ${restaurant["desc"]}

Add To Cart
  [Arguments]     ${name}

  Click     xpath=//span[text()="${name}"]/..//a[@class="add-to-cart"]

Should Add To Cart
  [Arguments]     ${name}

  Wait For Elements State     css=#cart tr >> text=${name}     visible     5

Total Cart Should Be
  [Arguments]     ${total}

  Get Text        xpath=//th[contains(text(),"Total")]/..//td       contains      ${total}