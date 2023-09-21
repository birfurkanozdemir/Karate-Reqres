Feature: File Transactions

  Background:
    #* def urlBase = 'https://reqres.in/'
    * def usersPath = '/api/users'

  Scenario: Create User with Reference to Json File

    Given def referenceData = read('classpath:json/MorpheusOldInfo.json')
    * print referenceData
    And url baseUrl + usersPath
    And request referenceData
    When method POST
    Then status 201
    * print response


  Scenario: Transactions Json Files

    Given def oldReference = read('classpath:json/NeoInfoDetails.json')
    And def newReference = read('classpath:json/NeoUpdateInfoDetails.json')
    * print oldReference
    When set oldReference.name = 'The One'
    And remove oldReference.nickName
    And remove oldReference.hackerName
    And remove oldReference.birthDate
    And remove oldReference.birthPlace
    And remove oldReference.profession
    * print oldReference
    Then match oldReference.name == newReference.name
    * print newReference