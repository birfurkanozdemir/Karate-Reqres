Feature: User Update Transactions

  Background:
    * def urlBase = 'https://reqres.in/'
    * def usersPath = '/api/users'

  Scenario: Create User

    Given url urlBase + usersPath
    And request { "name": "morpheus", "job": "leader" }
    When method POST
    Then status 201
    * print response


  Scenario: Update User with Put

    Given url urlBase + usersPath + '/2'
    And request { "name": "morpheus", "job": "zion resident" }
    When method PUT
    Then status 200
    * print response


  Scenario: Update User with Patch

    Given url urlBase + usersPath + '/2'
    And request { "name": "morpheus", "job": "zion resident" }
    When method PATCH
    Then status 200
    * print response


  Scenario: Delete User

    Given url urlBase + usersPath + '/2'
    When method DELETE
    Then status 204