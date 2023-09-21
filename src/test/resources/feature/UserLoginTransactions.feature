Feature: User Login Transactions

  Background:
    #* def urlBase = 'https://reqres.in/'
    * def loginPath = '/api/login'

  Scenario: Login Successful

    Given url baseUrl + loginPath
    And request { "email": "eve.holt@reqres.in", "password": "cityslicka" }
    When method POST
    Then status 200
    * print response


  Scenario: Login Unsuccessful

    Given url baseUrl + loginPath
    And request { "email": "peter@klaven" }
    When method POST
    Then status 400
    * print response


  Scenario Outline: Multiple Parameters for Login Process

    Given url baseUrl + loginPath
    And request { "email": "<emailInfo>", "password": "<passwordInfo>" }
    When method POST
    Then status <responseStatus>
    * print response

    Examples:
      | emailInfo          | passwordInfo | responseStatus |
      | eve.holt@reqres.in | cityslicka   | 200            |
      | demo@gmail.com     | demo123      | 400            |
      | peter@klaven       |              | 400            |