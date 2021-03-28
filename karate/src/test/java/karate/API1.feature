Feature: API1

  Background:
    * def host = 'https://petstore.swagger.io/'
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

  Scenario: Get pet
    Given url host +'v2/pet/1'
    When method Get
    Then status 200
    And match response == schema
    * print response


