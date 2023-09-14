Feature: File Transactions

  Background:
    * def urlBase = 'https://reqres.in/'
    * def usersPath = '/api/users'

  Scenario: Create User with Reference to Json File

    Given def referenceData = read('classpath:json/MorpheusOldInfo.json')
    * print referenceData
    And url urlBase + usersPath
    And request referenceData
    When method POST
    Then status 201
    * print response