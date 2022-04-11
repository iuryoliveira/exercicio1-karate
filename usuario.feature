Feature: Usuario

Scenario: Consultar pet por id
    # Given path "pet", 1
    * def identificador = 1
    Given url "https://petstore.swagger.io/v2/pet/" + identificador
    When method get
    Then status 200