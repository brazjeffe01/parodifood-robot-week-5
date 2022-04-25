* Settings *

Resource      ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown     Take Screenshot

* Test Cases *
Deve adicionar um item ao carrinho

  &{restaurant}     Create Dictionary     name=STARBUGS COFFEE      desc=Nada melhor que um café pra te ajudar a resolver um bug.

  Go To restaurants

  Choose Restaurant     ${restaurant}

  Sleep   10

* Keywords *
Choose Restaurant
  [Arguments]     ${restaurant}

  Click     text=${restaurant["name"]}      force=true

  Wait For Elements State       css=#detail       visible     10
  Get Text      css=#detail     contains      ${restaurant["desc"]}