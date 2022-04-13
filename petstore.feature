Feature: Gestão de pets
    Como um gestor da pest store
    Desejo gerenciar os pets
    Para ter o controle das informações cadastradas

    Background: Base url
        Given url "https://petstore.swagger.io/v2"
        And path "pet"

    Scenario: Atualizar um pet utilizando id
        * def payload = { id: 0, category: { id: 0, name: "string" }, name: "doggie", photoUrls: [], tags: [], status: "available" }
        Given request payload
        When method post
        Then status 200
        * def petId = response.id
        * print petId

        Given path "pet"
        And path petId
        # And path "131313" 
        And form field name = "Cachorro Caramelo" 
        And form field status = "available"
        When method post
        Then status 200
        And match response == "#object"
        And match response contains { code: 200, type: "unknown" }
        * def message = response.message
        And assert parseInt(message) == petId

    Scenario: Consultar pet por status available e pending
        * def responseCodeEsperado = 200
        And path "findByStatus"
        And param status = ["available", "pending"]
        When method get
        # Then assert responseStatus == responseCodeEsperado
        Then assert responseStatus >= 200
        And assert responseStatus < 300
        And match response == "#array"
        And match response[*].status !contains "sold"
        And match response[*].tags[*].id == "#[] #number"
        And match response[0].tags[0].id == "#number"

    Scenario: Cadastrar um novo pet
        * def payload = { id: 131314, category: { id: 0, name: "string" }, name: "doggie", photoUrls: [], tags: [], status: "available" }
        Given request payload
        When method post
        Then status 200

    Scenario: Cadastrar um novo pet  com id aleatório
        * def payload = { id: 0, category: { id: 0, name: "string" }, name: "doggie", photoUrls: [], tags: [], status: "available" }
        Given request payload
        When method post
        Then status 200
        * def idDoPet = response.id
        * print idDoPet

