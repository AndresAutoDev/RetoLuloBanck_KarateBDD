@parallel
Feature: Obtener usuarios de una API

  Background:
   Given url 'https://dummyapi.io/data/v1/user'
    And header User-Agent = 'PostmanRuntime/7.26.8'
    And header Accept = '*/*'
    And header Postman-Token = 'eb674846-89dd-4bcc-aed0-f62e936eff3c'
    And header Host = 'dummyapi.io'
    And header Accept-Encoding = 'gzip, deflate, br'
    And header Connection =  'keep-alive'
    And header app-id = '64013f90bb1e4f20bc431c5c'


    Scenario: se consume el metodo get con un usuario random
      * def randomLimit = 5 + parseInt(Math.random() * ((50 - 5) + 1))
      Given param page = 1
      And param limit = randomLimit
      When method Get
      Then status 200

      And match $..id contains '#notnull'
      And match response.limit == randomLimit
      And match response.page == 1
      And def idRando = $..data[0].id

