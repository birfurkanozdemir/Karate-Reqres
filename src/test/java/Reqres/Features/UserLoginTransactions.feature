Feature: User Login Transactions

  Background:
    * def urlBase = 'https://reqres.in/'
    * def loginPath = '/api/login'

  Scenario: Login Successful

    Given url urlBase + loginPath
    And request { "email": "eve.holt@reqres.in", "password": "cityslicka" }
    When method POST
    Then status 200
    * print response


  Scenario: Login Unsuccessful

    Given url urlBase + loginPath
    And request { "email": "peter@klaven" }
    When method POST
    Then status 400
    * print response