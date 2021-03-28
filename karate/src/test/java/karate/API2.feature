Feature: API2

  Background:
    * def host = host
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
  @testPetPost
  Scenario: Test add Pet
    Given url host +'v2/pet'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
    {
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "perrito",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
  }
    """
    When method Post
    Then status 200
    And match response == schema
    * print response