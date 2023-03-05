@parallel
Feature: se realiza una peticion post

  Background:
    Given url 'https://dummyapi.io/data/v1/user/'
    And header User-Agent = 'PostmanRuntime/7.26.8'
    And header Accept = '*/*'
    And header Postman-Token = '7bd0c0d7-dcc7-47b2-a1b0-7133a3d05f28'
    And header Host = 'dummyapi.io'
    And header Accept-Encoding = 'gzip, deflate, br'
    And header Connection =  'keep-alive'
    And header app-id = '64013f90bb1e4f20bc431c5c'

  Scenario: dado que se consume la peticion post con un usuario random
    Given path 'create'
    * def names = ['John', 'Jane', 'Mark', 'Lisa', 'David', 'Karen']
    * def randomIndex = Math.floor(Math.random() * names.length)
    * def randomName = names[randomIndex]

    * def lastNames = ['lopera', 'Gomez', 'Rodriguez', 'Restrepo', 'Zapata', 'Orozco']
    * def randomIndexLast = Math.floor(Math.random() * lastNames.length)
    * def randomLastName = lastNames[randomIndexLast]

    * def randomEmail = 'andres_' + java.util.UUID.randomUUID().toString() + '@yopmail.com'
    And request
    """
    {
    "title": "mr",
    "firstName":#(randomName),
    "lastName": #(randomLastName),
    "email": #(randomEmail),
    "picture": "https://randomuser.me/api/portraits/med/women/56.jpg"
}
    """

    When method Post
    Then status 200

    And match response.firstName == randomName