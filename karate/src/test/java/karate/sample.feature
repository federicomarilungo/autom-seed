Feature: sample

  Background:
    * def schema =
    """
   {
  "id": #number,
  "category": {
    "id": #number,
    "name": #string
  },
  "name": #string,
  "photoUrls": [
    #string
  ],
  "tags": [
    {
      "id": #number,
      "name": #string
    }
  ],
  "status": #string
  }
    """

  Scenario: first hello world
    Given url 'https://petstore.swagger.io/v2/pet/1'
    When method Get
    Then status 200
    And match response == schema
    * print response

  Scenario: first hello world
    Given url "http://www.google.com"
    When method Get
    * print response
    * print 'hello'

  Scenario: second scenario
    * print 'second'

