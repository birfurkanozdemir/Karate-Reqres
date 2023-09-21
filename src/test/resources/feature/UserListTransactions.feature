Feature: User List Transactions

  Background:
    #* def urlBase = 'https://reqres.in/'
    * def usersPath = '/api/users'
    * def unknownPath = '/api/unknown'

  Scenario: List Users

    Given url baseUrl + usersPath + '?page=2'
    When method GET
    Then status 200

    * print response
    But match $.page == 2
    And match $.data[*].id contains 7, 8, 9, 10, 11, 12
    And match $.data[*].first_name contains "Michael", "Lindsay", "Tobias", "Byron", "George", "Rachel"
    And match $.data[*].last_name contains "Lawson", "Ferguson", "Funke", "Fields", "Edwards", "Howell"


  Scenario: Single User Match Service Response Data

    Given url baseUrl + usersPath + '/2'
    When method GET
    Then status 200

    * print response
    But assert response.data.id == 2
    And match $.data.email == "janet.weaver@reqres.in"
    And match $.data.first_name == "Janet"
    And match $.data.last_name == "Weaver"
    And assert response.data.avatar != null


  Scenario: Single User's Response Data Transactions

    Given url baseUrl + usersPath + '/3'
    When method GET
    Then status 200

    * print response
    * def firstName = response.data.first_name
    * def gap = " "
    * def lastName = response.data.last_name
    * assert firstName + gap + lastName == "Emma Wong"


  Scenario: Single User Not Found

    Given url baseUrl + usersPath + '/23'
    When method GET
    Then status 404
    * print response


  Scenario: List <Resource>

    Given url baseUrl + unknownPath
    When method GET
    Then status 200
    * print response


  Scenario: Single <Resource>

    Given url baseUrl + unknownPath + '/2'
    When method GET
    Then status 200
    * print response


  Scenario: Single <Resource> Not Found

    Given url baseUrl + unknownPath + '/23'
    When method GET
    Then status 404
    * print response


  Scenario: Delayed Response

    Given url baseUrl + usersPath + '?delay=3'
    When method GET
    Then status 200
    * print response