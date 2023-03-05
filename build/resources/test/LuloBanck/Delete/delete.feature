@parallel
Feature: Obtener usuarios de una API

  Background:



    Given url 'https://dummyapi.io/data/v1'
    And header app-id = '64013f90bb1e4f20bc431c5c'
    And header User-Agent = 'PostmanRuntime/7.26.8'
    And header Accept = '*/*'
    And header Postman-Token = '4e6b169e-9703-468d-8add-b072360e6cb2'
    And header Host = 'dummyapi.io'
    And header Accept-Encoding = 'gzip, deflate, br'

    Scenario: se consume la api de eliminar usuario con usuario aleatorio
      * call read("../Get/get.feature@parallel")
      Given path '/user/' + idRando
      When method Delete
      Then status 200

