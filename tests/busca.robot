* Settings *
Library   Browser   strict=false

* Test Cases *
Buscar um restaurante

  New Browser   chromium    False
  New Page      http://parodifood.qaninja.academy/
  # Checkpoint

  Get Text      span    contains    Nunca foi tão engraçado pedir comida
  Click         text=Estou com fome!
  Get Text      h1 strong     contains    Ta na hora de matar a fome!
  # Sleep         10

  Click         css=.search-link
  Fill Text     css=input[formcontrolname="searchControl"]      Debuger

  Wait For Elements State     css=.place-info-box     visible     10
  Get Text      css=.place-info-box     contains    DEBUGER KING

  Sleep         1
  Take Screenshot