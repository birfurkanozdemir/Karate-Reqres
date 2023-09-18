Feature: User Register Transactions

  Background:
    * def urlBase = 'https://reqres.in/'
    * def registerPath = '/api/register'

  Scenario: Register - Successful

    Given url urlBase + registerPath
    And request { "email": "eve.holt@reqres.in", "password": "pistol" }
    When method POST
    Then status 200
    * print response


  Scenario: Register - Unsuccessful

    Given url urlBase + registerPath
    And request { "email": "sydney@fife" }
    When method POST
    Then status 400
    * print response


  Scenario Outline: Multiple Parameters for Register Process

    Given url urlBase + registerPath
    And request { "email": "<emailInfo>", "password": "<passwordInfo>" }
    When method POST
    Then status 200

    Examples:
      | emailInfo          | passwordInfo |
      | eve.holt@reqres.in | pistol       |
      | demo@gmail.com     | demo123      |
      | sydney@fife        |              |