Feature: Users Transactions

  Background:
    * def urlBase = 'https://reqres.in/'
    * def usersPath = '/api/users'
    * def unknownPath = '/api/unknown'

  Scenario: List Users

    Given url urlBase + usersPath + '?page=2'
    When method GET
    Then status 200
    * print response


  Scenario: Single User

    Given url urlBase + usersPath + '/2'
    When method GET
    Then status 200
    * print response


  Scenario: Single User Not Found

    Given url urlBase + usersPath + '/23'
    When method GET
    Then status 404
    * print response


  Scenario: List <Resource>

    Given url urlBase + unknownPath
    When method GET
    Then status 200
    * print response


  Scenario: Single <Resource>

    Given url urlBase + unknownPath + '/2'
    When method GET
    Then status 200
    * print response


  Scenario: Single <Resource> Not Found

    Given url urlBase + unknownPath + '/23'
    When method GET
    Then status 404
    * print response


  Scenario: Delayed Response

    Given url urlBase + usersPath + '?delay=3'
    When method GET
    Then status 200
    * print response