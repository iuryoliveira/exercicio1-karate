Feature: Gestão de pets
    Como um gestor da pest store
    Desejo gerenciar os pets
    Para ter o controle das informações cadastradas

    Scenario: Cadastrar um pet utilizando id
        Given url "https://petstore.swagger.io/v2"
        And path "pet", "131313"
        # And path "131313" 
        And form field name = "Cachorro Caramelo" 
        And form field status = "available"
        When method post
        Then status 200

    Scenario: Consultar pet por status available e pending
        Given url "https://petstore.swagger.io/v2"
        And path "pet/findByStatus"
        And param status = ["available", "pending"]
        When method get
        Then status 200
