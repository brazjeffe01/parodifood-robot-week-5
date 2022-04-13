* Settings *
Library   Browser   strict=false

* Test Cases *
Deve buscar um único restaurante

  New Browser   chromium    False
  New Page      http://parodifood.qaninja.academy/
  # Checkpoint

  Get Text      css=span    contains    Nunca foi tão engraçado pedir comida
  Click         text=Estou com fome!
  Get Text      css=h1 strong     contains    Ta na hora de matar a fome!
  # Sleep         10

  Click         css=.search-link
  Fill Text     css=input[formcontrolname="searchControl"]      Debuger

  Wait For Elements State     css=div[class="place-info-box"][style="opacity: 1;"]     visible     10
  Get Text      css=.place-info-box     contains    DEBUGER KING

  Get Element Count     css=.place-info-box     equal     1

  Take Screenshot

Deve buscar por categoria

  New Browser   chromium    False
  New Page      http://parodifood.qaninja.academy/
  # Checkpoint

  Get Text      css=span    contains    Nunca foi tão engraçado pedir comida
  Click         text=Estou com fome!

  Get Text      css=h1 strong     contains    Ta na hora de matar a fome!
  Click         css=.search-link

  Fill Text     css=input[formcontrolname="searchControl"]      Cafe

  Wait For Elements State     css=div[class="place-info-box"][style="opacity: 1;"]     visible     10
  Get Text      css=.place-info-box     contains    STARBUGS COFFEE

  Take Screenshot

Deve buscar todos os restaurantes

  New Browser   chromium    False
  New Page      http://parodifood.qaninja.academy/
  # Checkpoint

  Get Text      css=span    contains    Nunca foi tão engraçado pedir comida
  Click         text=Estou com fome!
  Get Text      css=h1 strong     contains    Ta na hora de matar a fome!
  # Sleep         10

  Click         css=.search-link
  Fill Text     css=input[formcontrolname="searchControl"]      a

  Wait For Elements State     css=div[class="place-info-box"][style="opacity: 1;"]     visible     10

  Get Element Count     css=.place-info-box     equal     5

  Take Screenshot