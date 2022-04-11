# Definição da funcionalidade
Feature: Controle de Pets no PetShop
    Como um cliente do PetShop
    Desejo gerenciar os Pets
    Para ter controle das informações registradas na plataforma

    # Contexto compartilhado entre todos os cenários
    Background: Base url
        # Configuração do baseUrl da API
        Given url "https://petstore.swagger.io/v2"

    # Cenário de teste de cadastro de Pet
    Scenario: Deve ser possível cadastrar um novo Pet
        # Configuração da rota
        Given path "pet"
        # Configuração do Request Body em JSON
        And request
        """
        {
            "id": 0,
            "category": {
                "id": 0,
                "name": "string"
            },
            "name": "doggie",
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
        # Configuração do verbo HTTP
        When method post
        # Teste que verifica se o response code é igual a 200
        Then status 200

    Scenario: Consultar pet por id
        # Given path "pet", 1
        * def identificador = 1
        Given path "pet", identificador
        When method get
        Then status 200

